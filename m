Return-Path: <SRS0=7p0Y=4B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789BCC352A4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 01:27:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AFE024676
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 01:27:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nxDV566z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rvxiq1ff"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AFE024676
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M4RpSFiJyXTeYqrdkfkxbahcKnCpNcNl3RW3+bIuM7Q=; b=nxDV566zt5Wld6
	CthHE62YlSkJJJlx0JSh4Bzkz8uiSB6jr+pyEYsSGJJBFshNJ8Kagzn+yI9qXrlDCIF/YSEjppUUq
	xn7fWBLI/UXrA1uGH1VG4QRtKbI7ef86vLNpXkDhgLqls2QzOfs9W+sXFlZUV8x5ftfjsY8jfamOm
	p62x9rL9g2Ymr5scMfs/i1gvmWabJ366XRWVmOSNDUYdvzU3Ka6ZH63SSNIMAqxtvJ8koQRwcCvrv
	AoEhI2PpTuDXwnRX+8+Gmr47CuobHjtt8DT6NepKI+77ZR669fxXFumauXMbSE3i8MSzAyu5ouITH
	m+gxuwqnVsrakiXXCzDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j23HZ-0001yM-Dd; Thu, 13 Feb 2020 01:27:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j23HR-0001qq-0Q; Thu, 13 Feb 2020 01:27:02 +0000
X-UUID: a3f9354c9b19414ebd8f2ee998026917-20200212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yOSBqxqyM2MBNdVtLEcUpyckrLNC7q1s0wr5YIz7XTw=; 
 b=rvxiq1ffA/1uEyJ0mg3lMBWqFgHfnwv/KutQjyBKQ6Ko9WVMLOm2CKZaHGfUXI1U3qoHskVIpbzHR8l4l1ZlFufYbzVjNO6LxxAw5uUZh/p1QXjWlVdSbIbefthKeUPGQf1BVmuWkFUgYu31Q6aOzBbn3NpFB9Y46Y23yJrJuEo=;
X-UUID: a3f9354c9b19414ebd8f2ee998026917-20200212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1866105080; Wed, 12 Feb 2020 17:26:58 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 17:26:56 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 09:26:07 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Feb 2020 09:27:23 +0800
Message-ID: <1581557213.12296.0.camel@mtksdaap41>
Subject: Re: [PATCH 1/2] arm64: dts: mt8183: Add gce setting in display node
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Thu, 13 Feb 2020 09:26:53 +0800
In-Reply-To: <1581504514.26347.4.camel@mtksdaap41>
References: <20200212095501.12124-1-bibby.hsieh@mediatek.com>
 <1581504514.26347.4.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_172701_059059_EEB775CC 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: drinkcat@chromium.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tfiga@chromium.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-02-12 at 18:48 +0800, CK Hu wrote:
> On Wed, 2020-02-12 at 17:55 +0800, Bibby Hsieh wrote:
> > In order to use GCE function, we need add some information
> > into display node (mboxes, mediatek,gce-client-reg, mediatek,gce-events).
> > 
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index be4428c92f35..1f0fc281bc2d 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -9,6 +9,7 @@
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  #include <dt-bindings/power/mt8183-power.h>
> > +#include <dt-bindings/gce/mt8183-gce.h>
> >  #include "mt8183-pinfunc.h"
> >  
> >  / {
> > @@ -664,6 +665,9 @@
> >  			reg = <0 0x14000000 0 0x1000>;
> >  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >  			#clock-cells = <1>;
> > +			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST 1>,
> 
> I would like to remove atomic parameter, so please follow [1] to remove
> it.
> 
> [1] https://patchwork.kernel.org/patch/10765419/

Hi, CK,

Yeah, I'm trying remove atomic feature.

Thanks

Bibby
> 
> Regards,
> CK
> 
> > +				 <&gce 1 CMDQ_THR_PRIO_HIGHEST 1>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
> >  		};
> >  
> >  		ovl0: ovl@14008000 {
> > @@ -672,6 +676,7 @@
> >  			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_LOW>;
> >  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >  			clocks = <&mmsys CLK_MM_DISP_OVL0>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x8000 0x1000>;
> >  		};
> >  
> >  		ovl_2l0: ovl@14009000 {
> > @@ -680,6 +685,7 @@
> >  			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
> >  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >  			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
> >  		};
> >  
> >  		ovl_2l1: ovl@1400a000 {
> > @@ -688,6 +694,7 @@
> >  			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_LOW>;
> >  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >  			clocks = <&mmsys CLK_MM_DISP_OVL1_2L>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
> >  		};
> >  
> >  		rdma0: rdma@1400b000 {
> > @@ -697,6 +704,7 @@
> >  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >  			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
> >  			mediatek,rdma_fifo_size = <5120>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
> >  		};
> >  
> >  		rdma1: rdma@1400c000 {
> > @@ -706,6 +714,7 @@
> >  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >  			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
> >  			mediatek,rdma_fifo_size = <2048>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
> >  		};
> >  
> >  		color0: color@1400e000 {
> > @@ -715,6 +724,7 @@
> >  			interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_LOW>;
> >  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >  			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
> >  		};
> >  
> >  		ccorr0: ccorr@1400f000 {
> > @@ -723,6 +733,7 @@
> >  			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
> >  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >  			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
> >  		};
> >  
> >  		aal0: aal@14010000 {
> > @@ -732,6 +743,7 @@
> >  			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_LOW>;
> >  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >  			clocks = <&mmsys CLK_MM_DISP_AAL0>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
> >  		};
> >  
> >  		gamma0: gamma@14011000 {
> > @@ -741,6 +753,7 @@
> >  			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
> >  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >  			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
> >  		};
> >  
> >  		dither0: dither@14012000 {
> > @@ -749,6 +762,7 @@
> >  			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
> >  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> >  			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
> > +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
> >  		};
> >  
> >  		mutex: mutex@14016000 {
> > @@ -756,6 +770,8 @@
> >  			reg = <0 0x14016000 0 0x1000>;
> >  			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
> >  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> > +			mediatek,gce-events = <CMDQ_EVENT_MUTEX_STREAM_DONE0>,
> > +					      <CMDQ_EVENT_MUTEX_STREAM_DONE1>;
> >  		};
> >  
> >  		smi_common: smi@14019000 {
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
