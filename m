Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3D8CD4F41
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 09:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YXeYvlbGnNmMv9PUsmYFfNNN3O6C6muQR1bAD60qYI=; b=bJDsH7UBpMREgujFeU4hEQkFW0
	2rF8eZ0LyJMNLp547wojE1/rLiHmIm4RDgsgHNNpMRUuIHcuGs2AuUnL5UNFMlk6XVR93orhfGwTI
	t9Y6g07VyD7pCvgwChwCT7ydtvHQcw8KWCBu4024vveWzoVr4W/LZtGPKdp0KkT/GKx6Lk2ZhxsMx
	1k/pkp16cgUvKgTXZMzRtmztqADbXpvxoZnN85DCyItTvMgEivsVkI4sIQhHVbWQx0hRkQJtviZ/D
	PS6ejO9YT0QJEzGznWP08kOHEGjROgdGOkQmtEwrF8BAcU/fgHm/P9r6+yq5lErYDzfBO9mwx4Amx
	62KnkScA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRU-00000007pAm-1Bft;
	Fri, 15 May 2026 09:02:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRP-00000007p5i-1YxX
	for linux-mediatek@bombadil.infradead.org;
	Fri, 15 May 2026 09:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9YXeYvlbGnNmMv9PUsmYFfNNN3O6C6muQR1bAD60qYI=; b=raGAsmRlmSrkyVBR/pQ3IaBKpQ
	IIUZF6V9qSCymi9nxNopVUxAvWyBM86JRlIqZZ79oVYIyTk1lo22GAaI9WrwmtDpA76pcpE4FOhsH
	OuK8qTDwIaZdoFl96OrRYf8oa+9OYITm8SUgB1lvsdB6ZLFCmbPQ5D/J535Qjwdt9NkFNC4rZgGpY
	LzRcJ9NlfB9nz9kqylAhvYzS+KpASwFBw2IJtIIklE7FBqEJw4HMxwiReJfMmAG1SRPKbKo8BTBf8
	3yKlEDQ8Ywgjj1Mq+A4kTNqEJhluJq0UHxpiiYqhKOqzc9I7oj5YR5HwD9S/ubCiSEwEzCbnNigii
	fZ7HVang==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRM-00000004hCo-1FM5
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 09:02:42 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-36627a0ea23so3731715a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 02:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835758; x=1779440558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YXeYvlbGnNmMv9PUsmYFfNNN3O6C6muQR1bAD60qYI=;
        b=Z30ogoSthB7KLfJ1zS0EE6H9KXcLSR9hDEu8KS0Z1+kTbu1leqmeS7pXt/wJC+GZVl
         s3/1Eg920GZrfBVeqn+tKoCeFxMoLyCzAGg15ngu1nx//0LkXm/i8mUlmhUsilLQt0Bd
         sXrG6MGWKfpJRDWTj7VftqWBUga+esUKitFO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835758; x=1779440558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9YXeYvlbGnNmMv9PUsmYFfNNN3O6C6muQR1bAD60qYI=;
        b=I+wGxhMYlDxXO1HQ5LDgvZIAIq8jN3E677v/LIoekFs2CSAZFMreDXnmXqfUh/HZOM
         uAPoxms+E/ftfKkXrtysnZuIrJgc4AsS0wkz2mU5S24cFtABHwuM2oFdm4r3s9fImTkY
         cbPgTE6L4FQRMxGw0kiXYUu3FYPBfwiIdY0OMlgJ9KHEOKWtHFpoEbbE+C3ZXBMLNC40
         T0VcDx/j223fL9A18iEGTLVKvDU2P0B7oh1IUOo5IW2wpf7Lczq12X37OJa7LUqhPFzH
         T6hKreLdI6LfndJmg4cOPkmMIsr6DoBlJ/pYUiMCqwTnUlN4gRj/AjZL+ck83wAXDaSe
         DzsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+u9ZYrbXtZs0ndtZ9lYiIItaHO272j4qfkuF9E8aotsbxLmXgNixC5eOCYfQVVurdnMgWoym1SQeacrW/m2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTzZCh51QadP2b9wp3NQSe2DEUn+uVE5B5Pu+QAEIAz+rZsTBR
	mEB8URpO2F1G8bprw39GSGYfjwWEk/LEMJJi7tReM3ZRuGgZAvCjbHtRPBnwREGfCg==
