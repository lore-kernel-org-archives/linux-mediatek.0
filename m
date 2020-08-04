Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7C4C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 16:56:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81ECC2086A
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 16:56:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MLrby4L/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="rxR7PRph"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81ECC2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NAPC1PWjGa58WbeDu+BvqyzTEE2NZWbASy67Uj+baCU=; b=MLrby4L/blNwJa+n93Y8EmLAz
	iZwqZdvOXK3umLrhnnltTucZ6emC0iYamS7euE0ex0kGmmUCnKThWqVleuRfh1WrMX9AvmbgPzpsW
	InqDk4Yhp0Mvpy73XS1xMSeDFE6+0UEJzsks6UAV9FGyPrzShH/2W6U+4CJGul2rnoUFqHyszMiy+
	a4rRNTDA2uZUPjsT4cfuiE1rGGE3vXREyAX5DVS3W18PNu7tgOcxlixyux8752oP2oQTz7x6ydrN/
	tF9mElp/2Cx5nWydeO+CcCdugvZ3boUVaRkdI0GZNk+G6XlwYbPn5WN4ibU/+SqFQs6YGd1DRI1zd
	RbSWGWY2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k30Eh-0004jq-21; Tue, 04 Aug 2020 16:56:23 +0000
Received: from mxwww.masterlogin.de ([95.129.51.220])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k30EX-0004gG-2o; Tue, 04 Aug 2020 16:56:14 +0000
Received: from mxout2.routing.net (unknown [192.168.10.82])
 by forward.mxwww.masterlogin.de (Postfix) with ESMTPS id 3BAA496148;
 Tue,  4 Aug 2020 16:56:11 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout2.routing.net (Postfix) with ESMTP id 09E0A5FA21;
 Tue,  4 Aug 2020 16:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1596560171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fAxB8FMw1RdmCyat0mKDQj17vHc5n1XZwQpV53Cpf1Y=;
 b=rxR7PRph6EoO/i7t+XmJVhi+FTTq75/xxVcYLFMVjan2HNNbjK8dMftAyWXPR1W0C4A6YC
 o4gEh9HKno+xzwhUjQG5QVPZRdOO82v77Oh70Tn6serRYxMBPK3c7nYTKy0hVrurwNBSPU
 W6PiT/kJjJi1anZzh8+38XUGGakqlv8=
Received: from localhost.localdomain (fttx-pool-217.61.144.119.bambit.de
 [217.61.144.119])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 57CA73605F9;
 Tue,  4 Aug 2020 16:56:10 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v4 2/6] drm/mediatek: add ddp routing for mt7623
Date: Tue,  4 Aug 2020 18:55:51 +0200
Message-Id: <20200804165555.75159-4-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200804165555.75159-1-linux@fw-web.de>
References: <20200804165555.75159-1-linux@fw-web.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_125613_677421_202B4EAB 
X-CRM114-Status: GOOD (  12.18  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

on BPi-R2/mt7623 main-path have to be routed to DPI0 (hdmi) instead of DSI0
using compatible "mt7623-mmsys" already defined in dts

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6bd369434d9d..11e3752c670d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -74,6 +74,19 @@ static const enum mtk_ddp_comp_id mt2701_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DPI0,
 };
 
+static const enum mtk_ddp_comp_id mt7623_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_BLS,
+	DDP_COMPONENT_DPI0,
+};
+
+static const enum mtk_ddp_comp_id mt7623_mtk_ddp_ext[] = {
+	DDP_COMPONENT_RDMA1,
+	DDP_COMPONENT_DSI0,
+};
+
 static const enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_COLOR0,
@@ -127,6 +140,14 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.shadow_register = true,
 };
 
+static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data = {
+	.main_path = mt7623_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt7623_mtk_ddp_main),
+	.ext_path = mt7623_mtk_ddp_ext,
+	.ext_len = ARRAY_SIZE(mt7623_mtk_ddp_ext),
+	.shadow_register = true,
+};
+
 static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
 	.main_path = mt2712_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2712_mtk_ddp_main),
@@ -422,6 +443,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 static const struct of_device_id mtk_drm_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmsys",
 	  .data = &mt2701_mmsys_driver_data},
+	{ .compatible = "mediatek,mt7623-mmsys",
+	  .data = &mt7623_mmsys_driver_data},
 	{ .compatible = "mediatek,mt2712-mmsys",
 	  .data = &mt2712_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8173-mmsys",
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
