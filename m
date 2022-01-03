Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421F5C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 07:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTNdmP+yaoUkLfYj1qrrfYzuitMW362XmAKjrvCrn3g=; b=UAZ/NR/7JgGBGs
	aHpq8gjZjT2H/JR2QkDNUnSb5HGBvjTKLz/8stM46sBjWApjA8DSdDswaCXwDFiKU4Bo1em0ShkLS
	XKLvJRCBg6h7O8JkIshZOALw9SclHtwtwrvvbVRtmlORFWS7hj5tl9ch8zCdwavrYdRW8yYgYDAbv
	TPe/PelXCplsuZi5u8G74E8MWIxglVJ/kblZNLQYEQo6yaaU9J/oeS2VAdwUREGx+RQlTNujsIa1Q
	H8/H+UmT1/kxYLqcVcow9jAe9KokTXhJur3cB53pbzHNTcEucyNjBlAoOQtFCra21nhISln2+cW2F
	ewUYXWZ0C4kXG++FjdjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4IA5-008XdF-Ci; Mon, 03 Jan 2022 07:53:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4I9t-008Xbp-Ao; Mon, 03 Jan 2022 07:53:35 +0000
X-UUID: f3478d42cda0437d9701b275d7fdabbf-20220103
X-UUID: f3478d42cda0437d9701b275d7fdabbf-20220103
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 438459850; Mon, 03 Jan 2022 00:53:32 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Jan 2022 23:43:30 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Jan 2022 15:43:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Jan 2022 15:43:28 +0800
Message-ID: <ca8e8e62d4c7d9b714c64fbf9e59ba0ebe42bea4.camel@mediatek.com>
Subject: Re: [PATCH v16 0/7] soc: mediatek: SVS: introduce MTK SVS
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 3 Jan 2022 15:43:28 +0800
In-Reply-To: <abd9332b-dace-f75a-33f5-be88fe516784@gmail.com>
References: <20210428065440.3704-1-roger.lu@mediatek.com>
 <abd9332b-dace-f75a-33f5-be88fe516784@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_235333_416475_B6B74AFC 
X-CRM114-Status: GOOD (  22.91  )
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

Hi Matthias,

On Thu, 2021-12-30 at 14:18 +0100, Matthias Brugger wrote:
> 
> On 28/04/2021 08:54, Roger Lu wrote:
> > 1. SVS driver uses OPP adjust event in [1] to update OPP table voltage part.
> > 2. SVS driver gets thermal/GPU device by node [2][3] and CPU device by
> > get_cpu_device().
> > After retrieving subsys device, SVS driver calls device_link_add() to make
> > sure probe/suspend callback priority.
> > 3. SVS dts refers to reset controller [4] to help reset SVS HW.
> > 
> > #mt8183 SVS related patches
> > [1] 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/patch/11193513/__;!!CTRNKA9wMg0ARbw!yy2e7JqE__BQAZF3jwBuR3Fbzbv8LPxwwA3l6SVu7SFAG94dCHyVq9A3MIscKXW-$
> >  
> 
> Already mainline, please either refer to the commit, to make it clear it's 
> maineline or drop it.
> 
> > [2] 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20201013102358.22588-2-michael.kao@mediatek.com/__;!!CTRNKA9wMg0ARbw!yy2e7JqE__BQAZF3jwBuR3Fbzbv8LPxwwA3l6SVu7SFAG94dCHyVq9A3ML35Ale5$
> >  
> 
> Same here.
> 
> > [3] 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20200306041345.259332-3-drinkcat@chromium.org/__;!!CTRNKA9wMg0ARbw!yy2e7JqE__BQAZF3jwBuR3Fbzbv8LPxwwA3l6SVu7SFAG94dCHyVq9A3MMUMr7Oh$
> >  
> 
> Same here,

Thanks for the review. I'll refer to mainline or the latest reviewing patch. 

> 
> > 
> > #mt8192 SVS related patches
> > [1] 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/patch/11193513/__;!!CTRNKA9wMg0ARbw!yy2e7JqE__BQAZF3jwBuR3Fbzbv8LPxwwA3l6SVu7SFAG94dCHyVq9A3MIscKXW-$
> >  
> 
> Same here, it's actually the same link as [1].
> 
> > [2] 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20201223074944.2061-1-michael.kao@mediatek.com/__;!!CTRNKA9wMg0ARbw!yy2e7JqE__BQAZF3jwBuR3Fbzbv8LPxwwA3l6SVu7SFAG94dCHyVq9A3MEUxFEDM$
> >  
> > [3] 
> > https://urldefense.com/v3/__https://lore.kernel.org/patchwork/patch/1360551/__;!!CTRNKA9wMg0ARbw!yy2e7JqE__BQAZF3jwBuR3Fbzbv8LPxwwA3l6SVu7SFAG94dCHyVq9A3MNObUeLt$
> >  
> > [4] 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20200817030324.5690-5-crystal.guo@mediatek.com/__;!!CTRNKA9wMg0ARbw!yy2e7JqE__BQAZF3jwBuR3Fbzbv8LPxwwA3l6SVu7SFAG94dCHyVq9A3MMx-JKoe$
> >  
> 
> There are many dependencies for that. Some patches need resubmit, others seem
> to 
> be stale. I'd advise to concentrate on mt8183 for now and add support for
> mt8192 
> once dependencies have settled.

Sure, let's concentrate on mt8183 patches first. Thanks for sharing the advice.

> 
> Regards,
> Matthias
> 
> > 
> > changes since v15:
> > - Put (*set_freqs_pct) and (*get_vops) in struct svs_bank because they are
> > part of svs bank's operation
> > - Add define "SVSB_INIT02_RM_DVTFIXED" and "SVSB_MON_VOLT_IGNORE" to make
> > control clearly.
> > - Remove unnecessary parenthesis
> > 
> > Roger Lu (7):
> >    [v16,1/7] dt-bindings: soc: mediatek: add mtk svs dt-bindings
> >    [v16,2/7] arm64: dts: mt8183: add svs device information
> >    [v16,3/7] soc: mediatek: SVS: introduce MTK SVS engine
> >    [v16,4/7] soc: mediatek: SVS: add debug commands
> >    [v16,5/7] dt-bindings: soc: mediatek: add mt8192 svs dt-bindings
> >    [v16,6/7] arm64: dts: mt8192: add svs device information
> >    [v16,7/7] soc: mediatek: SVS: add mt8192 SVS GPU driver
> > 
> >   .../bindings/soc/mediatek/mtk-svs.yaml        |   92 +
> >   arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   18 +
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi      |   34 +
> >   drivers/soc/mediatek/Kconfig                  |   10 +
> >   drivers/soc/mediatek/Makefile                 |    1 +
> >   drivers/soc/mediatek/mtk-svs.c                | 2524 +++++++++++++++++
> >   6 files changed, 2679 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-
> > svs.yaml
> >   create mode 100644 drivers/soc/mediatek/mtk-svs.c
> > 
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!yy2e7JqE__BQAZF3jwBuR3Fbzbv8LPxwwA3l6SVu7SFAG94dCHyVq9A3MIj4Pohu$
> >  
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
