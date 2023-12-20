Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B25C46CCD
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 10:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qrd8CBtzSErqQa5akSqRWKSzMQ/dF9WTM7t56hIZFXg=; b=dW0Fytu5p0dFO4qt0n806uHfWH
	76VpPxxoapbZbu7Y81z51b7c6hw2mSftxJGYx9XKAGp6KfGpxs53TABT4vFBfHjDCLZTSabyYmHKQ
	ndF6In/249Al6wsIHhOSl1znsWgp8CyMZarm2TSV9Qyz61KthHnPbVfqBzTdCZdQOsUDcD2CK8KQK
	pIcJJ0Z7gUP1ZL2cnY4CJm4/hlbL/yInaNLMBbIhmvGy2qsX5jtCSg1xF6DP8qUwEvZSOTTXnLmwU
	/OAt+p+kRNLGQYs5B7u+bHj/hElkeRlJVfNbHn+cRjYH/j9Kn+FkWIrAFVbTjJOHQAt1fxJjywhC3
	OWJYUf7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtfj-00Gt7w-19;
	Wed, 20 Dec 2023 10:19:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtfe-00Gt4A-1x;
	Wed, 20 Dec 2023 10:19:24 +0000
X-UUID: 3bff2b989f2111ee9b09ad09c76753c8-20231220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Qrd8CBtzSErqQa5akSqRWKSzMQ/dF9WTM7t56hIZFXg=;
	b=FvEbXapWY4Qhprkysl4sVH9ZwfhmL4hlCedJadvSTybaaFCiXeLzbnlpUtNn5RwEvoYE5eN3XAbybw9uzGzM1ztETrpbnYj7QLxWuQ5waUhpIL9+XeWl33eCTcJhA3EcRrYVcoi8o/6Y3yT+hbC25R7C4fJU7MDJP/+KujPveMM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:e483b0fa-5714-458e-a64e-dd0ef72f2b9a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:9f687a7e-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3bff2b989f2111ee9b09ad09c76753c8-20231220
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2102697537; Wed, 20 Dec 2023 03:19:18 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Dec 2023 18:18:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Dec 2023 18:18:39 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v9 05/12] media: platform: mtk-mdp3: add checks for dummy components
Date: Wed, 20 Dec 2023 18:18:31 +0800
Message-ID: <20231220101838.21510-6-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231220101838.21510-1-moudy.ho@mediatek.com>
References: <20231220101838.21510-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.872600-8.000000
X-TMASE-MatchedRID: wjXr8BNNQ6gBiF1BcicujnV895e/Bd2J1KoSW5Ji1Xv/evmlVf9xZpeS
	PuHyHNrhlTJXKqh1ne2tsViygrLz2i2W7Y+Npd9R4pdq9sdj8LXbKTxp3+WtIF4ZlrnygRdkH+9
	NxCXWsGghV3ms47WK7+B+gRoSa3oDFGDwHFCuATSWLCkl1lq7B5FLUnnvueyBEB/Asc4oaYEOgZ
	RjdFiqzQQyWbFmlWkxJAM20RFs/ZvVFtf7bVfns3TnOygHVQpOF7+vaWTP+FMD68pdUls5ss+cJ
	FTrDBt4RcK0DrBkisuAMuqetGVetksDkkP3zIjq3QfwsVk0UbswamAE0joFowYTMJo9dgTIRkwE
	Q8Bln+DRs0WnPjdeHdJBtxJYSqVYc+OKqv5cBQz+ooybmJZW2plPG6tTzRZavoNxQ/8+qOwOAWC
	Aw3j1SYCE5xpCtDRTUbJFyh4XXyqYo/TPOlMB4bCh3zE4wqa8wIE77PEBbml+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.872600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6430B74F991D337D0D74B4FE9483499BD92786DF81C9284614415CD961E801EF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_021922_655012_167B20BD 
