Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490DCC6FA99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 23:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4hsdqWnTrZCw8a5RzNxKgld2eq5ESSNSd43t/rkHbA=; b=h5V2blpm9S4xCqIWfu2L6BBvVh
	uyhkvJuezRYJg2Oxu0MKWmYqHPbhnb63A2W8IOyK2DSZLhbyAi/3pQxYG/DaJSpTQ3Rg9LggUVjyG
	r3pw5Pm3QSJU2y/mRCerOVXeUlkeFTzMBsE+Wk+q8kMCJ2/ePybreZrVQXAhbyempayBolP8wia5A
	ItvKZ8hTFjsH2rpfV+iTZHlckz0Luxe4T206EnafHeF63ffkH1AgaVh+B7xSsu3XzunPxJ7Y1vja/
	BRq5fk0CiX/sCZJQkbFczlb5YGpFmIWHybKovJ9N+uPePXlcCXOwGOOTyJRG6d9VHrUce7BAqGGWx
	OekGnjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pamDX-00GczU-En; Fri, 10 Mar 2023 23:32:07 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palEY-00GNgB-QF
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 22:29:09 +0000
Received: by mail-ed1-x535.google.com with SMTP id j11so26471510edq.4
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 14:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4hsdqWnTrZCw8a5RzNxKgld2eq5ESSNSd43t/rkHbA=;
        b=sQ9AnmWrtkGTib7XAuvnkd/mECJ9fJ3H135f812M5x+86PSP40RwLIlTRgQ1T4m70O
         /5u/uQm3FN3/qjs3kbzAn3amwi8BH54NeZ9ak/3qqOHRxONcHK+LS0jQ2lZFKn5gYTUc
         RpRtfSA2m+jUdaaoLfdezgQ0HnabwAw5Zd5UJ5dqV3uQXLsbWK3iN7ntET4GLmfonbHG
         HqTHQEpi57dXBQigF2FBMVwrXUfCvgWj/8SOoCpunzh11ZkB+PNH65nvKVZkueb62SGb
         mXX9xdEOWyKpvgeLMJaW+kaCM65dZySOzCAtYIZjl7k+9cAThGz1l/FTIQEQq4iT2/ER
         RJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4hsdqWnTrZCw8a5RzNxKgld2eq5ESSNSd43t/rkHbA=;
        b=LTwBuLsajz+dJDAAc/NqfTAODvNPkhD68QYKnVeqfGmwjlb2QGtQ1uRPEcFfheQoLL
         oRQK/98c+WSC8NG4bYApKG724yAIRVrDQ5xpQGDNS6+vlJMpd0NBRzrzkQqiBeotgrum
         M2tY07b701JAc0NkJtGDE7mEs7Y5iaBc0O7B0pw5RVrgojuvwogW4lqdiOUE0djjclKe
         mSLY23OHPwx46lmRyurHDMx3yW85rW/cugdv6CVBaR6VEfrH6DHRmR9NSbW0JxL0Fagu
         LB7pELznNqYAZ2e0pElvv3UeXpm2dzuMzueuj+cIaA2Lf6WXhblSKbyTuX7d+htXeHn3
         u1HQ==
X-Gm-Message-State: AO0yUKXKZ3g3TcousBpAn0MWFzSeFjLwnZ71oUWe8LuYY9Q3zd1Qysww
	wTcT0F153wNG3JF28UoDILEBpg==
X-Google-Smtp-Source: AK7set8req7DR8ncW0h8QB4fOrmA/Kz78djHJzJDXsGh0OSt5DpOgdDc5EHeCp2kQeLQUU4yam/Ccw==
X-Received: by 2002:a05:6402:2028:b0:4af:70a5:55ee with SMTP id ay8-20020a056402202800b004af70a555eemr23535448edb.3.1678487346365;
        Fri, 10 Mar 2023 14:29:06 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:06 -0800 (PST)
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
Subject: [PATCH 05/16] spi: orion: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 23:28:46 +0100
Message-Id: <20230310222857.315629-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_142906_872224_1FDA06C0 
X-CRM114-Status: GOOD (  15.54  )
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

  drivers/spi/spi-orion.c:615:34: error: ‘orion_spi_of_match_table’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-orion.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-orion.c b/drivers/spi/spi-orion.c
index e79d1fe0bca4..c63b75c1829a 100644
--- a/drivers/spi/spi-orion.c
+++ b/drivers/spi/spi-orion.c
@@ -852,7 +852,7 @@ static struct platform_driver orion_spi_driver = {
 	.driver = {
 		.name	= DRIVER_NAME,
 		.pm	= &orion_spi_pm_ops,
-		.of_match_table = of_match_ptr(orion_spi_of_match_table),
+		.of_match_table = orion_spi_of_match_table,
 	},
 	.probe		= orion_spi_probe,
 	.remove_new	= orion_spi_remove,
-- 
2.34.1


