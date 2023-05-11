Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6695FC77B7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 17:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=px/CxXTCmKMmC2DtIG43QR1JFGJikIefzXWxaCFHoxA=; b=qMxRw3W80rRmb55nDuZvUWDbex
	IJuAdvpVFnKF/ydxqMeXb1O9FOSMD34b1r54Isjhpg8rE3spSkgo72kIjETiQpz/KZmHO/5SiIspm
	8jxM12bRHlNUKbfdx2IDP8162qgIBR834S1x/A+5m2XV2SOMA9LekeaM3FmiWoUZzrRdvrwvMxoiy
	zXHO7pB7N3sG+sWl65D/FxFHStWkumXBkT6fA3PE0n0uDWkPLVIOj/NAZuMqUMDcpcDRlpmDzPQD3
	VgcUp5M6sUyuA+Rv+JToIESO5RC5KBmM71oM6zE6dVrSZtQugNrupleDiXErBQMj7Al9HzYkDoHzN
	5u1guuyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxAH1-009aJ2-1Q;
	Thu, 11 May 2023 17:40:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxAGz-009aI3-1J
	for linux-mediatek@bombadil.infradead.org;
	Thu, 11 May 2023 17:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=px/CxXTCmKMmC2DtIG43QR1JFGJikIefzXWxaCFHoxA=; b=JaQyaGKYK5PRjGwtnsqkAhlVCO
	ZpFhmImiaROS3V4U2y/I7AzX9PwKZ+IRRjiwWygA6UGaEpAHQqW1sUAoqYQc0eXHskRzhFrb21IYQ
	hJFFLtZuZdlC2v2g46Wwq5nkBWzu39bUJsvHCcReW8XCtqOEHhdpi7MzCcW20i+TcN3sg/q9ru8LF
	3jR4Znqd5of8EFEaS/ZXkTU2VMgSvWAYcNkl3D9H3lhfjpm9WF448rpbqwUbv1cua7bIdGA0CQB2M
	cw6ynkF78BTf6M24bQWJi9BUoLXD9A7VzdIH5I94+4S6lmaR7hSyBEMuq/UfX2TQX+a/Dr4X5ZRtJ
	4WjKDB1A==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px9BA-008Inw-1Z
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 16:30:11 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-96652cb7673so903824366b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 09:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683822606; x=1686414606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=px/CxXTCmKMmC2DtIG43QR1JFGJikIefzXWxaCFHoxA=;
        b=3KicUe34xmlEeHQcSF65ph3MOrdKA29zYQqKZ3pSZY1EAkIjwvTVoXHfjODz7UmsIr
         nK4tyA73ncLYyVwUNFy9kR1rj5pWHiNh7fSEEpgHlDwMiyhBfgW3sZ/7LxfDk7c+6Qpz
         3dDxfZL+xg71x4KysZwPz7154KsqFyBJLj9VjDSNKywfNt/X4B2huSRsU+sNlzjKbWbX
         mPbWFTSej8Rica4Bm7F7nplf0Ymd8hr5PWNsEFw2koCOvaQrnvDioAAjG17bfdwcwyeX
         L3UK/IbsE8TlDKzRBAZyOl716akXFE6T+dyo4gNYkg2innsi/TNEwcfs9jV4ReYWGw43
         171w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683822606; x=1686414606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=px/CxXTCmKMmC2DtIG43QR1JFGJikIefzXWxaCFHoxA=;
        b=SURb01ToNhbz/qG4m42k+LoNQOkK91RXDW/3msIyshxeEV0bLJSiIuS5VFi4aMsPkB
         XdInOK23Lz4wPOw9d7O36TWbzgXAi/Sm1ePW181YxOqJwwMIHPzkeQ2C9VscO0ewTuWe
         pA0qOjtvTY05WPdPpHiiWH7fL1NPXrrSojgLbh3deEQESr9TPLp8gOrIAj4Bpz6fIm8d
         Ua2PuUBUI7IW9U0jtkd48YOxlI2ipQ4Bnv60UYVwr01fZW/BJliSZ63rfgc4WjLEb+f0
         GsL+agdp/nvZIiJ+JmOWRzT8//iaX+L4rv7C8TxfRBXfQTVuYgzG1uD4pMgIh9ocyxfA
         /G1A==
X-Gm-Message-State: AC+VfDzUjwQj3Fq6LWxXBWYw7DCzD5rOVXoaNIy8sGNl/wGuq/A93RRV
	9g7uyJB1CZwiKHkP7d1HJWHBWA==
X-Google-Smtp-Source: ACHHUZ79BGYI/b+wGlY7M4CXS1R2qYAwJZgwhUs0WwwXbYFkHcQhHwrSfvijlKlf5GiuBtWTlkRFww==
X-Received: by 2002:a17:906:5d16:b0:960:f1a6:69df with SMTP id g22-20020a1709065d1600b00960f1a669dfmr24047805ejt.36.1683822606489;
        Thu, 11 May 2023 09:30:06 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id v9-20020a170906338900b0094ee99eeb01sm4209935eja.150.2023.05.11.09.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:30:05 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 11 May 2023 18:29:27 +0200
Subject: [PATCH v7 07/11] arm64: dts: mediatek: add usb controller support
 for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v7-7-98cbdfac656e@baylibre.com>
References: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=oZbGnh0AF7O5vKAvETFcbZmSMeU6k+oaLr1YtFhDeGw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkXRgEJVLUMNrCtvulo4P32pcT3Od+6Jn7RABhZ1oP
 XOd3Dw2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZF0YBAAKCRArRkmdfjHURf8vD/
 9c8d0pFkg+B/LMM7Um+nQUi/dPdBdYrWqou9Enbj+Ca6nAgBRs7hPgRacy1xHIWCotGVzkz7FEYiFb
 AYyJ24CZUhHpkfVSl3Nb4Zfd8LMEGgF9t+/eocu+YdkHNSVAPp/jZKZ5CRfiOzke4l2elvOit/y2MM
 l3bs3mFK1mFLU64/A2S0tCmtkFdgu9yCC2xLDV/eMjXc2+nbC6AqDk5Pf/IeAxlipzaasbRlBdrWAr
 sJQtlpWdlF75hpx9M+JI6pKSdyd9lfncJ13aTQl6xdUbJTQbZZltCoNM4dx4yTb7rfnWzd2MEgU5lH
 R20uRGV4Gs5dwenEDUwHqW+Q6mMgHzaBK7xvHer1Ae5tGVdHDpc6XFBBDfgMmBnyuBHzug3DoWRz7x
 OXuey043E1uQenboG/IqJnOyhRaITrzZgIJdxj9W2BPA7rL6dDlGdDf84RqMgYhsFjmITPdhPb/g9J
 CaaPCzTebSa1jKHBJfgSjT3FWVYWUp5aiWajckfCECyok936hA0O+nvP2P3C2FDGdnH3LWybCszVNn
 7gXkwTXeo93jjo7sDzMaI6vw40C/hQgoQWCqnaNO2xdR5XzJbA1D5HVSgCSzdV/f95hX6fkN/09HV5
 aniOe7wPCo+pjHTD5OPIF9dwy45DSpwZKuG6EmuU0m5RBwXqh3+PnVayVFQg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_173008_675356_683ED411 
X-CRM114-Status: GOOD (  10.36  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 5d69b39c8746..3a472f620ac0 100644
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


