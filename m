Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C69CD4F32
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 07:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CX3ld0AtP64ZccAhAQbdWTp3psgMnFvDLW9/WAY4Kj8=; b=Bn5pz4kUJprlMpayy83x4QXjm6
	safWeDX78Q5ecTqRLHBgV540lZ7z+qKv1xrNN/wVEWM/8k8Dbq7jBygtMg4wdvNLk9MNPyFAXhz7/
	+mWrtkPpczz61AKGOTtgtJiewbU2hBLnhPEjkqILYkuH5d3pj9JtbCuJKV+qdxiDEnoyftmI5V1OV
	A2nCxNqROQ27hmmGkdTj3LPH3Xd5rY2UZ38YQLNQFJggzugv9KN1Ez/+5NsWAvA/2Bkt8PbFH9rQ3
	+dvzwnj37p72cBtSTd+UfUhCGwhejCNGui/X4axzs0Tz5YZBXWypY/zTmYGrRitaSfBLdhli3WJh1
	KKgnio5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjanV-008E8j-25;
	Fri, 22 Sep 2023 07:41:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjanQ-008E43-2U;
	Fri, 22 Sep 2023 07:41:54 +0000
X-UUID: 7d5e5a56591b11ee9b7791016c24628a-20230922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CX3ld0AtP64ZccAhAQbdWTp3psgMnFvDLW9/WAY4Kj8=;
	b=gqwWh18pO3wsn7cSCNro3Qa9bWad8IsUaXNvPtLDu6URxLO01MgOjRwCL4dRzpztbNruKJktsxn+o+fKHpl/AOedlMnEJUDRSdfcViJA2l1nf1r3g2Hc9b+WWgpkFTBBtkvhQAVMHXKZoUxgMTXvKCEPDSsOhHRAs4lHkBhmCfY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:be1f6557-b1ac-46ae-b905-b97b79603027,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:133d55c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7d5e5a56591b11ee9b7791016c24628a-20230922
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1118243069; Fri, 22 Sep 2023 00:41:49 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Sep 2023 15:41:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Sep 2023 15:41:46 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ping-Hsun Wu
	<ping-hsun.wu@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v6 05/13] media: platform: mtk-mdp3: add checks for dummy components
Date: Fri, 22 Sep 2023 15:41:37 +0800
Message-ID: <20230922074145.11977-6-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230922074145.11977-1-moudy.ho@mediatek.com>
References: <20230922074145.11977-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_004152_810347_28482DFB 
X-CRM114-Status: GOOD (  18.22  )
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
index 370f840ec593..708c3f39c451 100644
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
@@ -288,6 +328,11 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
 		const struct v4l2_rect *compose;
 		u32 out = 0;
 
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
index 667933ea15f4..1831e3d9b0e3 100644
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


