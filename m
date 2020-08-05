Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70079C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 07:29:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 383852073E
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 07:29:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yf37TWpd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TdOm+Sff";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="lAOSobc5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 383852073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LrbQ/M9+rQmpM+K8REvtWb/70Y7Tb+ylTN2HJFa9iOQ=; b=Yf37TWpdOZvBYHFL1kXg6vlUG
	W1YYzUY9etrx76Fq1p7jBXwwHSztkdrKLk7MSGKMlt+8LhwG1LFaJUJeFYnRS1iCj/+0SlMaXmg57
	T6rcqdi5Ocn6InjELckNH2uBYRMO5bX6acm5bROrVWVmUqI8zsGUYeeAnpvwxy43O/gtlBrncHLYK
	BfwmXjnc8Ti3u7bHZqxazhZJQ39a5Og4LT1vsHvCuEMBJKR5Jw/hUowC9jdUz7riKmNYaLrS6cNqW
	FQroCFjmoG0ES2oDW44bDwjFG+ens/Bt9rleyFuJchVU94jM3O8MSGfgDVphGFMWzPTBpycsp3pPT
	4gceP8+0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3DrB-0001DL-Vl; Wed, 05 Aug 2020 07:29:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3DrA-0001Cu-L6; Wed, 05 Aug 2020 07:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:References:
 In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=+akV2xOfUkCulRI6COmQ5X6yUyxaqB/yUBSbtvXCDYA=; b=TdOm+SffuOAWYWMLSX1+8gAN4A
 XeIaxA1bEpTyDkp7jpW0xNDnEcmdVd5W83/2SF6IS/+IEU1CtRHSrpwRdsekmQDQVTSbkqI2eTdtm
 pbDhhjLKERzUxCaIiS0N9dk663yXoYgHxGmFRDf6rLHqeXSNZBxsbYEEbgY5fD7L6MuY33pcp5p+Q
 5gi14vS5/Zea5HCc7QImilCGbqfzfDu1NaMD5atPA6ZN1v829/c3ImlA9LJ4QrRvU6Tfmmv+x1WyW
 pcwmdlmSNL8mQi4hCfmwvrV0aE8prQSUCUwmwvWFpL7zO7tOlQWj1c9yr8Ga0O/ihrNxGRkqd+3Lt
 dA7TjcXA==;
Received: from mout.gmx.net ([212.227.17.22])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3Dr7-0003fM-0E; Wed, 05 Aug 2020 07:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596612461;
 bh=NJ3W3FnV8FjFCOCq58j3yAlSrdAYyv5IGb5zxRxgkfo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lAOSobc5fopmfGe+oOaxYD7Jy/WzyrAHtMMke/Dmv8efLVmgsahLM76obUI3okfDU
 +8bMz36Qz+5+M96NIlP0RcYrMGIs0+ikGMFrQNCtqpl6VcfmQDL30SUPDdrECclCTN
 FxULD2Gl+bgdiTP+rdozURGA8bZeCz6N01fPoH2E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.208.209.197] ([80.208.209.197]) by web-mail.gmx.net
 (3c-app-gmx-bap13.server.lan [172.19.172.83]) (via HTTP); Wed, 5 Aug 2020
 09:27:41 +0200
MIME-Version: 1.0
Message-ID: <trinity-16cee263-ff59-4595-adc1-738071745162-1596612461427@3c-app-gmx-bap13>
From: Frank Wunderlich <frank-w@public-files.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Aw: Re:  Re: [PATCH v4 6/6] arm: dts: mt7623: add display subsystem
 related device nodes
Date: Wed, 5 Aug 2020 09:27:41 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <45d34c6cc19c2e5c13f9e88a8e04bdae9259ffdc.camel@infradead.org>
References: <20200804165555.75159-1-linux@fw-web.de>
 <20200804165555.75159-8-linux@fw-web.de>
 <3966b4f687f2fabf9041059dd5f39165177a6ef6.camel@infradead.org>
 <trinity-5335a61e-b8f0-4441-9fe9-0827cdd67ce4-1596562816887@3c-app-gmx-bap28>
 <45d34c6cc19c2e5c13f9e88a8e04bdae9259ffdc.camel@infradead.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:SEYuaGP8Vwnd5amGqCfH/R98lwowQCF73eBx323W8BgrPpA2kZEH4ZYzVh+cqYPgXlfne
 jmvkrfQn2+cSr6UquFT+158ips5sk6liAJNFWXpNpd03rBFrDSTkaZ5kBjDw6Vrd40zkAZIMeD51
 FmdtAWuvoPjYHnDnMeho1Loqho42ttzdgxxW767qwHymTlJQl4ba0Br7JdclPuR+LD30YLs2kcl+
 Cc5cwNse9u8FpaNt/FNM+Y9Rn+ptbEUTCSGCW0Lz/4ss/kjaa6VMpE84LGpe+THzqcRyiglhwUUa
 DQ=
