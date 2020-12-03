Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F571C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 22:29:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C64A6223C8
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 22:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C64A6223C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o426opw0iiYn7g/fzuIqrJsvLhiUidVvNBEDvjbt7uA=; b=NVX3XBnzlWo/w+ED0vOr1kScIC
	0B5K8jfJ7OiOIU+yd09E2L76agnguX1c7Wwr8fJI9I79RmiVPLyEGEPpuKVliYVkA4A/dVy/h29XF
	TuE/vDuk3OVDDpgwrspkKYkBClRKrsAE7B00J00cw4jqPx03zcYCgA3dOcL18ktOn7P/PVoVFFgYd
	aM8P2oe4EEPYekyIdrNGUgA4D9wxXZqcHimW5LW90B9rvtunPIbEK7ZCf60rBv+kI7eJyAnEj9MQ7
	l/Li1WhqIToHindQAROyfbiwGGtUJIQr0EVBn1Oo15P1z1+QY4/swnPiSJNcZ+Q7bprBtnABo2yoh
	E2afx52A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkx6U-0004Qh-LV; Thu, 03 Dec 2020 22:29:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkx6O-0004PG-U9; Thu, 03 Dec 2020 22:29:29 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH] mmc: mediatek: mark PM functions as __maybe_unused
Date: Thu,  3 Dec 2020 23:29:16 +0100
Message-Id: <20201203222922.1067522-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_172929_115385_683D3FDB 
X-CRM114-Status: GOOD (  12.00  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marex@denx.de>, Arnd Bergmann <arnd@arndb.de>,
 Chun-Hung Wu <chun-hung.wu@mediatek.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, yong mao <yong.mao@mediatek.com>,
 Amey Narkhede <ameynarkhede03@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

The #ifdef check for the suspend/resume functions is wrong:

drivers/mmc/host/mtk-sd.c:2765:12: error: unused function 'msdc_suspend' [-Werror,-Wunused-function]
static int msdc_suspend(struct device *dev)
drivers/mmc/host/mtk-sd.c:2779:12: error: unused function 'msdc_resume' [-Werror,-Wunused-function]
static int msdc_resume(struct device *dev)

Remove the #ifdef and mark all four as __maybe_unused to aovid the
problem.

Fixes: c0a2074ac575 ("mmc: mediatek: Fix system suspend/resume support for CQHCI")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mmc/host/mtk-sd.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index d057fb11112a..de09c6347524 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2683,7 +2683,6 @@ static int msdc_drv_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static void msdc_save_reg(struct msdc_host *host)
 {
 	u32 tune_reg = host->dev_comp->pad_tune_reg;
@@ -2742,7 +2741,7 @@ static void msdc_restore_reg(struct msdc_host *host)
 		__msdc_enable_sdio_irq(host, 1);
 }
 
-static int msdc_runtime_suspend(struct device *dev)
+static int __maybe_unused msdc_runtime_suspend(struct device *dev)
 {
 	struct mmc_host *mmc = dev_get_drvdata(dev);
 	struct msdc_host *host = mmc_priv(mmc);
@@ -2752,7 +2751,7 @@ static int msdc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int msdc_runtime_resume(struct device *dev)
+static int __maybe_unused msdc_runtime_resume(struct device *dev)
 {
 	struct mmc_host *mmc = dev_get_drvdata(dev);
 	struct msdc_host *host = mmc_priv(mmc);
@@ -2762,7 +2761,7 @@ static int msdc_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int msdc_suspend(struct device *dev)
+static int __maybe_unused msdc_suspend(struct device *dev)
 {
 	struct mmc_host *mmc = dev_get_drvdata(dev);
 	int ret;
@@ -2776,11 +2775,10 @@ static int msdc_suspend(struct device *dev)
 	return pm_runtime_force_suspend(dev);
 }
 
-static int msdc_resume(struct device *dev)
+static int __maybe_unused msdc_resume(struct device *dev)
 {
 	return pm_runtime_force_resume(dev);
 }
-#endif
 
 static const struct dev_pm_ops msdc_dev_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(msdc_suspend, msdc_resume)
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
