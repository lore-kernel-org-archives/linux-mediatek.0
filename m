Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7473C6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 08:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vY1pR8A7OW80xkAZYg++krO0fJkxZ30BhhNRiI4WE+4=; b=pUyDcejop+GEj9kseMOUNwmU8I
	X2qsLJG8qVpr5EXpc1l0ifmtgx/ipj3Sx8fAUwOHwjuCVPWmOH4M6Ugz0fIbFn1ajAKY9M0XrQl2o
	a+3NySTd+hAY8r7XY6d9qvIlVUzNPq68rpiKh9NA+9qRaBQJl6cPbChzViLpQOKuTjTPFCiJHjdtU
	gQudoOD6xifpjlrCfXIrhpbQ632Imx+FVlyEYsgwCJjhRb/0+hIet1+bMYXF2tifJ+gP8MvcPzMh6
	8zofY+WU6pn591HKIUR+KF2WgC5f3p5ScLWJZ8Gq1GZU7hnmB4bKIPPyAKpJyRr2Efjn/XJmiAuNT
	wEnmh7hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhff-00DNym-80; Tue, 17 Jan 2023 08:50:19 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhfI-00DNlJ-VF
	for linux-mediatek@lists.infradead.org; Tue, 17 Jan 2023 08:50:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so25261294wmb.2
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Jan 2023 00:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vY1pR8A7OW80xkAZYg++krO0fJkxZ30BhhNRiI4WE+4=;
        b=AZ8IcZTPMXsufFN2kXO3HRi0ZvdFnnGQ2th1Ro9B226rdQQ9Xel2dmYM/oQFtw7oNK
         vpKamG8ugf9p9+/xOGR2r1aaHyM5yBTGRSjMXlGQdyqHRRwSpURDHqjtpQAf3rULEo8+
         j8j/QezFDU6aFt0dKO3/CWdYa7wKaZBfaRVFDjagWtWYsQoHglP/3ZMpRGurpy8JwimG
         WiPJaD6IIDRt1Ok/7mkDQJye4rXHCzTYKIdL7nvDFm2tWMYoap9OBGUlZLFumPLJ+8Ge
         xFxnHiBDcmIEONVN1/Ig8MeUGsL8G/kcEL7txjup5DjRTLNQM3Lbe2eJhiPdFEDEJvfR
         0S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vY1pR8A7OW80xkAZYg++krO0fJkxZ30BhhNRiI4WE+4=;
        b=d2KiD2SIh4YKIz6foXiDjAIaxK+CgKvPedC/N24JH52LDC4Ys7/aqF24PEp3jenPD5
         p3LdF//Dcv3I9A0x/9uyZ5alnVRSoS7rAdhnwzxcLlo/xUUbh6W7zPoHSpmXQ4ntE6WN
         rdoAymMPqdrj8puuGvHnxUVul7aPKyLIKKHnINypoWeGtSla2mHWrMQXVT4OLeqPw1/q
         YR0tx8Hk4MNSwW29iDPnHC/y1I1Uz3VeDEvkmlzTeBeRC5fMv7Yl9azCYcYI/TmxQT7c
         gKdMO/JfViXfSwA4UlgWaOTBNExUyJr5SvIRKCX3kwB7tpmc4OT7eXzLVUFrSV1uNBYX
         Bszg==
X-Gm-Message-State: AFqh2kqwuaG4fTKKgytTMQjXGckmKzA+hEyfKOTNHuLtONqOX2IH2O8f
	0lzxr4SHETGj2BWQzT1Y2lKEXw==
X-Google-Smtp-Source: AMrXdXvZ3Mbz7cXl2jBywRBW+mzQr4zX495ZTEUrU3W0d/jp9rOsVcaRFJTSMHg1lquwMfnKi2lI6w==
X-Received: by 2002:a05:600c:511f:b0:3d0:bd9:edd4 with SMTP id o31-20020a05600c511f00b003d00bd9edd4mr2266161wms.0.1673945395322;
        Tue, 17 Jan 2023 00:49:55 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id i14-20020a05600c354e00b003d1d5a83b2esm45040928wmq.35.2023.01.17.00.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 00:49:54 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Jan 2023 09:49:41 +0100
Subject: [PATCH 3/4] arm64: dts: mediatek: enable i2c0 for mt8365-evk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-mt8365-i2c-support-v1-3-4aeb7c54c67b@baylibre.com>
References: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Qii Wang <qii.wang@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=VOgzUWYZ5LqJIocyR/msYYzp26C90wB0hqeJ/d6bEGk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjxmEu/1ATFrLnz4wZ5FHf5BjXYBtuHu6+qKyasU1/
 oquOHiOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8ZhLgAKCRArRkmdfjHURRfJEA
 Cc8GST/9irlHGIql2YtIHfbd9HQu1ah91IpB36SZWBJ1g9wwyeKf717wTh56hqNAk1XtGyWlCWaKUg
 dqIYRlZUB3HgoB0Mp6rgZLakIRV8+Nuz2GrLGcOqfRJDK8qUIQRY8WFHC38AbnQ+aqOkXsWqcRBbPu
 UnNJ6rR93Wzz4HuEQBx/PfZObcu/XlPvZgQ8zVvbbkDsvjm6viTW7RSEW1Epqrg2d3tgD7f7VzZhUP
 47+m5NgJRAiy/2gp3hyn6OE9w5TfRm1fQ8TThmZRTusk/bmozRM5N4wDuQqcmxRumio69SCQDjyc09
 XkQ8fPIp0fA8Yc0T+b19ftVXI/FEoTrOvUYvYoF6FFb3yfGZPrsfuWGRA38IEXVTH7KP0YZsYFajQQ
 G9UJtyrFB/ray4flboMovBDwOkdoUGflFSf/dPhTF3RlvxBVhzCGH23BsZHClZcoVpKHowuljXTws4
 TWdqBz/Uq4gE41F9a3DUzMH8tbejAgu5Kcvb4FlIMPOuBkERVVb/jaWcXnjsG1aOlmu7NbIE7OtgJ5
 OJrzLRYCZq5BF6cKyxtEL5/KCYwt7MA958VDbeR5phILWFgh7tTnh0P5ilQvRgrbFVoS5hwKvEuW2d
 TpjzBvM+1lYxsEadLGbHFyVT53ay0BQSFGlhw4HlxvoFj6K3jCUahD9T4Mdw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_004957_056902_C2E67C02 
X-CRM114-Status: UNSURE (   8.98  )
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

Enable the I2C0 bus provides communication with:
- The integrated RT9466 Switching Battery Charger.
- The integrated MT6691 LP4X buck for VDDQ.
- The integrated MT6691 LP4X buck for VDD2.
- The pin header, to plug external I2C devices.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 275ea3a0e708..d5d76a7dbd82 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -88,6 +88,15 @@ optee_reserved: optee@43200000 {
 	};
 };
 
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	clock-frequency = <100000>;
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {
@@ -97,6 +106,16 @@ pins {
 		};
 	};
 
+	i2c0_pins: i2c0 {
+		pins_i2c {
+			pinmux = <MT8365_PIN_57_SDA0__FUNC_SDA0_0>,
+				 <MT8365_PIN_58_SCL0__FUNC_SCL0_0>;
+			mediatek,pull-up-adv = <3>;
+			mediatek,drive-strength-adv = <00>;
+			bias-pull-up;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins {
 			pinmux = <MT8365_PIN_35_URXD0__FUNC_URXD0>,

-- 
b4 0.10.1

