Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DC2C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 09:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uj5gr+4mPVvnfCNzOk8V4mj5Wru/QwptKiCL/eRZCmY=; b=ZTreUAbshRc+ezpedpK0tplwFv
	44LVXqkxEfOg2/gI5XMNR3GrbA+TFEdfCC7KWumik8HXCNFNtxmFLqrzuHM3utLXFmNpUxHLWUiAr
	Kw5iNmRsSfBlocHu/AZJym8dxwbAF9MaLJtc4WgRZY9d+3SveuCarnq3diQ2uLARXqRNk1Iky+Kj1
	twtwqTt+GUGZh8P/4la+TaLCNdBJ7bXEPDsySQHTCFpYEbqpExwZWddG0npzfeVJdwq4rbR9Nz6JI
	h8UNZCIfNg3ngV0GbZHO2qTP4lc/AmqxpA/tp1CcDyNRpGATwZ9FBTHwFpBXpAx48fK3gaRtZoRbr
	5m7s6omw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph5GT-00DgB7-2H;
	Tue, 28 Mar 2023 09:05:13 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph5GL-00Dg6n-0K
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Mar 2023 09:05:08 +0000
Received: by mail-wr1-x42a.google.com with SMTP id q19so8273442wrc.5
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Mar 2023 02:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679994302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uj5gr+4mPVvnfCNzOk8V4mj5Wru/QwptKiCL/eRZCmY=;
        b=qCkdQ2dqjq+QOkVFUbmaznTsXM2hRjYkSbe4oiqjIKbZ/ctBff9QAi1HEBeKc2h5Jd
         9DlUSeab/6QzHZ8pu5KRTS17qlALbNnOjCunCNn2nPydexs5Rv5Y4+KRerp6tUPFPAKa
         cqpXeko7/uSoGrFzmMmDD9G1kACkH+JvV11eFio6QclUl2okZ0A83RePs9CZ1oQHJHNa
         9WHaFVRSWMzXNsaah4oVedkPQ+tgU5O/4CEvVsW7oAXIzJdnohR0POMQEFHtpybcsYa2
         783LI5KvInQPjV3em37nQpspXgpKGuhJW6zzBIdOEMNzigL48OACLgnaRPu+r2OysLjO
         xkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679994302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uj5gr+4mPVvnfCNzOk8V4mj5Wru/QwptKiCL/eRZCmY=;
        b=WdP6bB0WaTbvZmtfl5uU0a67tfZRdYQF+rp6k+7s4ydNljqrQPjWkITwXenq/1cU1v
         5VyPg3ARyVXCTZORTeZAOxX6puO/BCyAVPJWzEHeGJfqKknRBjU2BEnEzG2ipG2KFqdt
         3sPTm8lgzc7mETzLTKxi7DQNucSF8My6x8Kh7Dwvkn7KS1qO/uMhCbxhTt1kAJ3VpKpZ
         ndXoUOIEKndB4G59c4yJopFzMjovj648flbEzZNcTECHVAt1IZ/UaX3heiVnjb+5GKiE
         Lo4n3q/gjzTvlK+kM8lpgZ38LDQtXsFkGWtqXvdfZ5Y2L1UaCZ49IOUBFcI5bRZ3imec
         lydg==
X-Gm-Message-State: AAQBX9dfX+5n0CXqY3uDWpONuoB3xuswC4CG80VegToH3soPJSge9Ecr
	kWO8XandqCflDQ6tbXWr8CXehQ==
X-Google-Smtp-Source: AKy350bL24mYxay1rxaA6oH1zPGG9FbBr3x2RneSqPXJnpTZGtmlJTfU7Mh9wuCqvW3n6LHxbapjZA==
X-Received: by 2002:adf:f64d:0:b0:2cf:ed44:693c with SMTP id x13-20020adff64d000000b002cfed44693cmr11074807wrp.31.1679994302716;
        Tue, 28 Mar 2023 02:05:02 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j10-20020adff00a000000b002d1bfe3269esm27102109wro.59.2023.03.28.02.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 02:05:02 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 28 Mar 2023 11:04:48 +0200
Subject: [PATCH v6 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221122-mt8365-i2c-support-v6-2-e1009c8afd53@baylibre.com>
References: <20221122-mt8365-i2c-support-v6-0-e1009c8afd53@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v6-0-e1009c8afd53@baylibre.com>
To: Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, 
 Rob Herring <robh@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=oenjaAD8yENugJ98bbechsKeee+bhy6mS/fPCtOzVTk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkIq27SlFTL8MC9k4ujZdwxuq3vNeLbQumhcib27er
 OgQI70uJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCKtuwAKCRArRkmdfjHURWz/D/
 sFXI8s9TB/qi3jpFd/eIFHieqQczvcNbppzmtw2IaKeSYj4L5NQ2IHJq1BVTDqt4C+63+P6LudKs/o
 hurxwr/Gi7n7GxUIokB3Pqaiza0PmwZh/+ty8GmE25C2VrWXSXie6bwya9ciOcvzvRHjneZWzzwpNf
 4GO+ZoXHAhS7HRzUxtrKUxuk1skldQszNlc+hPzcL9hzl+N+YNqxrFBbZaAjgqJ2RS/E49fp6r8vI8
 0SaLRQHzOZOEDEioGdE/3MvytFVGEBiHuONio7h/O1+ae00ZHjcbfJ7Ns5kCQlUcjfWiTt4D5EIfe7
 UhC6hGUtBOxjQzR5geXTtM8IjY4acENy2/MSpHEIWMLcGWF/IO2tmXzno/wdLPD2q4LPzSXYlCkrk+
 ja8194zterVHQY9ecTD/KsDzfsgkAsnVB6cbCv2OxrihuzePBRZPoQhs3B/0a+nk9AqqTYt+DZviI4
 trmjzAo3ykqHOxtdPdKRUpEsm/3ku8irhv9HQTCEgms7VHL4usqWTwE0MINlJePPNYTpgiIe4kOYDN
 UDIw3AWNImmYClwUcnX40Xas+gWTXU8UH5C47HH8aXmryu2Z3KEXqmItRiU9mu1askHaiJNLST3QyA
 etFbBfVE6NMlGxRUAbrHKkA1W1VLBKhkjh1h97cR9BcdwPBLg//URJnWqDBw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_020505_140142_D0D34B14 
X-CRM114-Status: UNSURE (   8.93  )
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
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 4683704ea235..adc79ba14b33 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -87,6 +87,13 @@ optee_reserved: optee@43200000 {
 	};
 };
 
+&i2c0 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {
@@ -96,6 +103,14 @@ pins {
 		};
 	};
 
+	i2c0_pins: i2c0-pins {
+		pins {
+			bias-pull-up;
+			pinmux = <MT8365_PIN_57_SDA0__FUNC_SDA0_0>,
+				 <MT8365_PIN_58_SCL0__FUNC_SCL0_0>;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins {
 			pinmux = <MT8365_PIN_35_URXD0__FUNC_URXD0>,

-- 
2.25.1


