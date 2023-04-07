Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10663C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OS7Sye0IPLu21f+Xi1LC07CtmBlPzToUPrfZNf6CO3E=; b=y9IlK06TiLg9OsiYQu/NRtTU9Y
	n1t3QnPGM7H3W/NMRYz7RPX2w2zxmkKgTE7vpq/d9OcuAT3bZ8fd/7bYf9CS6w9OJiGoYAq2IAApe
	narwW/IlyEdcfMRUPjJPkw7B2e0H36tcEZri22AHA1hG/93LReWW4pMsidRUtm7gmt7g1PpszKl5p
	06DooXsTL6YvqEFBGsafmHsoy7D8NsglWuIWqxHznELc98o5rAS/N64R9qPvrkpqrvIo+oe8Ft9tX
	0BZAdmrZ2J2fQHGTyB/j6wsdb6pHAuxwmRY6jCy8qM/9BScS31YrWLw3ZXRPLZvpsiKOLEa6Qk+Z1
	ePUMqoEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmQ8-00ANDY-2p;
	Fri, 07 Apr 2023 13:46:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmQ7-00ANCF-0m
	for linux-mediatek@bombadil.infradead.org;
	Fri, 07 Apr 2023 13:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OS7Sye0IPLu21f+Xi1LC07CtmBlPzToUPrfZNf6CO3E=; b=miAxidleSEnJuEL2uMVKmUitGO
	IN5zfNShFOd5VJCEGBHGQ6GN0Z5dekXu1lMGPuK+bTp+MwVkgEZtdAeM+1064qd4C4iaeC2qU1CvS
	UxVz31vokJB1+4LWdSvDoyAUriYAquaA8bubAKaXkzVQc6xz6hI2WYbkrZZQVmIBnorQy5Eedd8Qm
	KB6Rqizc/mTGc6tiiTBy37RpPn3omlN/5DCFKXKyAyl2O+Nw2ImiEmzD7Q0ireRG/dap2s76FR6rn
	O4VVVV9ONOkj+RbiyZSdnTgxmXDN656477aWvWOkxCSpNTFWDnAsUsXHOxmC1hVv5USk/mb7Eyc6v
	uTkWKx2g==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklh2-00B2wY-0c
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 12:59:54 +0000
Received: by mail-wr1-x434.google.com with SMTP id i9so42262837wrp.3
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 05:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680872390; x=1683464390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OS7Sye0IPLu21f+Xi1LC07CtmBlPzToUPrfZNf6CO3E=;
        b=S/fsg8L/mGih4FrM5STj7n1V7lYfXP4QCfGKRFFxTreuNX5zDtf2vexBt4uxIL93TQ
         wdz6cHYAN+WD7dry13Fq8vLPEYplUMavXnV6I0ifQyurJXouApvbrpQRnnEhCeazFHqx
         U+RAszdaE/U+smX4G/1G2qZMhC6ktDzeUb4cdABYWLIFqHYtcwWEGnWnTv8x8lbHY2ID
         dTNyqkCdoZqkS6X/bGYGJCu8Xe0CoHB/s94vlLt0PzFoTfhLEjvU/vmLLqxLMPy1d3cg
         0K1668IJ1rcL7FmhOqTC+D7c9b54YVO6bZywGem1dPuO2xSueEvV9jyCbmVGDY0yS4FP
         of2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680872390; x=1683464390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OS7Sye0IPLu21f+Xi1LC07CtmBlPzToUPrfZNf6CO3E=;
        b=czQQmTy2943wg68EdCZDeeBwW+1PN9zasFSKXPsMzfL4Tk4Y3WlETHgqTSTVPA8i60
         izEocWkmT1T3c3mj9MRWpSoREg0DsSIn87juV78xH1RoV4JGdUNRlhtstVXs08YjEUfC
         e+iGzjA135x/UG33O+vdnpl2b9xNtOj3P2e6YX2kv0qMdimI5oyH/5vNI1kbN1lAn4hK
         NRjI+phP3NHFBSIgWPmyfCMHYAzu/2HQJ9Bl8LicJK8JZFAQToFIhKzcmSM/UHJKKq7x
         Mm4JLl0BXljOWJESI6jYW2lw9P+hYglbCq1GQogGXb+X6tKwklvasP1SgLGq02CKZY4j
         4bMQ==
