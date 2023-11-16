Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8842C54FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 13:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g+caM/fGFqwg+mNVYtjWtQ/3+CQtaaIeq8SYK74zbQE=; b=HDxVkwJvobCe1H
	Q/Q8i3AE5pkvs1RLE4S5DFSFxfQrZWhT/j2RMKmfBFHEHSJoVIa4dEkA/IR+pA02ax8pjEgQFTpD9
	r6ljZr3GMpg+4UBLWCufAMHl1bBU5tmlT7nIQvahZdXsVbtBxep+4cC1mGNGdm6WOuEofXwRcGi5m
	K6p8NmtJomgO9DVQwMncHR/57c2j5Heg/o8IM5fRw9rrDJPie8ypwJy8+LlfhgCUkaIXrEtFezyiO
	zwbkFI0UIouZ3H7UHfr5AexcB4ngdYliqCPOUnMUJFxV+kcOtNgGVpTfCOvWeT1rYBvQ1w9rmNPC2
	df8Bv9hwa7kSMa12EkfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3c8E-003YKN-2n;
	Thu, 16 Nov 2023 13:10:06 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3c89-003YI1-1C;
	Thu, 16 Nov 2023 13:10:02 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5094727fa67so1090282e87.3;
        Thu, 16 Nov 2023 05:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700140199; x=1700744999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+caM/fGFqwg+mNVYtjWtQ/3+CQtaaIeq8SYK74zbQE=;
        b=EFBEg6uBUZFkSz8G86oeUi0BcXJuic4FujgH/PSEbEJ4RcSfXB4kLQnqRQBKF+7xNw
         JFCE58+LNspaK0ETe0qX0VprT/py8am1Ptk4Ct/yjQSyHlwrlHNzyws1y2CER/34vJU3
         ys8+ldphWo4EjA4JVSEksEGA6I0vnt6P4lQ1VdUC+6njh9BPJf6gQ00eZ8aT+5JRwZoo
         b2obBoZoVOEt+4NKUfVwzWGL2Kvh0aDIWEX+JrTXrnSaUU5wZunmUC5QQ5ttUPaLIq7W
         e7uXsxcJXmUKRhJhGv+bxp5i0n6y7cquFQH8TG4ze/ZMzsrmosGWDz74xu077MagZKzf
         Um6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700140199; x=1700744999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+caM/fGFqwg+mNVYtjWtQ/3+CQtaaIeq8SYK74zbQE=;
        b=hwiWdk2Gdn60rYrqbOUVnrzlSgqdNlBDUm36/gbNcEH4//N1qe7j4kvXiGrDb7tLoR
         9SdGcAIOFwVR7ZNaX9c2TtNSQo7502tbsy/NidEWY68MrkUaF5KYhXnaNo6255Hcv7Bn
         93UseM8xm6VRvfTjcbzBndgxyWZX7WP6YLLncb8M/xW2HhU6yzQsUfpc9nwTHPAAp7fr
         NqMJmbJ5mkp5mNpI/QP3VulxpnPbe3xbEYZMIAF6PUVEKoUqkJAWSPCqOnrxGOLsamBz
         ZcXTFcOhRQKCnEDgJkx8ulHxhxCbtdeYwR8kZD9vvQBZNUkQC1N8wgKbNtRFk4yMYxTT
         jUfg==
X-Gm-Message-State: AOJu0YzJ7EbtO6pkGuG6LQg1bmEEn1c9ySYWGnFgkex4aNeNJRzNbx/p
	HG9qaQ3z5KGk2ONlcBMGHzs=
X-Google-Smtp-Source: AGHT+IEx188eMVfx2JFN4RQ/a3OZYRbagamvEiD0/93G0nYiihguTjkmM1ueS+77Cz5i4/SKzp22nA==
X-Received: by 2002:a05:6512:4002:b0:505:6cc7:e0f7 with SMTP id br2-20020a056512400200b005056cc7e0f7mr2343047lfb.44.1700140198822;
        Thu, 16 Nov 2023 05:09:58 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id cw18-20020a170906c79200b0099bd7b26639sm8390652ejb.6.2023.11.16.05.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 05:09:58 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt7986: fix SPI nodename
Date: Thu, 16 Nov 2023 14:09:52 +0100
Message-Id: <20231116130952.5099-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231116130952.5099-1-zajec5@gmail.com>
References: <20231116130952.5099-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_051001_410992_7128026A 
X-CRM114-Status: GOOD (  11.87  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, linux-mediatek@lists.infradead.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rafał Miłecki <rafal@milecki.pl>

This fixes following validation errors:
arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: spi_nand@0: $nodename:0: 'spi_nand@0' does not match '^(flash|.*sram|nand)(@.*)?$'
        from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: spi_nand@0: $nodename:0: 'spi_nand@0' does not match '^(flash|.*sram|nand)(@.*)?$'
        from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#

Fixes: 885e153ed7c1 ("arm64: dts: mt7986: add spi related device nodes")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 3 ++-
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index bcb3ebb85d70..2f884c24f1eb 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -237,7 +237,8 @@ &spi0 {
 	pinctrl-0 = <&spi_flash_pins>;
 	cs-gpios = <0>, <0>;
 	status = "okay";
-	spi_nand: spi_nand@0 {
+
+	spi_nand: flash@0 {
 		compatible = "spi-nand";
 		reg = <0>;
 		spi-max-frequency = <10000000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
index 48fe50e67177..57dcaeef31d7 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -152,7 +152,8 @@ &spi0 {
 	pinctrl-0 = <&spi_flash_pins>;
 	cs-gpios = <0>, <0>;
 	status = "okay";
-	spi_nand: spi_nand@0 {
+
+	spi_nand: flash@0 {
 		compatible = "spi-nand";
 		reg = <0>;
 		spi-max-frequency = <10000000>;
-- 
2.35.3


