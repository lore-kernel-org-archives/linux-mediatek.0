Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815CFC433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 09:24:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D6AE61182
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 09:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D6AE61182
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nlg+LWdctgaQM2frzaiBZG9nF16Eo7gBmkVVvCW1FQ4=; b=JBVr/pdGI9Xq2tzThfzcUAnbt
	CenN60e2tzwVXa0xDze7qJHRL1O8LkqjAn14N7YlnT0psnjG26vMqnpXjsPmgwNZwgMUxumJp94K2
	X7t8WefViWOupNNpLlPNxxxcDfhOkAScLq8GMl9EImHkGyVI8GbhTMXci8VKp8SjEhX273DKGQdq5
	yFUPktfrh0QLmxoVzpbqGEMJAEznXUYwhCR2JYU5oxoTnQzz+aRAxuP5xsNAvmq4y8/fiK3UGMo/y
	KzTcF4tRbo9MyCKRWpg3DWEJnvPaktuyNA0kYiRs8h5cP4kNTOqLvGR3WLy9iRxx43MOTJ+MQ/4Zi
	70SbV8OJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV9rC-002XAd-NV; Sat, 10 Apr 2021 09:24:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV9pf-002WnV-FR; Sat, 10 Apr 2021 09:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=qcqlOeOU2kkIoXoH5J7Amkk6qmPSAOXmHwBg6Rrw8DQ=; b=mxNXvngsdYSPWRPuvNcZqe+UAf
 doheahbSwMk8zV72uAIs1wJuoVftxmO8jtBAxzOhDTy8C8WC5t8ENQbGaU9Q3S5B0hfDzJYbZg58D
 SJ8znV25Q5pamwx4Y5Dl0umiIRcOgt7Iv7+HCtHtQy9WQFFUjzNabegE3Kl2FjIW97bqKXuYIX8sP
 A+O7oHY2Rv85N+fB1STC+W+S2AGwldvzYhRJcfmIFJb7MrlkI7CTkiFfTGU8jSqw9Z4fiDGuexN/s
 rZr3ldWRUSwQCHbA996QGjGDftuphUDsUAJV7iadBjxQJpk0NI+Eaub4PGL9qxB39U4lo+Z2Ypgv+
 xKGZfxVQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV9pc-0050kK-Ur; Sat, 10 Apr 2021 09:23:10 +0000
X-UUID: 529e713722714596a62c5e1086875782-20210410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qcqlOeOU2kkIoXoH5J7Amkk6qmPSAOXmHwBg6Rrw8DQ=; 
 b=fmzmwiJxDIVwQDfaWLjql6EuIgL74I5kwx3Z4R2UqXWgL1rYl5NnUFSpe2OP6AfIJphMX6CFU0fCsSf2KttxGer4ycKURWqgC5ovmndwip6JrIy+OC45rRcLM3IHtzEFrGOYpSu627NACzSx756CUq9HTWoNhqrL64qoarhuy90=;
X-UUID: 529e713722714596a62c5e1086875782-20210410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 910873033; Sat, 10 Apr 2021 02:23:03 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 02:14:13 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 17:14:11 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Apr 2021 17:14:10 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, <eizan@chromium.org>,
 <acourbot@chromium.org>
Subject: [PATCH v5 15/16] arm: dts: mediatek: Get rid of mediatek,
 larb for MM nodes
Date: Sat, 10 Apr 2021 17:11:27 +0800
Message-ID: <20210410091128.31823-16-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210410091128.31823-1-yong.wu@mediatek.com>
References: <20210410091128.31823-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210410_022309_022047_17E95A4C 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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

After adding device_link between the IOMMU consumer and smi,
the mediatek,larb is unnecessary now.

CC: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
---
 arch/arm/boot/dts/mt2701.dtsi  | 2 --
 arch/arm/boot/dts/mt7623n.dtsi | 5 -----
 2 files changed, 7 deletions(-)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index fade14284017..0a7892bcf536 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -564,7 +564,6 @@
 		clock-names = "jpgdec-smi",
 			      "jpgdec";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-		mediatek,larb = <&larb2>;
 		iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
 			 <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
 	};
@@ -577,7 +576,6 @@
 		clocks =  <&imgsys CLK_IMG_VENC>;
 		clock-names = "jpgenc";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-		mediatek,larb = <&larb2>;
 		iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
 			 <&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
 	};
diff --git a/arch/arm/boot/dts/mt7623n.dtsi b/arch/arm/boot/dts/mt7623n.dtsi
index 1880ac9e32cf..2e6c16164744 100644
--- a/arch/arm/boot/dts/mt7623n.dtsi
+++ b/arch/arm/boot/dts/mt7623n.dtsi
@@ -121,7 +121,6 @@
 		clock-names = "jpgdec-smi",
 			      "jpgdec";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-		mediatek,larb = <&larb2>;
 		iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
 			 <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
 	};
@@ -144,7 +143,6 @@
 		interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&mmsys CLK_MM_DISP_OVL>;
 		iommus = <&iommu MT2701_M4U_PORT_DISP_OVL_0>;
-		mediatek,larb = <&larb0>;
 	};
 
 	rdma0: rdma@14008000 {
@@ -154,7 +152,6 @@
 		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&mmsys CLK_MM_DISP_RDMA>;
 		iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA>;
-		mediatek,larb = <&larb0>;
 	};
 
 	wdma@14009000 {
@@ -164,7 +161,6 @@
 		interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&mmsys CLK_MM_DISP_WDMA>;
 		iommus = <&iommu MT2701_M4U_PORT_DISP_WDMA>;
-		mediatek,larb = <&larb0>;
 	};
 
 	bls: pwm@1400a000 {
@@ -215,7 +211,6 @@
 		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&mmsys CLK_MM_DISP_RDMA1>;
 		iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA1>;
-		mediatek,larb = <&larb0>;
 	};
 
 	dpi0: dpi@14014000 {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
