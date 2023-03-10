Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC748C6FA99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 23:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=60PuEIm35j5/lTNeJPhlkXRZcGNjzFmtFVCVem+hEDw=; b=cMJOtHXKpL1aeJhT/5Dp6FwAY9
	W+JYH6KAdQOm2jdyf72jU/UbffTaF8u/m1NYOJtYsIh9keTBknptjtizG2i8V5JPYZN8jYLS0XGbA
	hBfF2n2B1N6Yc8k6+zAf+Cl3RchQz1QZNxDZ71aydxZ7KR36QpXvfXfuPFyVbqoG1yXRmnB/Ia1p4
	GZV3KyUEMZsYkReWtHrqhhr2ilWd6GvfU0A3ALYYtmfT9NYSug+NECC/iJrxi2hsHK3ldr4L5E5/1
	u9C4EaMHTheqSs0VJq4DGrQ3v06xu0Kki2cckF1vCG45ZZiX472vqSEcNAOAoudOxamPYgMmbyG1F
	6FpI//zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pamD3-00Gce7-Fy; Fri, 10 Mar 2023 23:31:37 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palEU-00GNgB-Fy
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 22:29:05 +0000
Received: by mail-ed1-x535.google.com with SMTP id j11so26470841edq.4
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 14:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=60PuEIm35j5/lTNeJPhlkXRZcGNjzFmtFVCVem+hEDw=;
        b=LEfc0zEi+LQ5St5qp/OpSxRZTLSGwJrZ1Hg1Bjj2BqrW0jf1MDtYIRP0HBSYpqADEj
         WF3P0M3JfPUzD+0gnosaMbTzjvm7A21OxNXWw1cCY3V/EijHD8A57mAb+tmulhwrtNmZ
         /ey6MnBObA52rMXrEjca40rbROCtoOkxo00ygLa6tTa4IPsuDoy8BCLW4mXNNsI/mb3R
         JtMWGx0rRuUOJTylIlHrwVyQ7uG44r5J62FtVEjBEXguCGv+0Um5Q7oEhqDemugm9lCP
         n2LNdiqGW9semV4b/A988X57tQIYizAda0dcfvCxdBt2WybsTGqY6mRciCT0f6OPhsrB
         qMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=60PuEIm35j5/lTNeJPhlkXRZcGNjzFmtFVCVem+hEDw=;
        b=dzHS0jCS10tJ35TtIJm9VlE3ki69wV83YFRludj47GWL3NJSMVfbGr390cqYFFHz5E
         E89mhVAFQdyC23kvCUusFdxsqGsPJibZe9693L68F6mC7X8Plu176fLGGk4cP6+nqpeC
         YFu9UfbOQjpGAxJx5OTChKosKFp3v8FI4MgsARwtD2wPjCqHBawlsnUF2YEgN9ZaLvVy
         r8QF4On+rktE1B6B4HGiJRPO9YYwtLG/GPWkBXeLD7BYbG14A9eUgvOVUTfxwHi3gaUz
         eTuwN0HP7ytf6Hpxa64mpywI4nSBcFZQKPzCnXUQvkGAMfHHwBC9sPRfUyAH/e8Qyv3i
         1pAg==
X-Gm-Message-State: AO0yUKXZBB0uIkTglcNtDMA4HsxXYJ3oxS6M9gZI3qXWrBhk18R38I3t
	Kk50JsnzhIASc1Bnggm6btDNIQ==
X-Google-Smtp-Source: AK7set/w56mrFx7St5tpjzC1nqrpGgftY5conmyuZ6lJBZWH6ul1PMXKHMQPItpT75fNAsz/ObHAxg==
X-Received: by 2002:a05:6402:1506:b0:4ac:c7b3:8c27 with SMTP id f6-20020a056402150600b004acc7b38c27mr25909175edw.28.1678487340674;
        Fri, 10 Mar 2023 14:29:00 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:00 -0800 (PST)
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
Subject: [PATCH 01/16] spi: armada-3700: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 23:28:42 +0100
Message-Id: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_142902_663795_DB82188A 
X-CRM114-Status: GOOD (  15.63  )
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

  drivers/spi/spi-armada-3700.c:807:34: error: ‘a3700_spi_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-armada-3700.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-armada-3700.c b/drivers/spi/spi-armada-3700.c
index 6a7e605f73bf..feb7371940bc 100644
--- a/drivers/spi/spi-armada-3700.c
+++ b/drivers/spi/spi-armada-3700.c
@@ -919,7 +919,7 @@ static void a3700_spi_remove(struct platform_device *pdev)
 static struct platform_driver a3700_spi_driver = {
 	.driver = {
 		.name	= DRIVER_NAME,
-		.of_match_table = of_match_ptr(a3700_spi_dt_ids),
+		.of_match_table = a3700_spi_dt_ids,
 	},
 	.probe		= a3700_spi_probe,
 	.remove_new	= a3700_spi_remove,
-- 
2.34.1


