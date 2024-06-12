Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C947EC27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 20:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1eed+2CfpyC5UVd4nAFeDZB/9Ij+Vk+m/v76FicPbdk=; b=5FK7qOGR8fyKGsnq3U5MxkZ8XN
	qa6dtyGxwM+O9cjpRxEGu3ysIJLExxjgWIr/ux1GjhGMTrENYTEKfUxrH14JPHpoz91zhdi+wN9Ss
	aPQ/9mRbG6tuGu6kAtFrZQQdopqSJI1cpmMGIGr+ImlpOzgPgQ24CnVINkzo4cCWVHEw7yUGaj1BP
	quGaXrGoh9Fb7BjxLsQJjLdO4JDqQHqv5q+5bKKTcgM8pXUlKahRfDUZewDzxOZFAz4+STeLAQzqp
	k5u2bp6wRCz7KcsfQMM/s+TskutdHGuQKWhwLM+pYRQPHSnQkxoxf+2mz28a3LAXFEzL7eTYXa3Ju
	UxEryj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHUKb-0000000DzM1-28rY;
	Wed, 12 Jun 2024 20:12:29 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHUKY-0000000DzJk-08cz;
	Wed, 12 Jun 2024 20:12:28 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-35f06861ae6so278402f8f.2;
        Wed, 12 Jun 2024 13:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718223140; x=1718827940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1eed+2CfpyC5UVd4nAFeDZB/9Ij+Vk+m/v76FicPbdk=;
        b=DiAMVA1Mn0odjBKbZSXcfULqPJh3wERxSUFYf6Y1Q44dBZVqWzBxy32nuWCCs4JC2Z
         C0vTK92j+WrTSphdsN42L5rW+Ug2leaQoOuYq/hfKQzJXJhavW4mwE6/AxgX3NcDYe3i
         aQ2st8MfttldUBPGBIMTHGoHItWKbs1wzphVT/Lb+c0JAupT3GOHp9UYhxJKzGkPLT47
         Uu9xTFIZAcNqgEm33BWiYYHBjVey/1Jrt6Qu/MQukTYlJTMuONVERm19Dvc8wXokHcz1
         ndE4cseN6SkVqoCs/gc989x8SuX4yXpWWapt1iM3HIAebWfn9sfq9ti9rYcwHANkwpwP
         9LNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718223140; x=1718827940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1eed+2CfpyC5UVd4nAFeDZB/9Ij+Vk+m/v76FicPbdk=;
        b=VwH1xjLh65BntiY0epXXiXLInmCnVp8S4YfXFYD7Vx1Z5NbhRPgBfUMmYbOd/bZEzW
         jBAh6J7lPXKjMOloBK7nvQH1Ynn+6KF+zJ3bEQUQtGvSxcA2TRzmZW/E6wrkOgFon1pA
         +bbWE6kjMKtxz5gNBswLsLawTsuh66TzHLHUFlr31UNFiTxhX2h7r8SwnuRIw6t4YPWC
         Hx9CW9A/Bw3wWMnP1WADu9dXH/siAkJxxmolWGZ5pJC9VRVzC7Nn1Da/LHAzB6a8/hy3
         7dmCh4XnIagpdP5gqkGbBdEk0TtPCjW7YE/9ClsFF2CHArLYMijTjow2KP99cFL2i5uv
         dZ2w==
X-Forwarded-Encrypted: i=1; AJvYcCXQ5/MwbwhtrkEMgXz2pULrIAEyfrp+HaFy+l7Q0M90qFuwTl3I8BXK96r0jL6eG0KKB+tDgJFWEjfWmzEjf9TYGW7ZqaUr3+7TkhvifngwZtzdot5fj6XbvDC1x6OoMhMOdN1HfPNXQXaSIhxR+qTqMTfhesN8cu0=
X-Gm-Message-State: AOJu0YybfCB7rGufojbigVQefRaeV470Y+dfmzuSTm6raRNhi2YC2+cG
	hCmROjOUi/+4q3INEjaKj4GtUkrauiHcVQGU+9Hi2sAJrQUWGmmA
X-Google-Smtp-Source: AGHT+IFzhJSmsSeyPWsFkquVLF4ZsYUhdbk+Ko+VxAggBeLczkroAq1sV7RZSMvKVmWBaruhdXyaWg==
X-Received: by 2002:a05:600c:4590:b0:421:a1b4:c1d4 with SMTP id 5b1f17b1804b1-422863a8ce8mr28675025e9.13.1718223140088;
        Wed, 12 Jun 2024 13:12:20 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe7670sm38110205e9.6.2024.06.12.13.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 13:12:19 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>
Subject: [PATCH RESEND v2 1/2] clk: mediatek: mt8173-infracfg: Handle unallocated infracfg when module
Date: Wed, 12 Jun 2024 23:11:00 +0300
Message-ID: <20240612201211.91683-1-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_131226_095945_8F8A3640 
X-CRM114-Status: GOOD (  16.66  )
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

The MT8173 infracfg clock driver does initialization in two steps, via a
CLK_OF_DECLARE_DRIVER declaration. However its early init function
doesn't get to run when it's built as a module, presumably since it's
not loaded by the time it would have been called by of_clk_init(). This
causes its second-step probe() to return -ENOMEM when trying to register
clocks, as the necessary clock_data struct isn't initialized by the
first step.

MT2701 and MT6797 clock drivers also use this mechanism, but they try to
allocate the necessary clock_data structure if missing in the second
step. Mimic that for the MT8173 infracfg clock as well to make it work
as a module.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

Changes in v2:
- Rewrite patch subject for consistency

v1: https://lore.kernel.org/lkml/20231108213734.140707-1-alpernebiyasak@gmail.com/

 drivers/clk/mediatek/clk-mt8173-infracfg.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
index 2f2f074e231a..ecc8b0063ea5 100644
--- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
@@ -98,7 +98,17 @@ CLK_OF_DECLARE_DRIVER(mtk_infrasys, "mediatek,mt8173-infracfg",
 static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
-	int r;
+	int r, i;
+
+	if (!infra_clk_data) {
+		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
+		if (!infra_clk_data)
+			return -ENOMEM;
+	} else {
+		for (i = 0; i < CLK_INFRA_NR_CLK; i++)
+			if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
+				infra_clk_data->hws[i] = ERR_PTR(-ENOENT);
+	}
 
 	r = mtk_clk_register_gates(&pdev->dev, node, infra_gates,
 				   ARRAY_SIZE(infra_gates), infra_clk_data);

base-commit: 03d44168cbd7fc57d5de56a3730427db758fc7f6
-- 
2.45.1


