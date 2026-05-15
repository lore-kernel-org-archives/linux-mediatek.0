Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E96CCD4F3D
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 09:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2ZaGVux29bB4QztqEVTUE9+3m9wph3XttnIMDbQw7w=; b=WdUFd4Qukv+gmUJZdCLYrWGLrC
	imEP5myvgH+JVex7tyGv5f6W+pHvttYptRRHaCgAeX8dxwXPSqk2blX12a5autH0thtrxzcYBxGy1
	bns6zmJDqz/Hw94i0naaEppSrL1Dlzv2N81zOqAjUcXxF/9dpKTmfQyKFS+KlNrX3VWJT8TAj5vIx
	Po8jqosJISTVTA15zBIsmcDHOAxuSLy+aVy597zKv/RQmijRUYL9rbCbTSAj2MlDMg3Dvt4IffXxn
	iv/6TZpbLvJUKdPH/9qJd2p8YWVpHF0++hhxezDbLTvMNRl5Y3Kd5BYICNyBdAzPAXua+7v9qWHY7
	ZWaaollA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRX-00000007pGK-3NVB;
	Fri, 15 May 2026 09:02:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRW-00000007pDO-1PJ1
	for linux-mediatek@bombadil.infradead.org;
	Fri, 15 May 2026 09:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=T2ZaGVux29bB4QztqEVTUE9+3m9wph3XttnIMDbQw7w=; b=fo8+nwvO2p4DAW6ggBLD6ON1PU
	LP2Hoonu1CNa6p/2YtGvf2WGGG5Mi+ZR9WbQYiVwvyoWcywYabG8yq7u333/1AxodxKIILsWsK6yp
	+Ad2hk725VTkcKudrSS3R7nI33GJdXIQX7T685hCpPYnP/4dmYguzXTXxCzIcR4JoAnT6QrfEsYeg
	78fdyZdUdFytb7hXFHbVlWnIFxiXDnwdnb8hjLDIX5gPz6WFlr0oCsCPGIYLAtFfoCRTElofPpglF
	SFtidI3ALrR5N/GGSTb7X/XxpTuUh+a9FQSkwBf4B8+zMLnOJpq2A1OKnshvAsDMJwz7ApqUQyneA
	eXNGPqeA==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRS-00000004hES-42X9
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 09:02:49 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-36627a0ea23so3731754a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 02:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835765; x=1779440565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2ZaGVux29bB4QztqEVTUE9+3m9wph3XttnIMDbQw7w=;
        b=laT+Uzw/e7PUf4vhfuRP8FHpGHzgRAf0P8NE2gVnDECk4tF1EZLwsVY07ATC4w5gzd
         3WfOh+eGAIaUIYEq0q3rP549wl//Jtya7nzHp4IfiY0/N6/5HJJIoppUDYknhnX9+IA4
         LOGpsLvy3AuKpX/sGN5rtMnhh8KlID8cGZTOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835765; x=1779440565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T2ZaGVux29bB4QztqEVTUE9+3m9wph3XttnIMDbQw7w=;
        b=W3Jj0JO9ijyJlKIlAfjn4+4qpZHoUOOSdyav8sD+4fCBVsiwfkKC6gSg0pRU8tG1OY
         IsOFsQvbMRPABl1C7wHkmIAjGt+oCSCCMtiIdohwfFCMzsATZ4ui2iBiuhhltxchOlsJ
         pz7mTuoP4C74ujdbmjFMoIYlo1rs0w2LhO+rW1iFwNgdLNnPzXYOVIaOLSbELCte4dCu
         qPhYYYStUYu5piYTlRWeB9qy6A3WiJyxnZSh6AVjRxHSadJBoddBD1sRqplgG3DgJS7k
         9hS7eos85LO9+oLePCDhmnAr0kv2cukfa/oDD4CzPb8vpkg9wj/o2KD3EmUTSEDtWoon
         MWoQ==
X-Forwarded-Encrypted: i=1; AFNElJ91VbB/Lxz8HHrE0MB7dprNbiz22QNAZDR9HSkghhambWHKBoDDPwznckjUBA/eaO1tO3oS/6VdIfzUsF1tWA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2nu5a2YjqaZMiTB9/oVbP6KV2MclbDHoprcTlcHSXWQWAz1oc
	jDDIIchWd/Fn58hyIqN2txykgcN6BJJmSExq9emxTRN1AUmUDyaX/J+k0m1m+iPPTw==
