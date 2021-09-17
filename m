Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C8EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 03:38:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A68360F92
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 03:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A68360F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/fzDjTr4OovCXkM5B3huFtnysE757hAjpuor8ddZoA=; b=cO8gwCk3+SGvXZ
	jE36fEDp5kgz92/O3h8MsYM6RUfHK7OnknqXqR3PDWJBDlpME4FwdZ79kPB6j5P6wy7DzXunDq3JQ
	Jsbjuuk2fMpntprXAdMBM9gGL33/DlHyjzqvTLkllg5krpM/mznqs/+AyXqlBobVLMIW6T4pLhdbE
	EPVjotUpo57WCW3nQbJeVgw+deze3qU9Kppe2E9Bfur6GnZu2KZBuUvlyilk5kmIa6dhdD7Ut010w
	EZ81lADxVKfakbrJTYMDEgR/qeTR4pWpTr/Atl89WtwvdYINKJwm+0VgZmNOVXEWTR6vjqk/i6Cz+
	F9on14qAtdFK4NmTeGSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mR4hE-00D98i-Qe; Fri, 17 Sep 2021 03:37:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mR4hB-00D97p-T1
 for linux-mediatek@lists.infradead.org; Fri, 17 Sep 2021 03:37:51 +0000
X-UUID: c011aceda66547efb5d8be9a14ae0a32-20210916
X-UUID: c011aceda66547efb5d8be9a14ae0a32-20210916
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1620766065; Thu, 16 Sep 2021 20:37:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Sep 2021 20:27:48 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 17 Sep 2021 11:27:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 17 Sep 2021 11:27:45 +0800
From: roy-cw.yeh <roy-cw.yeh@mediatek.com>
To: "river . cheng" <river.cheng@mediatek.com>
CC: <linux-mediatek@lists.infradead.org>, Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
Subject: [PATCH v1 7/9] soc: mediatek: mutex: support mt8195 vppsys0/1
Date: Fri, 17 Sep 2021 11:27:26 +0800
Message-ID: <20210917032728.22367-8-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210917032728.22367-1-roy-cw.yeh@mediatek.com>
References: <20210917032728.22367-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_203749_972205_B60838D0 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

Add mt8195 mdp mutex info to driver data of mtk-mutex

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 53 ++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index c100a5249016..0e66b5ff916f 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -122,6 +122,23 @@
 #define MT8183_MDP_PIPE_WPEI			(MT8183_MUTEX_MDP_START + 2)
 #define MT8183_MDP_PIPE_WPEI2			(MT8183_MUTEX_MDP_START + 3)
 
+#define MT8195_MUTEX_MDP_MOD_MASK		0xFFFFFFFF
+#define MT8195_MUTEX_MDP_MOD1_MASK		0x000000FF
+#define MT8195_MUTEX_MDP_SOF_MASK		0x00000007
+
+#define	MT8195_MDP_PIPE_WPEI			0
+#define	MT8195_MDP_PIPE_WPEI2			1
+#define	MT8195_MDP_PIPE_RDMA0			2
+#define	MT8195_MDP_PIPE_VPP1_SOUT		3
+
+#define	MT8195_MDP_PIPE_RDMA1			1
+#define	MT8195_MDP_PIPE_RDMA2			2
+#define	MT8195_MDP_PIPE_RDMA3			3
+
+#define	MT8195_MDP_PIPE_SPLIT			2
+#define	MT8195_MDP_PIPE_SPLIT2			3
+#define	MT8195_MDP_PIPE_VPP0_SOUT		4
+
 struct mtk_mutex {
 	int id;
 	bool claimed;
@@ -266,6 +283,22 @@ static const unsigned int mt8183_mutex_mdp_offset[MDP_PIPE_MAX] = {
 	[MDP_PIPE_WPEI2] = MT8183_MDP_PIPE_WPEI2,
 };
 
+static const unsigned int mt8195_mutex_vpp0_offset[MDP_PIPE_MAX] = {
+	[MDP_PIPE_WPEI] = MT8195_MDP_PIPE_WPEI,
+	[MDP_PIPE_WPEI2] = MT8195_MDP_PIPE_WPEI2,
+	[MDP_PIPE_RDMA0] = MT8195_MDP_PIPE_RDMA0,
+	[MDP_PIPE_VPP1_SOUT] = MT8195_MDP_PIPE_VPP1_SOUT,
+};
+
+static const unsigned int mt8195_mutex_vpp1_offset[MDP_PIPE_MAX] = {
+	[MDP_PIPE_SPLIT] = MT8195_MDP_PIPE_SPLIT,
+	[MDP_PIPE_SPLIT2] = MT8195_MDP_PIPE_SPLIT2,
+	[MDP_PIPE_RDMA1] = MT8195_MDP_PIPE_RDMA1,
+	[MDP_PIPE_RDMA2] = MT8195_MDP_PIPE_RDMA2,
+	[MDP_PIPE_RDMA3] = MT8195_MDP_PIPE_RDMA3,
+	[MDP_PIPE_VPP0_SOUT] = MT8195_MDP_PIPE_SPLIT,
+};
+
 static const struct mtk_mutex_data mt2701_mutex_driver_data = {
 	.mutex_mod = mt2701_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
@@ -306,6 +339,22 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
 	.no_clk = true,
 };
 
+static const struct mtk_mutex_data mt8195_vpp0_mutex_driver_data = {
+	.mutex_mod_reg = MT8195_DISP_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8195_DISP_MUTEX0_SOF,
+	.mutex_mdp_offset = mt8195_mutex_vpp0_offset,
+	.mutex_mdp_mod_mask = MT8195_MUTEX_MDP_MOD_MASK,
+	.mutex_mdp_sof_mask = MT8195_MUTEX_MDP_SOF_MASK,
+};
+
+static const struct mtk_mutex_data mt8195_vpp1_mutex_driver_data = {
+	.mutex_mod_reg = MT8195_DISP_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8195_DISP_MUTEX0_SOF,
+	.mutex_mdp_offset = mt8195_mutex_vpp1_offset,
+	.mutex_mdp_mod_mask = MT8195_MUTEX_MDP_MOD_MASK,
+	.mutex_mdp_sof_mask = MT8195_MUTEX_MDP_SOF_MASK,
+};
+
 struct mtk_mutex *mtk_mutex_get(struct device *dev)
 {
 	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
@@ -614,6 +663,10 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	  .data = &mt8173_mutex_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-mutex",
 	  .data = &mt8183_mutex_driver_data},
+	{ .compatible = "mediatek,mt8195-vpp0-mutex",
+	  .data = &mt8195_vpp0_mutex_driver_data},
+	{ .compatible = "mediatek,mt8195-vpp1-mutex",
+	  .data = &mt8195_vpp1_mutex_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
