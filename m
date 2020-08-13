Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457DEC433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 09:07:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F30652074D
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 09:07:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NhT2z+dD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="abcXzxmU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F30652074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YkigcomdICE05ZRVIXMkwpKUptW6FJ6ZXjGrNNTgIeY=; b=NhT2z+dDGVaNLx2UP9hjivQ9p
	XffkLYLFX/F/Ox0F8hyvulcBnTtCdfOtxNxmHk1OzD5wLunIxNsugSdrptTStz2bPynbqhLGfXd24
	ItVSkDK7q7u/xlJchXHbtpr60u/OKkuRd8B+1M+PEoUL+BEFn8QBYvv8bOC00/AEpy7P4fnGx/tYU
	wCNtkBJ1sSHb218O7Iy0IjkeOSly3zdEZSnfeMPNh+v0lZnFGDIcjZSwvYjkUZoAT/KrS4jmT2d3z
	tCRKyqYVxbMGWou1uWqcpZx9nKx3qYZRPyUGi/G+bUguvOgTSG+R6GxvkAs02El5blwLDnwhvwkxF
	F8sA7fsFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k69Cu-00076x-FK; Thu, 13 Aug 2020 09:07:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k69Cp-00074y-CY; Thu, 13 Aug 2020 09:07:28 +0000
X-UUID: 4c93e4224b734953803b6315a507a5f5-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=9httdLSXqot72Vjp5bmV2MlVnnvkCGEnLIRNKAXrnXo=; 
 b=abcXzxmU9r8/9YyvInQGYa08sP7Kc+QsxcCc9XSZRug9MylwB5JoqvwLqfIso+odrDMoNs8FXg2vpBSUrqA/qGFEAKL7UkdFUqAobrslitVTB9x8H433Dk8evHYoPDrxp2NJzThSVEzxbgRpFBCEpapvUSdwZNNNCSqAiL6vxPc=;
X-UUID: 4c93e4224b734953803b6315a507a5f5-20200813
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1189394669; Thu, 13 Aug 2020 01:07:24 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 02:07:23 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 17:07:19 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Aug 2020 17:07:19 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [v4,3/3] mmc: mediatek: add optional module reset property
Date: Thu, 13 Aug 2020 17:06:18 +0800
Message-ID: <20200813090618.28009-4-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200813090618.28009-1-wenbin.mei@mediatek.com>
References: <20200813090618.28009-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_050727_603345_6CB00B07 
X-CRM114-Status: GOOD (  17.31  )
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
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch fixs eMMC-Access on mt7622/Bpi-64.
Before we got these Errors on mounting eMMC ion R64:
[   48.664925] blk_update_request: I/O error, dev mmcblk0, sector 204800 op 0x1:(WRITE)
flags 0x800 phys_seg 1 prio class 0
[   48.676019] Buffer I/O error on dev mmcblk0p1, logical block 0, lost sync page write

This patch adds a optional reset management for msdc.
Sometimes the bootloader does not bring msdc register
to default state, so need reset the msdc controller.

Cc: <stable@vger.kernel.org> # v5.4+
Fixes: 966580ad236e ("mmc: mediatek: add support for MT7622 SoC")
Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/mmc/host/mtk-sd.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 39e7fc54c438..fc97d5bf3a20 100644
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
 
+	if (host->reset) {
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
+	if (IS_ERR(host->reset))
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
