Return-Path: <SRS0=F1mA=FQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CE7C4361B
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Dec 2020 04:12:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E00A12313E
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Dec 2020 04:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E00A12313E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PgZi9RipCkAm3CNjS4Lc2q+9PCugqRToZRZjV9zbAmM=; b=fS12spPmvJtMBtvGbL6EPqMqN
	Yb5SPuwQfvitM2a6iwCmyhGbwc6++uTWLMQPnZ+288MbA3vABnWRCLAQLHsgveIHG9RMiuOKyThmw
	CZzo4qUPSirX4EMSnicFFwhjA1N3PaPAsfSSg51qSgEeoQdKYKh1HZTSIigxTkMLOhAnrZnDA11gd
	gBEjbOrIhFICatxLixfHNPJLltHeDy67wDooWJh9eyk4nuwTH06aRV4BT83mnx0tEP8Yc/dGGdGA2
	Ke0DpH6lkfxVA0UX4ATZapuv6luGzCg3bmK3S20BZffehxbsRer8cJrpafqHyncKN8LiY16kj+zFU
	HzNIm2fHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knwGl-00024O-Io; Sat, 12 Dec 2020 04:12:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knwGR-0001vD-DN; Sat, 12 Dec 2020 04:12:13 +0000
X-UUID: 6f1930e6d3ed436c9eb4781583f7bdea-20201211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IcBVGjhMM93U59Zg6sn4+HR2/5ZarY0qGfZCNPtkXU4=; 
 b=o+oTEOw0uCu1l4HZsoiOtZ6yMNR153wE0HIFSLyGrOyj/ojS04UnMpzBtuaIPJsxWwfKxm2loruLaMc75x7q02bRYuDqyr0Oscpiui0/rsdI8ZJloZxVpLs/IUqj9ZMdERflHl6c1UyyMpyIUjKPMwp1Mj+EbxfiN+LBU6GSNms=;
X-UUID: 6f1930e6d3ed436c9eb4781583f7bdea-20201211
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1278742007; Fri, 11 Dec 2020 20:12:08 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Dec 2020 20:12:06 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Dec 2020 12:12:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Dec 2020 12:12:05 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2,
 07/17] drm/mediatek: add disp config and mm 26mhz clock into mutex
 device
Date: Sat, 12 Dec 2020 12:11:47 +0800
Message-ID: <1607746317-4696-8-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_231211_624362_F1A4C51A 
X-CRM114-Status: GOOD (  18.27  )
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