X-Gm-Gg: Acq92OHeKi1Of3m0fwZqVYiIoGGr9XG3WYzuuBHiB31sgwNDf+VKOGSDN0xlosw4lem
	EJFMuQKW9f3wC6RZS70LyQt2i2VNprQX72dZQF2Df5Oj4f94aLljrAb8tMzSz0N1vPWo5eBF88i
	MlHoOxLDYYJVEzCsgFZlNrcDgjBAWaI8OOUcgHUyo0K1+FgPVcATUNel7Hvi/Ghl0A0qHn7QcNH
	KYco0tkdKJ8uA+ZakZhoCYzulZbf2wMGmKHiQKS1Xy76F+N4TATVPHAxrHW+uvcD3kT0cMcGw5V
	IOEI9q38KtFic8wObhVazq/JXgJbCWl0VGIUE09zK1FeFh9yUvE/iJ8SQeQbYfAoCz9g78OwAvo
	YrABI34nZ9/hN0d2/Mm/MsEDNhS6FUWicYlox/JmhGUmfDtth0rUSbZ0mFksExCbNbFXX0Wmz6W
	rai5qgpywM6RF2SZYS2sBRRYICj76iErRueUTg8bHAH8u2KQPXCk2VHJSuYGNRtQRq7B/aFwzX+
	jSQ88DeVYdtc7B74cg=
X-Received: by 2002:a17:90b:53cf:b0:366:16d1:6a25 with SMTP id 98e67ed59e1d1-369518b206cmr3162750a91.5.1778835765371;
        Fri, 15 May 2026 02:02:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:44 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 11/12] arm64: dts: mediatek: mt8195-cherry: Add USB type-A connector
Date: Fri, 15 May 2026 17:01:47 +0800
Message-ID: <20260515090149.3169406-12-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_100247_466109_81CAD013 
X-CRM114-Status: GOOD (  11.24  )
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

The MT8195 Cherry design features a USB type-A connector for external
devices.

Add a proper representation for it with a node for the connector and
OF graph connection to the USB hub behind it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 72 ++++++++++++++++++-
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index c95a54de3567..b21cbe918c1f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -153,7 +153,6 @@ usb_vbus: regulator-5v0-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb-vbus";
 		enable-active-high;
-		regulator-always-on;
 		vin-supply = <&pp5000_s5>;
 	};
 
@@ -267,6 +266,32 @@ tboard_thermistor2: thermal-sensor-t2 {
 						125000 44>;
 	};
 
+	usb-a-connector {
+		compatible = "usb-a-connector";
+		vbus-supply = <&usb_vbus>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb_a_u2_ep: endpoint {
+					remote-endpoint = <&usb2_hub_p3_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_a_u3_ep: endpoint {
+					remote-endpoint = <&usb3_hub_p3_ep>;
+				};
+			};
+		};
+	};
+
 	wifi-bt-connector {
 		compatible = "pcie-m2-e-connector";
 		pinctrl-names = "default";
@@ -1672,9 +1697,52 @@ vdosys1_ep_ext: endpoint@1 {
 
 &xhci0 {
 	rx-fifo-depth = <3072>;
-	vbus-supply = <&usb_vbus>;
+	#address-cells = <1>;
+	#size-cells = <0>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
+
+	usb3_hub: usb-hub@1 {
+		compatible = "usb5e3,620";
+		reg = <1>;
+		reset-gpios = <&pio 84 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_s5>;
+		peer-hub = <&usb2_hub>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@3 {
+				reg = <3>;
+
+				usb3_hub_p3_ep: endpoint {
+					remote-endpoint = <&usb_a_u3_ep>;
+				};
+			};
+		};
+	};
+
+	usb2_hub: usb-hub@2 {
+		compatible = "usb5e3,610";
+		reg = <2>;
+		reset-gpios = <&pio 84 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_s5>;
+		peer-hub = <&usb3_hub>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@3 {
+				reg = <3>;
+
+				usb2_hub_p3_ep: endpoint {
+					remote-endpoint = <&usb_a_u2_ep>;
+				};
+			};
+		};
+	};
 };
 
 &xhci2 {
-- 
2.54.0.563.g4f69b47b94-goog


