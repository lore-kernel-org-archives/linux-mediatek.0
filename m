Return-Path: <SRS0=56RK=F5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5E0C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 08:33:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9088023129
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 08:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9088023129
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MtZKT39sniiUttK3Iz8SleaGJu2aAzxRlfFT7BN7jTc=; b=r1Np4xFs++8dyj/NHA1o/LoBga
	SpUGzDqSoNo3VLoxW1k4Gu3dk+1FWKTqL5yfkGa6Uqmx2MPBgc8HA7V4j82zy0f1VVgXy2THMn5ng
	WMGynEpeJ0cL64THSlrgU8oCFq8JVhqAzYNrFN9/gJdEOnWbWqPYkmdrL/mTdDb+eK56nOIXFau9o
	tw1BboCYnSK0DRkBlhXxKWLmgMTSHLM3sz0qZ2gPtNuguZFR8/TG2Ec+EBGa4YzZqX3Os5ibz4OWW
	JidFcSXO8twcpSxOkFtQ22+kUaoSpFu9vuf0MXtvXAHj7KNi0qhBQY1bgatVTy1p8g1rBI/WfAD+y
	qEG1ETnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksiXR-0000rv-5n; Fri, 25 Dec 2020 08:33:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksiXP-0000rU-33
 for linux-mediatek@lists.infradead.org; Fri, 25 Dec 2020 08:33:28 +0000
X-UUID: 5b654a500d6c43dabd77d7b227ff57f5-20201225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=yfC39+wsyeXP2hku+0Tl6EmKyeFPiPSkxM/GM4YA3eU=; 
 b=Pfusz/Dwys8kVK2pLpvaYTurNj9W96MXx7z6Se1qMvvJw0ZMIr1QhXzDyR9xX57SYvL0vsD/g+hlUzWU35G6kSLatWjVuF6XfN5o44wjFlMmnFEBU/4lU/GjEdA4X30Yh3ehGwTNopmCg39HRkQW3LXg9C1CKiRpRXlzRyM+Kds=;
X-UUID: 5b654a500d6c43dabd77d7b227ff57f5-20201225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2120719973; Fri, 25 Dec 2020 00:25:10 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Dec 2020 00:25:07 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 25 Dec 2020 16:25:03 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 25 Dec 2020 16:24:41 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/mediatek: dsi: Use IRQF_TRIGGER_NONE for dsi irq trigger
 type
Date: Fri, 25 Dec 2020 16:24:41 +0800
Message-ID: <20201225082441.10412-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3055B27357DF4CE21774917DAC12CFD17DBB4E4C7ABE15A7001CBD1AB51F48292000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201225_033327_276704_D9AECF8F 
X-CRM114-Status: GOOD (  10.91  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, bibby.hsieh@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The interrupt trigger is already set by OF. When do devm_request_irq()
in driver, please use IRQF_TRIGGER_NONE and don't specify trigger type
again.

Change-Id: Ie59d7bd9a44a130420890b169cc2e6fee3ad7633
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 4a188a942c38..1d6248930bdf 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1128,9 +1128,8 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		goto err_unregister_host;
 	}
 
-	irq_set_status_flags(irq_num, IRQ_TYPE_LEVEL_LOW);
 	ret = devm_request_irq(&pdev->dev, irq_num, mtk_dsi_irq,
-			       IRQF_TRIGGER_LOW, dev_name(&pdev->dev), dsi);
+			       IRQF_TRIGGER_NONE, dev_name(&pdev->dev), dsi);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request mediatek dsi irq\n");
 		goto err_unregister_host;
-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
