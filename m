Return-Path: <SRS0=vX0G=4A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E0CC352A4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 10:48:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A87A2082F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 10:48:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tea2a+2Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IkkwUNsZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A87A2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZUhRupDfk/98hT8P8uK1Kvl5c45EAigBE1Tw6Ior8h0=; b=tea2a+2Zahue1J
	QLSjDS3yn9OXJP0ZCFjFaI4BEPdbncXW6Abm3jetptNdBrBLd0avHL3KYid4JJdoMYuCjG5MJd04P
	dD+NnmLQOJCM49MTOiS8pijbSCzcK/nsJDVio8YoHM/aXH8tk4vkazxh0YVbR4winhuSN61dAqKZh
	b0l71Slf9iR3wHpkf4XN7WHf6fxN8bVCeVZK10zFU4RjHdAwG5GvaG0bsxBlOIBDsLZQJgTw020oL
	RtpZVrPmKcUGSjeGnNVlkpc+8ciVniaFpgeRnKBq29Cx6x07Ce6FKV5eH6vxw328IxLzyTsY3p3P3
	w4QdO22kJ8E9gFgHILfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1pZY-0000Pt-Ir; Wed, 12 Feb 2020 10:48:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1pZP-0000I0-Ma; Wed, 12 Feb 2020 10:48:41 +0000
X-UUID: a943504f53bc4855801b6d69953222dc-20200212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ssEEVXg39Akuq7xiDnhxIk0C5G9biOCSA4wS5rOD9IE=; 
 b=IkkwUNsZqgNJJv+KYTxW1JovHrISvU4OJAeGFWmGM58HAMYyIbkhjtD91riwoYR6RfdpiT6MACDADHZNugqbzfEVpYUIOhg1FKCJMADiGJVXK7K2KT6FGaGqqJofRVcYDvLkOFQiOdI1AjXo1afKS2xjK7lo2orLzUDyZUBqQfs=;
X-UUID: a943504f53bc4855801b6d69953222dc-20200212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 210495644; Wed, 12 Feb 2020 02:48:37 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 02:48:35 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 18:47:44 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 12 Feb 2020 18:47:34 +0800
Message-ID: <1581504514.26347.4.camel@mtksdaap41>
Subject: Re: [PATCH 1/2] arm64: dts: mt8183: Add gce setting in display node
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Wed, 12 Feb 2020 18:48:34 +0800
In-Reply-To: <20200212095501.12124-1-bibby.hsieh@mediatek.com>
References: <20200212095501.12124-1-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_024839_747965_B20D42A1 
X-CRM114-Status: GOOD (  12.53  )
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

On Wed, 2020-02-12 at 17:55 +0800, Bibby Hsieh wrote:
> In order to use GCE function, we need add some information
> into display node (mboxes, mediatek,gce-client-reg, mediatek,gce-events).
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index be4428c92f35..1f0fc281bc2d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/power/mt8183-power.h>
> +#include <dt-bindings/gce/mt8183-gce.h>
>  #include "mt8183-pinfunc.h"
>  
>  / {
> @@ -664,6 +665,9 @@
>  			reg = <0 0x14000000 0 0x1000>;
>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
>  			#clock-cells = <1>;
> +			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST 1>,

I would like to remove atomic parameter, so please follow [1] to remove
it.

[1] https://patchwork.kernel.org/patch/10765419/

Regards,
CK

> +				 <&gce 1 CMDQ_THR_PRIO_HIGHEST 1>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
>  		};
>  
>  		ovl0: ovl@14008000 {
> @@ -672,6 +676,7 @@
>  			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_OVL0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x8000 0x1000>;
>  		};
>  
>  		ovl_2l0: ovl@14009000 {
> @@ -680,6 +685,7 @@
>  			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
>  		};
>  
>  		ovl_2l1: ovl@1400a000 {
> @@ -688,6 +694,7 @@
>  			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_OVL1_2L>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
>  		};
>  
>  		rdma0: rdma@1400b000 {
> @@ -697,6 +704,7 @@
>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
>  			mediatek,rdma_fifo_size = <5120>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
>  		};
>  
>  		rdma1: rdma@1400c000 {
> @@ -706,6 +714,7 @@
>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
>  			mediatek,rdma_fifo_size = <2048>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
>  		};
>  
>  		color0: color@1400e000 {
> @@ -715,6 +724,7 @@
>  			interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
>  		};
>  
>  		ccorr0: ccorr@1400f000 {
> @@ -723,6 +733,7 @@
>  			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
>  		};
>  
>  		aal0: aal@14010000 {
> @@ -732,6 +743,7 @@
>  			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_AAL0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
>  		};
>  
>  		gamma0: gamma@14011000 {
> @@ -741,6 +753,7 @@
>  			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
>  		};
>  
>  		dither0: dither@14012000 {
> @@ -749,6 +762,7 @@
>  			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
>  			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
>  		};
>  
>  		mutex: mutex@14016000 {
> @@ -756,6 +770,8 @@
>  			reg = <0 0x14016000 0 0x1000>;
>  			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +			mediatek,gce-events = <CMDQ_EVENT_MUTEX_STREAM_DONE0>,
> +					      <CMDQ_EVENT_MUTEX_STREAM_DONE1>;
>  		};
>  
>  		smi_common: smi@14019000 {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
