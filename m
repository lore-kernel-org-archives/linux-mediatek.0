Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A692EC2BB3F
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 17:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nXTjoyVMIW/yRQ2Q8optVuxtgEkz3DRech+NYfXUR9A=; b=NFDj++4VC4U605QuAkejb9i34i
	rvzQyinJkjhjfzcDJ7ytMcjXh9WYdSHtrGQ19ecvlpjjcRj8sQKN6FoiIDSZrT1dBOmNLGp6tq6at
	CMSaRrtuU2jOWpEMX6ff2eIX7EIiKK1ey55JyD93zonbdgV6CKUwI4KcqcDdnHMmczUP8ppJlnSpt
	ZCQKXUYdyrluGcY3hqhAkf7qapllsgNEe27vhLIhf6EiiixUmQItrpC1ySRnYuSbOIb71Bb/2Wy99
	S+6aZ0FEJ6jnv+k/YdDnsC5Z0w64SoWnJcTH6ZBa+WB0gVLd3SeRijLMRx6q/EQxFlQ+M2xISb2Lt
	/rZZXD3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3JNZ-001Or3-0z;
	Wed, 15 Nov 2023 17:08:41 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3JNV-001Oq8-05;
	Wed, 15 Nov 2023 17:08:38 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-32f9268bf8cso4429054f8f.0;
        Wed, 15 Nov 2023 09:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700068114; x=1700672914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nXTjoyVMIW/yRQ2Q8optVuxtgEkz3DRech+NYfXUR9A=;
        b=N9/n/unRptdXGiXzG7X1SkMnsRNIKyIK2Fv8Uge2obc+W1O/igGpL6Dc8MJmJEQKsZ
         orRpPGv8zQtXFt66xraM1zjYqS0ws6WeRj5mDboL5crcpu32vQU0IGBkuYJWwabSUI1B
         MB+DTgSERdS6tiyXfeN3g3rWpKe3kwqSi5dkWjOjMgODnBDfqmchiPOl7aaON8TYUhSH
         zd6LdZuDkp62MsejEgcxEinLkeblkhkuU/82tuwudO3u2nWdbrIDWsyj34IQZTPDHSIb
         k/DXtf6sMVTesA8B9RasPIz2jP7W/zBSFMr9IkKJfD8Pv1mAjWFp8HCEhmW4CXbdFeyX
         FDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700068114; x=1700672914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXTjoyVMIW/yRQ2Q8optVuxtgEkz3DRech+NYfXUR9A=;
        b=eDr66KCK+0faA9IvfAsL8ocGsDnC8S5caRWBYU84U5mc8c8PJYDLjpeqbToCnwLghA
         j2ggrp58tP9lTWXY3+MdQGRIjEx1gPzEKabIV46AfXfUv+COTNu5e8PRSQGzO0/fJdoT
         rDAa2QPZc3eet294Gkcozy5VkcdovspjKQtNdVGaXwabxMVMUXk6TWCQmyCp8g6xx6XU
         /xJJvjn4pqkd7tT7ilulecsc+BMj6GCQMRCUaWrZDN8ccAICMuIJvIOwswg4MBSf3T6n
         QVulbehODnD31RPG4/0i3AXc/HWO6B8cNMaXW0UPvD413uZk+7XtRqivYD/6vPjvLOJD
         oeFA==
X-Gm-Message-State: AOJu0Yxde5h4kttD40jLS0pOJI5dnAbOLmNLPBq9MXtaemIAVRPkfNxb
	y2ovOUU/OrZ9kS7Dq0/Bp5c=
X-Google-Smtp-Source: AGHT+IFljFo2x86LrUGVvlArWoH2Dzg1FID8H1eKmivUz22BVETYCNx6O9wJom4ahLITEq9gblxjmg==
X-Received: by 2002:a5d:64ee:0:b0:32f:7fe4:45f2 with SMTP id g14-20020a5d64ee000000b0032f7fe445f2mr13012008wri.4.1700068113882;
        Wed, 15 Nov 2023 09:08:33 -0800 (PST)
Received: from ALPER-PC.. ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id o1-20020adfeac1000000b0032dab20e773sm11077833wrn.69.2023.11.15.09.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 09:08:32 -0800 (PST)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>
Subject: [PATCH v2 1/2] clk: mediatek: mt8173-infracfg: Handle unallocated infracfg when module
Date: Wed, 15 Nov 2023 20:06:24 +0300
Message-ID: <20231115170825.908640-1-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_090837_084950_E911337F 
X-CRM114-Status: GOOD (  17.50  )
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

base-commit: bc962b35b139dd52319e6fc0f4bab00593bf38c9
-- 
2.42.0


