Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70293C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 14:50:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ADAF610CF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 14:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2ADAF610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7CGKtcF2NKwqTGQj5uohTIrC/E8mRV/aBFtyMXy4QjM=; b=P7Uq6uxHRgP7iO
	ZItfJOq+Y26EtrMLmmdTACEjAteNMlP7Rx6/9xRHl6fKAcL7T5nPx/ZhiXVVSvdy5OILMrxDqDMVW
	tKmfZm0VG4eY9lzAOKPyXIu9gDOCxQo68BJdqmXm33gTE5Z3ilbNOBNRdQArTaqqhIM2GZtTJVZFI
	XK5dU7xG72zRE8Tqfzn5i7ecKvoZD9mLJpEC4p2fn4yP8IWVsKBhNojXW7FZmV7V19p1P/aodOj79
	1D2xoHDWCAwQYFEPrKjIStZWbn1JvoiXsu3w0P0/EnMOEH0LIBeJKTqmVLuvtJe61vtFjkwTykCGb
	bJ9J3kxPuAPpAj15aDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIuDu-007Jdu-RF; Wed, 25 Aug 2021 14:49:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIuCr-007J8J-Qs; Wed, 25 Aug 2021 14:48:49 +0000
X-UUID: e73119bf002a4d9483d1ab2f5b09e60d-20210825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=S8lz40VQsC+iruDypsU8GKepI1jpx87PsYGerDEG0kE=; 
 b=qxfRn1Hg0Lqe3t56hcPyiYopMgCBOEnF0HgRUSSCfHPYpftk0WOntKvUis/nwkfA0fPea/EoJMbonVlIlKXRKTeIhmCrSI3MxkQaCPDZMn5U9NRh5bGjEmesNKk714oj79d39HMJ5346IOZ0hrrLFm2QKisR2aGXHoa9/PAJPlA=;
X-UUID: e73119bf002a4d9483d1ab2f5b09e60d-20210825
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 873447159; Wed, 25 Aug 2021 07:48:38 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 07:48:37 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 22:48:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 25 Aug 2021 22:48:35 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Frank Wunderlich
 <frank-w@public-files.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Fabien Parent <fparent@baylibre.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 06/14] arm64: dts: mt8195: add display node for vdosys0
Date: Wed, 25 Aug 2021 22:48:25 +0800
Message-ID: <20210825144833.7757-7-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210825144833.7757-1-jason-jh.lin@mediatek.com>
References: <20210825144833.7757-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_074845_931175_1A5A6FE6 
X-CRM114-Status: GOOD (  11.01  )
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

Add display node for vdosys0.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
This patch is based on [1][2][3]

[1]arm64: dts: Add Mediatek SoC MT8195 and evaluation board dts and Makefile
- https://patchwork.kernel.org/project/linux-mediatek/patch/20210601075350.31515-2-seiya.wang@mediatek.com/
[2]arm64: dts: mt8195: add IOMMU and smi nodes
- https://patchwork.kernel.org/project/linux-mediatek/patch/20210615173233.26682-15-tinghan.shen@mediatek.com/
[3]arm64: dts: mt8195: add gce node
- https://patchwork.kernel.org/project/linux-mediatek/patch/20210705053429.4380-4-jason-jh.lin@mediatek.com/
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 110 +++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 47c44cb77da0..4064a92e28a5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1153,9 +1153,119 @@
 			#clock-cells = <1>;
 		};
 
