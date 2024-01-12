Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D12FC4707C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dl8Ci/D8tziuCjeAIKcwofobw/LxJO4GLIdZ8rxwCI=; b=wMdm0S3l02sYWKsy8eo5J5vjtX
	nWHi4EtRMVhB7aap8CaAnKt86tqr5C4uoGweKnr4rOwJEYAfBKBi1M82LzQnXOwAIvVmc0ZxjTbnw
	EsFA6FXY5YrPOks5ctRf9y0IrUKZ+Eg2RR2TlUNv89kYv4BcVl7OOYXMco45CRf30FXxGrLJ5Pqxj
	ch3IwqPNAS1wY6XYxcg8U42gmi3AQyeaDsndoXQHNTxuafhuZaDK2tvzcNDWrG+ZlpYQpUX/11bB9
	Nb+Jnr5CP8dboV7s8fL7SQ1GRxGRptiX+cZf85CTANEO5gJKo5segw0R0WSdWudUEUZZ42JpJ9/t1
	ctekJEfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE8A-002NbD-08;
	Fri, 12 Jan 2024 09:47:14 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7o-002NCU-0E;
	Fri, 12 Jan 2024 09:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705052810;
	bh=ooNGEFPL+gUVRid3mWpdeLiRnX9gOyT+28DJWB37x2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s7j+MtAA2wKznnHtgaCCVdL9MMIzIDL35gK5ovR2oytf+x3+qEOy4Mgor9NnL+EaB
	 4gE7uzIxbbM3aWcvgFzQRN9+CoYv5rBpj4Ue9ucTLBWhC0aC0F7eT1xKZ+GIC5FtL8
	 IarcnCOn3wseHA8uxDffMUh6OQqehAcrp+z44pYvMYstRjg0kr2scO25AQn5aW70Cb
	 +0CzMagVdrzhnJZLXJyIxOrTJQ+glhRfdeWnAL16xthFCsgCJZaS1H4aIrLfpNVMpw
	 JeU/XOjmuAxxnMM/66RkoxVS738a/wLmaIh2YUZzG/U2vozP8gNa/83LZs6CWSTf1K
	 x72lkUSq4BRWA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 058EB3782021;
	Fri, 12 Jan 2024 09:46:49 +0000 (UTC)
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
Subject: [PATCH 12/15] arm64: dts: mediatek: radxa-nio-12l: Enable PCI-Express 1 for WiFi
Date: Fri, 12 Jan 2024 10:46:29 +0100
Message-ID: <20240112094632.66310-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
References: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_014652_253344_45B56D3E 
X-CRM114-Status: UNSURE (   8.76  )
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

This board has a MT7921E combo chip connected through USB for Bluetooth
and PCI-Express for WiFi.
Add the PCIe1 controller to enable WiFi connectivity.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index eafce9cb2598..be2094b8fe3c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -573,6 +573,15 @@ pins-bus {
 		};
 	};
 
+	pcie1_default_pins: pcie1-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO0__FUNC_PERSTN_1>,
+				 <PINMUX_GPIO1__FUNC_CLKREQN_1>,
+				 <PINMUX_GPIO2__FUNC_WAKEN_1>;
+			bias-disable;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO98__FUNC_UTXD0>,
@@ -598,6 +607,12 @@ &pcie0 {
 	status = "okay";
 };
 
+&pcie1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_default_pins>;
+	status = "okay";
+};
+
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
 };
-- 
2.43.0


