Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E76EF357DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 07:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=296zJScy32zZ99pggZVYgRNpwHzrGar0aPdVMmqKLxo=; b=peItW0CUHgGBkEbMvMwFj20QD7
	IvXcKYwr0XLyuXKJD9nHaywwQ08tf2g93aRu/S6LXka69NloBz3rAz6U3xLGuNDUH2V92MiJ1zjhm
	ZFCfUql13B1E19SYOHbMOmgh0QphwdLZAtwS8Tsx+aTbzLhMOJWkLa7jLbOIVsYx9z1o8Fqbc2daz
	q6ic/Op/avki6CrXnPlJ3+hGaCYyheakJDOHkWAyb45cRIwNzTTLG5jGaBBjB1YPJ+crgdxLSmXFn
	HoSmIqZKNTEezXKCxQqY41A5+h5Hzx/MLKztIfgXzBdcRXq9Rrb3eeHzA7S5V0voBr/bvh7qTS2Js
	XTdP80mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9Er-00000003Pjo-2XwO;
	Wed, 25 Feb 2026 07:23:17 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9El-00000003PcF-0GC7
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 07:23:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a7bced39cfso64927475ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Feb 2026 23:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772004190; x=1772608990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=296zJScy32zZ99pggZVYgRNpwHzrGar0aPdVMmqKLxo=;
        b=VeVnZ0NLdTg/2cbFK1QNx+P1jwyJGEQsZK49ubQHfDCvfG8Etq8fI4rhVXdyBdevy2
         eqXgfaScPnP7+M4h4FKt2LsIrLWS7Rpw/0DAZvd3rK8zNdYdLPYlNBZ8aDlIqJ2gkWSd
         eQl+1+4iy140C8n/th6b2GOstNd25xUYEf9hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004190; x=1772608990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=296zJScy32zZ99pggZVYgRNpwHzrGar0aPdVMmqKLxo=;
        b=pIRirbTD4OWfCcmzjWjmFlBizmvBMGnYTVlPOfYblnNzWOFOdFDzEawKBnob5Akbca
         9GW+f8lBzi/mxdLIgPwPDucOtPAIAHcJ/CrL0+pE6A2/HDfF48A0GTLBTzAs7qfbKAFt
         XfGEbFtgaQXD0eltk+ZpVePc0BMtkRfvLyWEHOd6GzKpDmaMzeMiRcsj9LMBzxebfOxH
         OiE5Nd31Z2tsbmFdAF2TFavmtDNPvzx/9XMtQ33Otl1juliXENJnvsyUTEG11V2xvEgy
         Kbpq6gwWO/kmZPsnbvSrf3lmjkT8oHyV0RdUektWGUUPbTgBizyuULCiWrimVGqa3oUe
         GBTg==
X-Forwarded-Encrypted: i=1; AJvYcCV5l9Vy5ZdU44s4Eo17w+8igVu6C+ziJiEt/hA6iKtIDu4s5RewifpukZC7WnU6ay5cfQbGANYy1+LLFXlLvw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+fyGUC+LvzDTK6nxgAXXa5s7ZreLA0mrTvIghZgzL1wP7McAz
	NDtCDKQ3JRy2s0EVjuxNQuaLvWd54IexNfngpk9W/6eMoZOWe9NKJXHC5OayNM+MYA==
X-Gm-Gg: ATEYQzyUYLlZ2mdKoACWhHbjKKONgewc7HD3Fea3jBiVMcjTrCKIRzDvjl8m2vFdb4i
	5sHB7ddehlAr0M73a53fhGwq9hb3dm9yYQl/FwNcnsYR6G9j+aBCUeg5zumJXWJJFhUj4vUJsUZ
	uD+RZg546idaGP/n91qHQDCT9Z1ZzeWJwozcjv92MCZMvU6gawCgFSP7KNJE1tYyEhFR54DzML3
	jpxz7Nqx+gApzZK3a26sCjc4taZMDYbtILVznI49Qp75r6cKWBwW0ggfmy7biUVHY2ybjclixFV
	TwCVnXATm2u2rHSFFGb6Sr+bmTmBLRak/o0yQo5EAErn9RVtwwDspoavrXxQyoXITvSvL/Yh+Ie
	4b6qzsvQ4kTLsLW1Kc8wOc72e1HwDDNYPfV51mg56o81P1Cd5tq8Y2NMqPZthGLxmrtx7GWUlHK
	NbAoov+RbvAMK8W9/M3wTZhY1nwd9NpxqVz8/fQdtDTT0SBEFboVeUQtExugYyKW+ni67QJEDsH
	vSjUQ==
X-Received: by 2002:a17:903:37c5:b0:2a7:5751:5b27 with SMTP id d9443c01a7336-2ad7451eaabmr146610585ad.39.1772004190346;
        Tue, 24 Feb 2026 23:23:10 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9d6:2e6a:941b:690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503fdc9sm130814435ad.80.2026.02.24.23.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:23:09 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: mediatek: mt8195-cherry-dojo: Describe M.2 M-key NVMe slot
Date: Wed, 25 Feb 2026 15:22:24 +0800
Message-ID: <20260225072225.3345307-8-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260225072225.3345307-1-wenst@chromium.org>
References: <20260225072225.3345307-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_232311_136307_C1B0A8B5 
X-CRM114-Status: GOOD (  10.91  )
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

The Dojo device has a M.2 M-key slot for an included NVMe on some
models.

Add a proper device tree description based on the new M.2 M-key binding.
Power for the slot is controlled by the embedded controller. As far as
the main SoC is concerned, it is always on.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../dts/mediatek/mt8195-cherry-dojo-r1.dts    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts
index 49664de99b88..57cc329f49c4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts
@@ -11,6 +11,28 @@ / {
 	compatible = "google,dojo-sku7", "google,dojo-sku5",
 		     "google,dojo-sku3", "google,dojo-sku1",
 		     "google,dojo", "mediatek,mt8195";
+
+	nvme-connector {
+		compatible = "pcie-m2-m-connector";
+		/* power is controlled by EC */
+		vpcie3v3-supply = <&pp3300_z2>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				nvme_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie0_ep>;
+				};
+			};
+		};
+	};
 };
 
 &audio_codec {
@@ -72,6 +94,22 @@ &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_pins_default>;
 	status = "okay";
+
+	pcie@0 {
+		compatible = "pciclass,0604";
+		reg = <0 0 0 0 0>;
+		device_type = "pci";
+		num-lanes = <2>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		port {
+			pcie0_ep: endpoint {
+				remote-endpoint = <&nvme_ep>;
+			};
+		};
+	};
 };
 
 &pciephy {
-- 
2.53.0.414.gf7e9f6c205-goog


