Return-Path: <SRS0=0dL+=DQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E47C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 12:35:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7896422284
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 12:35:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pAi4fGII"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7896422284
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yEeZu7f3NiAuUIQswqJgdENnjVI+ZOI9C5Dvp3cUNXA=; b=pAi4fGIIBVa/dPHEqT/i4Od6Q
	TJjic0niRGybGMT4LU5YyiDVOI+khaVpRGmG+MyMZMRXPMbJFJI5maeAMdQrZ9qvAW+bxXEEDTCIA
	kvCNvPsmxt62AlEdkFwKnKvp4jkaUFPm9ku0sU9AJ3r44aXObsBrLSFkOE8EQuUruuI8Nm2EuDisL
	qknjKUnB6+t/yGeqJ5vjNm4NhDvmjYjIWVI26pbPf5aYauyqcHsYQxw2m01yGhy/YuOxBzJZVhcW0
	rggsWRif/jlys5YKpULCPZhLEWE3TZJ4HOOZnMPBRGZMxMbr/k5WuQXJiGvpnm7V+8CHbEA1eVK2U
	lLHeeblyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQrbz-0001pC-5O; Fri, 09 Oct 2020 12:35:03 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQrb4-0001Ik-18; Fri, 09 Oct 2020 12:34:08 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 608A8BE9F70EC95BF8F0;
 Fri,  9 Oct 2020 20:33:56 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Fri, 9 Oct 2020
 20:33:47 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <rick.chang@mediatek.com>, <bin.liu@mediatek.com>, <mchehab@kernel.org>,
 <matthias.bgg@gmail.com>, <tiffany.lin@mediatek.com>,
 <andrew-ct.chen@mediatek.com>, <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <hverkuil-cisco@xs4all.nl>, <jcliang@chromium.org>, 
 <minghsiu.tsai@mediatek.com>
Subject: [PATCH 6/7] media: mtk-vcodec: add missing put_device() call in
 mtk_vcodec_init_enc_pm()
Date: Fri, 9 Oct 2020 20:38:03 +0800
Message-ID: <20201009123804.3977562-7-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201009123804.3977562-1-yukuai3@huawei.com>
References: <20201009123804.3977562-1-yukuai3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_083406_376691_B06E66A6 
X-CRM114-Status: GOOD (  11.66  )
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
index ee22902aaa71..1a047c25679f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -47,14 +47,16 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
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
@@ -67,11 +69,14 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
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
@@ -80,17 +85,24 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
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
