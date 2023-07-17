##################################################
#MMMMMWxkOOOOOOOOOOOkxxxxxxxxxxxxxxkkkkkkkkkkkkNM#
#MMMMMN.'O0000000000d..........................0M#
#MMMMMX.'O0000000000x..........................0M#
#MMMMMX..xkxxxxxxxxxl.........................'0M#
#MMMMMX........................................0M#
#MMMMMX........................................0M#
#MMMMMX........................................0M#
#MMMMMX...................''...................0M#
#MMMMMX................,cx00kl,'...............0M#
#MMMMMX...............,xMMMMMM0,'..............0M#
#MMMMMX..............',0MMMMMMN,'..............0M#
#MMMMMX...............';kXWMNO:'...............0M#
#MMMMMX.................',,,,'.................0M#
#MMMMMX........................................0M#
#MMMMMX........................................0M#
#MMMMMN...................''...................0M#
#MMMMMN...................''...................OM#
#MMMMMN........................................OM#
#MMMMMN........................................OM#
#MMMMMW,,,,,,,,,,,,,;;;;:;;:;::;;;;;::::::::::cKM#
##################################################

# Caching.jl - a memory/disk memoizer written at 0x0α Research
#              by Corneliu Cofaru, 2018

module Caching

using Serialization
using DataStructures
using TranscodingStreams
using CodecZlib, CodecBzip2, CodecLz4
using MacroTools
using Random
using Base: summarysize

import Base: show, empty!, length
import Core.Compiler: return_type
import Serialization: serialize, deserialize

const MAX_CACHE_SIZE = typemax(Int)

export AbstractCache,
       Cache,
       AbstractSize,
       CountSize,
       MemorySize,
       object_size,
       max_cache_size,
       arghash,
       syncache!,
       persist!,
       empty!,
       @cache,
       @cache_ttl,
       @syncache!,
       @persist!,
       @empty!

include("cache.jl")
include("utils.jl")
include("file.jl")
include("ttl.jl")

end  # module
