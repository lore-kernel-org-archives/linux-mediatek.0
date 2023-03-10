Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B68C6FA99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 23:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4aKAo6MFb3QMb21J3aoV2riVolfD7kZUTP9+kgcCSU=; b=j4Dh6D1+K8xjEQUy5cjKWbrA8M
	P3hA4+ffamlTtx5s28CLjYmKsFUDD0KScyp+qg4Ad5KPH46fvcsuJgqQl1cuq8wYMfceF/tWXi2jL
	a/VnYgUFBxPPkYOH5UZw9IH76kFtjdncl5NBCvhHM4lOJhqkI3lKPs+NbHZ/hwgNjSoXFyy1UVnQZ
	TpYNsBgIiQnfjDt6+RNLY60d1IYycUMrEYep+AhzemdAZAL5m2st6SXj8ecMcf326XaoyP1nO2wDw
	IxuTevt6KljH7TU+m3Sb3JC/B4LQcWJv4AWxe8K1PM3Jdc1oLsFxZ6SFR5ttG/w5FN0Nqj0VBHgUz
	bJe93g9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pamDb-00Gd2r-4i; Fri, 10 Mar 2023 23:32:11 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palEa-00GNhj-5P
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 22:29:11 +0000
Received: by mail-ed1-x533.google.com with SMTP id g3so26537999eda.1
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 14:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4aKAo6MFb3QMb21J3aoV2riVolfD7kZUTP9+kgcCSU=;
        b=RZ3qkTbRBfZNiA0cqYlVVp21HmjVtY20XaGBwrmGNBazyP6QOIQ0QQeeiMkL7MUPJz
         X7C/0rDhWN32MdR45MbZNH2J+UJZgUl6YA2jF1RnkLqBWV5zT8h0JcGqbLJkYQHJcBap
         S0dnyle/sIgSi32MaROVKLa5wvqJ5gvHk8RJz3hldiuC+82cjq7IpInFb/frDBMPszfJ
         7DJ/vCeaRAhX6wQYox60fKxT9TUKzvESrlhC4kWCfK+0Tj+1dNSd259NjGnwOrpfuWzT
         GvPzpcatvo59dJWBtopFntOFKv4E48mBMqf/6T9rg8W2ymkjI1gSdguO9gia/RG4pRBz
         4Fvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4aKAo6MFb3QMb21J3aoV2riVolfD7kZUTP9+kgcCSU=;
        b=SrZHuq2bbRyGP9vHYzd8WFg/CK8iHcrcv8CnZJu3ZXGiCGqrAroOCztg0jzz6tLlGc
         /KMLR55TeoUaTz2FHCF9h2eu8QDzEvXaZgE6OPgy5G9XdPoLBgsQ7RaWd52Jvh/cwHqB
         amjq40/Pbevz9qUmz8qGR2vm19vbFz9CTikAbYpO5lx4X9UPSohjMiN6hcAmjxFfgkIL
         3OPNGYE/jOe56ACgHnbfC3JYnWz+yE98OXtD1mw8K0jBP8xyAXTYb2Z56mjH9XVQOGuK
         M4TMpyGWBRW7SINRJQIO6+c+h7+3FScsoZAM1RD0JL1OFNd8J1xOORbAz+iNn/3byueG
         eA2A==
X-Gm-Message-State: AO0yUKXSZfUelm1k9+kltUQ2dSLizD0nEDH9xY1c/sptrT/SsjWdQW8d
	miF4HA8TL/ABrn/CjOm89bUX2g==
X-Google-Smtp-Source: AK7set/W0kTwiGlItblh7tf5JTPG4Jzj41fZ0/kDRrZaCweil86ynzpBOA1iUGvgXuT1rUSP46ReMw==
X-Received: by 2002:aa7:d60b:0:b0:4be:d5b8:c007 with SMTP id c11-20020aa7d60b000000b004bed5b8c007mr23483407edr.25.1678487347617;
        Fri, 10 Mar 2023 14:29:07 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andi Shyti <andi@etezian.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 06/16] spi: rockchip: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 23:28:47 +0100
Message-Id: <20230310222857.315629-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_142908_250229_6C47E7ED 
X-CRM114-Status: GOOD (  15.62  )
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

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it is not relevant here).

  drivers/spi/spi-rockchip.c:1051:34: error: ‘rockchip_spi_dt_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
index a66fff0ee20e..57ae58bf7a62 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -1069,7 +1069,7 @@ static struct platform_driver rockchip_spi_driver = {
 	.driver = {
 		.name	= DRIVER_NAME,
 		.pm = &rockchip_spi_pm,
-		.of_match_table = of_match_ptr(rockchip_spi_dt_match),
+		.of_match_table = rockchip_spi_dt_match,
 	},
 	.probe = rockchip_spi_probe,
 	.remove_new = rockchip_spi_remove,
-- 
2.34.1


