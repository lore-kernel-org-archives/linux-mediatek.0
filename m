Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E69C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:06:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A59DE2078D
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:06:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B1ACBdIQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dHL3r+kt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A59DE2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PgZi9RipCkAm3CNjS4Lc2q+9PCugqRToZRZjV9zbAmM=; b=B1ACBdIQ582KE3Yjui9CBxtN8
	3O3MmoC14+wH5NWVVvMNSY1P+kaVzbmmTtU5cTtY1H1eAQPKZmboGHo8CCDH0sR6FCkFfeiqhOPd8
	aeAmnzhq0k8ScJKCXx0FfNa2kf3ur4bZng9dU67hPgc6TrG39LqFR8wEBDtTVjX97GtgpP58QI7/+
	wODwU/P6nLku3V+WLH9JtAi9te1js2yNg3bsfLH/tLpUySQM5u/wojJ17uvb4E3qh3ZhEVzwvpYMX
	tw+7pnbxciZRA2sJXHVKXA0GDfpwp0Y1fG3m+hTHrjVmBDeXMJA4Lmly7g3gvoVNnT330n+RW3tGQ
	GdeKVaAwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8diG-0005AL-I8; Thu, 20 Aug 2020 06:06:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8dhn-0004vl-VI; Thu, 20 Aug 2020 06:05:48 +0000
X-UUID: 001234d571054f45ba27a769b974129e-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IcBVGjhMM93U59Zg6sn4+HR2/5ZarY0qGfZCNPtkXU4=; 
 b=dHL3r+ktu7jltVPSZ+p80+K0xZc4nM851bjIjVhYXIuSCY7ZDV24D87Rxlt4Iy36+9iai7bUr12Ajxd/dgEwSd59OkPz/rMLZzBcpfxy0sXPqgxK3YxNyEywf6sZiZZW2bRLJ3fuqgCOWn669XnYeXkai7GFHh2NLYW9c68/n3w=;
X-UUID: 001234d571054f45ba27a769b974129e-20200819
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2071711881; Wed, 19 Aug 2020 22:05:42 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 23:05:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:37 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:36 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 06/21] drm/mediatek: add disp config and mm 26mhz clock
 into mutex device
Date: Thu, 20 Aug 2020 14:04:03 +0800
Message-ID: <1597903458-8055-7-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_020544_234256_E82A9078 
X-CRM114-Status: GOOD (  19.91  )
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

there are 2 more clock need enable for display.
parser these clock when mutex device probe,
enable and disable when mutex on/off

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 49 ++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index 60788c1..de618a1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -118,7 +118,7 @@ struct mtk_ddp_data {
 
 struct mtk_ddp {
 	struct device			*dev;
-	struct clk			*clk;
+	struct clk			*clk[3];
 	void __iomem			*regs;
 	struct mtk_disp_mutex		mutex[10];
 	const struct mtk_ddp_data	*data;
@@ -257,14 +257,39 @@ int mtk_disp_mutex_prepare(struct mtk_disp_mutex *mutex)
 {
 	struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
 					   mutex[mutex->id]);
-	return clk_prepare_enable(ddp->clk);
+	int ret;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ddp->clk); i++) {
+		if (IS_ERR(ddp->clk[i]))
+			continue;
+		ret = clk_prepare_enable(ddp->clk[i]);
+		if (ret) {
+			pr_err("failed to enable clock, err %d. i:%d\n",
+				ret, i);
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	while (--i >= 0)
+		clk_disable_unprepare(ddp->clk[i]);
+	return ret;
 }
 
 void mtk_disp_mutex_unprepare(struct mtk_disp_mutex *mutex)
 {
 	struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
 					   mutex[mutex->id]);
-	clk_disable_unprepare(ddp->clk);
+	int i;
+
+	 for (i = 0; i < ARRAY_SIZE(ddp->clk); i++) {
+		if (IS_ERR(ddp->clk[i]))
+			continue;
+		clk_disable_unprepare(ddp->clk[i]);
+	}
 }
 
 void mtk_disp_mutex_add_comp(struct mtk_disp_mutex *mutex,
@@ -415,11 +440,19 @@ static int mtk_ddp_probe(struct platform_device *pdev)
 	ddp->data = of_device_get_match_data(dev);
 
 	if (!ddp->data->no_clk) {
-		ddp->clk = devm_clk_get(dev, NULL);
-		if (IS_ERR(ddp->clk)) {
-			if (PTR_ERR(ddp->clk) != -EPROBE_DEFER)
-				dev_err(dev, "Failed to get clock\n");
-			return PTR_ERR(ddp->clk);
+		int ret;
+
+		for (i = 0; i < ARRAY_SIZE(ddp->clk); i++) {
+			ddp->clk[i] = of_clk_get(dev->of_node, i);
+
+			if (IS_ERR(ddp->clk[i])) {
+				ret = PTR_ERR(ddp->clk[i]);
+				if (ret != EPROBE_DEFER)
+					dev_err(dev, "Failed to get clock %d\n",
+						ret);
+
+				return ret;
+			}
 		}
 	}
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
