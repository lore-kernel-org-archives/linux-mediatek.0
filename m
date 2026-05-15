Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182AACD343F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 09:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gi/8adN9TdR0oUR/hsRlFBiThItLlG36dm/4R472kYw=; b=PrTVK/NbU1yC866pZ0k0pZG8hB
	2tzQgFl67uZQe4qRkl61N4HW7BheLu7hWpTMgPouzP/3GlQE3ON5CU/fPDADnPMDdyJpZiB3QTu+h
	QbJ7FsYws1SEjgIknzN0nWjwjc5uWh4C2lkIszSjKZHuBixTlQ7572fpgeFLOH5ISYBcpjFM1qCDu
	ddTOnzthhe9LU33coY2GmtEsKrh+bvk7rdcKEUO4ApftVm7SungoUzIHdSd0g+rcTAnvVX9CHKZEt
	Fx0KEk2GG2ZX9cR/FiZ2ONSK6BU+Y/tBj+qcPJqq48nrEDJRcRlrhfs9J7LPqG+PwKjIdgX175nY1
	3YqqaaFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRO-00000007p51-0NBp;
	Fri, 15 May 2026 09:02:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRM-00000007p2K-1pst
	for linux-mediatek@bombadil.infradead.org;
	Fri, 15 May 2026 09:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gi/8adN9TdR0oUR/hsRlFBiThItLlG36dm/4R472kYw=; b=TyD74JbzHOFLMKDUFowXAkB3pT
	o9/z+tOLsvhOhOZr0zyt1dJeYjMuFRNKXYL7QrRXp5QYgaXUh3SSEKs+T1cb40rW4GC1GkgL6Bv97
	ohxyGjk/mOyaIwi+jpR0+Keuiidp60LtRP0ft9jRfZ6yJHAUN3B8rAILRcOoMU2YwNLI4Ekz0x1Sg
	ll+tMhUEgoxEcOCC8hao8pX8NKk7qiy8qZdYLk9z6gj8/CJeuGuBuQW3fvs7PzPm6V2GWquN0yGju
	BE2LiFXt0yMMuMxGr0nRQKFCAbjJ1v1Sq6BxllTmV2npi6rGEjvjTqqLllXHCdmJXF2hWbL2ihl8r
	pd1bojEg==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRJ-00000004hBS-1bPy
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 09:02:39 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-367c2a39fcfso3670633a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835755; x=1779440555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi/8adN9TdR0oUR/hsRlFBiThItLlG36dm/4R472kYw=;
        b=UFDdCvOeFozRkUlSJhk4MUM0dS7hgnCA2UtfRETBFJDLayGD8g19DFRgwDS//BmTBt
         9q+GFpurfC1DISypqfO939MPW1nY4I9E1Voa0wwzpkjTUADRkipo8xaTwYipPpKsGVA6
         AMx4jTbNaewR6yaLJNRp4KIOLME43Z4eTt8gQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835755; x=1779440555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gi/8adN9TdR0oUR/hsRlFBiThItLlG36dm/4R472kYw=;
        b=afcD16YDX7NCakReaha9ZSKHiHLeR98DBvTtnw/o+1R6NhurgW91Lsy405bKbox7/o
         +ZysvhLem6f6QCakFmRB6xNNy23uFmWoMvWfxYqHSt4XvOCuVIA7R3oyMk4y9P64e7+B
         kZg88v/5JNqA6iOcdtdLbXD2JyIzQ3zVQka/MX7V3tSK5hzmqcWtkwPVqoaj9sX9a0ZL
         JbMxmOlC8ujIvQdpepbGsUOu6wq3yW6v1zT4Yp/gxliltvch2CqXEDAczXgi6QMIaHZV
         r3U+uOsixIAWEH8rXB0zR80jKrH2GxZMGZTfLg+YNhEhlBm+Ishfgax/19GTq71p7L2Q
         VDcA==
X-Forwarded-Encrypted: i=1; AFNElJ9sV8FDoIWQJDClOL1twq8CN/Q7aEfN7c1bOO1HBvG6rRkvzZh6587O/aieHZm+sc0gqERwZYoqty+zf0SSEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyah2DONVcVbw1rul0ftvdhAAB7DwRYcjRvaROBxVB1bhRUE9bf
	3/Ur5mcnNBGWWlsvxpgWusfbpP9kuZ+l0ykxKPQo+SGhtTvgC5tKBjG7GXZBcqu/sw==
X-Gm-Gg: Acq92OGaWDaWpon+pukj8qwo0aDNqyAJcy9jwRPdUJljJy21RTROZTDTqgHzQepQn4S
	OBPFJpvqgBLIKZ/XKhuTu9Qi/FjzP/ftgjv/hPnwnNMPLIGiVIgd0Ih9aR9/Ou7eDWsqQ4QN4dI
	roiYD4+VUb0vkPcAN1x0zywJZ1XbQKmElwIT2fs2XZ7ZPZw+/+rQAj3X+X6Cq9nbSA2CSdIkUa6
	wDvMtvsK4kXIKD8TQK6L3jh68FBl5Cxgz98rsyTMMYebY8Nhuic7K0bFyj8vTUQpghQcCPf2epW
	iLFVGLm4crcNgQX5dW/TarmA7YyXydJJxm2CrjXMbMSClvYkHtW8xrZjyzm9NdKsBSnaInpLuY1
	kYOLPQ/lFigQAA3eau5WJU7+FOHysYSLhE5bqssqv60cIp2oTxUyHWLrP5gQuHMtWFb3vAOkPiL
	alp1OJKM/lwm1NYnA9MIlvXozAaW+KJay4t7oyridByZazPMeSunI7gSo/bsEl/+YetZQ8EG56h
	gK6fxnYUMrcMDEJZ5U=
X-Received: by 2002:a17:90b:5790:b0:368:98c0:8836 with SMTP id 98e67ed59e1d1-36951a667c3mr3003689a91.18.1778835755183;
        Fri, 15 May 2026 02:02:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:34 -0700 (PDT)
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
Subject: [PATCH RFC 08/12] arm64: dts: mediatek: mt8192-asurada: Add USB type-A connector
Date: Fri, 15 May 2026 17:01:44 +0800
Message-ID: <20260515090149.3169406-9-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_100237_797869_28495CD4 
X-CRM114-Status: GOOD (  10.63  )
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

The MT8192 Asurada design features a USB type-A connector for external
devices.

Add a proper representation for it with a node for the connector and
OF graph connection to the USB hub behind it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 74 ++++++++++++++++++-
 1 file changed, 71 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index b7387075cb87..fb4d92750770 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -292,6 +292,32 @@ sound: sound {
 		pinctrl-24 = <&aud_gpio_tdm_off_pins>;
 		pinctrl-25 = <&aud_gpio_tdm_on_pins>;
 	};
+
+	usb-a-connector {
+		compatible = "usb-a-connector";
+		vbus-supply = <&pp5000_a>;
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
 };
 
 &afe {
@@ -1702,11 +1728,53 @@ &uart0 {
 };
 
 &xhci {
-	status = "okay";
-
 	wakeup-source;
 	vusb33-supply = <&pp3300_g>;
-	vbus-supply = <&pp5000_a>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	usb3_hub: usb-hub@1 {
+		compatible = "usb5e3,620";
+		reg = <1>;
+		reset-gpios = <&pio 44 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_a>;
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
+		reset-gpios = <&pio 44 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_a>;
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
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.54.0.563.g4f69b47b94-goog


