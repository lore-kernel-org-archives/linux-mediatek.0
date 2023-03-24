Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9BFC6FD20
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 17:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GV4iKXq9m6RWITAoD8Qah7JE1fYZPEC85DzSL6+CoPc=; b=iNVCw90kRWEbHvBiTIQAEP9qg0
	u3gsjpPM+n+98oucyHOIOlbAvtauIKBdP8Q8VEd/XDgczRrogur1sW83iw557Kk2/YfqR4YtoFEBL
	j9e6SevQqS7oQYzX/uUAlrAuEXO4d2MXDScu62o9jFXEOC0gaAYSTMCbr1ECHjy9fX/KAwCc9I6vq
	1vndSYIJloIBxMZkpJUUFHhHjko0gjFAG7OzjMwJG0z84QkH+wUQQ2gvAiW5puYw1MzRvKgCCMVmp
	ApemYCG6ZlYRLbeWVLraSY2BaXyWICRStPJajwcQWZ8LWiAxQifuz+lNlQ4SUXl+PQLKBD+ipX8/W
	t25X4BHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pflfL-005Bxo-2C;
	Fri, 24 Mar 2023 17:57:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfldF-005AOv-0D;
	Fri, 24 Mar 2023 17:55:18 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 17F85660314B;
	Fri, 24 Mar 2023 17:55:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679680515;
	bh=7QwlmzO687lgIQQgZpeWHJxJZ30x74RVdHCWiqIGrHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b3SeICoNVCF8VmX+gw0g9JPvjE+XkavnqV6IFsRoaY8RsW9cPWMaSBl81k6foPP6T
	 9i9CG4wJyxLkr/hyeF4ki7FYCDPdMWjPPoxdtXfoH+Zi7Ol1P/y0hrMZrNYy56xCtV
	 dUXAU1vsokiT5i6m76iRPWoulXeeoab4GJ5FzL9CzMulROxdcWwG5nZLGb+YJw0/W6
	 16s9R1uanDcGRoJ3JnlrxFDtqEB2OqcQpRga0mx4aRBA/tx7puwtqBl6u+yA+XphNZ
	 tH7vO+22UTf4pgMlCJQzGe+i+587patL+SgkeiwEVhw00tHpBH2k3YWIZxG3bZpRfY
	 R3uGyz5Td+5FA==
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
Subject: [PATCH v1 17/18] arm64: dts: mediatek: mt6795-xperia-m5: Add Sensortek STK3310 Proximity
Date: Fri, 24 Mar 2023 18:54:55 +0100
Message-Id: <20230324175456.219954-18-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_105517_254940_3BBB8806 
X-CRM114-Status: UNSURE (   7.90  )
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

Add the STK3310 Proximity sensor and its pins.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index bda14c74a8af..bff0760cc1c8 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -111,6 +111,14 @@ magnetometer@0x12 {
 		compatible = "bosch,bmm150";
 		reg = <0x12>;
 	};
+
+	proximity@48 {
+		compatible = "sensortek,stk3310";
+		reg = <0x48>;
+		interrupts-extended = <&pio 8 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&proximity_pins>;
+	};
 };
 
 &pio {
@@ -127,6 +135,14 @@ pins-rst {
 		};
 	};
 
+	proximity_pins: proximity-pins {
+		pins-irq {
+			pinmux = <PINMUX_GPIO8__FUNC_GPIO8>;
+			bias-pull-up;
+			input-enable;
+		};
+	};
+
 	accel_pins: accelerometer-pins {
 		pins-irq {
 			pinmux = <PINMUX_GPIO12__FUNC_GPIO12>;
-- 
2.40.0


