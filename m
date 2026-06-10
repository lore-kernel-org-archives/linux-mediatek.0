Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6334CD98E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 08:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//v6/82RkqjQCguIRc8t+FdPVtsIJvFDXM0cNoEMOXg=; b=uYMuXu6y6A4/1LZXDggay+gLRI
	zgdMKSzBeRUx0OXCL/UBsVAhQ3oP1dAwLdY9PkIdkGbNHGUKSq7MFK+mWNRrVxpzwIulsb1e4G5ri
	S6hKZGSXf2KscoNxP/KJWjexHTZIsU5aNdcbRuVWiQLQkW68twKWgKzXiX9aD/CLQ43AWr73PvQ/v
	lE0/0cAVdb3lt3ehVCemQ6OGNC7gPooR1AEEFVWDNQDvBq+DctqRTGm11b7EowJhso3927SIaE3XK
	OpYEUjZIpkNfVQLMS4euBN1xfso/kPB9gTcqz/CS0dHOjPoMBoAD586gzNG32JOsXRp68a3QI2xJm
	4ZkmKLDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVq-000000076Jh-2bZq;
	Wed, 10 Jun 2026 08:42:14 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVo-000000076GL-2SBH
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 08:42:13 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2bf1cda2b17so48186305ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080932; x=1781685732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//v6/82RkqjQCguIRc8t+FdPVtsIJvFDXM0cNoEMOXg=;
        b=GKTQ3TfhvH5iKWtFenxCFN3ykqEfpymyZ8kifkovnvtA92Wk4bJ9eXgWYJ6BakcRv/
         8U2L5r8YcownTcORCIPFfibMnk+i4YULNL7xaRyMo8ypYrZswHd2DB+qF1FXj/PnzioU
         k6/ZfsTKbmGLRTHXEuuKzNuMxqaAnNKTz1rjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080932; x=1781685732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=//v6/82RkqjQCguIRc8t+FdPVtsIJvFDXM0cNoEMOXg=;
        b=lVnhs2BZ+BFquZQTrptAiVC+zc7DP21KlDd1noaU1s+URnVZ3dVKwHQhgH5tc+Pfnt
         JsOVAQ8iNo1M9aXey9Xq5xIPTv5lO1w+l2ll1Lq7rqowQCYL4pquOxaX9t6maXta6Ir9
         YB8Ba6FXYIP87hdmtG2hWyZIKOL0xhX5p60BU4oGps+rnVGRt3hxauxphuAGwsfXRU28
         Jf4guGWlSB0j5f9bqEuhtodilwtXqW7VckIZSxtPQBu/GIi/PxGEkcC+tD42wiYMFk8n
         pASKccwcJhzCfx/eqab3zR0JA5y9nejcRB/OVGzD8zymcrbXT45efhH55rWrmqvlUnFF
         mrLQ==
X-Forwarded-Encrypted: i=1; AFNElJ81E5WDiHXqdrl9PUbhR+MSXJfc/JwrXHHQlpdY7SKtyjF3ql273Jz/c+w2aOK8WEulsKYfB+DeDZNeggyyJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcFG3oPELSa3VUL9fcbAa3hNPbIqxx/fLXb1Y+R++fq/C2P5uR
	pjSQ2Q3uRAzRngx0FTkNKoG4xGk5k26DT4F4xSHS5Mn5pDJCLYSZjQ6doMRYuHfg0g==
X-Gm-Gg: Acq92OH0KRYRloh5V0f+yiNGhV8CiZ397W3D/z+ZXzW0TdOb+UyuBqqAvHa/OETByNt
	Ijt//6uRqmqp0aliezAskJGHjzkexqTd2o+GDD0/ymyhvsiGpB8vIljr6bS7EGxrYUVIi6y8sbG
	JztX5Fdt1Vdj7ePsPCapztjXQgTBGGIXt4UPnk1QkYtwf5zDPDfKC2wlQdn6uuT4rJQ+icxWm/9
	3iQ5PTXDDk/U1m6af/fqmr6HqJaIkrQxgpMjvipnJcg2ftOKRxUbmjKu13mdOnLRQPhJhOwl58X
	ErHyypMmxGEtJVIPxi3Yw7M8KC3RnabMzAN0p3vgzAta0WCMFvpcCefmTKSjK7Djs05MGo71Pmw
	UpNKX/OREoiCIrzDc5n4j+xwyx2me0pXAYZY/eY0SgBHP7AtixqxhguWSuZeByPFKWM/4fi6ZKI
	jinVjX4CHC3nughVWzUVPpF+HxDpMvNx4MomYginny0HSuVFSw0uiMOCmKf99PFGZc/nIqvKgE+
	MhPJU+bD+KJMat0EA==
X-Received: by 2002:a17:903:94d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2c1ec508177mr217649415ad.7.1781080931995;
        Wed, 10 Jun 2026 01:42:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:42:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 12/16] arm64: dts: mediatek: mt8192-asurada: Add USB type-A connector
Date: Wed, 10 Jun 2026 16:40:46 +0800
Message-ID: <20260610084053.2059858-13-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014212_630488_29C4529F 
X-CRM114-Status: GOOD (  11.42  )
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
2.54.0.1099.g489fc7bff1-goog


