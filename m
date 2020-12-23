Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CB4C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 09:33:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3656A20825
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 09:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3656A20825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WyroarqlgDcBNP+sZTjZ+plwzJY9wesHd9c+PCkETLo=; b=fVqGXewnVzF+yqq3Jvq6XQeJJ
	Wvuo0CpiWY2K5Q8R9qpuSaQtUolnZCvwrS5sa5zCAIHi5Bw2Sd8RdPfAdTbJXMZ4Q2RBJXi/KDtrj
	L+S6+8rHmeFOXK6Am0jIG5TsKLiFb/PTa7kXa1REj8txAbgjOjJ8H4SETMIrNdnyA5UC1ZSAVMr1a
	6mzLOYh/hazEe5fHuWw3Y+9EyD8L3sKoW0Pv+U2RxW5ZHkJERkFJRuH/uPCFFkElrpp6OmoEaLFsh
	OiCmyhG6V0OPM92/V+A3pWQwbhpFWsmN+K10yI13mXbnmXIMvmeHzlcweX8IYxVxefrhSeFENVIV+
	suTUEB0jg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks0Wj-00069O-9T; Wed, 23 Dec 2020 09:33:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks0WX-000636-OL; Wed, 23 Dec 2020 09:33:38 +0000
X-UUID: 3d034ad375b2487c88807cd355c38fb6-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8vSrQk2PNw1eg3vxDmj3qN0tO7XWa6Rq5gvoDLMCono=; 
 b=OJooeAmma16x2ORM0A5UI90l4giMqDsxVkqgIRzO3uAyQEkZPQKHaYkhlRcBDf+q3/shjDkw3VYVqIpYw5FeM75Lx3OUb5C50c0FKWVRt2WcrmMeB44ZNyz3E+ghVqtyVASCyyIjSW4KBijAtnESDNsC6b69zjiX5F6tAUEElKA=;
X-UUID: 3d034ad375b2487c88807cd355c38fb6-20201223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <eastl.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2052800011; Wed, 23 Dec 2020 01:32:29 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 01:31:08 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 17:31:05 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Dec 2020 17:31:06 +0800
From: EastL Lee <EastL.Lee@mediatek.com>
To: Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v8 4/4] dmaengine: mediatek-cqdma: fix compatible
Date: Wed, 23 Dec 2020 17:30:47 +0800
Message-ID: <1608715847-28956-5-git-send-email-EastL.Lee@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1608715847-28956-1-git-send-email-EastL.Lee@mediatek.com>
References: <1608715847-28956-1-git-send-email-EastL.Lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: AB5F3E4F3B23590E4D2AA6A9CEEF542C12AA43FC13FAE86D027D8A63160E284B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_043338_002734_34CB8579 
X-CRM114-Status: GOOD (  11.16  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, cc.hwang@mediatek.com,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 EastL Lee <EastL.Lee@mediatek.com>, dmaengine@vger.kernel.org,
 vkoul@kernel.org, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds common compatible & platform compatiable.

Signed-off-by: EastL Lee <EastL.Lee@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/dma/mediatek/mtk-cqdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 1610632..17b3ab9 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -547,6 +547,7 @@ static void mtk_cqdma_hw_deinit(struct mtk_cqdma_device *cqdma)
 
 static const struct of_device_id mtk_cqdma_match[] = {
 	{ .compatible = "mediatek,mt6765-cqdma" },
+	{ .compatible = "mediatek,mt6779-cqdma" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_cqdma_match);
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
