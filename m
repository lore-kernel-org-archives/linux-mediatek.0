Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DACC433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 09:13:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6795660233
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 09:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6795660233
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M2jJ3JZ3iQ5ACg6Xzp7oEW5xTzqW/uxtL22RUFFkwBg=; b=iaf76RAEYNqJdW21ARVjfxjbC
	ZmSntBW8AwQ3qVAhn7rs8wGQcMiMnxB/YT7t/Zdp3visHt2HUDlhLUnQNnF4gVWlr9SEmBfJdXpij
	Jjx1IfndGaPlShINSnn+08jW8FPSZPUf5ecxBPKVcNyg8Mv6AcIJPG9yH0uTZjfgwZMhjrHzvrviB
	3HJJQe95DanKUIVD3KbPk5P6wNYsplZ9ik7IaLy3JWAFZBhzHaPhpjfqK5LCi/4chEqntRR/5CFqV
	IPmZHuEDf/tCmp7B361AxdjKBUydry1bn1sTKRSi2oguduW9e3dCSgmtPMxzvvplDsRTlCVK9EtS5
	+KMrt4qyg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV9gC-002UvQ-Pl; Sat, 10 Apr 2021 09:13:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV9fU-002UjU-DE; Sat, 10 Apr 2021 09:12:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=QAlOd7K7/vdGwAob0/U0+7kXnpz7QGqRXuec37rdtrc=; b=YmcWJGgMBlgx0qYJaC83nrz2bc
 LEilsLrkIX6m9thELU876uhSUWVcA48icbpF/5nb/5+ZWuGBf0BIiJpSdWg2AW3MkThwcofYsAyOD
 Nl/MpEXk1I/4RPanUKTydHJtQFb2yc1Vnbfkbn/EFFSnQQaD0VZK1D4sf9hdMvD0W6iPwYO/fwNh4
 nHMjZrns3N7dt0qkc054o1Ncod7SEvvv559qX00ZJVBMxu+/+n7Y6xFlDuORGrbAPXHbc6FCpABfk
 nezZ0hFLmjM+VREXY7YcGMOyRD/Ba+2+KaBJiAcfRVXJsoZM//KN0ubaTFF1HpSiyBAR+WpcHtnUJ
 jxNwo08Q==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV9fR-0050Hu-O6; Sat, 10 Apr 2021 09:12:39 +0000
X-UUID: 65631a775d704837a0e66057e0466b32-20210410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QAlOd7K7/vdGwAob0/U0+7kXnpz7QGqRXuec37rdtrc=; 
 b=XhUcmqlRdMy4fkuZ/X0jUPjQ5L7+m/s4+veMMYPGtWOlGYjF0kEYjYGzhK8eGQM9agNQgbUXqvfv2zwKMXYN4lTNU8gjZOeRA/ysJ11WkYzTOEj/tOZlawcnBxnmRbIHrjDb9YS/f/guW/NHits5M85lq86J6r5HUjiyD5/5rNs=;
X-UUID: 65631a775d704837a0e66057e0466b32-20210410
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 656844866; Sat, 10 Apr 2021 02:12:34 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 02:12:33 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 17:12:31 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Apr 2021 17:12:30 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, <eizan@chromium.org>,
 <acourbot@chromium.org>
Subject: [PATCH v5 04/16] memory: mtk-smi: Add device-link between smi-larb
 and smi-common
Date: Sat, 10 Apr 2021 17:11:16 +0800
Message-ID: <20210410091128.31823-5-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210410091128.31823-1-yong.wu@mediatek.com>
References: <20210410091128.31823-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210410_021237_812972_35653AFD 
X-CRM114-Status: GOOD (  17.41  )
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

Normally, If the smi-larb HW need work, we should enable the smi-common
HW power and clock firstly.
This patch adds device-link between the smi-larb dev and the smi-common
dev. then If pm_runtime_get_sync(smi-larb-dev), the pm_runtime_get_sync
(smi-common-dev) will be called automatically.

Also, Add DL_FLAG_STATELESS to avoid the smi-common clocks be gated when
probe.

CC: Matthias Brugger <matthias.bgg@gmail.com>
Suggested-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/memory/mtk-smi.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index b396253fcf4b..c5fb51f73b34 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -319,6 +319,7 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *smi_node;
 	struct platform_device *smi_pdev;
+	struct device_link *link;
 
 	larb = devm_kzalloc(dev, sizeof(*larb), GFP_KERNEL);
 	if (!larb)
@@ -358,6 +359,12 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 		if (!platform_get_drvdata(smi_pdev))
 			return -EPROBE_DEFER;
 		larb->smi_common_dev = &smi_pdev->dev;
+		link = device_link_add(dev, larb->smi_common_dev,
+				       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+		if (!link) {
+			dev_err(dev, "Unable to link smi-common dev\n");
+			return -ENODEV;
+		}
 	} else {
 		dev_err(dev, "Failed to get the smi_common device\n");
 		return -EINVAL;
@@ -370,6 +377,9 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 
 static int mtk_smi_larb_remove(struct platform_device *pdev)
 {
+	struct mtk_smi_larb *larb = platform_get_drvdata(pdev);
+
+	device_link_remove(&pdev->dev, larb->smi_common_dev);
 	pm_runtime_disable(&pdev->dev);
 	component_del(&pdev->dev, &mtk_smi_larb_component_ops);
 	return 0;
@@ -381,17 +391,9 @@ static int __maybe_unused mtk_smi_larb_resume(struct device *dev)
 	const struct mtk_smi_larb_gen *larb_gen = larb->larb_gen;
 	int ret;
 
-	/* Power on smi-common. */
-	ret = pm_runtime_resume_and_get(larb->smi_common_dev);
-	if (ret < 0) {
-		dev_err(dev, "Failed to pm get for smi-common(%d).\n", ret);
-		return ret;
-	}
-
 	ret = mtk_smi_clk_enable(&larb->smi);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable clock(%d).\n", ret);
-		pm_runtime_put_sync(larb->smi_common_dev);
 		return ret;
 	}
 
@@ -406,7 +408,6 @@ static int __maybe_unused mtk_smi_larb_suspend(struct device *dev)
 	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
 
 	mtk_smi_clk_disable(&larb->smi);
-	pm_runtime_put_sync(larb->smi_common_dev);
 	return 0;
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
