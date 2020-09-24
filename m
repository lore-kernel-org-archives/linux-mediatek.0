Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA0CC4346E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 08:17:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 756862068D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 08:17:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DPtPzPdu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 756862068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MjSCzEPqgqo7ho0AmcWSQj77vajbvtfRsmON3pDI6os=; b=DPtPzPdux+JSJ5y2lLEEMbPxuX
	E4xiSeMmoVuLPAvERQeWcElKyR7sG6MWJ6OkonqPuMfiZ5s8TBAcBWbiX1samow26zd0qhvtyhw4x
	ts9fsRxb4lbhOOJUd0VLvkx+q4awoTQ3TL2I+iTMOWhwyqwRr59KSuwD+o/GW+b/CeIfe7QGnTVh8
	GoH3kc6LIdk3o7sxmFnIfzIAKZpMbkZEW2gdlKtkmSH+lOersK3vIuaICC/pS8dFK2C9K2mnIbfgb
	zKG8J0xrKoqz8UQOf++eQ+3tA1bdcr68X1Kvj/iAmaWFrsEMmQgOGsuEgun1RlvJPfRTAkRi4FnkK
	Urwl/kPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLMRb-0002Fx-UB; Thu, 24 Sep 2020 08:17:36 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLMRM-00028H-T6; Thu, 24 Sep 2020 08:17:22 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 2F6D5D462937A09BCF5F;
 Thu, 24 Sep 2020 16:17:16 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Thu, 24 Sep 2020
 16:17:07 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <tiffany.lin@mediatek.com>, <andrew-ct.chen@mediatek.com>,
 <mchehab@kernel.org>, <matthias.bgg@gmail.com>, <hans.verkuil@cisco.com>
Subject: [PATCH 3/3] media: mtk-vcodec: add missing put_device() call in
 mtk_vcodec_init_enc_pm()
Date: Thu, 24 Sep 2020 16:18:11 +0800
Message-ID: <20200924081811.1061145-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_041721_194449_45D17AB4 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, yukuai3@huawei.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

if of_find_device_by_node() succeed, mtk_vcodec_init_enc_pm() doesn't have
a corresponding put_device(). Thus add jump target to fix the exception
handling for this function implementation.

Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 26 ++++++++++++++-----
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index 3e2bfded79a6..e682bdb1ed45 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -49,14 +49,16 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 	node = of_parse_phandle(dev->of_node, "mediatek,larb", 1);
 	if (!node) {
 		mtk_v4l2_err("no mediatek,larb found");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto put_larbvenc;
 	}
 
 	pdev = of_find_device_by_node(node);
 	of_node_put(node);
 	if (!pdev) {
 		mtk_v4l2_err("no mediatek,larb device found");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto put_larbvenc;
 	}
 
 	pm->larbvenclt = &pdev->dev;
@@ -69,11 +71,14 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 		enc_clk->clk_info = devm_kcalloc(&pdev->dev,
 			enc_clk->clk_num, sizeof(*clk_info),
 			GFP_KERNEL);
-		if (!enc_clk->clk_info)
-			return -ENOMEM;
+		if (!enc_clk->clk_info) {
+			ret = -ENOMEM;
+			goto put_larbvenclt;
+		}
 	} else {
 		mtk_v4l2_err("Failed to get venc clock count");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_larbvenclt;
 	}
 
 	for (i = 0; i < enc_clk->clk_num; i++) {
@@ -82,17 +87,24 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 			"clock-names", i, &clk_info->clk_name);
 		if (ret) {
 			mtk_v4l2_err("venc failed to get clk name %d", i);
-			return ret;
+			goto put_larbvenclt;
 		}
 		clk_info->vcodec_clk = devm_clk_get(&pdev->dev,
 			clk_info->clk_name);
 		if (IS_ERR(clk_info->vcodec_clk)) {
 			mtk_v4l2_err("venc devm_clk_get (%d)%s fail", i,
 				clk_info->clk_name);
-			return PTR_ERR(clk_info->vcodec_clk);
+			ret = PTR_ERR(clk_info->vcodec_clk);
+			goto put_larbvenclt;
 		}
 	}
 
+	return 0;
+
+put_larbvenclt:
+	put_device(pm->larbvenclt);
+put_larbvenc:
+	put_device(pm->larbvenc);
 	return ret;
 }
 
-- 
2.25.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
