Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCB6C4707C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hDzwVL9hlvrw+EBTBX0nN4O9YeKBoXB8PgMdGHs6jY=; b=E9AxVqMVYQlS0u8QS8rcsGaENw
	UqlKL36YuiRF6bXDnMiyaesyiA7ZCteNbisV6Rvu1qug/Kw3OrE3wRVDnHp+IML3VnIS2AId8G4WC
	cwuYdDo9Y+9ot6ywa0ofwuZEsZyaRwQ5L0uvmk34DsdQDs6k/OixEAIyPRKv5MaYsXN7nDf+Clutr
	QZI7bCOk83aZHHtr73v2qtVFFongMuqaVSxaB8rGyqdjQOfvTfwa5i+6TtjwFQzz64aobVv/f5nqb
	6eKnzvWb8shQ8+tssWSSyHG8PZJ+2wN46KyOIbbrB5SOmjlKBFPs5st5dFZ+SCUrD5tmW/8KYZrZ0
	YA1G7+nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE8N-002Noz-1F;
	Fri, 12 Jan 2024 09:47:27 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7q-002NEP-09;
	Fri, 12 Jan 2024 09:46:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705052812;
	bh=gL9dBZTGnU9IkMRPqj3ewg2fNvV9dpUlTIdwuTp/HeU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JgameZ7Qfy0yT8alx2+YKNEednVHANfwOvPmh9XyzJpaRvDVfl7mNGFizFGxgZlqr
	 +sljUdc6UkzHSpUgDEgnOoTObIgshFnxILuxih0/Lg8RHIztL+IXyqjJkweN7J0h2A
	 48neMrJYNXFvRbHlTkRVseZ4/n5wxp3gmyRZvY4c9VQBq+LqhLKy2UZERh53VOlLxk
	 LHMrkGCnd8duiyb9AdrBfQ7/P77NMtWW+i62CZ5217BIvAMFwI72fPCd2CVtcKNx16
	 4Hjr6PJw6CAaHp5GX8jZBdSLUAqAZUzyD9ypwEF7gghkoNri9Fkdy6tY4NSX3WFNyk
	 lzbW0PqEiO2uA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0D9443782035;
	Fri, 12 Jan 2024 09:46:52 +0000 (UTC)
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
Subject: [PATCH 14/15] arm64: dts: mediatek: radxa-nio-12l: Enable UART1 for 40pin header
Date: Fri, 12 Jan 2024 10:46:31 +0100
Message-ID: <20240112094632.66310-15-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
References: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_014654_215637_41B9D82A 
X-CRM114-Status: UNSURE (   9.71  )
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

Enable the secondary UART port, exposed on the 40pins header.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 191c059f5c97..b0d66fa139b5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -609,6 +609,13 @@ pins-bus {
 		};
 	};
 
+	uart1_pins: uart1-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO102__FUNC_UTXD1>,
+				 <PINMUX_GPIO103__FUNC_URXD1>;
+		};
+	};
+
 	wifi_vreg_pins: wifi-vreg-pins {
 		pins-wifi-pmu-en {
 			pinmux = <PINMUX_GPIO65__FUNC_GPIO65>;
@@ -707,6 +714,13 @@ &uart0 {
 	status = "okay";
 };
 
+&uart1 {
+	/* Exposed at 40 pin connector */
+	pinctrl-0 = <&uart1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &xhci0 {
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&otg_vbus_regulator>;
-- 
2.43.0