X-UI-Out-Filterresults: notjunk:1;V03:K0:yakE5sTu7hc=:eKQHR+4doAROunHdQVNri5
 bxXCgNSvyBn9pA2iUvkHpdCaLALTxZr4W7lxP7ix0LMobilUK/ha/UgdNuGXSi/aG4qVJ8omT
 SYhZq8KoqSNBQ0kPQuF71vrLkQHkdpSBj0yfTeEZ5rnLuxU4gCGMvuepoNQrOycxl/jA/eB3h
 Trgv9rBzDci79BRGSY36aGqoTT+T4MvdDZk4zpzGFWRACN7kljThE4EYbHxUwxMzy3rShiSpC
 Dd+4SCcGU/WAUW+zxTe39Zl0tfQGucJHkNjwgRH3CM74Lls+Udaj2lhzr9mr7Y+cmbtWR6CzS
 VKsQIyG5Va6Vl3nkvDL5310F284gpf5m9pOU68s071y5e2GZ1WhnepxelxOj5UKnUqSME7DB8
 J3Iq+Yc6mHGX/EEBihZvEa30eKAynhDfxsbvnEEnO36eFAGNBpWTEViMiLChr5ZJGooB1+vxY
 F0HZ/rl8Ots6zyQg+LIfXjMHwLg7sEIZ81ewCTrwjugdSmZrsG8qe1OcOvmQT9u2L8uYESqQX
 xvGKNjJMfZe2UBGTYgs0tLywAsZwmZpGwPfer9nT4wfpRCMQOrVDsSEIDgRmXygYZ8J8r0Wsd
 BvHf+fRnCOPfDqJLxIc7MEEKt3N+YKcgMLIS3GGLN7rpC2OaxFpEG98X3ePLZNfRurJdSPTqx
 +wH64s6EooRPLCasHTDv29N3wlOVwgnzDWC5bGCGcI5l1hGSK2klP3xPbslW5imBUF+c=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_082857_287030_2978999B 
X-CRM114-Status: GOOD (  25.07  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, chunhui dai <chunhui.dai@mediatek.com>,
 David Airlie <airlied@linux.ie>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 CK Hu <ck.hu@mediatek.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CC Rob Herring + devicetree List + Sean

> Gesendet: Dienstag, 04. August 2020 um 20:02 Uhr
> Von: "David Woodhouse" <dwmw2@infradead.org>
> On Tue, 2020-08-04 at 19:40 +0200, Frank Wunderlich wrote:
> > > Gesendet: Dienstag, 04. August 2020 um 19:24 Uhr
> > > Von: "David Woodhouse" <dwmw2@infradead.org>
> > > > +	mipi_tx0: mipi-dphy@10010000 {
> > > > +		compatible = "mediatek,mt7623-mipi-tx",
> > > > +			     "mediatek,mt2701-mipi-tx";
> > > > +		reg = <0 0x10010000 0 0x90>;
> > > > +		clocks = <&clk26m>;
> > > > +		clock-output-names = "mipi_tx0_pll";
> > > > +		#clock-cells = <0>;
> > > > +		#phy-cells = <0>;
> > > > +	};
> > >
> > > Doesn't this (and some others) also need status="disabled" since
> > > they're not present on MT7623A? Or maybe it's time to split
> > > mt7623.dtsi
> > > into a mt7623n.dtsi which includes mt7623a.dtsi and adds the extra
> > > components?

any opinions about this? should i disable all new nodes and enable them in the
dts for specific board (bpi-r2/mt7623n-rfb)?

have prepared it here [1]

> > do you have a MT7623A board for testing? is there any list which
> > components are existing on mt7623a? or should i disable all of them
> > and re-enable them in bpi-r2 dts?
>
> The UniElec U7623 board (which is supported in OpenWrt) is MT7623A.
>
> I was told that MT7623N has GPU and HDMI, while the MT7623A has a
> built-in mt7530 switch. Does that imply the switch on the MT7623N
> boards is *external*?
yes, bananapi r2 has external mt7530 switch connected to gmacs 0+1 with its ports 6+5

> If so, that means that mt7623n.dtsi maybe shouldn't just include
> mt7623a.dtsi because it's not a strict superset; maybe they should both
> include a common mt7623.dtsi that has the parts that are truly common?
>
> I also suspect the switch definition from the UniElec U7623 dts should
> probably move to this new mt7623a.dtsi? That's not upstream yet though.

or should we split dtsi to have a common part (mt7623.dtsi), and one for
soc (mt7623n.dtsi/mt7623a.dtsi)?

mt7623.dtsi => mt7623n.dtsi => mt7623n-bananapi-bpi-r2.dts
mt7623.dtsi => mt7623a.dtsi => mt7623a-unielec-u7623.dts (not existing yet,
openwrt seems to use a board-specific dtsi)

regards Frank

[1] https://github.com/frank-w/BPI-R2-4.14/commits/5.8-hdmi4mainline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
