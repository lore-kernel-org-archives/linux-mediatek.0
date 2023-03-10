Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EA8C6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 23:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3O5N03pwwa5CISBXEL2uh41ANV84DtyZX9Qqc/gvOE=; b=Hj9hJzqG+/t7t9gQmFEKCcDdET
	tPanfyn99AJjzr9MoXuc/luZYoqK4uMlld8dHdxR/WX+hnYganH9w+78o03ma5wckBzyb7+pEvpar
	1ejeLBSF9VE4YeWVkNCEHlPpoyPubSiDGy6Yqeo1ELbp7sngTFu0FH3As3vUyuSzwOd6/Gn+GOMaw
	7hA1bSJZKgffuSIiZvrjACbQYetej0yAV4P2TxeQW7AguLBYMwn/xDdV/0w4Mf0jHDd0JaJdrBNvF
	W9hedPZ53s2cpNBGKCRLLCiXJs0KDgIj0gZgfy7dlHfXG6XoLtFUuQgv3N4D98jDtSWsiVrzYta9G
	e5fQfHKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pamGc-00GfEi-2J; Fri, 10 Mar 2023 23:35:18 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palEl-00GNgD-QI
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 22:29:21 +0000
Received: by mail-ed1-x535.google.com with SMTP id a25so26664902edb.0
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 14:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3O5N03pwwa5CISBXEL2uh41ANV84DtyZX9Qqc/gvOE=;
        b=k/86A8NzfMfImxqB7+KDGVg/tynJ0FVCkA4dmZsWIIwO7Ykre8VGNhhLmaoZxK5KT6
         H3l6ZZCxmyioRniLqshH544hiliBpuPql4rrcaGN9SPUaoBgt/mYjvy3lFkcooWp+CQj
         /cZd6t1wB+DD9btEFmW4rhD/UxwGgSLeoP8+6PQdjvt2yfEZsUiYi1auwiNr2YRkL0Ae
         eGYX/hpVFD0YR9ZjOD9aXNAFS55flsLUNlQ/EodMAcU9+jDwOEUYGcDlVb/I+8XQi7AC
         +dBZ6c8c6uYJIAAEPOJ4odu80gqrKfSiQSXkSlCWkyr1U2hFPRdYKsgGWKGkJMfxst9s
         c+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3O5N03pwwa5CISBXEL2uh41ANV84DtyZX9Qqc/gvOE=;
        b=AsLR7f//uS5TvWegzOC+CTSjtcHyu8+JVIX538n5O2XQv53lmqZ7If8zXC2dOnOgz9
         9QshQzzYdBvhyJsUcRl59VjF1SVGSIo7XQOzyXLIM0rVTmKyAgaTGl2NRXU1uVtAiEtw
         O6dViq35t3/IuvXKHUH9uKARJgRwR2yTeHXOQURGgEoWvWX1AxipQm6PM8ZvdERrawRE
         0ULn2lgIUkD/HLpQpdNjSMf6ZdLyQGkE1T4g/mOGIcfWJFo7RApWaaFdiC07qNas/137
         JH9TXNuR1sj1ZfGXyBXsHXUc0CX5/ITr1/OSVrDpTlNmVQRWMEIlHv++62WafKjDtt22
         RAlA==
X-Gm-Message-State: AO0yUKU6WQMNpAvTJJ2ZNwpTRwqzSflr9nF82HR8G5pa9srysX3PqK7s
	8WPRs/k5FR1qreywBNjfZJpn8Q==
X-Google-Smtp-Source: AK7set9Rvn4y0BGnLTV87CbBg91zcO1xpeU2J1xLOi9EFaaPOkq+Z2ChtSGd5/YJsuzGlHU4/phxIA==
X-Received: by 2002:a05:6402:3d9:b0:4af:69e2:529f with SMTP id t25-20020a05640203d900b004af69e2529fmr26991968edw.27.1678487359382;
        Fri, 10 Mar 2023 14:29:19 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:18 -0800 (PST)
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
Subject: [PATCH 15/16] spi: sc18is602: Mark OF related data as maybe unused
Date: Fri, 10 Mar 2023 23:28:56 +0100
Message-Id: <20230310222857.315629-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_142919_880584_518C0874 
X-CRM114-Status: GOOD (  13.15  )
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/spi/spi-sc18is602.c:318:34: error: ‘sc18is602_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-sc18is602.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sc18is602.c b/drivers/spi/spi-sc18is602.c
index 983b3621bc2a..5c2c255f70e8 100644
--- a/drivers/spi/spi-sc18is602.c
+++ b/drivers/spi/spi-sc18is602.c
@@ -315,7 +315,7 @@ static const struct i2c_device_id sc18is602_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, sc18is602_id);
 
-static const struct of_device_id sc18is602_of_match[] = {
+static const struct of_device_id sc18is602_of_match[] __maybe_unused = {
 	{
 		.compatible = "nxp,sc18is602",
 		.data = (void *)sc18is602
-- 
2.34.1


