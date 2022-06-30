Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EA0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0H4Tb7jspgbenIwk9oZ4Yih9WscgIB/rfGdAnUnDGc=; b=G5XDfackLoRIrYihoDIp3h9fl7
	D43j8MpkPAnebj5NaIPgMjLCbBMVFSid3duwQYaduwFp+KHR1sqtsYHhqWtGEPVXXEQ8T+r5BNFUc
	8hn17ceBnCG4SVLeU5TuysQqWdZdWYOlgo69sx+E7MRLPN2qR4SoCBbahoHiAmLUhj6EaFkZ/RmCk
	ldPGS7WhAwR5FtxO0DqxbR2iRLg0enEsV7cTIsdr6Avj5SfMa/1Qzc1DOmYIVaXP+JbIRNhnxZZtV
	Sjlm3O57NdlHaiRGufEtSC4MTD60hlCUNw12Pa/RToEbBCeONgHktMZnIxkZsDJgN40IImI9qBE5R
	Bkra6d0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wEq-000Kmh-15; Thu, 30 Jun 2022 15:37:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wAf-000IZB-Ej; Thu, 30 Jun 2022 15:33:35 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7B9016601977;
	Thu, 30 Jun 2022 16:33:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656603212;
	bh=Z5AoNXePqDCnxXb8uAYZR8QzxcTn7tQFTixe292MpDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d9EDnd81JFVrRCxiTNFt7rOMnjZSNr+4qseMa/IczEdoCewcK+wMLT2uYpCbgdU26
	 90Tslt8i42cXFf+ZAgwjkVaRUPMctG2KgC5Ldp54TEqqGFK0vUbnBvpvDwH60cXST3
	 vU4bc5fuV+tSV2yHkhTW81nMKV61DF03znoxt/jlEtJz7B+i+jOwThjpwJWDsaXGVU
	 /xPWygGxtV1kLB2Ahk/momOOE/EsWCKeTvTRhiXP8GVT+u0s7Kx/1F/xwzOI2Rq0Do
	 1eR1vOnxfVGYFFBf0Z4nujT8WbpNhbAYwr0mWypDdgZGalLgMCVUO0mEw/s2joztNh
	 T3oigYwSDiqDA==
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
Subject: [PATCH 09/11] arm64: dts: mediatek: cherry: Enable MT6360 sub-pmic on I2C7
Date: Thu, 30 Jun 2022 17:33:14 +0200
Message-Id: <20220630153316.308767-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_083333_731021_7F8C7245 
X-CRM114-Status: UNSURE (   8.85  )
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
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 379d0e5c4055..1668aa1be373 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -161,6 +161,18 @@ &i2c7 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c7_pin>;
+
+	pmic@34 {
+		#interrupt-cells = <2>;
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


