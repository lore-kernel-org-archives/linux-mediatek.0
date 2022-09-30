Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F250C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 15:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7Hgs2iG5sX0wtqJxwvwxAv71bZdVVbmEMQ0IehiRro=; b=mY2KoBVt/v/k1RjP/4i1z+KbdM
	ES3UFLUHlkHN8XTTgH3YaweNKR27wd+ngCNrWcc9YbD8+cSIpL8kWiE2gN5LIfursNyHlNqTbwO/c
	dhZRniDLz8LPHpUdJAzl5xJpFx8xRTpX4WXc5biFEnkoU2tHlHj2mH/w1ZKQ1ThuwmBSEBJiBGj8E
	ARat2RxuE70itGh7RrjiOzM/9mzDsPNem+R1bJXfXWT90h0YrOOWxeWxc3asKakTkTSYBWgXOdXzy
	zAAjD49mMjHo8oOApDTrS+PDpkk2GZCV3N93fLBdPEXRQ/dioL3pBn2+Er2JIBeOmzl72RSKHWdQx
	qaQnkBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeI1S-00AF96-BD; Fri, 30 Sep 2022 15:33:54 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeI16-00AEvD-8p; Fri, 30 Sep 2022 15:33:34 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 5C10B1884DF6;
	Fri, 30 Sep 2022 15:33:26 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 482782500015;
	Fri, 30 Sep 2022 15:33:26 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 3CBD79EC0002; Fri, 30 Sep 2022 15:33:26 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Fri, 30 Sep 2022 17:33:26 +0200
From: netdev@kapio-technology.com
To: Ido Schimmel <idosch@nvidia.com>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
 netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens
 <hauke@hauke-m.de>, Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>, Landen
 Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Jiri Pirko
 <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu
 <roopa@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan
 <shuah@kernel.org>, Russell King <linux@armlinux.org.uk>, Christian Marangi
 <ansuelsmth@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, Yuwei Wang
 <wangyuweihx@gmail.com>, Petr Machata <petrm@nvidia.com>, Florent Fourcot
 <florent.fourcot@wifirst.fr>, Hans Schultz <schultz.hans@gmail.com>, Joachim
 Wiberg <troglobit@gmail.com>, Amit Cohen <amcohen@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bridge@lists.linux-foundation.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 net-next 0/9] Extend locked port feature with FDB
 locked flag (MAC-Auth/MAB)
In-Reply-To: <Yzb3oNGNtq4GCS3M@shredder>
References: <20220928150256.115248-1-netdev@kapio-technology.com>
 <20220929091036.3812327f@kernel.org>
 <12587604af1ed79be4d3a1607987483a@kapio-technology.com>
 <20220929112744.27cc969b@kernel.org>
 <ab488e3d1b9d456ae96cfd84b724d939@kapio-technology.com>
 <Yzb3oNGNtq4GCS3M@shredder>
User-Agent: Gigahost Webmail
Message-ID: <ee5317df52609e0d7c0fdbccf0421a69@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_083332_646188_97C38645 
X-CRM114-Status: GOOD (  14.97  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2022-09-30 16:05, Ido Schimmel wrote:
> What exactly is the issue? You should be able to run the tests with 
> veth
> pairs in a VM.

First there is an issue with alsa missing for some mixer tests, then 
there is several reports of sys/capability.h missing, and then just 
really many obscure problems that look like wrong lib versions are in 
place. Here is some of the long log of errors etc... :(


In file included from lib/elf.c:8:
include/test_util.h: In function ‘align_up’:
include/test_util.h:134:7: warning: format ‘%lu’ expects argument of 
type ‘long unsigned int’, but argument 6 has type ‘uint64_t’ {aka ‘long 
long unsigned int’} [-Wformat=]
   134 |       "size not a power of 2: %lu", size);
       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~
       |                                     |
       |                                     uint64_t {aka long long 
unsigned int}
include/test_util.h:54:43: note: in definition of macro ‘TEST_ASSERT’
    54 |  test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
       |                                           ^~~
include/test_util.h:134:33: note: format string is defined here
   134 |       "size not a power of 2: %lu", size);
       |                               ~~^
       |                                 |
       |                                 long unsigned int
       |                               %llu
include/test_util.h: In function ‘align_ptr_up’:
include/test_util.h:150:9: warning: cast to pointer from integer of 
different size [-Wint-to-pointer-cast]
   150 |  return (void *)align_up((unsigned long)x, size);
       |         ^
In file included from include/kvm_util.h:10,
                  from lib/elf.c:13:
include/kvm_util_base.h: At top level:
include/kvm_util_base.h:93:26: error: field ‘stats_header’ has 
incomplete type
    93 |  struct kvm_stats_header stats_header;
       |                          ^~~~~~~~~~~~
