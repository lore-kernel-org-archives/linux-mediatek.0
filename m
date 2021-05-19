Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0861C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 16:26:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 393F361244
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 16:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 393F361244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ecjxh9Tf3oBqZekdAILFvuDdoRzSR+QMyGaAkaAAkkc=; b=loj8aiWtiKBVBv3mVVP5qhZWKM
	96L43zkoOjYKWeotWYZfrctJ5Ajh7yPqTl1AtcxDJzxggkbCpg8/G+I+Vy1t5JMp6m3MZYPOAMBkr
	TkElq26PLLtKKGtJnMB630CgpitM8PRV7iYU9uDq+hivhv2+dCbY/UrqI+4jImv5eaNn+Qwa/ALXt
	yYGvMLm5K/oILcCFjiZ63CQK7FFfnEo1aQGvhn6exmZ6QKcRI75jiOpSHzf4BTMxXOfNGRYYq3XTZ
	Skw0ZEssCnV5+6bEfjjhowugB4tEfGLojitOA9A3XwTrfERjdX0hXTY1uymLintg863NWytSaBgiL
	F/67m1eg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljP1Q-004Waq-Tn; Wed, 19 May 2021 16:26:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljP1B-004WVh-Bq
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 16:25:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=h9ACoFyscr2mGx2hv7BWBvdkBNtd8ng9Fu2si46cdq4=; b=KBIN73J9cPcOcPLvk2+do3U0rx
 5Wkrq3y4Mw41yQGYbdvSjAhLJvzxxSoULAp/cJc1ljFRt45kKNfkyh8insSxeDp+tZvc32P/gz9tT
 NxLltGkr0dcXkSYbTKwfK4efipzSszt8jhya6Gcy3XcDK26WpvWLFb8zh1nZq8+xFz6EZ+VXpn8bC
 wK3W7/irTTZE6eV6Q9RXvATwYPTro/1VUFFmUZEpQ/yP+4ru8ZE2vPdKFc6eBlBF2dlkikEoy3Is4
 hWpbr6AiOuY3GBY27ShWdSsGZbj1pbs9Q7L97kwm9EnV6F0T3XXww6g4RDY9OX+uzBlOCkT5nLYlu
 5EmD86rQ==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljP18-00Fcym-RJ
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 16:25:56 +0000
Received: by mail-wr1-x431.google.com with SMTP id r12so14682668wrp.1
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 09:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h9ACoFyscr2mGx2hv7BWBvdkBNtd8ng9Fu2si46cdq4=;
 b=byisdwD/i5u3WtSKYw+sYWGk0u8xFD4aI4NdDxMw+ffgIcjDqEhv7ahv61jA6USQgk
 jm9vALBRIHhaWHsrnl4alI9tjghWi/KDqej7GJsI+Kh4+CiH0JVQT0LCLcEZJlSVxSxX
 jj3JoW++94xEI/00y2L7l5sdQNlHQsyE9iBR37drGXa3B+/DmIvmUTXJqrKzGH3GoeOw
 XAMQ1MECR83nnQKSRbgV7bTxboQM9oo/dUiqmRqnU1zBiQl1kBpBniegFK6NnaUyMYJs
 dGv3epgWNZMUAMRxznt6TtyULLsjNPeZZZZRIBCFCcBlAEE6+cO/T9jXmsp2Z9ceZfa7
 EZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h9ACoFyscr2mGx2hv7BWBvdkBNtd8ng9Fu2si46cdq4=;
 b=izipDe94wf3sw4z5T/6jawwYVP31uqw+8E79IsU4iwRzRcFCxir4oOkotHwXAlHzHF
 QPHOYRlSs6O6+fk+HUK//TJnazBCIFVo6ypOVq2xkDbPpBnVgUhvEem52WGHWz1x56jf
 sX0fgohB6qz2NwGul7kP7NgdHbnhoyh1gKVLs9xzfyYnbsK2n4TfXN2xHBHnHloxOIie
 vbqSB+GC8PQGIJO46anQXdDPp9AfsxNz7DlVpcBD4t4nDgR6gg3g/Z/VUhohfBRuSv5D
 t+dSQaEOg/JBZrJC7F7gLDXHQVXyd26rV3BUaCADHEpuEaOgq4OWzhz0YEyu6rHl76ti
 kc8A==
X-Gm-Message-State: AOAM53185PPzsfZ5YE80vpL0+TfVpbN94ZvFH64Ak6nG/Kgg7M/xPqng
 tovsVRae3RHFVAd1vvcFqRkLnw==
X-Google-Smtp-Source: ABdhPJwr3K6AGuoWpHTQgaEA3SUgfH1bxgCXJJ3IVhKq00yPr1NJM+0gcq90Ro1URVdiivdA8wZX8A==
X-Received: by 2002:adf:e411:: with SMTP id g17mr15445759wrm.402.1621441553089; 
 Wed, 19 May 2021 09:25:53 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id k205sm5827724wmf.13.2021.05.19.09.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 09:25:52 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] cpufreq: mediatek: add support for mt8365
Date: Wed, 19 May 2021 18:25:50 +0200
Message-Id: <20210519162550.3757832-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_092554_895303_C5C1242E 
X-CRM114-Status: GOOD (  11.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add compatible stirng for MediaTek MT8365 SoC. Add also the
compatible in the blacklist of the cpufreq-dt-platdev driver.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 drivers/cpufreq/mediatek-cpufreq.c   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 5e07065ec22f..d6fd821e3f5a 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -126,6 +126,7 @@ static const struct of_device_id blacklist[] __initconst = {
 	{ .compatible = "mediatek,mt8173", },
 	{ .compatible = "mediatek,mt8176", },
 	{ .compatible = "mediatek,mt8183", },
+	{ .compatible = "mediatek,mt8365", },
 	{ .compatible = "mediatek,mt8516", },
 
 	{ .compatible = "nvidia,tegra20", },
diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index f2e491b25b07..87019d5a9547 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -537,6 +537,7 @@ static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
 	{ .compatible = "mediatek,mt8173", },
 	{ .compatible = "mediatek,mt8176", },
 	{ .compatible = "mediatek,mt8183", },
+	{ .compatible = "mediatek,mt8365", },
 	{ .compatible = "mediatek,mt8516", },
 
 	{ }
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
