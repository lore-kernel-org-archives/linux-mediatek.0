Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BFBC76195
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 17:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=et9IXXnwuJj8gBw2w84nxQj+qW6lVRl9tm6flakAp/I=; b=NOWFBEzOwg20QSEnFIrOyaiTQi
	dSZNONanViKp6si1ktrGSwOKx42FJwRdCHo8dL/rEgJNq2JwnL4vZn0xJakV7LKgDfwFaT3511W5Y
	9XFlBpQeNnLbLhvpeAblx2t9mbKSoXP1W1LFlR4DxTlQLSVZ3x1P5COM9UwO3L1YWi6VDUEqNLaZe
	06WbAE5UILpgUz6LMLEDDZA42ZOQZPydCKtzeYSzZCb3GmXanko4V0aB7+TVLdPPvfG4erJSfuJGD
	faPSC0nebzsoYYUldhfwRH4ggUzpKlbLU2y6/uwEGu1aSF+aXnq4lcKe6wNT0AZp2S91JsnlOO1Re
	QyT20h1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfleV-005BGC-0R;
	Fri, 24 Mar 2023 17:56:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfldA-005AKv-0Y;
	Fri, 24 Mar 2023 17:55:15 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DA32F6603143;
	Fri, 24 Mar 2023 17:55:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679680510;
	bh=klZ1wIb0qi8AUCKdFQaQFYLZ3ZlhvULeIjT368zNwRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S3wo2L/WbIXRtUL5Frry1upxALnlEdZImgYbyWsWSbznlxp0XuL5HR17x/tbBs0fP
	 A9xyNIzHJYqC3xVp+g4AvO7GXjeSKAXOApHB3QYpJ5OcvOkjv5dTEFd07MFciqzEgY
	 z+bu6qqVncKe1kYxh3ca2LfAG97wRIdo/z1F1mDcFoSxynCUqlWzKjwmTRxJUPhieH
	 UJRVNn3oITsuGGNIpt+jcdYzfjqF5iXfNc7GOLK1+OyfWhNrns3acRMPqHHfNP2ZT7
	 UjIWSnDu1aRUs9Kp7odBTvPOfFOwxLIOkWfhlmf1kmSOQovcyVf0ayaKDlrJqbtWSA
	 dDgfDjUNabFGg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: qii.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	houlong.wei@mediatek.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 11/18] arm64: dts: mediatek: mt6795: Add VDECSYS and VENCSYS clocks
Date: Fri, 24 Mar 2023 18:54:49 +0100
Message-Id: <20230324175456.219954-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_105512_372397_51384AE1 
X-CRM114-Status: UNSURE (   7.97  )
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

In prepration for adding the IOMMUs and LARBs of this SoC, add the
VDECSYS and VENCSYS clock controller nodes, providing clocks for the
vcodec stateful decoder and stateful decoder hardware.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index b721971d4e5e..a8b2c4517e79 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -647,5 +647,17 @@ mmsys: syscon@14000000 {
 				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
 		};
+
+		vdecsys: clock-controller@16000000 {
+			compatible = "mediatek,mt6795-vdecsys";
+			reg = <0 0x16000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vencsys: clock-controller@18000000 {
+			compatible = "mediatek,mt6795-vencsys";
+			reg = <0 0x18000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 };
-- 
2.40.0


