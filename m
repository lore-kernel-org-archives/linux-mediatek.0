Return-Path: <SRS0=+xT1=ZE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9A2C43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 08:39:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5CFC21783
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 08:39:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nZeo8Gip";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fIcrJIcR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5CFC21783
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RShCA04NAAY28e8gCVLUjiYR62pI9y3VJS+UllsJoq0=; b=nZeo8GipTmE5YM
	btehFtaDH1j4vvbMdCYnvTHJLFR92Z6My3HXFdCLkMlCTfU6FboGeHanleGpZdxUejwOCicW5ejxd
	tZEhvfHL6ta8VTjRnsSpyzuwlIhT/q+egd+OK9qU+uwCgXJm0Sh47X7Zv79mPdc2ym3c+5lG8stbs
	j74o57sgHKujUHN7HcWKFOdRA0zHCIcjOHg+YeLW4eulLlcKP2KD6AX2eNnsG/A6lCdny7au/jk8R
	0w2bdsirDHLeNGzPRNhFcRsQXsEBT1p5K4fEGtrJSe7o4m9R/i8fDDhwRukAukWTXUZRqGKCBxlGJ
	UHu1VKUqIyV/yqiwbeOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iURiC-0005yV-C4; Tue, 12 Nov 2019 08:39:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iURfj-0003Qp-Mf; Tue, 12 Nov 2019 08:37:14 +0000
X-UUID: a7d915d504a74a0bafb11f6b33db8483-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qy9ivUWj/ElKl+3goTjgwfuF3GW/F0SKTM6aPsZ/8T8=; 
 b=fIcrJIcR7vSx051jQEd8ddAx+woWi4HI11eyAzk4W9RoSB8cYZVOvHcwBdY133lFzOirgO3sd8/KrJCmbYiF5ZGVn1xBi9Ghi3tjnjAk9M85xYxkxq9+cxmimPz8L0nfmqfZ7ZAGaFYaMFrQ+I3hFEE7Cp6zAbAvlnHp8iaY5OQ=;
X-UUID: a7d915d504a74a0bafb11f6b33db8483-20191112
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 472632620; Tue, 12 Nov 2019 00:37:23 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 00:37:04 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 16:37:01 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 12 Nov 2019 16:37:00 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 09/11] phy: phy-mtk-tphy: remove unused u3phya_ref clock
Date: Tue, 12 Nov 2019 16:36:34 +0800
Message-ID: <1573547796-29566-9-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1573547796-29566-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1573547796-29566-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D22098D56DE57EC675AFDE6068FBF972EE78801099749E93CC00EBC1C200C10D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_003711_794915_9F8AFE6F 
X-CRM114-Status: GOOD (  12.79  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The u3phya_ref clock is already moved into sub-node, and
renamed as ref clock, no used anymore now, so remove it,
this can avoid confusion when support new platforms

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v4: no changes
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 96c62e3a3300..c6424fd2a06d 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -312,8 +312,6 @@ struct mtk_phy_instance {
 struct mtk_tphy {
 	struct device *dev;
 	void __iomem *sif_base;	/* only shared sif */
-	/* deprecated, use @ref_clk instead in phy instance */
-	struct clk *u3phya_ref;	/* reference clock of usb3 anolog phy */
 	const struct mtk_phy_pdata *pdata;
 	struct mtk_phy_instance **phys;
 	int nphys;
@@ -921,12 +919,6 @@ static int mtk_phy_init(struct phy *phy)
 	struct mtk_tphy *tphy = dev_get_drvdata(phy->dev.parent);
 	int ret;
 
-	ret = clk_prepare_enable(tphy->u3phya_ref);
-	if (ret) {
-		dev_err(tphy->dev, "failed to enable u3phya_ref\n");
-		return ret;
-	}
-
 	ret = clk_prepare_enable(instance->ref_clk);
 	if (ret) {
 		dev_err(tphy->dev, "failed to enable ref_clk\n");
@@ -992,7 +984,6 @@ static int mtk_phy_exit(struct phy *phy)
 		u2_phy_instance_exit(tphy, instance);
 
 	clk_disable_unprepare(instance->ref_clk);
-	clk_disable_unprepare(tphy->u3phya_ref);
 	return 0;
 }
 
@@ -1127,11 +1118,6 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* it's deprecated, make it optional for backward compatibility */
-	tphy->u3phya_ref = devm_clk_get_optional(dev, "u3phya_ref");
-	if (IS_ERR(tphy->u3phya_ref))
-		return PTR_ERR(tphy->u3phya_ref);
-
 	tphy->src_ref_clk = U3P_REF_CLK;
 	tphy->src_coef = U3P_SLEW_RATE_COEF;
 	/* update parameters of slew rate calibrate if exist */
@@ -1178,10 +1164,6 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 		phy_set_drvdata(phy, instance);
 		port++;
 
-		/* if deprecated clock is provided, ignore instance's one */
-		if (tphy->u3phya_ref)
-			continue;
-
 		instance->ref_clk = devm_clk_get_optional(&phy->dev, "ref");
 		if (IS_ERR(instance->ref_clk)) {
 			dev_err(dev, "failed to get ref_clk(id-%d)\n", port);
-- 
2.23.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