X-CRM114-Status: GOOD (  17.23  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some components act as bridges only and do not require full configuration.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../platform/mediatek/mdp3/mdp_cfg_data.c     |  8 +++
 .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |  1 +
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 58 ++++++++++++++++++-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    |  9 ++-
 4 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c b/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
index fcc582292b77..fe92c0474bfa 100644
--- a/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
+++ b/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
@@ -451,3 +451,11 @@ enum mtk_mdp_comp_id mdp_cfg_get_id_public(struct mdp_dev *mdp_dev, s32 inner_id
 err_public_id:
 	return public_id;
 }
+
+bool mdp_cfg_comp_is_dummy(struct mdp_dev *mdp_dev, s32 inner_id)
+{
+	enum mtk_mdp_comp_id id = mdp_cfg_get_id_public(mdp_dev, inner_id);
+	enum mdp_comp_type type = mdp_dev->mdp_data->comp_data[id].match.type;
+
+	return (type == MDP_COMP_TYPE_DUMMY);
+}
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h
index dee57cc4a954..dfffc72868e4 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h
@@ -16,5 +16,6 @@ enum mtk_mdp_comp_id;
 
 s32 mdp_cfg_get_id_inner(struct mdp_dev *mdp_dev, enum mtk_mdp_comp_id id);
 enum mtk_mdp_comp_id mdp_cfg_get_id_public(struct mdp_dev *mdp_dev, s32 id);
+bool mdp_cfg_comp_is_dummy(struct mdp_dev *mdp_dev, s32 inner_id);
 
 #endif  /* __MTK_MDP3_CFG_H__ */
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index 31930ddbc828..a81caf5f472c 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -6,6 +6,7 @@
 
 #include <linux/mailbox_controller.h>
 #include <linux/platform_device.h>
+#include "mtk-mdp3-cfg.h"
 #include "mtk-mdp3-cmdq.h"
 #include "mtk-mdp3-comp.h"
 #include "mtk-mdp3-core.h"
@@ -108,6 +109,12 @@ static int mdp_path_subfrm_require(const struct mdp_path *path,
 
 	/* Set mutex mod */
 	for (index = 0; index < num_comp; index++) {
+		s32 inner_id = MDP_COMP_NONE;
+
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
+			continue;
 		ctx = &path->comps[index];
 		if (is_output_disabled(p_id, ctx->param, count))
 			continue;
@@ -132,6 +139,7 @@ static int mdp_path_subfrm_run(const struct mdp_path *path,
 	int index;
 	u32 num_comp = 0;
 	s32 event;
+	s32 inner_id = MDP_COMP_NONE;
 
 	if (-1 == p->mutex_id) {
 		dev_err(dev, "Incorrect mutex id");
@@ -144,6 +152,10 @@ static int mdp_path_subfrm_run(const struct mdp_path *path,
 	/* Wait WROT SRAM shared to DISP RDMA */
 	/* Clear SOF event for each engine */
 	for (index = 0; index < num_comp; index++) {
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
+			continue;
 		ctx = &path->comps[index];
 		if (is_output_disabled(p_id, ctx->param, count))
 			continue;
@@ -158,6 +170,10 @@ static int mdp_path_subfrm_run(const struct mdp_path *path,
 
 	/* Wait SOF events and clear mutex modules (optional) */
 	for (index = 0; index < num_comp; index++) {
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
+			continue;
 		ctx = &path->comps[index];
 		if (is_output_disabled(p_id, ctx->param, count))
 			continue;
@@ -183,6 +199,12 @@ static int mdp_path_ctx_init(struct mdp_dev *mdp, struct mdp_path *path)
 		return -EINVAL;
 
 	for (index = 0; index < num_comp; index++) {
+		s32 inner_id = MDP_COMP_NONE;
+
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
+			continue;
 		if (CFG_CHECK(MT8183, p_id))
 			param = (void *)CFG_ADDR(MT8183, path->config, components[index]);
 		ret = mdp_comp_ctx_config(mdp, &path->comps[index],
@@ -204,6 +226,7 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	struct mdp_pipe_info pipe;
 	int index, ret;
 	u32 num_comp = 0;
+	s32 inner_id = MDP_COMP_NONE;
 
 	if (CFG_CHECK(MT8183, p_id))
 		num_comp = CFG_GET(MT8183, path->config, num_components);
@@ -223,6 +246,10 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	}
 	/* Config sub-frame information */
 	for (index = (num_comp - 1); index >= 0; index--) {
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
+			continue;
 		ctx = &path->comps[index];
 		if (is_output_disabled(p_id, ctx->param, count))
 			continue;
@@ -236,6 +263,10 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 		return ret;
 	/* Wait components done */
 	for (index = 0; index < num_comp; index++) {
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
+			continue;
 		ctx = &path->comps[index];
 		if (is_output_disabled(p_id, ctx->param, count))
 			continue;
@@ -245,6 +276,10 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	}
 	/* Advance to the next sub-frame */
 	for (index = 0; index < num_comp; index++) {
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
+			continue;
 		ctx = &path->comps[index];
 		ret = call_op(ctx, advance_subfrm, cmd, count);
 		if (ret)
@@ -268,6 +303,7 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
 	int index, count, ret;
 	u32 num_comp = 0;
 	u32 num_sub = 0;
+	s32 inner_id = MDP_COMP_NONE;
 
 	if (CFG_CHECK(MT8183, p_id))
 		num_comp = CFG_GET(MT8183, path->config, num_components);
@@ -278,6 +314,10 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
 	/* Config path frame */
 	/* Reset components */
 	for (index = 0; index < num_comp; index++) {
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
+			continue;
 		ctx = &path->comps[index];
 		ret = call_op(ctx, init_comp, cmd);
 		if (ret)
@@ -289,6 +329,11 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
 		u32 out = 0;
 
 		ctx = &path->comps[index];
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
+			continue;
+
 		if (CFG_CHECK(MT8183, p_id))
 			out = CFG_COMP(MT8183, ctx->param, outputs[0]);
 
@@ -306,6 +351,10 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
 	}
 	/* Post processing information */
 	for (index = 0; index < num_comp; index++) {
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[index].type);
+		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
+			continue;
 		ctx = &path->comps[index];
 		ret = call_op(ctx, post_process, cmd);
 		if (ret)
@@ -508,9 +557,16 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	}
 	cmdq_pkt_finalize(&cmd->pkt);
 
-	for (i = 0; i < num_comp; i++)
+	for (i = 0; i < num_comp; i++) {
+		s32 inner_id = MDP_COMP_NONE;
+
+		if (CFG_CHECK(MT8183, p_id))
+			inner_id = CFG_GET(MT8183, path->config, components[i].type);
+		if (mdp_cfg_comp_is_dummy(mdp, inner_id))
+			continue;
 		memcpy(&comps[i], path->comps[i].comp,
 		       sizeof(struct mdp_comp));
+	}
 
 	mdp->cmdq_clt->client.rx_callback = mdp_handle_cmdq_callback;
 	cmd->mdp = mdp;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index 575c8d52acd1..93df2e013438 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -853,6 +853,9 @@ int mdp_comp_clocks_on(struct device *dev, struct mdp_comp *comps, int num)
 	int i, ret;
 
 	for (i = 0; i < num; i++) {
+		/* Bypass the dummy component*/
+		if (!comps[i].mdp_dev)
+			continue;
 		ret = mdp_comp_clock_on(dev, &comps[i]);
 		if (ret)
 			return ret;
@@ -865,8 +868,12 @@ void mdp_comp_clocks_off(struct device *dev, struct mdp_comp *comps, int num)
 {
 	int i;
 
-	for (i = 0; i < num; i++)
+	for (i = 0; i < num; i++) {
+		/* Bypass the dummy component*/
+		if (!comps[i].mdp_dev)
+			continue;
 		mdp_comp_clock_off(dev, &comps[i]);
+	}
 }
 
 static int mdp_get_subsys_id(struct mdp_dev *mdp, struct device *dev,
-- 
2.18.0


