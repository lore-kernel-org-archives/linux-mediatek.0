Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74486C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 17:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qzug9pLoxRuQXnYlv7XgDcrHUWACV82JptfG9Z4/D4s=; b=jKmeJwAHmwLjguLABNVRAsqZ9t
	An0lL/a8A+Lt9SorgZ58KiHO+8zXGvIKBUXcHwVX34HGPpEX0UWTV1XLH3TBP3k+g2RGEoyscjRWj
	dyy8oQwgKCW7AJ67B7FgyOJGgMna765W+i+v3C2jh6tpUoP3z60xwjxnytZ0f4w5HFXJGWZqU8jKF
	FsBGIsaeMuTTfP5nKbIbRsEtuRiOPjUEKvk3LOKq4Wrfsi5q5XO2FZHugTSuUuAb71puXEffjI+7t
	wO62k2zA0cTXtkYqn9soQ649JgWW8GYCXp8h6ZpNp6zknnq0b94iU0qfuQ1MejroWlsdc4lvMHbfK
	XhJPsnTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYjF-006HHK-0j; Thu, 19 Jan 2023 17:29:33 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYiM-006Gra-3C
	for linux-mediatek@lists.infradead.org; Thu, 19 Jan 2023 17:28:39 +0000
Received: by mail-wm1-x32e.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso4059414wmc.4
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Jan 2023 09:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qzug9pLoxRuQXnYlv7XgDcrHUWACV82JptfG9Z4/D4s=;
        b=QbQ+xtuogSjENXvuyQHvcBc+32t2eHBeMI6TM7rGc5E/n9VjD0JiQ0xDLxWk5JLDiW
         9n+vkvnjzxKrkmxQapT8ZQNJtTHYsILzs6i3pCjsdvGuPWWgPXt7QcCnLlXIM7TJ34ZF
         fRQCrzHfsE4fUlpI4OmgUk7WTZdRGcVN4seKNiS7lxLB823RToSOFSNliSV3CpNQTepO
         giBfIh3YKY85HDfCjhPB2EFSRlcT90XANR9Ua0VVH8fR1/JVYZU2be/HrujPTe6mw2UA
         KlJTx8w4VH+DFQq07YrJ3O2Uek8o/MEr7UUPvSjJkbr9TcWbsoKA1D+sCtZOQLkbiOth
         lgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qzug9pLoxRuQXnYlv7XgDcrHUWACV82JptfG9Z4/D4s=;
        b=5w7zmhNDQPcCzHwNpgWEcbH9jnGZUbrwC6k7SzRxnBACkvR6BWrpPDLa7v/gJgsrEk
         a0VhBZPkaLXz+9prcURpV733+KMkb6kWQrRDOo6G+4cM+SDEyK8cbDK8By7OiOI8JETX
         VEWLfmEVFn9LKKQAPq5FMLil9u15qqUg622svDdWpzxZu0AuRuvllmrDsyPrUOpQ8AmH
         pdl7+jMDVG2KBXtIeNpypBOLyjVwbMJ0W8BMcZ0KguHMWjSs6Y8Ep7Z+pTerIv9wxhCk
         VkuUc56hcEV0cU5+OKe/60iAjaUOYodfc86yUlmB/VAACOSxv7jm+j+BHg7Z+8k5h3U5
         NjkA==
X-Gm-Message-State: AFqh2kr7btzW1iLsU+5uZC0sMevGbSQlEM2IItQi6qCu5OcYLccluS+H
	y2UT83cUsChJE1+2S7+f2f7ROQ==
X-Google-Smtp-Source: AMrXdXvE4JbSwyhINg/vGJhV3TJVbuG9yiJGQSLKxogSjADoupUFsnQPqxFTdf59WZc19Q/vzSxYNw==
X-Received: by 2002:a05:600c:1c01:b0:3da:fc07:5e80 with SMTP id j1-20020a05600c1c0100b003dafc075e80mr14344237wms.12.1674149316600;
        Thu, 19 Jan 2023 09:28:36 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id h11-20020a05600c314b00b003db2e3f2c7csm124186wmo.0.2023.01.19.09.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 09:28:36 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 19 Jan 2023 18:28:20 +0100
