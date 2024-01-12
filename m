Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A833AC4706C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuGD8K11CBQmIhdf5c6VYI6DkDR5nWH5KUeFpU0vuSA=; b=NN0di2viWm4YROkqQRvixggwU7
	yweIwOQg17fTwykrbKg++NeqgY3FLaMTHa8feicj7U5uB9eb2XjQBsuRe+IezhgAQkDUrd043LKzW
	mpT4G0ifrnLYXhQZiEI2E5u4LFshsTZijmE9gWCjUynX0Btuqmfk8upPSbbECmytvdCbpUghvWC+7
	1AP+ow0ZygL2Mrt2yeZfYWcjBkJN6SC1LYKvmFGE7AuFNTSOmSAxJPYoGcL8VcawiigpBmiLs/WRY
	jKYTkmchBNIXJGkcotS1mlgn3yfwe9OcCOvViwo+7Nv7shWDPodolnT1VyiKASBUEx7o7qoJ1RiWm
	wrPoqUYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE88-002NYk-03;
	Fri, 12 Jan 2024 09:47:12 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7m-002NBo-36;
	Fri, 12 Jan 2024 09:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705052809;
	bh=g7FhaFbhntWGCCkCExT62675y5uul510eeZHjE0YvKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=agvbrPbm+dTH26Wq2f6dm860vARTYaN6RQxO5YqmnRqQVIINpjF4ag04/jXVzKjPG
	 /DdQ60IIZmreQaezYQq4uLBpteVCLMLA5/KJ2f0DIPujUDluh+GNxVYU714Eh9cqWC
	 AzKRqioua2HCef7AVtB28v5h1/RBYqY10s9l3GLUCfIw3YT3Y0mjyAcJqz0Up9gHTu
	 ImJ7A6NgCh+hO/1/HEo9N280SMCFueKn/3swVGB9QfcyPymfGRHnVSMH5nrLG6ssy6
	 2lYQCTVfyJW0S4RvuEcpX//zgfky7tn7h6wWjpxR6TUc88LLowEt+zQbZswYWRfH/O
	 jxI1MIBW1GWPA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EFD153782031;
	Fri, 12 Jan 2024 09:46:48 +0000 (UTC)
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
Subject: [PATCH 11/15] arm64: dts: mediatek: radxa-nio-12l: Enable the USB XHCI controllers
Date: Fri, 12 Jan 2024 10:46:28 +0100
Message-ID: <20240112094632.66310-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
References: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_014651_175098_978BB9B9 
X-CRM114-Status: UNSURE (   9.78  )
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

Enable the three XHCI controllers found in the MT8395 SoC, used for
both MT7921's Bluetooth (using USB 2.0) and external USB3 connectivity.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index dbde2c7b3c64..eafce9cb2598 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -651,3 +651,23 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&xhci0 {
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	vbus-supply = <&otg_vbus_regulator>;
+	status = "okay";
+};
+
+&xhci1 {
+	/* MT7921's USB Bluetooth has issues with USB2 LPM */
+	usb2-lpm-disable;
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	vbus-supply = <&vsys>;
+	status = "okay";
+};
+
+&xhci2 {
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	vbus-supply = <&vsys>;
+	status = "okay";
+};
-- 
2.43.0


