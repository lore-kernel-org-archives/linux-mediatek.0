Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B11C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 08:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BNONLWFVXwk/7cpwqGoEsjCpkeKP9bkYNCBxgTvGBnc=; b=SLCTl9nyzgseixh79pVnyIoqjT
	betINjSSSK+F+3NN5FAdQS9W6M3agCN06MauZiWVjjt0qZavrFCnPFq8elgelhYZg5SfllUdwxluv
	n64s5vlS0GMm6HW6nBJIbP5SUpAq6RUkwHhWuq8HY9nmHypWXQ80qgNiu1+yMSPbavz3KbQTgGHaa
	9WDbfK0XV/OxK8f4EGlqixji95ZPGgi7jZhGWlkZdnMyIJs83XIbtNazrWPGj8RoPT+9YEaFfyIyG
	gufzUm1kVMOj411UDar4Lm62bGVd2Kf3oj3OOW7KwenRNDxEzhiZJF5O7z0F0vNaUbcYINvBRCKGA
	l3ZtCoKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7AMm-00000000zX1-2rsc;
	Wed, 15 May 2024 08:52:04 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7AMi-00000000zUq-2QYi;
	Wed, 15 May 2024 08:52:02 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-51f2ebbd8a7so7439009e87.2;
        Wed, 15 May 2024 01:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715763111; x=1716367911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BNONLWFVXwk/7cpwqGoEsjCpkeKP9bkYNCBxgTvGBnc=;
        b=UQ2PLVXbj30Q3NECCxRqB8iq6tFACPpKlBekr4xEGKeRmx8QxtF8GAwHT56AHFuTl5
         ruLduqG+AJMHwKifeqnLExpVSX/vyj8XRrpCzuOy9XvlQkxPgYy/hhiXc1En/w4oDnr5
         nShoznTQsbySQdPnWBispm7QtOFWLDdzHeHGxrWWreWCqe2b4Oc+Q7j88hqQRMoMKglb
         KIkCvh48w9EFopPHAmkehB9Pom/PVwxxFe51D0WhLG4uKS3zxyCgOqRINsfj2hXlfrI5
         vgat6J1pR5GsHNhVsIp+N1Xi+oh1K7ZPCbWrDHZzY3ctMtrkw0q6Fvq7duYhtwGcRrpo
         HgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715763111; x=1716367911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNONLWFVXwk/7cpwqGoEsjCpkeKP9bkYNCBxgTvGBnc=;
        b=XvGp1JbKtgZ+taMQBRP2vfpsY3fkJ1D34zmooHCyiiBfG2fWD/9vSeelpAJqbzuHUZ
         JeUaWY2c41KSQHxWJjFbiQkOgyHKSgqCu9+2IUpAtuQp30P67z0Z+ai8R+AAg19lkdHA
         hSZ2SVOSm9lvNg6ijycE90gBJBCNHgOUbb25Fs03gRkiZ1Zx2jVsvprtsBLL7ORCUUtI
         H3LHvQmQKza0xjX/+U72cZ/RI5NWtGDEeEAkD7cPrGbBv7qBPo1nRhN8gvFv7py485wR
         xK2h9HrrHzd0m3scq0WEwrEZOnvBu9cPAp4f267Nr+7WnXtPRxF/G0V8PcWfqcmCuMot
         xD9w==
X-Forwarded-Encrypted: i=1; AJvYcCX/cFb0uSUYHjogR6jYncmjGRE+/pU9xQH48BA/0RXzelhagSoYp42/juvyFJIxCv48JY0sw1FVj0LIfAhgbNOVD3i2+QL7ewS+kkq4C6TiK2YWYc7HB3S2eQ4R2SitemS8Qb8mX0W5/glJXZOhKIgQBvH78FdSA00=
X-Gm-Message-State: AOJu0YxYiBoMtnvvTwaVMCyrbgyNjtp8BLbF1iQtcADHXuDu8AiNnq0L
	cr6vMeKTXvsIde0PFYFEsy1manOHfhkFdjVxpkLATl7dWPeWdBHE
X-Google-Smtp-Source: AGHT+IGt4iTM9rt9AiTs1z+QhdX5WFWgmL1iAw4vZzAginFakZKOg0FrZcSm21nAlwWZL2DkPx/n8A==
X-Received: by 2002:a19:4355:0:b0:51f:315c:75e0 with SMTP id 2adb3069b0e04-5220ff71049mr7480506e87.44.1715763108966;
        Wed, 15 May 2024 01:51:48 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8a8454sm15825034f8f.56.2024.05.15.01.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 01:51:48 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-mediatek@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>
Subject: [RESEND PATCH v2 1/2] clk: mediatek: mt8173-infracfg: Handle unallocated infracfg when module
Date: Wed, 15 May 2024 11:51:04 +0300
Message-ID: <20240515085137.2842804-1-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_015200_649343_3B1657E5 
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

base-commit: 6ba6c795dc73c22ce2c86006f17c4aa802db2a60
-- 
2.43.0


