Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333E5C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 04:23:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAED661CB0
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 04:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAED661CB0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kRHjolhk+KiBSFc1EAjNukMf3SleWCZu7GJE9fctvYI=; b=KCKvZCpxHGkqUU
	huqT4JUOeaQxSH8WkW4rRotdoVF9NNyWF1YnCANKK5gy1PRcFURsTzaeTZxnYtOb3J2x88YINv8op
	pE7iKlkmYVBSCT6iHHdIdTs+3S694Wk2FZO42waxiW7aCOUtOy8BecRSIKMH/PztpP8VWk12m8+2H
	pmlthm4Util3rQn7yzf1F8tPqjbVhZaZLQB6RY79QQdto+Ced5BzfA25n6I5xhTqBGSPD63XBoc8O
	NF6P+3M0tAWk/wxJFCi7t1ngXxqd5V0L0ljV2c/RQJ2fOmNvuygvuQmTwsp9svyVUbNKK22VoUpGf
	VZIYjv8ErEQoDzGipDJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0z5Y-00DNWC-HR; Wed, 07 Jul 2021 04:23:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0z5U-00DNTx-HL; Wed, 07 Jul 2021 04:23:06 +0000
X-UUID: 9c04ba428b8c44b3b1321cad7ebdab81-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=j/dX6dnsq6IiwTi6Q8aLJJFN5zw2ITAVN8dPli208JE=; 
 b=Gr+aB4+et+46vVWY6/GQ7W+hQRmLB00MIyNHfFs4OytMsuH99zxMuSkO1jzpRoP/BjSY3ajxqKoCkCcABHxoK/mIhK80p4xnAlK/ObKIj9C3QfeDBJmN3pN3jzF29dL2a3BNRWDTM9Mwf0Cciag+932BtrY028A6Xatb7hYKuog=;
X-UUID: 9c04ba428b8c44b3b1321cad7ebdab81-20210706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1529867513; Tue, 06 Jul 2021 21:23:02 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 21:13:00 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 12:12:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 7 Jul 2021 12:12:58 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v1 11/17] drm/mediatek: add COLOR support for MT8195
Date: Wed, 7 Jul 2021 12:12:43 +0800
Message-ID: <20210707041249.29816-12-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_212304_605965_EAFE5309 
X-CRM114-Status: GOOD (  11.03  )
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

Add COLOR support for MT8195.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 6 ++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c    | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 63f411ab393b..ce2cf9f504cc 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -149,6 +149,10 @@ static const struct mtk_disp_color_data mt8173_color_driver_data = {
 	.color_offset = DISP_COLOR_START_MT8173,
 };
 
+static const struct mtk_disp_color_data mt8195_color_driver_data = {
+	.color_offset = DISP_COLOR_START_MT8173,
+};
+
 static const struct of_device_id mtk_disp_color_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-color",
 	  .data = &mt2701_color_driver_data},
@@ -156,6 +160,8 @@ static const struct of_device_id mtk_disp_color_driver_dt_match[] = {
 	  .data = &mt8167_color_driver_data},
 	{ .compatible = "mediatek,mt8173-disp-color",
 	  .data = &mt8173_color_driver_data},
+	{ .compatible = "mediatek,mt8195-disp-color",
+	  .data = &mt8195_color_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_color_driver_dt_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 8b24623dcd91..28bf4a11efb0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -444,6 +444,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_COLOR },
 	{ .compatible = "mediatek,mt8173-disp-color",
 	  .data = (void *)MTK_DISP_COLOR },
+	{ .compatible = "mediatek,mt8195-disp-color",
+	  .data = (void *)MTK_DISP_COLOR },
 	{ .compatible = "mediatek,mt8173-disp-aal",
 	  .data = (void *)MTK_DISP_AAL},
 	{ .compatible = "mediatek,mt8173-disp-gamma",
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
