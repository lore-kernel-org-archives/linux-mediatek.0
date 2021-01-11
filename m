Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12056C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 07:54:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A27CD22A84
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 07:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A27CD22A84
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=voFqQf1rjTKQIqYtYNNewjvqVVq3M+iyBh17iZruLF4=; b=TpbaZHUfffzgwV+ITN23Q9O+y
	hiAYBZtTH+s2EeBBOk4HHJD/mkxQzK9e4hKf4jzCbiqkQoNz6chyfaQl9SRVOeEwoX3R/Dz+2jZRl
	XBW2oySFAmIPh0fI00ybluYzyZavJDupF8hs1pIok2KNWwupeEFwpxjssYn2CfygwGoAg0l1jI791
	bJbYif4z6qWN3K7q9pELFcTGsZvcX2zyZvm0VtCQSY9DFsIrR3aj+MAPddLQLlIZSrznXzdC5XKB+
	aGy3h6jzuf30m5tVd71pYBC0Ox1oWANhqhYczHRiTgGFrqRgDPhFbloZQyFVng1h2J3UzIbrLHZ9B
	IYI4TI+8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kys22-0006LP-NH; Mon, 11 Jan 2021 07:54:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kys1n-0006DR-Qh; Mon, 11 Jan 2021 07:54:18 +0000
X-UUID: 6edb28a863a347c3aeee49836585ccd6-20210110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4N2NE7wANll/2uaHzEqXBrx5e3/xtyTmarEPZESiIYI=; 
 b=uxFRPyXqBvxjVDUlKTGUkRl0iqQQSI+TkXbzP5wMWbQrfvrdvB4+r2IU8Z+eEv69++fI4QRAHry1r/DHtauf0Z+kHLAlkT3ErFRiSANyE43E2N1QgdnisWpWxDr1i58D5BlWpsTXZzhmjft53deX+UI0BqMYcmaacTrAei3oII0=;
X-UUID: 6edb28a863a347c3aeee49836585ccd6-20210110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 212998190; Sun, 10 Jan 2021 23:54:10 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 Jan 2021 23:44:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 15:44:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 15:44:07 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3, 14/15] drm/mediatek: add DDP support for MT8192
Date: Mon, 11 Jan 2021 15:43:50 +0800
Message-ID: <1610351031-21133-15-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_025416_101114_C1948494 
X-CRM114-Status: GOOD (  15.16  )
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add DDP support for MT8192 SoC.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index 1308046..7aa7fc3 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -40,6 +40,18 @@
 #define MT8167_MUTEX_MOD_DISP_DITHER		15
 #define MT8167_MUTEX_MOD_DISP_UFOE		16
 
+#define MT8192_MUTEX_MOD_DISP_OVL0		0
+#define MT8192_MUTEX_MOD_DISP_OVL0_2L		1
+#define MT8192_MUTEX_MOD_DISP_RDMA0		2
+#define MT8192_MUTEX_MOD_DISP_COLOR0		4
+#define MT8192_MUTEX_MOD_DISP_CCORR0		5
+#define MT8192_MUTEX_MOD_DISP_AAL0		6
+#define MT8192_MUTEX_MOD_DISP_GAMMA0		7
+#define MT8192_MUTEX_MOD_DISP_POSTMASK0		8
+#define MT8192_MUTEX_MOD_DISP_DITHER0		9
+#define MT8192_MUTEX_MOD_DISP_OVL2_2L		16
+#define MT8192_MUTEX_MOD_DISP_RDMA4		17
+
 #define MT8183_MUTEX_MOD_DISP_RDMA0		0
 #define MT8183_MUTEX_MOD_DISP_RDMA1		1
 #define MT8183_MUTEX_MOD_DISP_OVL0		9
@@ -215,6 +227,20 @@ struct mtk_ddp {
 	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
 };
 
+static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+	[DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
+	[DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
+	[DDP_COMPONENT_COLOR0] = MT8192_MUTEX_MOD_DISP_COLOR0,
+	[DDP_COMPONENT_DITHER] = MT8192_MUTEX_MOD_DISP_DITHER0,
+	[DDP_COMPONENT_GAMMA] = MT8192_MUTEX_MOD_DISP_GAMMA0,
+	[DDP_COMPONENT_POSTMASK0] = MT8192_MUTEX_MOD_DISP_POSTMASK0,
+	[DDP_COMPONENT_OVL0] = MT8192_MUTEX_MOD_DISP_OVL0,
+	[DDP_COMPONENT_OVL_2L0] = MT8192_MUTEX_MOD_DISP_OVL0_2L,
+	[DDP_COMPONENT_OVL_2L2] = MT8192_MUTEX_MOD_DISP_OVL2_2L,
+	[DDP_COMPONENT_RDMA0] = MT8192_MUTEX_MOD_DISP_RDMA0,
+	[DDP_COMPONENT_RDMA4] = MT8192_MUTEX_MOD_DISP_RDMA4,
+};
+
 static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_DSI3 + 1] = {
 	[DDP_MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[DDP_MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
@@ -275,6 +301,13 @@ struct mtk_ddp {
 	.no_clk = true,
 };
 
+static const struct mtk_ddp_data mt8192_ddp_driver_data = {
+	.mutex_mod = mt8192_mutex_mod,
+	.mutex_sof = mt8183_mutex_sof,
+	.mutex_mod_reg = MT8183_DISP_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8183_DISP_MUTEX0_SOF0,
+};
+
 struct mtk_disp_mutex *mtk_disp_mutex_get(struct device *dev, unsigned int id)
 {
 	struct mtk_ddp *ddp = dev_get_drvdata(dev);
@@ -497,6 +530,8 @@ static int mtk_ddp_remove(struct platform_device *pdev)
 	  .data = &mt8173_ddp_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-mutex",
 	  .data = &mt8183_ddp_driver_data},
+	{ .compatible = "mediatek,mt8192-disp-mutex",
+	  .data = &mt8192_ddp_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, ddp_driver_dt_match);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