In file included from ../../../include/linux/kernel.h:8,
                  from ../../../include/linux/list.h:7,
                  from ../../../include/linux/hashtable.h:10,
                  from include/kvm_util_base.h:13,
                  from include/kvm_util.h:10,
                  from lib/elf.c:13:
include/kvm_util_base.h: In function ‘kvm_vm_reset_dirty_ring’:
include/kvm_util_base.h:308:24: error: ‘KVM_RESET_DIRTY_RINGS’ 
undeclared (first use in this function); did you mean 
‘KVM_GET_DIRTY_LOG’?
   308 |  return __vm_ioctl(vm, KVM_RESET_DIRTY_RINGS, NULL);
       |                        ^~~~~~~~~~~~~~~~~~~~~
../../../include/linux/build_bug.h:79:56: note: in definition of macro 
‘__static_assert’
    79 | #define __static_assert(expr, msg, ...) _Static_assert(expr, 
msg)
       |                                                        ^~~~
include/kvm_util_base.h:193:2: note: in expansion of macro 
‘static_assert’
   193 |  static_assert(!_IOC_SIZE(cmd) || sizeof(*arg) == 
_IOC_SIZE(cmd), ""); \
       |  ^~~~~~~~~~~~~
include/kvm_util_base.h:216:2: note: in expansion of macro 
‘kvm_do_ioctl’
   216 |  kvm_do_ioctl((vm)->fd, cmd, arg);   \
       |  ^~~~~~~~~~~~
include/kvm_util_base.h:308:9: note: in expansion of macro ‘__vm_ioctl’
   308 |  return __vm_ioctl(vm, KVM_RESET_DIRTY_RINGS, NULL);
       |         ^~~~~~~~~~
include/kvm_util_base.h:308:24: note: each undeclared identifier is 
reported only once for each function it appears in
   308 |  return __vm_ioctl(vm, KVM_RESET_DIRTY_RINGS, NULL);
       |                        ^~~~~~~~~~~~~~~~~~~~~
../../../include/linux/build_bug.h:79:56: note: in definition of macro 
‘__static_assert’
    79 | #define __static_assert(expr, msg, ...) _Static_assert(expr, 
msg)
       |                                                        ^~~~
include/kvm_util_base.h:193:2: note: in expansion of macro 
‘static_assert’
   193 |  static_assert(!_IOC_SIZE(cmd) || sizeof(*arg) == 
_IOC_SIZE(cmd), ""); \
       |  ^~~~~~~~~~~~~
include/kvm_util_base.h:216:2: note: in expansion of macro 
‘kvm_do_ioctl’
   216 |  kvm_do_ioctl((vm)->fd, cmd, arg);   \
       |  ^~~~~~~~~~~~
include/kvm_util_base.h:308:9: note: in expansion of macro ‘__vm_ioctl’
   308 |  return __vm_ioctl(vm, KVM_RESET_DIRTY_RINGS, NULL);
       |         ^~~~~~~~~~
include/kvm_util_base.h:193:16: error: expression in static assertion is 
not an integer
   193 |  static_assert(!_IOC_SIZE(cmd) || sizeof(*arg) == 
_IOC_SIZE(cmd), ""); \
       |                ^
../../../include/linux/build_bug.h:79:56: note: in definition of macro 
‘__static_assert’
    79 | #define __static_assert(expr, msg, ...) _Static_assert(expr, 
msg)
       |                                                        ^~~~
include/kvm_util_base.h:193:2: note: in expansion of macro 
‘static_assert’
   193 |  static_assert(!_IOC_SIZE(cmd) || sizeof(*arg) == 
_IOC_SIZE(cmd), ""); \
       |  ^~~~~~~~~~~~~
include/kvm_util_base.h:216:2: note: in expansion of macro 
‘kvm_do_ioctl’
   216 |  kvm_do_ioctl((vm)->fd, cmd, arg);   \
       |  ^~~~~~~~~~~~
include/kvm_util_base.h:308:9: note: in expansion of macro ‘__vm_ioctl’
   308 |  return __vm_ioctl(vm, KVM_RESET_DIRTY_RINGS, NULL);
       |         ^~~~~~~~~~
include/kvm_util_base.h: In function ‘vm_get_stats_fd’:
include/kvm_util_base.h:313:26: error: ‘KVM_GET_STATS_FD’ undeclared 
(first use in this function); did you mean ‘KVM_GET_SREGS’?
   313 |  int fd = __vm_ioctl(vm, KVM_GET_STATS_FD, NULL);
       |                          ^~~~~~~~~~~~~~~~

