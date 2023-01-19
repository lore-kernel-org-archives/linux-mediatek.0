Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F71C00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 17:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vY1pR8A7OW80xkAZYg++krO0fJkxZ30BhhNRiI4WE+4=; b=J8BJY7R63VeToAl1sijG2B07zg
	NHIqruZTXO2MyE+yPvqxCt+yRTj+1vg8G31Xv930YkMP3X/gWUsBJ1eE7i///y2Vo9BWYx7b4Yfpe
	unsMKrHAvWQHEwQVG/ZYdLF/TURtmKdXGnTXLAEwuZToaA0oMJSr3nZthLkClJXHk9c79rKeebJXu
	/J7ipokRC2MEaUEGXJLcYVgJJWVnNKFhrA3umj4nrxUOaVtmPMq2j+aylAXUCBPycyiJ1UrOwEwrs
	UdDmp3gZWkURzhOiYlT7DDjAfA5OpJlsFSlOnHg4f9cFSFbe33O3IaGNBB96lpoxScZb2ERlzdGg0
	7CxUz+Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYRF-006BRf-BN; Thu, 19 Jan 2023 17:10:57 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYPc-006Ahy-SK
	for linux-mediatek@lists.infradead.org; Thu, 19 Jan 2023 17:09:21 +0000
Received: by mail-wr1-x429.google.com with SMTP id n7so2524215wrx.5
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Jan 2023 09:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vY1pR8A7OW80xkAZYg++krO0fJkxZ30BhhNRiI4WE+4=;
        b=P65lYM/d/tq/Tl+523m0GHYdBPr1YEqPOFcgIGr7Fb3OmHUpAzkHxBwCvneoSkKqSA
         cN0C1PdoheStFj4oa4A9us8dMWFJn7V+qQYlsv37VHnvy1GYHeegrbBb0cBJ1c0kyVzm
         QCvRRVTGBRpngeUjZifN4H6yV9v0BpllFhZvtPnyMwPnPPjI76H5wBeVC6JlND4/YIQp
         GHn2y2tC18K5hsmJ/YGbBCbCLWg/wKzrdV5V2kR1EL9Z8mwfqxXhcTGYB8lOD4x6oGV6
         P6DNeaV4536ihL0rpi7B/3oCM2OY1hdr3f1tmb8ZjZm2tEA5cizIF3FwtEtHFHD9Phya
         uARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vY1pR8A7OW80xkAZYg++krO0fJkxZ30BhhNRiI4WE+4=;
        b=sSIQAQuT5tqxZbOhanQXpZyjPWi6/cQv5eBfYXeMcjvUt5gZTWNoL3D3rFXrDae3s+
         YsAs5qxfJMmBBQs167yPcxzBw5zbLS3jznLmu65o28VBUkdvm+w49goBB18hGt6sCSUT
         wpj8M5EwQcSGfXnPDAK5uG3pThqyGxhgL0iiVUBcV/qmif6BlOMakuufwWHGipAx3ija
         2KKDQEFL9kyfJhoM02Ycj5ShzLdvpNhZPXsAWJ7uiuniNJnwdYQLsIgGsMuFae1f674x
         YiExKNZXV+V7wQZSWLrYZRC0yl9pLryD0JnxBZnU0Del30RUszmFJ/o5cuJHR2rhtfqM
         YPtA==
X-Gm-Message-State: AFqh2kpxmsvNdX4T3LvWXqGIpRGmDDPvOmyIMxVOp5uzM1U1kEuEMsPd
	IYx6+gxDO30zyMqSBghdtS77qoKbs4ikWN7X
X-Google-Smtp-Source: AMrXdXuVy8ToVBnQPqscQFHF/FAJ0rM3gQzJN+hV5KyJBH7B3bYj/kUMevWR4CjW9sGQCBIdSI7M8g==
X-Received: by 2002:adf:e841:0:b0:2bd:bf01:5c3 with SMTP id d1-20020adfe841000000b002bdbf0105c3mr10191130wrn.61.1674148155117;
        Thu, 19 Jan 2023 09:09:15 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id bu9-20020a056000078900b002be1dcb6efbsm8738701wrb.9.2023.01.19.09.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 09:09:14 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 19 Jan 2023 18:08:54 +0100
Subject: [PATCH v2 3/3] arm64: dts: mediatek: enable i2c0 for mt8365-evk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-mt8365-i2c-support-v2-3-e4c7c514e781@baylibre.com>
References: <20221122-mt8365-i2c-support-v2-0-e4c7c514e781@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v2-0-e4c7c514e781@baylibre.com>
To: Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>,
 linux-i2c@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=VOgzUWYZ5LqJIocyR/msYYzp26C90wB0hqeJ/d6bEGk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjyXk2ouw0TaK/YymL8/LwYG7zbgNsYWk7Sm4QaG1v
 Hq9eNMeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8l5NgAKCRArRkmdfjHURZhID/
 9Uub2bUuBaf78i7z9ZyRrS0l1yJ8Bdey5zQzK/4aK8mPTm5Nl9fubCpzirBoXEG8bhSVJjvmZwyo1G
 RaJkZfkeBqgLOJKpWVHZNGWpoGrsrNBkJoWkhNvK2qfqsOrK1w2RIbO8lefpgWEyvDM3JRCEW/WDJc
 i0pj+XSJSlvga7oQPj9FmDe9blRKUlGJDJTa2RQvdpsD+RE+Cq2wK75i0s0+Qmi6JEW8QcWXLIroNv
 lgqeZRqvP4ZBHWeQ6zRF/u+lyUNHKnRR4jU9DIM5f7xBmwQT3rAEdrRck4Px0Peb8tBqrov38SNyq9
 A70WPxxZ8VFGSC1FkhuROcCV61CNyfxQSdAI9eKlmzav2RDqVbTjBSX+5jxcbLsd+gS2kS5rWWlFiE
 8psXIUQHk9FxSOt0knnWdNgq2oMQ9MkBrmh3xDVJVKkCzBm1DJ/89cXh+Ems3p1VUYNt3MHOXIDDeM
 1SQoV1em6g9NpHeegLBV1V/zKJ7D2+6avO1l9p2Ay8/4GZHtSOosLIQn2i0iT1mIgiXVZ3fFTv1SLK
 Ck+g+gNQ+/TN0hXC0qiPja3qxrwsuv1EnANH9SEJMt2OLgrXDyUV5yHWgRwmbBCWt/mfsh7+mbL31H
 80CefxZZyl5wX20zlkLw5zEso3Vz3EOdA4uXryCmzG3y74NAbfq2W1SSwkVw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_090918_297473_9B6DA173 
X-CRM114-Status: UNSURE (   8.82  )
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

