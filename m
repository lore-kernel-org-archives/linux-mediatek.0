Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDEAC7EE2F
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 16:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VZdEI4WWgDShKJddX0qICL1FLXweDUrUToNWyLYDJM=; b=O6OwHSLqC/jDiCOjvt0lFUFMes
	IYM/ST0sqB8cVy6i/vwjukCi0c2OdKMN6za5/68soJB7+UIm2MtQTo3N93Tselr4IN8F3OUqVbUxc
	ubb1T2ISoTxj+aFs4tawVo7lyYig63T3Ahvg1GCfme4vW9Y0kYs67VzoFLt+sXrkg/LmFZYMJtFZb
	di/qoLReqK93I6J5Os6nU/6NMg0tDT/pa4t1Tc4UUlcmM3/atkrADYDiKX7q6Ht54V6m5trrNqUGA
	3hBJ6UvQFdDvjZuu2ldbCzYpIJ8za0aeySRWnZpURSmCcim9t2aQVLoHbmCqwP04zqJvFm4W6XQ7y
	55S21TRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Cxk-00G6S2-0o;
	Mon, 05 Jun 2023 16:21:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Cxf-00G6NR-2G;
	Mon, 05 Jun 2023 16:21:41 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AED526606E75;
	Mon,  5 Jun 2023 17:21:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685982098;
	bh=eYWIdhW4aakZCc9KT/m2mXuoGNz20gM45H5p6PtQfaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nyshmm6ObK9GxFVtiLunGY3XtIz9xexeLx/ePQwXglIhayFfZxi3sM4omcgO83LkK
	 fIDCGlZexBM8iCi/9LZzmQHh/n+AGsC7CzWquCziocDuPiZZleX36sbD7So7qKe6U2
	 a14M9u+sY45vC2QNBgNfu1hIRjVXzcX9WuJEqKkRqHjtc2TtAd0H6LRC8JTsQsIE8q
	 cIkHLvz4hxBdmrO6i8M3nl0Xhn5OA7N0BSypRMas2Siw2oDLjQBnYvYyiRU5zEVv84
	 lI1f2ImGC2qDbLdOsfIYKM4T8usjS4EZIxQU0k7MtKHkDa0EDYtymStIrURM8vbprx
	 Z5zoOPbPdaCfA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 6/6] arm64: dts: mediatek: mt8183: Add decoder
Date: Mon,  5 Jun 2023 12:20:30 -0400
Message-Id: <20230605162030.274395-7-nfraprado@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605162030.274395-1-nfraprado@collabora.com>
References: <20230605162030.274395-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_092139_872112_E1197EF0 
X-CRM114-Status: UNSURE (   9.25  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

Add node for the hardware decoder present on the MT8183 SoC.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Signed-off-by: Qianqian Yan <qianqian.yan@mediatek.com>
Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5169779d01df..8bb10ed67e87 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -2019,6 +2019,45 @@ vdecsys: syscon@16000000 {
 			#clock-cells = <1>;
 		};
 
+		vcodec_dec: video-codec@16020000 {
+			compatible = "mediatek,mt8183-vcodec-dec";
+			reg = <0 0x16020000 0 0x1000>,		/* VDEC_MISC */
+			      <0 0x16021000 0 0x800>,		/* VDEC_VLD */
+			      <0 0x16021800 0 0x800>,		/* VDEC_TOP */
+			      <0 0x16022000 0 0x1000>,		/* VDEC_MC */
+			      <0 0x16023000 0 0x1000>,		/* VDEC_AVCVLD */
+			      <0 0x16024000 0 0x1000>,		/* VDEC_AVCMV */
+			      <0 0x16025000 0 0x1000>,		/* VDEC_PP */
+			      <0 0x16026800 0 0x800>,		/* VP8_VD */
+			      <0 0x16027000 0 0x800>,		/* VP6_VD */
+			      <0 0x16027800 0 0x800>,		/* VP8_VL */
+			      <0 0x16028400 0 0x400>;		/* VP9_VD */
+			reg-names = "misc",
+				    "ld",
+				    "top",
+				    "cm",
+				    "ad",
+				    "av",
+				    "pp",
+				    "hwd",
+				    "hwq",
+				    "hwb",
+				    "hwg";
+			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
+				 <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
+				 <&iommu M4U_PORT_HW_VDEC_VLD_EXT>,
+				 <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
+				 <&iommu M4U_PORT_HW_VDEC_PRED_RD_EXT>,
+				 <&iommu M4U_PORT_HW_VDEC_PRED_WR_EXT>,
+				 <&iommu M4U_PORT_HW_VDEC_PPWRAP_EXT>;
+			mediatek,scp = <&scp>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_VDEC>;
+			clocks = <&vdecsys CLK_VDEC_VDEC>,
+				 <&vdecsys CLK_VDEC_ACTIVE>;
+			clock-names = "vdec", "active";
+		};
+
 		larb1: larb@16010000 {
 			compatible = "mediatek,mt8183-smi-larb";
 			reg = <0 0x16010000 0 0x1000>;
-- 
2.40.1