X-Gm-Message-State: AAQBX9dsGQuaQYVfAqC7PiAgdmtvmB7pS3d+Q2V94uzRApMWbXysvK5K
	CtpVY6yFr9+ZaLRT/Y5wIO/fBA==
X-Google-Smtp-Source: AKy350YSqDbwpqlTeAn/rb2199Ze25ghk9x0ahK7dXbgGhMTjWux8Ostb1nw1+NIhd1Tu54Ml2XSFA==
X-Received: by 2002:a5d:4286:0:b0:2e4:eebe:aee3 with SMTP id k6-20020a5d4286000000b002e4eebeaee3mr1166263wrq.60.1680872390303;
        Fri, 07 Apr 2023 05:59:50 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id t4-20020a5d6a44000000b002e558f1c45fsm4471446wrw.69.2023.04.07.05.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 05:59:49 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 14:59:27 +0200
Subject: [PATCH v5 08/12] arm64: dts: mediatek: add usb controller support
 for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v5-8-1883c1b405ad@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1190; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=fWeFY0N26AVZAJlISCaJeet0l8YjLAinj4NBVfmxvvQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkMBO6B8EEk4RvcvkArYDsSmADxohNcPtVSviSaDT2
 yhxcX0yJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZDATugAKCRArRkmdfjHURQvhEA
 Cb51lDZgNpI4TXbu6IxWdcuWpTkZLgumOT9wrV2FW9H88XRvaBVERxPKm2tkNi6Mw/S94XbhrLhrMd
 70by7FXzioMFGT3HIy56g5XJouSAHFprJmeM14CyWGeriNd5gszIB0fEgbau6loKNkaWZtt3fp68le
 jKJcPrxaSdlMHRvALub1A4gwkOv1ggLlJOozaY2vkcULu9ZLxKXO1IcXGRYZFTvUy5zEH0vu3UWkDK
 5/i7i6DpcIixaonvF9uYK+xhn9PDKx5DiJDAtMjPrzWgBfP5zRXqILLWF1lszghE4LmKEseTXge8U8
 /mzv/ygHbMLJ0PsP6d4vYMUEzj5ZpG8H/nA/1Nh1oSnLJUQloup5Nz2vgVE4GD/6KhHsip1t64TehC
 ROXgYMpXNfq8/NKsTRTsVYQcW2IgI055jDv8qj+CsLrmXEUPeDAAiStOHZocu2hCGjsQS9cKbXBqCN
 TEO3tuqYqJP9bh61zSPNFW2mGa3er4nawAmjrJgRW16UTf0OAT08cEel92JRh2Qfj3CFtGG5eQlK1G
 VyGBGuMfJlQNbdjx2D9/uTcaOFVxGGfKbtliG2ZEURQtTMO9GN87JgFP4dwkvPEG5hWybVf+t2cFQH
 7CplOmlyx3oAzp0hs0avkNNSW3L0oLgaJavVY7ETIY6IxIJ4JIhzZeT0yDJA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_135952_390248_3F98DF78 
X-CRM114-Status: GOOD (  11.02  )
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

This patch add support for SuperSpeed USB, in OTG mode, on micro connector.
It also add support for the Extensible Host Controller Interface USB.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 1c36d8f19525..9760f181eb34 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -314,6 +314,28 @@ &pwm {
 	status = "okay";
 };
 
+&ssusb {
+	dr_mode = "otg";
+	maximum-speed = "high-speed";
+	pinctrl-0 = <&usb_pins>;
+	pinctrl-names = "default";
+	usb-role-switch;
+	vusb33-supply = <&mt6357_vusb33_reg>;
+	status = "okay";
+
+	connector {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		id-gpios = <&pio 17 GPIO_ACTIVE_HIGH>;
+		type = "micro";
+		vbus-supply = <&usb_otg_vbus>;
+	};
+};
+
+&usb_host {
+	vusb33-supply = <&mt6357_vusb33_reg>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	pinctrl-names = "default";

-- 
2.25.1


