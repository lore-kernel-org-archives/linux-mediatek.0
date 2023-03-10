Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71156C6FA99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 23:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIL/eAhzd2Q+CmLa0/Vp8uh0M9mRf6IHTk8hQZUVPkA=; b=oBPdTo5q7qnYap4OToeZthl/a0
	F9wUSTHRAuICuCuxD+Wp4JLKLfPj1JA826OtY6gZoZh4lVfxJofxL6SKN1eSz6c0VQxEYsj3SufY1
	tWZf3PzojAoPTLl5JjyFMOEBeiJ/q2VcBGKmo3jHa373+tuKsyYbDS+dON5edcDcgbfuraO7ulaGz
	prQBkjDNY/o8cbDmxOlZGz0i2r0K9lTTdWd1phWEksP8wRHwH2MbxDTkgzrrvmLHMaeq49x6feEQN
	XBWPBPIlRWbS9Ln/p9CjTRs+S4UsJigpvRu5nhqDsaZE+/pjAas3Kl5f7+pKg78n+GV8GCWN3KMRD
	d1dP3YOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pamG4-00Geta-7B; Fri, 10 Mar 2023 23:34:44 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palEh-00GNg9-RU
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 22:29:17 +0000
Received: by mail-ed1-x530.google.com with SMTP id o12so26455127edb.9
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 14:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIL/eAhzd2Q+CmLa0/Vp8uh0M9mRf6IHTk8hQZUVPkA=;
        b=k9IOHxBgd0bMymkB/VVDYynw3dg0wz5WLTLxzV6gvhi0zHI1m8CQMly3VXoSXuKFCp
         8h9Sng22gMlalzZGQ190Jfc2ocLKGquLyts/VCYV4KgnzhNpLAw1lmCH08tqlBTGh9uX
         opjEMpR+/6cN4xnJkfQRHijm2E+EP866a7+7DUN7ENr4l/jbDJAouQL9++JBziQhUcen
         89Kb5I7fiA11hsVqegrlnQFLmvaJvdNzACOqIF+Q8V10Tmi8VpXBpBjWc0BjNbw236gS
         IGoWXG5ofcZOzKkhc2pkde95caIVRGE7UK7159UQqJklSACcPwP+y8SGCq20FhEImF6F
         06VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIL/eAhzd2Q+CmLa0/Vp8uh0M9mRf6IHTk8hQZUVPkA=;
        b=BoE9ffL2+HimLfxdPZTn8UBip55LK2GN13FVDohamq5/rN5bPbeoEpk6eY3iplGvqH
         gJtk+Kye3LRb4pnayFKrc7+U50JO4M1ByndiG1s9vqzFwslRuItG9/ACMmGRRWNHtYV5
         FAf7zzvNbGMRZrWt1Vo4Pfw63l4Nx7Y5Xg0HBkFLfNyuudatMuOmALChcg3p+4vEduF/
         12HgZYzibjvBQmHlwPBBkqhHuLmW9YBeQf4PyYtHDd1pgqlMPTQzT60xj/vKDZ6mrVRe
         FUmY5csZnw739/r8i/4xECrUCpy9fpvVzAkdbbN3w4tZYc/E9gX4wb4PmJEaVR9UzzKc
         gbuA==
X-Gm-Message-State: AO0yUKW2+DMX0lEZXzzK2lrywe9KGuoMd55Xqx5DKh0GOzMbCB5ycwgk
	o3DeO8aGkaygoumxsnLaWLfwvg==
X-Google-Smtp-Source: AK7set84qDZr9RcwJ70A6u3nLP8atYZ9eptCD6oONVkchKcqZ66qh2jURUNfTUs7WD78mR7YiVblZg==
X-Received: by 2002:a17:906:dd7:b0:87e:a34b:9e2b with SMTP id p23-20020a1709060dd700b0087ea34b9e2bmr27657561eji.28.1678487355376;
        Fri, 10 Mar 2023 14:29:15 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:15 -0800 (PST)
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
Subject: [PATCH 12/16] spi: pxa2xx: Mark OF related data as maybe unused
Date: Fri, 10 Mar 2023 23:28:53 +0100
Message-Id: <20230310222857.315629-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_142915_946791_6F59C05E 
X-CRM114-Status: GOOD (  13.04  )
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

  drivers/spi/spi-pxa2xx.c:1757:34: error: ‘pxa2xx_spi_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-pxa2xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index a75ba2993f3c..19e996a5a02e 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -1754,7 +1754,7 @@ static const struct acpi_device_id pxa2xx_spi_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, pxa2xx_spi_acpi_match);
 #endif
 
-static const struct of_device_id pxa2xx_spi_of_match[] = {
+static const struct of_device_id pxa2xx_spi_of_match[] __maybe_unused = {
 	{ .compatible = "marvell,mmp2-ssp", .data = (void *)MMP2_SSP },
 	{}
 };
-- 
2.34.1