X-Gm-Gg: Acq92OHDwhfpF+5z6yQpCf4iMTBx9bUeX+W4mepTVeaeZQf0Ft6hk/RvoTeGTTP7MGW
	Olx6cmp/C6CAhJFrmz+KMBrfDb0xiLBvvVfXdDwgtJEBYfb7YORoO6w/jx98DkMQP+NedApOgPl
	j9JJBph0IpJpOHBbAsHNCEt1hW0TsYOHZyypUenY1cGF0su90IdDc6KHmIg/xNA0/ixxvrU6mot
	zLWrpqkLaXCRpm6jJ9crK9GaGdLf79TJb5aiznv2fFPnDtGMepZ4TT0aK9IoJc2ORM5Bos9gUBa
	2zS/Vfruh+QZX4D2H5etjoSWY1vF1bxYf9/t+CwyD8Hb5f8Fu9xT//QlKZ+d7lglZCsrx0sM8kA
	5ReLGJ1kZDhh3ItzS9GXXCwLYLIy4gf4FD+XTcl3RWUqF6xHfdZ6JQM/8G83NsGuhdRCyTOUjY2
	1y0m6n9WGT27UEls66P8gwZiOCwUdctu+unagzdAgFfHakQh1TBzKg9XJbFC+xB77reawt8ar/4
	/SrI6tR
X-Received: by 2002:a17:90b:3d0a:b0:366:479e:63a5 with SMTP id 98e67ed59e1d1-369518b25cemr3280292a91.2.1778835758557;
        Fri, 15 May 2026 02:02:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:38 -0700 (PDT)
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
Subject: [PATCH RFC 09/12] arm64: dts: mediatek: mt8192-asurada: Add M.2 E-key slot
Date: Fri, 15 May 2026 17:01:45 +0800
Message-ID: <20260515090149.3169406-10-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_100240_687424_E69562DE 
X-CRM114-Status: GOOD (  12.60  )
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

The MT8192 Asurada design features an M.2 E-key slot for WiFi/BT combo
cards. Only PCIe and USB are wired from the SoC to the slot, along with
some auxiliary signals.

Add the proper representation for it, replacing the PCIe wifi node and
vpcie3v3-supply property under the PCIe controller. Also clean up the
pcie controller node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 65 +++++++++++++++++--
 1 file changed, 58 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index fb4d92750770..901240384a4a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -318,6 +318,41 @@ usb_a_u3_ep: endpoint {
 			};
 		};
 	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_e_key_kill_pins>;
+		vpcie3v3-supply = <&pp3300_wlan>;
+		w-disable1-gpios = <&pio 61 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pio 59 GPIO_ACTIVE_LOW>;
+		/* PCIe auxiliary signals wired to controller. */
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* PCIe for WiFi */
+			port@0 {
+				reg = <0>;
+
+				wifi_ep: endpoint {
+					remote-endpoint = <&pcie_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+
+				bt_ep: endpoint {
+					remote-endpoint = <&usb2_hub_p4_ep>;
+				};
+			};
+
+			/* SDIO, UART and I2S not implemented */
+		};
+	};
 };
 
 &afe {
@@ -671,19 +706,19 @@ &pcie {
 	pinctrl-0 = <&pcie_pins>;
 	memory-region = <&wifi_restricted_dma_region>;
 
-	pcie0: pcie@0,0 {
+	pcie@0 {
+		compatible = "pciclass,0604";
+		reg = <0 0 0 0 0>;
 		device_type = "pci";
-		reg = <0x0000 0 0 0 0>;
 		num-lanes = <1>;
-		bus-range = <0x1 0x1>;
-
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		wifi: wifi@0,0 {
-			reg = <0x10000 0 0 0 0x100000>,
-			      <0x10000 0 0x100000 0 0x100000>;
+		port {
+			pcie_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
 		};
 	};
 };
@@ -1206,6 +1241,14 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO61__FUNC_GPIO61>,
+				 <PINMUX_GPIO59__FUNC_GPIO59>;
+			output-high;
+		};
+	};
+
 	mmc0_default_pins: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO184__FUNC_MSDC0_DAT0>,
@@ -1773,6 +1816,14 @@ usb2_hub_p3_ep: endpoint {
 					remote-endpoint = <&usb_a_u2_ep>;
 				};
 			};
+
+			port@4 {
+				reg = <4>;
+
+				usb2_hub_p4_ep: endpoint {
+					remote-endpoint = <&bt_ep>;
+				};
+			};
 		};
 	};
 };
-- 
2.54.0.563.g4f69b47b94-goog


