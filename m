Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D705CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 19:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJ4k8D8uCacIpIYmwtTNDpHiX8wJk8HiIP5bXpeb5Os=; b=g+HNu5i/GqM2BG
	f3eqdinNDwt74gdIK/blNzBRD2FTsSHqyQ1I220Q9uDjpgi95/rI6UuTbxATTlhDWLex/IClcvkxD
	ZT24R1T4Bzqdk42pfEzS1aJRNZzz7GX98iHdFPTYaf9R5biG5Svw+3MnEhkcwVonnrQzUyeyx7tfC
	Fk9ss4zBnvkrELPh0hyEtQYcbtdXoOa2GtUcR4hir46XBM/55fswGJpUZ8DKdvltyEnmp/w/U3XiM
	eNdj5Ijw/TZFrI57UKNBkLxrKT79iUFMabyQoPIUmEnAumjYAkUVFwpJ3Zaap37E3218a3w0QthTX
	ZEw1aM4DzyxeXPsjsolQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKQQU-008Gpj-He; Wed, 16 Feb 2022 19:57:22 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKQQR-008GnR-MP; Wed, 16 Feb 2022 19:57:21 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1nKQQI-00055x-01; Wed, 16 Feb 2022 20:57:10 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 84055C250A; Wed, 16 Feb 2022 20:54:23 +0100 (CET)
Date: Wed, 16 Feb 2022 20:54:23 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mips@vger.kernel.org, Rui Salvaterra <rsalvaterra@gmail.com>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: ralink: mt7621: do memory detection on KSEG1
Message-ID: <20220216195423.GA17551@alpha.franken.de>
References: <20220211001345.3429572-1-gch981213@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220211001345.3429572-1-gch981213@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_115719_911603_9B04C440 
X-CRM114-Status: GOOD (  16.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 11, 2022 at 08:13:44AM +0800, Chuanhong Guo wrote:
> It's reported that current memory detection code occasionally detects
> larger memory under some bootloaders.
> Current memory detection code tests whether address space wraps around
> on KSEG0, which is unreliable because it's cached.
> 
> Rewrite memory size detection to perform the same test on KSEG1 instead.
> While at it, this patch also does the following two things:
> 1. use a fixed pattern instead of a random function pointer as the magic
>    value.
> 2. add an additional memory write and a second comparison as part of the
>    test to prevent possible smaller memory detection result due to
>    leftover values in memory.
> 
> Fixes: 139c949f7f0a MIPS: ("ralink: mt7621: add memory detection support")
> Reported-by: Rui Salvaterra <rsalvaterra@gmail.com>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  arch/mips/ralink/mt7621.c | 36 +++++++++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 13 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
