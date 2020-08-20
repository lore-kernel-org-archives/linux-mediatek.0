Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D55C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:16:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26DD12075E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:16:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I52rXxiG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OYFtsuV8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26DD12075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lcRgjyqtIv+Wbn+NaZdeKmeY1Fa06nh/M2EmKvD6QzM=; b=I52rXxiGc3xNPelmsN0T+WK/8
	tiVacWUTL9mY9J2wlHZCJBOscSIpuF5STzNlfUCAdvVoj3geeOMW/prY5Evx4705lzyLCzSXRzaT+
	m60eLb/yRThlmv3QpTFghSQvlJ88rvavTr1BHTlvHypUfT4umLPDPinu01B3/e9YmF6Gxfx+iM+xg
	xQmMlLLtxXRbZ7LjIxdQZW5CjkhgQpgYGDqBQ95LKPVKmm9hjEfTVkkuCQW4fo41mKqwp2+C99Lv7
	lwOxdop3rksXZuK5RxQcpGXO3Ypy9jm07NXr39AiV+Ro4k+L4EdKJ8JHfSv5MD+DXBesPiG7gIsKF
	CdS3l5Vtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8dsB-0008Co-JM; Thu, 20 Aug 2020 06:16:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8drU-0007vu-3D; Thu, 20 Aug 2020 06:15:46 +0000
X-UUID: 629142947f2e4c86968bdc781069e8f5-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZdEoowJE8yrsOxJwibOQFbZ5BGKEhdg3fQs9sloWNGY=; 
 b=OYFtsuV82j640cor6jm1HimmGU/O6JD4QwW9ZLy5T0YG+Fxe0Tkko/UyytsYj93cY4EfZH4ZpAr1uEEHHsu2Of2vqA3A4dRvrdOjYon44tVXz55dJtvj55Wpn/xFNV7ODyOSrufULRt7VIT6V0qHKgZ9BQ/uZ1uzUhnh13SASXY=;
X-UUID: 629142947f2e4c86968bdc781069e8f5-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1421118782; Wed, 19 Aug 2020 22:15:38 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 23:05:38 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:36 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:35 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 05/21] mtk-mmsys: add ovl mout on  support
Date: Thu, 20 Aug 2020 14:04:02 +0800
Message-ID: <1597903458-8055-6-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_021544_418206_1758E62D 
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

add ovl mout on support

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/mmsys/mt8192-mmsys.c | 23 +++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c          |  8 ++++++++
 include/linux/soc/mediatek/mtk-mmsys.h    |  3 +++
 3 files changed, 34 insertions(+)

diff --git a/drivers/soc/mediatek/mmsys/mt8192-mmsys.c b/drivers/soc/mediatek/mmsys/mt8192-mmsys.c
index 006d41d..06080ad 100644
--- a/drivers/soc/mediatek/mmsys/mt8192-mmsys.c
+++ b/drivers/soc/mediatek/mmsys/mt8192-mmsys.c
@@ -134,10 +134,33 @@ static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
 	}
 }
 
+static int mtk_mmsys_ovl_mout_en(enum mtk_ddp_comp_id cur,
+				 enum mtk_ddp_comp_id next,
+				 unsigned int *addr)
+{
+	int value = -1;
+
+	*addr = MT8192_MMSYS_OVL_MOUT_EN;
+
+	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_OVL_2L0)
+		value = DISP_OVL0_GO_BG;
+	else if (cur == DDP_COMPONENT_OVL_2L0 && next == DDP_COMPONENT_OVL0)
+		value = DISP_OVL0_2L_GO_BG;
+	else if (cur == DDP_COMPONENT_OVL0)
+		value = DISP_OVL0_GO_BLEND;
+	else if (cur == DDP_COMPONENT_OVL_2L0)
+		value = DISP_OVL0_2L_GO_BLEND;
+	else
+		value = -1;
+
+	return value;
+}
+
 static struct mtk_mmsys_conn_funcs mmsys_funcs = {
 	.mout_en = mtk_mmsys_ddp_mout_en,
 	.sel_in = mtk_mmsys_ddp_sel_in,
 	.sout_sel = mtk_mmsys_ddp_sout_sel,
+	.ovl_mout_en = mtk_mmsys_ovl_mout_en,
 };
 
 static int mmsys_probe(struct platform_device *pdev)
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 828d59e..1362d01 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -76,6 +76,14 @@ void mtk_mmsys_ddp_connect(struct device *dev,
 		reg = readl_relaxed(config_regs + addr) | value;
 		writel_relaxed(reg, config_regs + addr);
 	}
+
+	if (priv_funcs->ovl_mout_en) {
+		value = priv_funcs->ovl_mout_en(cur, next, &addr);
+		if (value >= 0) {
+			reg = readl_relaxed(config_regs + addr) | value;
+			writel_relaxed(reg, config_regs + addr);
+		}
+	}
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
 
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 8ef3eaa..eefc7b1 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -55,6 +55,9 @@ struct mtk_mmsys_conn_funcs {
 	void (*sout_sel)(void __iomem *config_regs,
 			 enum mtk_ddp_comp_id cur,
 			 enum mtk_ddp_comp_id next);
+	int (*ovl_mout_en)(enum mtk_ddp_comp_id cur,
+			   enum mtk_ddp_comp_id next,
+			   unsigned int *addr);
 };
 
 void mtk_mmsys_register_conn_funcs(struct device *dev,
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
