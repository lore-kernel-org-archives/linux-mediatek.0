Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EA3C4706C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5ECUvJvsXBj4/NOO4guY2IQc2L2V+eZ7O40UHnHmWI=; b=OcGbigM9WZMX+djyv3xgj7q57l
	T/yqm94nYaJRfZvdEVxHkDvLE1ezkUvWYIsBphRTwbBLG3orsKvSuz260LG8QEmDc98e8kqabHRm0
	ZLzVz4sOtqst5H/9aszs6xkXF31WhW2Z3JEB3ZioQKRvetPeipm+UPPArFo8rMUss+79sCEcRoqmZ
	0m2XmgKJCYqqxjoz4kKPq3/91folqwC1wfMuSnw/e6RQCVqMc9dRFNdCnxLY++w5h1Ga6v1+IocJm
	2XTQKIKO8xKDlc1BwiIbjs3gjdxXVBZ5bhepnvPf2AqdNgd25EGgneow0LTL/exKwHeEDUNNKhXSI
	UwaQkq4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE82-002NTT-31;
	Fri, 12 Jan 2024 09:47:06 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7l-002NB3-31;
	Fri, 12 Jan 2024 09:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705052808;
	bh=PBInGRQ7u56PJ5kAhJgP+h9Q1n6mnFxfoN7YCdPzwaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D3x/KrQGs5mZR32NTRZBSUZgSKwCRsHUE9HUveVzAwgj70HdsQHEyI9Tqr9PtweLH
	 4FI4pfF5uIvFCDjABr+efx7uhxfy8H5umrSm2ZLXGAGqkSQRucs8S+KIf5TuF/lZd7
	 LVRfsZeguGmQ/RKItOhwtFJoivbUVRuutEuOkfPuEzpxrVm6wlJWj8pbmstl5jwPql
	 3LaVtJeWUUatUFQHxC7/L5BW2trHj81nmUfsqZ6ZhyVg/Tf4bcLgMFqSMyhsBjLvX3
	 1m9TQSJSoj8EeZqX6Q9w1NA0HRlUJDM3wmIc5E9DSWqymdYYgdxBPAmFv25VZv59CP
	 MPeZ/K1gmfJmQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E61713781FCF;
	Fri, 12 Jan 2024 09:46:47 +0000 (UTC)
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
Subject: [PATCH 10/15] arm64: dts: mediatek: radxa-nio-12l: Enable PCI-Express 0 for USB HUB
Date: Fri, 12 Jan 2024 10:46:27 +0100
Message-ID: <20240112094632.66310-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
References: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_014650_102297_9E98E5FD 
X-CRM114-Status: UNSURE (   9.68  )
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

Enable the PCIe0 controller, providing part of the USB connectivity
found on this board through a USB HUB connected over PCI-Express.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 5a9e33013209..dbde2c7b3c64 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -564,6 +564,15 @@ pins-irq {
 		};
 	};
 
+	pcie0_default_pins: pcie0-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO19__FUNC_WAKEN>,
+				 <PINMUX_GPIO20__FUNC_PERSTN>,
+				 <PINMUX_GPIO21__FUNC_CLKREQN>;
+			bias-pull-up;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO98__FUNC_UTXD0>,
@@ -583,6 +592,12 @@ pins-wifi-vreg-en {
 	};
 };
 
+&pcie0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_default_pins>;
+	status = "okay";
+};
+
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
 };
-- 
2.43.0


