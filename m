Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F11C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 03:48:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6395364E27
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 03:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6395364E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ji329Khhih/rvSn+gJeS0hzORFInMjqf/yTm7mD0YAs=; b=d3sX5UjNfs9QfLgjEXc9FHpivw
	MoB3aMXZ42zNWkeDuYBnYhxRvtAXJaZ6EZTrmPHzO1HOYXTtVL8l8IH6ns1fshN5R+isC2H4EtJqV
	oIhRIKHbQ4XQamXSl83ilGVgacoGd9Rni6dke0qhaeyOSVGNHl+cFii8KCxQisaSwfnlWno5pcwx3
	vdtf3juT/B7JpSFAQ+G3P/tZydcx4PDjR8kWCXq8J3BIEdmRhx1Wc5qfjr4sZdwXgFZzfw+onsSbi
	FEug8abA1dvNxZh0Se8PXKiKGDgDw1LVygEvxd+iKnBYgtZblZaRO31bcE7J3K4uxY0dtA6fzp+9z
	/ZVHkxIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6QCB-0005gM-Il; Mon, 01 Feb 2021 03:48:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6QC8-0005ey-GE; Mon, 01 Feb 2021 03:48:10 +0000
X-UUID: 7ba9d4eea2684aaaaa9e129989a6208d-20210131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ycki3f22lu0G/Y5pcD1WAXwXxWSc4abbISJZOTSNMNc=; 
 b=pDOFhhxmjFLzOmwmHC4x9N38et/+Q01E1gSTzVtbD/xVJLLYDaoSXHkNsVS3sI1srpQ0GSORnxDwTEwdyvH3MBv+ELeNA98fRQUjHCZF9qvgP4cmRkLawcHYAjCffp6Vdr7HNcQnW61jSbxw6ws3DtrXsvP4NLROvku/oxEc4NY=;
X-UUID: 7ba9d4eea2684aaaaa9e129989a6208d-20210131
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 254929992; Sun, 31 Jan 2021 19:48:04 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 Jan 2021 19:48:03 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 1 Feb 2021 11:47:58 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 1 Feb 2021 11:47:57 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/mediatek: fine tune the data lane trail by project dts
Date: Mon, 1 Feb 2021 11:47:55 +0800
Message-ID: <20210201034755.15793-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: C09D5F74431AB1B049045EEA52CC4FCA78AF2ACAE1755FA553EE30718D904CAA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_224808_773388_77C48ED3 
X-CRM114-Status: GOOD (  13.92  )
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, shuijing.li@mediatek.com,
 linux-mediatek@lists.infradead.org, bibby.hsieh@mediatek.com,
 ck.hu@mediatek.com, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some panels or bridges require customized hs_da_trail time.
So add a property in devicetree for this panels and bridges.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 8c70ec39bfe1..6e7092fa2fee 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -194,6 +194,7 @@ struct mtk_dsi {
 	struct clk *hs_clk;
 
 	u32 data_rate;
+	u32 da_trail_delta;
 
 	unsigned long mode_flags;
 	enum mipi_dsi_pixel_format format;
@@ -234,7 +235,7 @@ static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
 	timing->da_hs_prepare = (80 * data_rate_mhz + 4 * 1000) / 8000;
 	timing->da_hs_zero = (170 * data_rate_mhz + 10 * 1000) / 8000 + 1 -
 			     timing->da_hs_prepare;
-	timing->da_hs_trail = timing->da_hs_prepare + 1;
+	timing->da_hs_trail = timing->da_hs_prepare + 1 + dsi->da_trail_delta;
 
 	timing->ta_go = 4 * timing->lpx - 2;
 	timing->ta_sure = timing->lpx + 2;
@@ -1094,6 +1095,13 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		goto err_unregister_host;
 	}
 
+	ret = of_property_read_u32_index(dev->of_node, "da_trail_delta", 0,
+					 &dsi->da_trail_delta);
+	if (ret) {
+		dev_info(dev, "Can't get da_trail_delta, keep it as 0: %d\n", ret);
+		dsi->da_trail_delta = 0;
+	}
+
 	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DSI);
 	if (comp_id < 0) {
 		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
