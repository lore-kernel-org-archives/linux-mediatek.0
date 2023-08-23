Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDFFC3DA66
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 17:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oaEUPFycSXhS+/NTw0FEdqgg7gEl4iJN4TXsTXPJu68=; b=BjEGukNl4kSAWvvixS9S0LGQ/d
	zavVxGHWpp87l1qDS0VfV4wjHivZZ+pKGaox88nZT/wW8e3ZQSX0lW8+/HqvhUgCRrtH+6wnJrEnx
	6iF4CYs/5Anm4tJVzyult4aWqkgSlePOMO/RN6yLyx6UAgVZGfuB4H2nmsXPCrYY3jKamgPBl6g2M
	lfzvfUQ3RtsdDGZPzOGoLMAbalTQObB9YtVpGSRHB9Lm+ADGsJp5pmlfzafw8W1C+FidXZ5VcYDL1
	li9Nnqnhzrme8N96ncOxDbDKvMu9KL3mGByqgAgVAhscVwqbefeW5D1JqvaTm3jOBUIoM3f2fruMn
	fPXTBGfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYrI2-001AXa-2U;
	Wed, 23 Aug 2023 17:05:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYrHw-001AWH-1U;
	Wed, 23 Aug 2023 17:05:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4F896356A;
	Wed, 23 Aug 2023 17:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8682DC433C7;
	Wed, 23 Aug 2023 17:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692810298;
	bh=GXvD77XTaP2qkGbTvhgKUp5FtOuSXwU1zkqXZiEQM1s=;
	h=From:To:Cc:Subject:Date:From;
	b=WE09yDkO6iIhcAp2WHThhSYB7H8IMd2eQfdEw2iUhuhdQpqr+S/kXh5PPm3ZdY/5Y
	 WzCxFD2LInrIallH95GeSk+cFXoMCumMaADMYe1ZhgeKfzNSZvHXm0lT8LkamMC2pF
	 HEkIO1R0EzdQeO4zFh6vFPbvILJCqDnY3JtjRcCmwBsorE8ot1RJl8Yn4Cys43DloO
	 pManHR3Tz2dpEX/TZq5ArSESreRJkTk6VLXK3q52ytqLWX6UYXrlBwUuZtDzt80Rse
	 6Rx4+s1kqLwidpB/kgjrAwTLa7oSSfzKklCIaR2LTmMB7lw8tNPmNGCOLbyuqkMLvD
	 ZB1aSsWoYOwGQ==
Received: (nullmailer pid 2491505 invoked by uid 1000);
	Wed, 23 Aug 2023 17:04:56 -0000
From: Rob Herring <robh@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v2] genpd: Explicitly include correct DT includes
Date: Wed, 23 Aug 2023 12:04:37 -0500
Message-Id: <20230823170438.2489746-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_100500_589503_52BEB451 
X-CRM114-Status: GOOD (  13.42  )
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

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it was merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
v2: Previously sent for drivers/soc/. Gathered up files which got moved
    to genpd to new patch.
---
 drivers/genpd/mediatek/mtk-pm-domains.c | 2 +-
 drivers/genpd/mediatek/mtk-scpsys.c     | 2 +-
 drivers/genpd/sunxi/sun20i-ppu.c        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/genpd/mediatek/mtk-pm-domains.c b/drivers/genpd/mediatek/mtk-pm-domains.c
index 354249cc1b12..ee962804b830 100644
--- a/drivers/genpd/mediatek/mtk-pm-domains.c
+++ b/drivers/genpd/mediatek/mtk-pm-domains.c
@@ -8,8 +8,8 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/mfd/syscon.h>
+#include <linux/of.h>
 #include <linux/of_clk.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/regmap.h>
diff --git a/drivers/genpd/mediatek/mtk-scpsys.c b/drivers/genpd/mediatek/mtk-scpsys.c
index 7a668888111c..b374d01fdac7 100644
--- a/drivers/genpd/mediatek/mtk-scpsys.c
+++ b/drivers/genpd/mediatek/mtk-scpsys.c
@@ -7,7 +7,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/mfd/syscon.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
diff --git a/drivers/genpd/sunxi/sun20i-ppu.c b/drivers/genpd/sunxi/sun20i-ppu.c
index 98cb41d36560..8700f9dd5f75 100644
--- a/drivers/genpd/sunxi/sun20i-ppu.c
+++ b/drivers/genpd/sunxi/sun20i-ppu.c
@@ -5,7 +5,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/reset.h>
-- 
2.40.1


