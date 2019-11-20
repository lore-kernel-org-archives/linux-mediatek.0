Return-Path: <SRS0=Qt5b=ZM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2685C432C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Nov 2019 06:21:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 948CF2243E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Nov 2019 06:21:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CQ5R1qeA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qj3btTHX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 948CF2243E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dh6NUL4aXaruDJN+lZLo/vzFwYVVl9W+pisGc6k6onE=; b=CQ5R1qeALtUdoq
	+XTw6upgNnc7lcA9esmf8upUrZ4KyZgaTXx/q6SOsuj1Eco5V9L7w97djZtqUQHt6oo2IEOBqgHhL
	QvEhnHhoxNdGiHEQf7OU11SJqvvh8Wj7B4ZxOgwU33hMG3ryFTa6tEesfdJWduDBNgd1YOAAp5rvR
	FwkLKYgZzs2QV60YsmF63DKyv266lMMIZFFM6jV4FFSlGwxg+aRers/7QqN/84oL0z+6z0RkM2y6u
	TGCJ4YCGa5nB/BCsNEj3BqkjVxZylAzWBGC6D9pT2+Wof11E7WOzNZZyQkvmVSZDJhyWu9xPz/nm5
	Vqlipw4UXepIPBXlzkLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXJMm-0003pj-50; Wed, 20 Nov 2019 06:21:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXJMc-0003ic-PJ; Wed, 20 Nov 2019 06:21:20 +0000
X-UUID: 2122265ee782478fbadd1cfac49d134f-20191119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cnXVYOCT6jAm+zO5eJXzFKhez0AEBAzRzE76qZr3S+w=; 
 b=qj3btTHXvPS7xMlbX8vTRXC2GUqS6ADJZ2nrdKrs77bWaH13Rub+7BApAHsewfc+P/PBhnZvbDSF0FjA8RCBwQjdzpV6FH/l0jP6lQLTcF5Abu5CHdAPUYr4kWWcFaz2EimB6GVl6mKOjYzDYV9N4RLZhipFZZ59kHYreDA6MN4=;
X-UUID: 2122265ee782478fbadd1cfac49d134f-20191119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 968739088; Tue, 19 Nov 2019 22:21:10 -0800
Received: from mtkmbs05dr.mediatek.inc (172.21.101.97) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 19 Nov 2019 22:11:12 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05dr.mediatek.inc (172.21.101.97) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 20 Nov 2019 14:10:53 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 20 Nov 2019 14:10:48 +0800
Message-ID: <1574230265.14846.1.camel@mtksdaap41>
Subject: Re: [PATCH] arm64: dts: mt8173: Add gce setting in mmsys and
 display node
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 20 Nov 2019 14:11:05 +0800
In-Reply-To: <20191118104252.228406-1-hsinyi@chromium.org>
References: <20191118104252.228406-1-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191119_222118_834209_6FB9E69D 
X-CRM114-Status: GOOD (  13.26  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2019-11-18 at 18:42 +0800, Hsin-Yi Wang wrote:
> In order to use GCE function, we need add some informations
> into display node (mboxes, mediatek,gce-client-reg, mediatek,gce-events).

Thanks for the patch.

Reviewed-by: Bibby Hsieh <bibby.hsieh@mediatek.com>

> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> - This is based on series "support gce on mt8183 platform"
>   https://patchwork.kernel.org/cover/11208309/
> - gce setting in 8183:
>   https://patchwork.kernel.org/patch/11127105/
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 15f1842f6df3..e84ec3f95d81 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -911,6 +911,11 @@ mmsys: clock-controller@14000000 {
>  			assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
>  			assigned-clock-rates = <400000000>;
>  			#clock-cells = <1>;
> +			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST 1>,
> +				 <&gce 1 CMDQ_THR_PRIO_HIGHEST 1>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
> +			mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
> +					      <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
>  		};
>  
>  		mdp_rdma0: rdma@14001000 {
> @@ -991,6 +996,7 @@ ovl0: ovl@1400c000 {
>  			clocks = <&mmsys CLK_MM_DISP_OVL0>;
>  			iommus = <&iommu M4U_PORT_DISP_OVL0>;
>  			mediatek,larb = <&larb0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
>  		};
>  
>  		ovl1: ovl@1400d000 {
> @@ -1001,6 +1007,7 @@ ovl1: ovl@1400d000 {
>  			clocks = <&mmsys CLK_MM_DISP_OVL1>;
>  			iommus = <&iommu M4U_PORT_DISP_OVL1>;
>  			mediatek,larb = <&larb4>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
>  		};
>  
>  		rdma0: rdma@1400e000 {
> @@ -1011,6 +1018,7 @@ rdma0: rdma@1400e000 {
>  			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
>  			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
>  			mediatek,larb = <&larb0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
>  		};
>  
>  		rdma1: rdma@1400f000 {
> @@ -1021,6 +1029,7 @@ rdma1: rdma@1400f000 {
>  			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
>  			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
>  			mediatek,larb = <&larb4>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
>  		};
>  
>  		rdma2: rdma@14010000 {
> @@ -1031,6 +1040,7 @@ rdma2: rdma@14010000 {
>  			clocks = <&mmsys CLK_MM_DISP_RDMA2>;
>  			iommus = <&iommu M4U_PORT_DISP_RDMA2>;
>  			mediatek,larb = <&larb4>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
>  		};
>  
>  		wdma0: wdma@14011000 {
> @@ -1041,6 +1051,7 @@ wdma0: wdma@14011000 {
>  			clocks = <&mmsys CLK_MM_DISP_WDMA0>;
>  			iommus = <&iommu M4U_PORT_DISP_WDMA0>;
>  			mediatek,larb = <&larb0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
>  		};
>  
>  		wdma1: wdma@14012000 {
> @@ -1051,6 +1062,7 @@ wdma1: wdma@14012000 {
>  			clocks = <&mmsys CLK_MM_DISP_WDMA1>;
>  			iommus = <&iommu M4U_PORT_DISP_WDMA1>;
>  			mediatek,larb = <&larb4>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
>  		};
>  
>  		color0: color@14013000 {
> @@ -1059,6 +1071,7 @@ color0: color@14013000 {
>  			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>  			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x3000 0x1000>;
>  		};
>  
>  		color1: color@14014000 {
> @@ -1067,6 +1080,7 @@ color1: color@14014000 {
>  			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>  			clocks = <&mmsys CLK_MM_DISP_COLOR1>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x4000 0x1000>;
>  		};
>  
>  		aal@14015000 {
> @@ -1075,6 +1089,7 @@ aal@14015000 {
>  			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>  			clocks = <&mmsys CLK_MM_DISP_AAL>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
>  		};
>  
>  		gamma@14016000 {
> @@ -1083,6 +1098,7 @@ gamma@14016000 {
>  			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>  			clocks = <&mmsys CLK_MM_DISP_GAMMA>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x6000 0x1000>;
>  		};
>  
>  		merge@14017000 {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
