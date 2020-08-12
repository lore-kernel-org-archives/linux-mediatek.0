Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09290C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 09:18:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCDDE2083B
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 09:18:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eQJu6Ccl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bR8KKaZI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCDDE2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XR31RapgkcxglCmm1Ov4xApm1DspdjRQ+MGRaeSJUx4=; b=eQJu6CclAv3bxRwN9noKszOSf
	m7puQ8iww8fNupFmEFMBBp0zhrUPbuMr7JZLKYayxXVoxwieQytXuPrkrIqjhgEQAbmDoLSQMQQZU
	uxaFrMMsugHSXTeI+BLuWAvPnHiiGUHsppb/y5oCP6KaEjCn2Irzuvl9OTYelAT217lQx6HdDNLyO
	5W86sOw4L/B3wyhZQd1sYGJ8f3zUWzkrgapAXc/hDavh/49X2lkf7klsrPpaWuL3OdwO7b6AR5Zko
	HgwbvM+ZpomDiAM6ntkZ4EfRwz0/2epVIAejQYAbn54waQCBuCvyuH7Ez4lysYe+m+ge/LTVqyJhz
	Jt9Euji3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5mtQ-0002fJ-CC; Wed, 12 Aug 2020 09:17:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5mtO-0002eJ-7R
 for linux-mediatek@lists.infradead.org; Wed, 12 Aug 2020 09:17:55 +0000
X-UUID: 497eb3491bf345faa3ed6851ba83a531-20200812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=UqdzDWD86OrCp6wEU2YB9Bwu97TCSXyPz6lXG6Qwo4U=; 
 b=bR8KKaZIG/GiDAYXoffnL7verGe3koQ8uq1m2yOEm9mD7Yx4TB6p5N/7qMHK/YkYtZN3ytIYzdBUgad8kH5JPBl7INF1U4C7FsI/EZ17Sgyo31ELFABOWS4BOx3gozDO8orgV/vAWBdaA9Av0FpP2/G0AR7DXmzMG/Ihvsg9U80=;
X-UUID: 497eb3491bf345faa3ed6851ba83a531-20200812
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1806498109; Wed, 12 Aug 2020 01:17:46 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 02:17:44 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 17:17:29 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 Aug 2020 17:17:29 +0800
Message-ID: <1597223851.5467.12.camel@mtkswgap22>
Subject: Re: [PATCH] net: untag pointer in sockptr_is_kernel
From: Miles Chen <miles.chen@mediatek.com>
To: kernel test robot <lkp@intel.com>
Date: Wed, 12 Aug 2020 17:17:31 +0800
In-Reply-To: <202008112018.fpLyWmTj%lkp@intel.com>
References: <20200811102704.17875-1-miles.chen@mediatek.com>
 <202008112018.fpLyWmTj%lkp@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_051754_408942_9208402D 
X-CRM114-Status: GOOD (  26.03  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: kbuild-all@lists.01.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 clang-built-linux@googlegroups.com, linux-mediatek@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-08-11 at 20:28 +0800, kernel test robot wrote:
> Hi Miles,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on net-next/master]
> [also build test ERROR on linus/master]
> [cannot apply to net/master hch-configfs/for-next sparc-next/master v5.8 next-20200811]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]

hi test robot,

thanks for the report.

6d04fe15f78a ("net: optimize the sockptr_t for unified kernel/user
address spaces") has been reverted, so I will not sent patch v2 for this
build error.

Miles

> url:    https://github.com/0day-ci/linux/commits/Miles-Chen/net-untag-pointer-in-sockptr_is_kernel/20200811-18303
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git bfdd5aaa54b0a44d9df550fe4c9db7e1470a11b8
> config: x86_64-randconfig-a013-20200811 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 4f2ad15db535873dda9bfe248a2771023b64a43c)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from net/ipv6/af_inet6.c:29:
>    In file included from include/linux/net.h:24:
> >> include/linux/sockptr.h:23:24: error: implicit declaration of function 'untagged_addr' [-Werror,-Wimplicit-function-declaration]
>            return (unsigned long)untagged_addr(sockptr.kernel) >= TASK_SIZE;
>                                  ^
>    1 error generated.
> --
>    In file included from net/ipv6/udp.c:24:
>    In file included from include/linux/net.h:24:
> >> include/linux/sockptr.h:23:24: error: implicit declaration of function 'untagged_addr' [-Werror,-Wimplicit-function-declaration]
>            return (unsigned long)untagged_addr(sockptr.kernel) >= TASK_SIZE;
>                                  ^
>    net/ipv6/udp.c:1029:30: warning: no previous prototype for function 'udp_v6_early_demux' [-Wmissing-prototypes]
>    INDIRECT_CALLABLE_SCOPE void udp_v6_early_demux(struct sk_buff *skb)
>                                 ^
>    net/ipv6/udp.c:1029:25: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    INDIRECT_CALLABLE_SCOPE void udp_v6_early_demux(struct sk_buff *skb)
>                            ^
>                            static 
>    net/ipv6/udp.c:1070:29: warning: no previous prototype for function 'udpv6_rcv' [-Wmissing-prototypes]
>    INDIRECT_CALLABLE_SCOPE int udpv6_rcv(struct sk_buff *skb)
>                                ^
>    net/ipv6/udp.c:1070:25: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    INDIRECT_CALLABLE_SCOPE int udpv6_rcv(struct sk_buff *skb)
>                            ^
>                            static 
>    2 warnings and 1 error generated.
> 
> vim +/untagged_addr +23 include/linux/sockptr.h
> 
>     20	
>     21	static inline bool sockptr_is_kernel(sockptr_t sockptr)
>     22	{
>   > 23		return (unsigned long)untagged_addr(sockptr.kernel) >= TASK_SIZE;
>     24	}
>     25	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