Subject: [PATCH v2 2/2] spi: spidev: add new mediatek support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230118-mt8365-spi-support-v2-2-be3ac97a28c6@baylibre.com>
References: <20230118-mt8365-spi-support-v2-0-be3ac97a28c6@baylibre.com>
In-Reply-To: <20230118-mt8365-spi-support-v2-0-be3ac97a28c6@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-spi@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=61svYXCZ66IwrOCd3PQBt6hGhHxViuxrH5xxuI0gaAc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjyX3BZ7lIoc0AZFKip7TYkMJRfcUdwbQhZSjn7YMf
 k4V70euJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8l9wQAKCRArRkmdfjHURaGzEA
 Cse+twuYNDKqhiv19vFcsZ60OAjlW4CXdtrhyIL2bHptTaSOg7JyNtOnjB01lKA0ya6rS+u2nW9j4o
 hlc+8MaBCChk5X+kzT6BM85SGzs5eHxzRPtmmjklTRsc0xFcfxK5kxtNc+WWGfK7YqjjkYNF1KEm9L
 M9yThVqXvmICYWj/Pmf+fxPlIcKby79BQV3eb6yAPIkRbhjO12OrzYxwDyNlctmY8QNEu2ZCWsq1j1
 rylE9a+t4Ell965hDseNAepDxAYyP5WtRHb5CbPfQEWlAVYJES1wf93kp6mCqZivGj5ZiU4jgfVchT
 O/hHqW4bnnEty1df+gn6fma7UIRbGPUQ+5b4CF2ptY32XBGzz3QLNwSX4u9GS94GUeynGFKT8e9Us2
 JjB8I+Y5DRMU6ux8selSaxjEnPDzi6T1TjstPjxaqIlKf28oTc+HW/1JyyGUa/EnD6CuKTRxBJcaeG
 AkbykIGzMz2FmUoj6DeUanMvm7On3ePP/H/IE5i/Pyf1N+Sz9HoWuu9iFpM32VjqbKiKdGsBy1UEOE
 +l+qx1H/8f5znJAgGMHPZ7jC8xxfLqrqKFpjje0QnYATaTStBGDizhldbyKbgle80Dsplt1P6ly3kl
 zOSUllGmhlkbclA+RUuAPROB1nqFcWFwMD8j09sCT46hgHJOxKH/jVhOMadw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_092838_200457_DD5E5E3F 
X-CRM114-Status: GOOD (  11.00  )
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

Add the "mediatek,genio" compatible string to support Mediatek
SPI controller on the genio boards.

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/spi/spidev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spidev.c b/drivers/spi/spidev.c
index 6313e7d0cdf8..e23b825b8d30 100644
--- a/drivers/spi/spidev.c
+++ b/drivers/spi/spidev.c
@@ -702,6 +702,7 @@ static const struct spi_device_id spidev_spi_ids[] = {
 	{ .name = "m53cpld" },
 	{ .name = "spi-petra" },
 	{ .name = "spi-authenta" },
+	{ .name = "genio" },
 	{},
 };
 MODULE_DEVICE_TABLE(spi, spidev_spi_ids);
@@ -728,6 +729,7 @@ static const struct of_device_id spidev_dt_ids[] = {
 	{ .compatible = "menlo,m53cpld", .data = &spidev_of_check },
 	{ .compatible = "cisco,spi-petra", .data = &spidev_of_check },
 	{ .compatible = "micron,spi-authenta", .data = &spidev_of_check },
+	{ .compatible = "mediatek,genio", .data = &spidev_of_check },
 	{},
 };
 MODULE_DEVICE_TABLE(of, spidev_dt_ids);

-- 
b4 0.10.1

