Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6292DC388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 14:52:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F52F20853
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 14:52:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2PoKrJFR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jGOKlHgX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F52F20853
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aSoBagiUz8B+mKm8acLZrQbC3FZDJRmZp7pvcwvsKi0=; b=2PoKrJFRa06GIHD1uUC1edEVV
	XSAC4udUTEs+lg+wuD6l97V5Y5+3PlsDlB10SK4yBUy0l8h/v/s4+dUWPil2ORh6ruwWW8gwyZ7Pd
	WXMev6duzbQIbkboUmYbiSx8yL/61vJzgIxmjmc/q5QB1C6jy4YUbaNWWqOjqnAe1IqYrgKCfKISQ
	PEnw/24mbxjImgadTT84VgzYM+ergF+Mxozb1M3P2FgSx5ssMFJcwmS1t5JETWGqt3CZGc41e4CaS
	EyzrtlLWWRTjJ3hQ2ddf3XJ6xSMGGhHxo/PwqD4c3ziyEC8M2jgFUyqNmNm+NIB68q5K2mTwipivH
	FeEMMCJ3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVyQN-0005fB-06; Fri, 23 Oct 2020 14:52:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVyQH-0005dE-10; Fri, 23 Oct 2020 14:52:07 +0000
X-UUID: 3ebf23696c0a46aa9b373804f49671ac-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ddf4hKRMI0Eh3zamZLgl9F8Qmg56Z8CHr0/2ldTtg1o=; 
 b=jGOKlHgXmznVwZbM70h0LC85jUvI+q+cbbvY0Z3rNGBQJhRT2IrAlbuQVwVDhs9KpR7PPrCcC3jvPM6xeGMhw351o8paRbO5s0DVI/YYb1NWNrDbYhMgaErGcQ/rdyQCDEzuS09JN7vYDYrTTvihZToobCKEPQ1GkweKAbbUxDg=;
X-UUID: 3ebf23696c0a46aa9b373804f49671ac-20201023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1076985139; Fri, 23 Oct 2020 06:51:55 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 07:51:53 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 23 Oct 2020 22:51:49 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Oct 2020 22:51:49 +0800
Message-ID: <1603464709.2898.3.camel@mhfsdcap03>
Subject: Re: [PATCH] mediatek: separate venc service thread
From: Irui Wang <irui.wang@mediatek.com>
To: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 23 Oct 2020 22:51:49 +0800
In-Reply-To: <CA+5PVA596qeJhNA5QQLNV60r6V4A4nk3Obp3-DnHwsO0mdxmRA@mail.gmail.com>
References: <20201023091026.32066-1-irui.wang@mediatek.com>
 <20201023091026.32066-2-irui.wang@mediatek.com>
 <CA+5PVA596qeJhNA5QQLNV60r6V4A4nk3Obp3-DnHwsO0mdxmRA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3CB2027E463B8AFA17FD4F864CCFA86E0A72150D22F4A2F068D04482EE0B7E8E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_105205_409346_ED9AC5B7 
X-CRM114-Status: GOOD (  17.88  )
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
List-Id: <linux-firmware.lore.kernel.org>
Cc: Andrew-CT.Chen@mediatek.com, Maoguang Meng <Maoguang.Meng@mediatek.com>,
 srv_heupstream@mediatek.com, Yunfei Dong <Yunfei.Dong@mediatek.com>,
 Erin Lo <erin.lo@mediatek.com>, Longfei Wang <Longfei.Wang@mediatek.com>,
 Linux Firmware <linux-firmware@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, PoChun.Lin@mediatek.com,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi josh,

yes, this is the same patch as in the GitHub pull requeset.
thanks for your help.

Best Regards

