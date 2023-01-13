Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85624C678D6
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 09:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZgR6XrcQdfRcjoVZjERFvas8vDe9zTI0Gm4QdyJhqc=; b=eh03GOxUtHJmDWYxrepCJGLxR/
	L9/p//tc3LMYJH+nU3WuQzpEgp7/UvrdYKpF2kiSCLHmxQDDg3sh20emismmT+M54kxm6RUErhXFQ
	gtuLPGfW+Ti5qKO5T+n8Ex59nrwsYkF3o1mMJc8fc3AC9GigHPUGP5eKCZGcKaHuS0mAL7faR+FoB
	gU/NimHD+ZfF+WfnCfWH8aWtT+KJykdEsb0a9MTh9T26Ndn+8KCXDnsk326efKewh+kkYP0jdE2L5
	ZK+lgwPG5awlYTY6eWZFU3OSVW1LixLHUrzK8aAtPIldjGBCYfUqYiPkeo9cMoDutmMJsN2B/wpwg
	xRA18/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFyQ-001MwL-EA; Fri, 13 Jan 2023 09:03:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFyK-001Ms5-6X
	for linux-mediatek@lists.infradead.org; Fri, 13 Jan 2023 09:03:39 +0000
X-UUID: 264ebcb2932111edbbe3f76fe852e059-20230113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vZgR6XrcQdfRcjoVZjERFvas8vDe9zTI0Gm4QdyJhqc=;
	b=XDVTnyhIxtXvjh+IQhS3uwwBcxEvW9979NeB1dnex407cN/AlzPj2VdoI6FVrHZwXNt09EBs8ONWZHjXgxyt/t6jl2FwNHNVgWR0iyRtk/t56ZxtIjL0Y8cCl3gfrEZmHQ3uFyfWTbbbea8Ku2Boz4/0oGltvB4RK9Yx3MB8VoI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:25791582-df3a-4e92-bbe2-403fffd04f2c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:cf75baf5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 264ebcb2932111edbbe3f76fe852e059-20230113
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 508840365; Fri, 13 Jan 2023 02:03:30 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 17:03:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 17:03:23 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v3 09/13] media: platform: mtk-mdp3: add the blend of component in MUTEX MOD
Date: Fri, 13 Jan 2023 17:03:17 +0800
Message-ID: <20230113090321.25128-10-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230113090321.25128-1-moudy.ho@mediatek.com>
References: <20230113090321.25128-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_010336_266429_28133C4A 
X-CRM114-Status: GOOD (  11.91  )
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

In further chips, some components will cooperate to achieve
advanced functions, and these MODs need to be set at the same time.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 6 ++++++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index 72b5dc4cb3b1..f21dfce9098e 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -122,6 +122,7 @@ static int mdp_path_subfrm_require(const struct mdp_path *path,
 	/* Set mutex mod */
 	for (index = 0; index < num_comp; index++) {
 		s32 inner_id = MDP_COMP_NONE;
+		const struct mdp_comp_blend *b;
 
 		if (CFG_CHECK(MT8183, p_id))
 			inner_id = CFG_GET(MT8183, path->config, components[index].type);
@@ -133,6 +134,11 @@ static int mdp_path_subfrm_require(const struct mdp_path *path,
 		id = ctx->comp->public_id;
 		mtk_mutex_write_mod(mutex, data->mdp_mutex_table_idx[id], false);
 
+		b = &data->comp_data[id].blend;
+		if (b->mod_aid)
+			mtk_mutex_write_mod(mutex,
+					    data->mdp_mutex_table_idx[b->mod_id],
+					    false);
 	}
 
 	mtk_mutex_write_sof(mutex, MUTEX_SOF_IDX_SINGLE_MODE);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
index d9442679cf53..c91d87359b17 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
@@ -201,9 +201,15 @@ struct mdp_comp_info {
 	u32 dts_reg_ofst;
 };
 
+struct mdp_comp_blend {
+	bool mod_aid;
+	enum mtk_mdp_comp_id mod_id;
+};
+
 struct mdp_comp_data {
 	struct mdp_comp_match match;
 	struct mdp_comp_info info;
+	struct mdp_comp_blend blend;
 };
 
 struct mdp_comp_ops;
-- 
2.18.0


