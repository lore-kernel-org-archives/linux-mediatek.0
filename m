Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C959C4707C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slOMKemX4DjdWZVjM3Z+B/MTebdzUQVzVDGz6wnMmZc=; b=GNrx4QNNJQnCVjTtEqx8CGjLUs
	PEEKtfEGCZh171YsfpvHQbx+bILqQE5+HqrCAe0G6nqpnivK5vsJw1QHSDBcRGofyOb8gyCkhrtD6
	uRotzYrWeEHN3kxO4EP5B/9lVqBIPjMbKSJLdTCNa9LpVkQObOIMGKYXr5nLYeoVgE+pVJ96AMKjE
	MkkKSf/rrsAb/A6N4DJMYJwOk8p36uwhKeq6ueUNE55trduiyZdD+KNW12lucUrZRS7gZCsviQBTt
	J/vugOokgCJ8LF65R8nSGyK49vCXEMDadS4KBnMKGbCA4XOYELjybgNj1h3CFQ+GXDuOckUQHGPS+
	jo9jeP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7w-002NLt-2Y;
	Fri, 12 Jan 2024 09:47:00 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7i-002N99-2d;
	Fri, 12 Jan 2024 09:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705052805;
	bh=yW5zSOddHFfd5FTjWfTz+7DQVWreLVZZ+dE3jjijem8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o9+q/Wi8MG/NZ1xu9L8pbjWm1oDP6fjeGZCI0BQzy7SBCIbHjowQR56EeJCU0ygkc
	 vlquxFvhVZ2dUv/5BCH35ptwYdGIEt4noPWR5bgOYSdmu0T6WlnJJc6TuEzeMa1DfY
	 CYN/X9qzSZwn1Qh2rdR6067JZz6tmfjlEMTdOigDXHbknvDyAaDfJX6OgExFaTnmux
	 jNYI5wLpC1X6eWI7bC3lxrgr9FFKgHHFh8jQUpns6tKndXFM8oxYambrFjYByHJIw7
	 ffsTAbnTKpoKoXoLWaCBtpm/MY5Qi4i8GKbN14hmQIsJIwD7OB5GTHg8d8WNmMh5jR
	 Jr73oGZe8oN0A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D38F53782031;
	Fri, 12 Jan 2024 09:46:44 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	macpaul.lin@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 07/15] arm64: dts: mediatek: radxa-nio-12l: Add MT6360 battery charger
Date: Fri, 12 Jan 2024 10:46:24 +0100
Message-ID: <20240112094632.66310-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
References: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_014646_981947_1D60F09F 
X-CRM114-Status: UNSURE (   8.86  )
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

Enable the MT6360 PMIC's battery charger which also provides a regulator
the USB VBUS.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 221d7062d5ef..3b8880db49ff 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -186,6 +186,17 @@ mt6360: pmic@34 {
 		#interrupt-cells = <1>;
 		pinctrl-0 = <&mt6360_pins>;
 
+		charger {
+			compatible = "mediatek,mt6360-chg";
+			richtek,vinovp-microvolt = <14500000>;
+
+			otg_vbus_regulator: usb-otg-vbus-regulator {
+				regulator-name = "usb-otg-vbus";
+				regulator-min-microvolt = <4425000>;
+				regulator-max-microvolt = <5825000>;
+			};
+		};
+
 		regulator {
 			compatible = "mediatek,mt6360-regulator";
 			LDO_VIN1-supply = <&vsys_buck>;
-- 
2.43.0


