Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1CEC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 18:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VSJWA8kLHUqq2NvqJf/DRTcJgn4mtn9gVMvlNmqiOhQ=; b=Gtg2W1PEpuH+dR2VZQdS+kbIMA
	EeFS9GmVVQoyXYBwGYTowzcPoLixH19phEsPJYgxKO/IQ2/rePJINQZciUOTo6DRuzf80dfWMgcdD
	eJCe3wyFUa1mktu3gUR4SdTV2SIniz08cnw46aJXbUBQXjQbWO3AEnZANrZsGpqcqUNyuwrcW7X9r
	r1bMNTBwJE1dDVqLpgYPt/bKG1BGZEEdHGlmE3BxsTYaqO7fjayt+D6Ma7aN3LK8f0ck+CPLx+zNC
	C2MVXejPWE35l+JTv+BcyhfHkJqvPX2b2Jh6h6xXgbWaaXbKDZO4SLCtUugD20KZyIQ+lXpSYBz+K
	kJG8Vzqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o44hk-00BqVq-RT; Wed, 22 Jun 2022 18:03:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o44bC-00BnFU-Oq; Wed, 22 Jun 2022 17:57:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8D81BB82081;
	Wed, 22 Jun 2022 17:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EBCC34114;
	Wed, 22 Jun 2022 17:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655920623;
	bh=VRukoejy6moeTDDBjSf9TvBXSWfTEbTgKnfDO7aPvnM=;
	h=From:To:Cc:Subject:Date:From;
	b=PVYuKFKTgIwilzfutOM8aihiifo2iNBWw7BxLK/BlkUoeEdvl7uUdk5C69+7IBQ9j
	 4TtvUEhyWHesAIw8PpyAePXk0nuHtLWqRlTr0d3oQf9BTrq55d28UQKS0rXogUxdkF
	 I0sZeR2q4PdTOU9nfs6Uaze3mc3KRupaYUCnqtGgn4zi+WL+9q8EoL/Q0xKe/Tuzwo
	 h/K+NIKkiMANvODoXAOtsuCH6YpiC5W8JSnJVIvUlzFhjNXDTctn3HIbx3hmXYfXYi
	 jP7+E+Dlb6pzC5+FQlo3sTItTraX0KFBCx4zxWo3WFpWEVMGHCOqvqYLpZEgwjlHSd
	 uHqjNjO4DEDJg==
From: Nathan Chancellor <nathan@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Roger Lu <roger.lu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	patches@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] soc: mediatek: SVS: Use DEFINE_SIMPLE_DEV_PM_OPS for svs_pm_ops
Date: Wed, 22 Jun 2022 10:56:49 -0700
Message-Id: <20220622175649.1856337-1-nathan@kernel.org>
X-Mailer: git-send-email 2.37.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_105706_986788_8BDA0D6D 
X-CRM114-Status: GOOD (  14.33  )
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

When building this driver for an architecture that does not support
CONFIG_PM_SLEEP, such as hexagon, the following warnings occur:

  drivers/soc/mediatek/mtk-svs.c:1481:12: error: unused function 'svs_suspend' [-Werror,-Wunused-function]
  static int svs_suspend(struct device *dev)
             ^
  drivers/soc/mediatek/mtk-svs.c:1515:12: error: unused function 'svs_resume' [-Werror,-Wunused-function]
  static int svs_resume(struct device *dev)
             ^
  2 errors generated.

This happens because SIMPLE_DEV_PM_OPS uses SET_SYSTEM_SLEEP_PM_OPS,
which evaluates to nothing when CONFIG_PM_SLEEP is not set, leaving the
functions unused in the eyes of the compiler.

This problem was rectified in commit 1a3c7bb08826 ("PM: core: Add new
*_PM_OPS macros, deprecate old ones") with new macros. Use
DEFINE_SIMPLE_DEV_PM_OPS to fix the warning while not changing
svs_pm_ops when CONFIG_PM_SLEEP is set.

Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/soc/mediatek/mtk-svs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 606a00a2e57d..d70903f45ddf 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2381,7 +2381,7 @@ static int svs_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(svs_pm_ops, svs_suspend, svs_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(svs_pm_ops, svs_suspend, svs_resume);
 
 static struct platform_driver svs_driver = {
 	.probe	= svs_probe,

base-commit: 71eaf1887203d0a59c92fd9dd3436b8d8489d68c
-- 
2.37.0.rc1