+		ovl0: disp_ovl@1c000000 {
+			compatible = "mediatek,mt8195-disp-ovl",
+				     "mediatek,mt8183-disp-ovl";
+			reg = <0 0x1c000000 0 0x1000>;
+			interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
+			iommus = <&iommu_vdo M4U_PORT_L0_DISP_OVL0_RDMA0>;
+			mediatek,gce-client-reg =
+				 <&gce1 SUBSYS_1c00XXXX 0x0000 0x1000>;
+		};
+
+		rdma0: disp_rdma@1c002000 {
+			compatible = "mediatek,mt8195-disp-rdma";
+			reg = <0 0x1c002000 0 0x1000>;
+			interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_RDMA0>;
+			iommus = <&iommu_vdo M4U_PORT_L0_DISP_RDMA0>;
+			mediatek,gce-client-reg =
+				 <&gce1 SUBSYS_1c00XXXX 0x2000 0x1000>;
+		};
+
+		color0: disp_color@1c003000 {
+			compatible = "mediatek,mt8195-disp-color",
+				     "mediatek,mt8173-disp-color";
+			reg = <0 0x1c003000 0 0x1000>;
+			interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_COLOR0>;
+			mediatek,gce-client-reg =
+				 <&gce1 SUBSYS_1c00XXXX 0x3000 0x1000>;
+		};
+
+		ccorr0: disp_ccorr@1c004000 {
+			compatible = "mediatek,mt8195-disp-ccorr";
+			reg = <0 0x1c004000 0 0x1000>;
+			interrupts = <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_CCORR0>;
+			mediatek,gce-client-reg =
+				 <&gce1 SUBSYS_1c00XXXX 0x4000 0x1000>;
+		};
+
+		aal0: disp_aal@1c005000 {
+			compatible = "mediatek,mt8195-disp-aal",
+				     "mediatek,mt8173-disp-aal";
+			reg = <0 0x1c005000 0 0x1000>;
+			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_AAL0>;
+			mediatek,gce-client-reg =
+				 <&gce1 SUBSYS_1c00XXXX 0x5000 0x1000>;
+		};
+
+		gamma0: disp_gamma@1c006000 {
+			compatible = "mediatek,mt8195-disp-gamma",
+				     "mediatek,mt8173-disp-gamma";
+			reg = <0 0x1c006000 0 0x1000>;
+			interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_GAMMA0>;
+			mediatek,gce-client-reg =
+				 <&gce1 SUBSYS_1c00XXXX 0x6000 0x1000>;
+		};
+
+		dither0: disp_dither@1c007000 {
+			compatible = "mediatek,mt8195-disp-dither",
+				     "mediatek,mt8183-disp-dither";
+			reg = <0 0x1c007000 0 0x1000>;
+			interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_DITHER0>;
+			mediatek,gce-client-reg =
+				 <&gce1 SUBSYS_1c00XXXX 0x7000 0x1000>;
+		};
+
+		dsc0: disp_dsc_wrap@1c009000 {
+			compatible = "mediatek,mt8195-disp-dsc";
+			reg = <0 0x1c009000 0 0x1000>;
+			interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DSC_WRAP0>;
+			mediatek,gce-client-reg =
+				 <&gce1 SUBSYS_1c00XXXX 0x9000 0x1000>;
+		};
+
+		merge0: disp_vpp_merge0@1c014000 {
+			compatible = "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c014000 0 0x1000>;
+			interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_VPP_MERGE0>;
+			mediatek,gce-client-reg =
+				 <&gce1 SUBSYS_1c01XXXX 0x4000 0x1000>;
+		};
+
+		mutex: disp_mutex0@1c016000 {
+			compatible = "mediatek,mt8195-disp-mutex";
+			reg = <0 0x1c016000 0 0x1000>;
+			reg-names = "vdo0_mutex";
+			interrupts = <GIC_SPI 658 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_MUTEX0>;
+			clock-names = "vdo0_mutex";
+			mediatek,gce-events =
+				 <CMDQ_EVENT_VDO0_DISP_STREAM_DONE_0>;
+		};
+
 		vdosys0: syscon@1c01a000 {
 			compatible = "mediatek,mt8195-vdosys0", "syscon";
 			reg = <0 0x1c01a000 0 0x1000>;
+			mboxes = <&gce1 0 CMDQ_THR_PRIO_4>;
 			#clock-cells = <1>;
 		};
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
