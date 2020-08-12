Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00637C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 09:38:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C564F20885
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 09:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0H9vPBxz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MBy7+yIr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C564F20885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6GsmrOhAM3xwRRhavLFXWrju6ChyVGkUAAxN/dvPv1c=; b=0H9vPBxz+4yHYpepNxNOGLtaB
	Gm77xllkeI6132C3K23vMU7RBbdRSsDWrITcwaqw0Gv489jGLq+re1dFC7GgE8tWUOFpA8uK+7G/W
	y0tgNOPJ5OGL2HiTJbUjlleCtDu2tEy4o1pbnvlIKC40m33h5UbIxPDmFwpOF0E82UsneTBGkq9Am
	MkX6LwKl3DGX5M1ugN5nKoc3nTGLJvBKm42tPJMk5KuB0nHARH1A/hJMm8dXq0tvBih1GpjUGQvfn
	M0oACqZogbNk6LLuGc+irW5BXr8b/DhOQXquKQrFZIrLTUOu+Vi0EgNezc5dRoM0z2ihpFsAoBTNt
	31i103vgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5nDW-0006eG-DK; Wed, 12 Aug 2020 09:38:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5nDQ-0006Zy-1Y; Wed, 12 Aug 2020 09:38:37 +0000
X-UUID: 6737caff4334471087325004fb16639d-20200812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=n8qTjuU/K0cDmRH8kbn9OnRMWaTi0JfPivM4HICkFOk=; 
 b=MBy7+yIrK00Juy+njlK/GuqyFo2Wz4/pImlPVYvMJWBqW7dMfSrJl77l0G7NZkw9z7nZ53LguO9CYEgiGylQK1p7gIkKu0YJFCYJbg55t/7ufx8eSh+C6ahv2sXpeHOixTRv/xWeuNN7Yc1JDh3vjdPvnUGprrSHQsV0BkxR35g=;
X-UUID: 6737caff4334471087325004fb16639d-20200812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1110206316; Wed, 12 Aug 2020 01:38:31 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 02:38:28 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 17:38:26 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 Aug 2020 17:38:26 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/3] mmc: mediatek: add optional module reset property
Date: Wed, 12 Aug 2020 17:37:26 +0800
Message-ID: <20200812093726.10123-4-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200812093726.10123-1-wenbin.mei@mediatek.com>
References: <20200812093726.10123-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_053836_220968_D014C7E3 
X-CRM114-Status: GOOD (  16.55  )
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
Cc: devicetree@vger.kernel.org, Wenbin Mei <wenbin.mei@mediatek.com>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds a optional reset management for msdc.
Sometimes the bootloader does not bring msdc register
to default state, so need reset the msdc controller.

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 39e7fc54c438..2b243c03c9b2 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
+#include <linux/reset.h>
 
 #include <linux/mmc/card.h>
 #include <linux/mmc/core.h>
@@ -434,6 +435,7 @@ struct msdc_host {
 	struct msdc_save_para save_para; /* used when gate HCLK */
 	struct msdc_tune_para def_tune_para; /* default tune setting */
 	struct msdc_tune_para saved_tune_para; /* tune result of CMD21/CMD19 */
+	struct reset_control *reset;
 };
 
 static const struct mtk_mmc_compatible mt8135_compat = {
@@ -1516,6 +1518,12 @@ static void msdc_init_hw(struct msdc_host *host)
 	u32 val;
 	u32 tune_reg = host->dev_comp->pad_tune_reg;
 
+	if (!IS_ERR(host->reset)) {
+		reset_control_assert(host->reset);
+		usleep_range(10, 50);
+		reset_control_deassert(host->reset);
+	}
+
 	/* Configure to MMC/SD mode, clock free running */
 	sdr_set_bits(host->base + MSDC_CFG, MSDC_CFG_MODE | MSDC_CFG_CKPDN);
 
@@ -2273,6 +2281,11 @@ static int msdc_drv_probe(struct platform_device *pdev)
 	if (IS_ERR(host->src_clk_cg))
 		host->src_clk_cg = NULL;
 
+	host->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
+								"hrst");
+	if (PTR_ERR(host->reset) == -EPROBE_DEFER)
+		return PTR_ERR(host->reset);
+
 	host->irq = platform_get_irq(pdev, 0);
 	if (host->irq < 0) {
 		ret = -EINVAL;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