On Fri, 2020-10-23 at 08:12 -0400, Josh Boyer wrote:
> This is the same patch as what was in the pull request, correct?  I've
> already applied that, so I'm skipping this patch.
> 
> josh
> 
> On Fri, Oct 23, 2020 at 5:11 AM Irui Wang <irui.wang@mediatek.com> wrote:
> >
> > Add two venc service threads in VPU firmware
> >
> > Release Version: 1.1.5
> >
> > Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> > ---
> >  mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
> >  mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131180 bytes
> >  2 files changed, 0 insertions(+), 0 deletions(-)
> >
> > diff --git a/mediatek/mt8173/vpu_d.bin b/mediatek/mt8173/vpu_d.bin
> > index a677dfd47178462238da03629256b8cbac271f4e..00d9c47d19a1dfa10244a5b030d171982333bbb8 100644
> > GIT binary patch
> > delta 1047
> > zcma))O-NKx6vxlIZ{9eL&iK*ErX2M-X_{q-l^80F2|+s-E+PWOkH{cV-!PjfhvIA^
> > zg30h@xtK+?hzMy?LnH=~77<Y)Bt;MwEhNgwJ{A%E->BrK=yHDd|3By6b1&~B@oGX#
> > zfN_^`Xs(6m>Nrt1aK=##PrssYIT8m9r<OvkHBJ-+>$Q2*0+)&2#gom(v^(j_uGyVT
> > z_*y-~`|6)+`;*3j3T?<+LNrrMRIsLw-$>0`y$<SM^NrB|VdFV}@k8m$+Hl~QNi>hk
> > z7oqRLtx}>p;4YX1)8GM^1rNa^@B};uN6^0vT>(G9PmmiTVh{j9um{wFv)~-K04{~l
> > zcp2t4NZ`_O=smCme;+zCe7NCs^^sYk$6y}31aCkmcn_A={72|F@GJSbVXE|?=QWW*
> > zMD<WNbYYPw1L}DToH{fM`r#>2HZ=H*$misr@S2@`IT`nz%s=1OKh@T+b$_?<(MMZO
> > z)Yk38VzkEseO>L*{(7WNUhUX)&Dqm#^$bRPyL!@VtNYeVaqWg}4k&Z8b)xrpq`k8@
> > zVm3CJduyF@i0q~TwJWX%?AU-x*d2q)Om8;5ehwfC5ygm*+s8qKi6}=@*|9-Y79`E(
> > zF_iAk%=URRviv!#XRgk+W~uE(TJtreTI@y4pBHl+azzI6j2|5%mMY8t^9<dC(e~ax
> > zD`MAKDrApYD&W(cmUZkimMXCq&@>WJE_=>W9M>yvMwHi1ebHlfYDk6c@QR*FUiXbw
> > z;m5!7kEzx8VobTl^~UhzS(VbJ!pnM0pZuze*A9QxJ;RA(8Nx1ML)a}0?-9-v_6lbS
> > zXAAp;{lYoIxx#tE`NEroS$MN>f$$dLfbdq~ZNi1ZLE$3dV&M{DQ@B((B)na?Ot@Tl
> > Whj4{(rSMMSD&bwiyC=B%;;G-&9RK0~
> >
> > delta 1002
> > zcma)(O-NK>6o$|J=GV~~M?0zcJ5J+IreGQoWH6SCXyv9LiH!U~g+#r>AO(3N54dpA
> > zWO!2~h8X%=lr-o-w3wnrv=EV?AQurX+9`tRqM~<nBsW5b^L+37z2E)rVdh4^&S_CF
> > zYqd3mP7yh0i9Wrg?P^0g2NYFT5d8@J%Vv<ZMu@zTc*MP6k6W|qYbQp7i&}mBLUWZi
> > zvR+CQ1Ao$*@_Q*L+u4^wf2Pj@@c+Z!_w3_Gwud$0g`+;AHyH2{x&ZE#6HS6?@DMx#
> > zkHK^B0=xqA;57*1{uk&n_y$(M7Wf6oPh<sopb&I}J}?Breq6i(b03Uh=mY2sSb~p2
> > zV-r(nZ`OTyOVsp^s0Ew{tzZe+MQB^vUx9Xm{&;gsqWsM8GLa3#pF-`>bKi*^&|#=E
> > zl|wV3mluh$pyN<?YQIY4N$pqhx%zVN#D){GVXbpB9(A`mO?=>~O1*0++}qKGhbY|D
> > z-_hRFaN_u`4-cH&$@PeK$s8M0J~KI}s<ZW;-tJKQwce1g>9nu0!Q32F&muOj*X7{?
> > zbP>7~?KhJ{xDrh*?*~<hS)waPvE9wZXdk))U6Y!yTjp(Dm6vH&r%hSx8Ch<ZBh!<O
> > zL#=r_wHludPmW<4x(ei`Q$;qUj;*Ui=De=_W=vO{qoq#wK;~~<mE~*Og*;vOeeIn?
> > zVY4x$D$L@L3PiltCq_uQ62Ub~Qkxu6LHtuI4f`y2k0q?LmZsqRy2Y@V#w}%-!4Z{A
> > z7#kLGMZAWY+^{$&);b-+R$-g4T^QaeoFVKI&J@lPb_;uivxU9FIl{TZ2ZUMppm3gW
> > zzHou?A>l&dBH?1;65&$eGGU)^xv*dOuy8=QLby`6O1N71h;WVYQQ_J-t{cDp7ZHZ*
> > AlmGw#
> >
> > diff --git a/mediatek/mt8173/vpu_p.bin b/mediatek/mt8173/vpu_p.bin
> > index ddeef747ac6e3ad1ee984d8d3c7428b2909b2cff..c3a6678ec4eabbdacd9504988f01fb3dbaf6c1de 100644
> > GIT binary patch
> > delta 11011
> > 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
> >
> > delta 10837
> > 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
> >
> > --
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
