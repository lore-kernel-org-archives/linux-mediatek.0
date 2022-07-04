Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940AFC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 10:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLMSYkpKZdI2e2a5c2naaWpsLPsBgtKhvRppqXHu/aw=; b=d2EAcJ4ZjAxfFL2DTJ5O3bq7Vj
	T0nYzUQ1YaPSyglqrkssIPY4HMiZ5LDnQnMnbMkwDBbKT09QQaveuoEFZ/cTE2UraPvMoXCdHGF0t
	2RoyigPzescc/UetKa+3c/n4LJayU+zeqckR0Zl3eU9tnL0Tw6Dxw80RQC9cFuTaAQx2J62XLlqwg
	2cwxTxCkesXNnGHV/XsSckV9CiQ8oKLFSRwXhM2vAxHLTbtOXX3jmrHlSH7CR/gwghvX3OjLX5QKx
	uosOvrl0tAn/0L7xkaJyq1i/uagLLS250F056iBk7iNY+IHAc9j6pylyuIn42js4+ddvvxhoI+dwb
	oLgfc40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J7x-006reZ-8g; Mon, 04 Jul 2022 10:16:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J5G-006phE-I0; Mon, 04 Jul 2022 10:13:40 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 82A956601985;
	Mon,  4 Jul 2022 11:13:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656929617;
	bh=cYCFPkI9Ox4t3aj8urLrA3wqMRp1z1bSxEhnMr1wUSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qdw82P7jQP9czqM3dF4d1Az22FRnHzS7I6TPRQ0FQjKV5s/uF4Xv+aXHBbCZaAVRz
	 M/NPUhNyxdzPxVTQ/aRV/DQImMihGL5z8Te/Mvq80i8vmbkuhZK0CNmHH31wjOX9BO
	 pgUhcNm4BJQ5+LTT5TqQnG7eOseHxMrtBQEfu8VQZaxxDhx85x1s0RId39gPUrJHnn
	 yC5rBUEylLu5ipsxkbI2tx4wxPVqduJRbHTkka5bKOz6qL9xoNd1jpwUriDXqj6U1P
	 jS2jLzyv4ikQjA/Ft/ujbvcjVODGUbaybO0cxc+m69mfFMj7HxKui5b6rDzWhZU6+W
	 xgdT/4tFs0xUw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	gtk3@inbox.ru,
	luca@z3ntu.xyz,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH v2 09/11] arm64: dts: mediatek: cherry: Enable MT6360 sub-pmic on I2C7
Date: Mon,  4 Jul 2022 12:13:19 +0200
Message-Id: <20220704101321.44835-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
References: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_031338_771134_F6AFE00A 
X-CRM114-Status: UNSURE (   9.35  )
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

All devices of the Cherry platform have a MT6360 sub-pmic,
providing two LDOs. Add the required node to enable the PMIC
but without regulators yet, as these will be added in a
later commit.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index f68d8ff05b4d..c07d3ac79f62 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -161,6 +161,18 @@ &i2c7 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c7_pins>;
+
+	pmic@34 {
+		#interrupt-cells = <1>;
+		compatible = "mediatek,mt6360";
+		reg = <0x34>;
+		interrupt-controller;
+		interrupts-extended = <&pio 130 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-names = "IRQB";
+		pinctrl-names = "default";
+		pinctrl-0 = <&subpmic_default>;
+		wakeup-source;
+	};
 };
 
 &mmc0 {
@@ -558,6 +570,14 @@ pins-miso {
 			bias-pull-down;
 		};
 	};
+
+	subpmic_default: subpmic-default-pins {
+		subpmic_pin_irq: pins-subpmic-int-n {
+			pinmux = <PINMUX_GPIO130__FUNC_GPIO130>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
 };
 
 &pmic {
-- 
2.35.1


