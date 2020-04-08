Return-Path: <SRS0=Kof6=5Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3B5C2D0EA
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Apr 2020 08:24:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76EE9206A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Apr 2020 08:24:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CLcYrhlc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MKFbUuAB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76EE9206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nO5rJ1nTYJ/yQAB7LCad7ypoNy+JtzbV+vn690ZSvpM=; b=CLcYrhlcJdtKBN
	ZA6PWlqFGSyv0JPN3N/MJEsyF5VMvRdsrGdKBcsXMhWQiKpBZVXr2TAtcGlIpGeEHMCJN18ZRqLwT
	RCJtzQnwSXxR+XJ8hTH3GSFWq/TLBhDlr+ooy8F7q/4QuPlJhAuu7t7OyUn4kOV95jhKXLpv6NVcg
	zfuSKSU9IQDYxEn1Jwcq93VhDRJhwUKd+OrRBQDnw0Ft9G+7GX4eJ3n16HtYQ/qmxtXpp/0otLJmW
	Yivh9iCjd6JjSOe+mk/7x0BB96W7x2XosP9NncAPB99T4VbOXyLsEDpSvoYMbuZZHLXmWLaiJJL3+
	fY97DXplxikZvUc/tm3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jM60G-0007fF-PL; Wed, 08 Apr 2020 08:24:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM5zB-0006IA-Bz; Wed, 08 Apr 2020 08:23:02 +0000
X-UUID: 07ab98e962474f8d89f7baf20dde0712-20200408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fGKVeJMpPPedNFBW5Z89bG65lS398KakOP6xziYFSsc=; 
 b=MKFbUuABkrrKU63iLFx4+0f2juuHFD9SORXdLpZ7/aoedEn8qEYckg5arBaqfRk4Fz1/Y3oo/payEiCmcOLwEyACj584YZHgX2kfRQGFSsAbrgqK6iaEm1Zp5F7bh5vyW/GgVB3G/ceSQbvtX5ehs0rqo66bizgZUYQSJyTjy1U=;
X-UUID: 07ab98e962474f8d89f7baf20dde0712-20200408
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 317860744; Wed, 08 Apr 2020 00:22:45 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Apr 2020 01:12:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Apr 2020 16:12:49 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Apr 2020 16:12:49 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: [PATCH v12 2/6] mfd: mt6397: Trim probe function to support different
 chips more cleanly
Date: Wed, 8 Apr 2020 16:12:07 +0800
Message-ID: <1586333531-21641-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1586333531-21641-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1586333531-21641-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FEDB43AB2ACB42064A2DB5C5D7CC07444166C3514C64B30D112F886F1894AF732000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200408_012301_420552_2C89DAFE 
X-CRM114-Status: GOOD (  10.84  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Josef Friedl <josef.friedl@speed.at>,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Frank Wunderlich <frank-w@public-files.de>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-rtc@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, Richard
 Fontana <rfontana@redhat.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, linux-pm@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add new struct members for mfd-cells and irq initial function, so we can
call devm_mfd_add_devices() only once.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 drivers/mfd/mt6397-core.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index d2e70d8..a313a72 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -103,22 +103,31 @@ static const struct mfd_cell mt6397_devs[] = {
 struct chip_data {
 	u32 cid_addr;
 	u32 cid_shift;
+	const struct mfd_cell *cells;
+	int cell_size;
+	int (*irq_init)(struct mt6397_chip *chip);
 };
 
 static const struct chip_data mt6323_core = {
 	.cid_addr = MT6323_CID,
 	.cid_shift = 0,
+	.cells = mt6323_devs,
+	.cell_size = ARRAY_SIZE(mt6323_devs),
+	.irq_init = mt6397_irq_init,
 };
 
 static const struct chip_data mt6397_core = {
 	.cid_addr = MT6397_CID,
 	.cid_shift = 0,
+	.cells = mt6397_devs,
+	.cell_size = ARRAY_SIZE(mt6397_devs),
+	.irq_init = mt6397_irq_init,
 };
 
 static int mt6397_probe(struct platform_device *pdev)
 {
 	int ret;
-	unsigned int id;
+	unsigned int id = 0;
 	struct mt6397_chip *pmic;
 	const struct chip_data *pmic_core;
 
@@ -154,29 +163,13 @@ static int mt6397_probe(struct platform_device *pdev)
 	if (pmic->irq <= 0)
 		return pmic->irq;
 
-	ret = mt6397_irq_init(pmic);
+	ret = pmic_core->irq_init(pmic);
 	if (ret)
 		return ret;
 
-	switch (pmic->chip_id) {
-	case MT6323_CHIP_ID:
-		ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
-					   mt6323_devs, ARRAY_SIZE(mt6323_devs),
-					   NULL, 0, pmic->irq_domain);
-		break;
-
-	case MT6391_CHIP_ID:
-	case MT6397_CHIP_ID:
-		ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
-					   mt6397_devs, ARRAY_SIZE(mt6397_devs),
-					   NULL, 0, pmic->irq_domain);
-		break;
-
-	default:
-		dev_err(&pdev->dev, "unsupported chip: %d\n", pmic->chip_id);
-		return -ENODEV;
-	}
-
+	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
+				   pmic_core->cells, pmic_core->cell_size,
+				   NULL, 0, pmic->irq_domain);
 	if (ret) {
 		irq_domain_remove(pmic->irq_domain);
 		dev_err(&pdev->dev, "failed to add child devices: %d\n", ret);
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
