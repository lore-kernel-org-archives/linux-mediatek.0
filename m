Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC786C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 13:22:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67208206A4
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 13:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67208206A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EAt4KkHVbRpGqu4PqVREf7kgmzWXoHDy3otHdrWdMME=; b=ggRBY4muE0+g6U061oYOupkD9
	0D4mDtDX7aRqklgvdh2Rb77e1sLAyDDHCxg36uYaBZFxaOo4yM5WqBPuYp5pSnPrkCiS11wNZzWwE
	ccP8vPzTFTIO9Xh2D1buuI4BZ5fzAHpCbAoJfMQ7b0YCShdB/Jksg0j2+KK8642MuMvKA2FPVONG6
	KHxpbFyuHkIcsjLBfoaXaWDdrdDIeEFVX2NulQuhhNzgEqlFU6b4zpLA9isnWJ3YBBr+o6EkleL8b
	KvWMy5OT8uQOcq21qb5GEsleCtDacYQOoOumleWaFLP6x8+CTkiHe7Ni0g1AZN7L+MrfSeglXYujN
	7NGY0ZGCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klB2Z-0004qp-VB; Fri, 04 Dec 2020 13:22:28 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klB2X-0004q2-Ms
 for linux-mediatek@lists.infradead.org; Fri, 04 Dec 2020 13:22:26 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.93.0.4) (envelope-from <daniel@makrotopia.org>)
 id 1klB2T-00078v-Ln; Fri, 04 Dec 2020 14:22:22 +0100
Date: Fri, 4 Dec 2020 13:22:18 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Mauro Condarelli <mc5686@mclink.it>
Subject: Re: Status of rt3050-esw driver
Message-ID: <X8o4ChkwdAioYoZN@makrotopia.org>
References: <c5625076-7533-86e8-ef5b-7248b62977d7@mclink.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5625076-7533-86e8-ef5b-7248b62977d7@mclink.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_082225_763539_1CE24D6E 
X-CRM114-Status: GOOD (  15.67  )
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
Cc: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Mauro,

when it comes to support in vanilla Linux, the closest it gets to is
the work of Stefan Roese from about 1 year ago:

https://github.com/stroese/linux/blob/gardena-v5.5/drivers/net/dsa/mt7628-esw.c

In OpenWrt we carry an out-of-tree legacy switch configuration layer
(swconfig) and that has mature support for the rt3050-esw incl. mt7628:

https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/ramips/files/drivers/net/ethernet/ralink/esw_rt3050.c;h=292f11a1700e03862e35a772a64e4f56da818b59;hb=HEAD


I hope that helps a bit


On Fri, Dec 04, 2020 at 11:42:01AM +0100, Mauro Condarelli wrote:
> Hi,
> I am very confused about the current status of the driver of internal switch in Subject.
> My need is to statically initialize the ESW found in MT7628 SoC.
> 
> I have found several references (some rather old) to some work from John Crispin and other developers, but apparently this work did never found its way in the kernel (but socumentation is there in Documentation/devicetree/bindings/net/ralink,rt3050-esw.txt !) because it doesn't seem to conform to kernel guidelines (using DSA infrastructure).
> 
> I have been using a derivative of this driver from Stefan Roese, but it "stopped working" some time ago.
> I actually use mostly WiFi and thus breakage, happening in some kernel upgrade, went completely unnoticed till recently.
> I am fighting to find out exactly where I broke things, but this spawned a search and I'm now wondering if there's a better (and more robust) way to enable MT7628 ESW.
> 
> Any hint and/or pointer to relevant documentation would be very welcome.
> 
> Thanks in Advance
> Mauro Condarelli
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
