Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4306BCD4F27
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 07:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IERTjL3EK6IdjaMsrf6wSQkbWHTgExrtMArEuCEwW8=; b=JrP4nCt1/FG1jwfTNMoUV8IRkj
	0fC6eI5elnkD3fV7ezsp0e3en8q89Vk0upCJbABsLJppaZbiQ30MN+TgojEZZM4zCI+IpgafUNpPU
	UD/bEgyV0QFJM6Qaf4ViRWSF22wxC04PCWWbo65yH2KWwXyHev/AHI0spbyfxIOzrmJPxKIGroasb
	QJA+MvB84eBzgELuaktA2MzJLL28jxAUBdKYErPuaBoq9iIrSKaVptmZCqVYqFUc8bZdZIDL2A3Rd
	Yma3gL13z0g1AbuDOyjLKGeE4mvZEYeleQ9bd2d5cLeTCbEYQBzcMXt+YL0BOrtY2/ylDjbvijcka
	3cqF/qGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjand-008EFW-3C;
	Fri, 22 Sep 2023 07:42:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjanS-008E43-1v;
	Fri, 22 Sep 2023 07:41:56 +0000
X-UUID: 7e75792e591b11ee9b7791016c24628a-20230922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6IERTjL3EK6IdjaMsrf6wSQkbWHTgExrtMArEuCEwW8=;
	b=HeQ+dJf+6fXZsfsjbdU24Eum2XKwatbd9ykkV+FSa2laUxBjuOliUEXSJ6EljemzDcDVEcUewFVsq6D6BkvtqCPitOKdlWu9sPjMmRj6hUJO449PkQ2dW9ZlB3/77ITtgDKG8gRgACSn6tW6AQLCrBrA40wuB813UKDOWc/E4nc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:70cb0aba-367e-4f95-b773-04b380a97f46,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:e6983e14-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7e75792e591b11ee9b7791016c24628a-20230922
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1634067260; Fri, 22 Sep 2023 00:41:51 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Sep 2023 15:41:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Sep 2023 15:41:47 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ping-Hsun Wu
	<ping-hsun.wu@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>,
	"Hans Verkuil" <hverkuil-cisco@xs4all.nl>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v6 08/13] media: platform: mtk-mdp3: add support for blending multiple components
Date: Fri, 22 Sep 2023 15:41:40 +0800
Message-ID: <20230922074145.11977-9-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230922074145.11977-1-moudy.ho@mediatek.com>
References: <20230922074145.11977-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.836800-8.000000
X-TMASE-MatchedRID: zGpV5UNF2R9ILSVPxvZJcHV895e/Bd2JO8xCfog1G6TfUZT83lbkECKI
	UiL7FC/vhVmF9kz2wxLhgM7lrVqO2A719kpOO37PJQI+kfsRJdq7nrAU9KQxUb/A+0D1to6PuiV
	mRyWjcdlMmm8bxtFZ3f1/2RbvJIzKGAdnzrnkM48URSScn+QSXt0H8LFZNFG7CKFCmhdu5cWXJh
	wSAIObjWWLJ1VRG4T6OMu36zQ+zdEWaAk99RWVTIkg75gljJI0ANrN9e8JWfZ806dJXWFBo9MaR
	QaFgo5UMqScAIoSfpAXRoPmWO3jekxwdkPqCq7vDEyN+J8hd+jCS9WgDXVPCp6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.836800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7139C4553C03C092FE7169FB2E2016391A82102F0862A4853FBEBF3FD8E0D9D92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_004154_667668_398296EE 
X-CRM114-Status: GOOD (  15.27  )
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

Certain chips can combine several components to form complex virtual
units with advanced functions.
These components require simultaneous configuration of their MODs and
clocks.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 10 ++++++-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 29 +++++++++++++++++--
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  7 +++++
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index 708c3f39c451..69eb85c04047 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -110,17 +110,25 @@ static int mdp_path_subfrm_require(const struct mdp_path *path,
 	/* Set mutex mod */
 	for (index = 0; index < num_comp; index++) {
 		s32 inner_id = MDP_COMP_NONE;
+		const u32 *mutex_idx;
+		const struct mdp_comp_blend *b;
 
 		if (CFG_CHECK(MT8183, p_id))
 			inner_id = CFG_GET(MT8183, path->config, components[index].type);
 		if (mdp_cfg_comp_is_dummy(path->mdp_dev, inner_id))
 			continue;
+
 		ctx = &path->comps[index];
 		if (is_output_disabled(p_id, ctx->param, count))
 			continue;
+
+		mutex_idx = data->mdp_mutex_table_idx;
 		id = ctx->comp->public_id;
-		mtk_mutex_write_mod(mutex, data->mdp_mutex_table_idx[id], false);
+		mtk_mutex_write_mod(mutex, mutex_idx[id], false);
 
+		b = &data->comp_data[id].blend;
+		if (b && b->aid_mod)
+			mtk_mutex_write_mod(mutex, mutex_idx[b->b_id], false);
 	}
 
 	mtk_mutex_write_sof(mutex, MUTEX_SOF_IDX_SINGLE_MODE);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index 2bf4a6b391b7..b942cc3a1865 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -864,12 +864,26 @@ int mdp_comp_clocks_on(struct device *dev, struct mdp_comp *comps, int num)
 	int i, ret;
 
 	for (i = 0; i < num; i++) {
+		struct mdp_dev *m = comps[i].mdp_dev;
+		enum mtk_mdp_comp_id id;
+		const struct mdp_comp_blend *b;
+
 		/* Bypass the dummy component*/
-		if (!comps[i].mdp_dev)
+		if (!m)
 			continue;
+
 		ret = mdp_comp_clock_on(dev, &comps[i]);
 		if (ret)
 			return ret;
+
+		id = comps[i].public_id;
+		b = &m->mdp_data->comp_data[id].blend;
+
+		if (b && b->aid_clk) {
+			ret = mdp_comp_clock_on(dev, m->comp[b->b_id]);
+			if (ret)
+				return ret;
+		}
 	}
 
 	return 0;
@@ -880,10 +894,21 @@ void mdp_comp_clocks_off(struct device *dev, struct mdp_comp *comps, int num)
 	int i;
 
 	for (i = 0; i < num; i++) {
+		struct mdp_dev *m = comps[i].mdp_dev;
+		enum mtk_mdp_comp_id id;
+		const struct mdp_comp_blend *b;
+
 		/* Bypass the dummy component*/
-		if (!comps[i].mdp_dev)
+		if (!m)
 			continue;
+
 		mdp_comp_clock_off(dev, &comps[i]);
+
+		id = comps[i].public_id;
+		b = &m->mdp_data->comp_data[id].blend;
+
+		if (b && b->aid_clk)
+			mdp_comp_clock_off(dev, m->comp[b->b_id]);
 	}
 }
 
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
index e6cbc6ab6bae..3e5d2da1c807 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
@@ -201,9 +201,16 @@ struct mdp_comp_info {
 	u32 dts_reg_ofst;
 };
 
+struct mdp_comp_blend {
+	enum mtk_mdp_comp_id b_id;
+	bool aid_mod;
+	bool aid_clk;
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


