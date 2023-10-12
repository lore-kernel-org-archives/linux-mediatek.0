Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38EECDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9t66eupdQbqY1SPNNEWt39SPeekiajLoj3HqZcc4co=; b=pGiFq1OH0ptxt4IrCrxXGGPBmj
	YlRc/ERaY0BfYon/708w9XMEKL3f/fw4amAyGcUyzKSx3VhIAZ9qEwp35zaXkyZ41c0HyoNYsIpvO
	Uh8iEa7ChoQ+Qy9hpCgwppqk30+Poow7E3P5eSsISctNu/hYdQcSpaj8y9eawQPxWNhvGonTlD0aN
	XIa3XwWvJATZGg/XVBepU0eM8f8ErqbbNajp2WLg/Uyoe7L7NKC7Y6RTgF0CKvQ7z5de+KTbAJ+w7
	U9azqhuHIwrvK0uDYv+UugiLxtgZ1N1Ev77Gk6t3/XyIoW+nwPepgvk5T716Fn19O37pxxEXt57Le
	EIvtWUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrkS-000KqR-26;
	Thu, 12 Oct 2023 09:12:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrkP-000KnQ-2B;
	Thu, 12 Oct 2023 09:12:51 +0000
X-UUID: 81855cbe68df11ee9b7791016c24628a-20231012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=T9t66eupdQbqY1SPNNEWt39SPeekiajLoj3HqZcc4co=;
	b=bCm6njPmc/S+tua7hNwzZB7yRl3E0uV8zs72yyTdX13Tze46weq+5tl5J4zT0E/1hs34FjgUePyEAWyKFV0ZE4f86iheCQ4tFZwDJKIILGNhJoiJJoLXKcvX36+d65/tS0mLhR/Syyw/KZQN46rE67z7CPHZbpj1bMBj3ZudWxw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:e576562f-3d2a-4934-98cd-cd79f91e6470,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:635c0ac4-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 81855cbe68df11ee9b7791016c24628a-20231012
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 336608942; Thu, 12 Oct 2023 02:12:45 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Oct 2023 17:12:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Oct 2023 17:12:08 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ping-Hsun Wu
	<ping-hsun.wu@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>,
	"Hans Verkuil" <hverkuil-cisco@xs4all.nl>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v7 07/12] media: platform: mtk-mdp3: extend GCE event waiting in RDMA and WROT
Date: Thu, 12 Oct 2023 17:12:01 +0800
Message-ID: <20231012091206.20165-8-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231012091206.20165-1-moudy.ho@mediatek.com>
References: <20231012091206.20165-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.856400-8.000000
X-TMASE-MatchedRID: mJkk328f4R4mNHlC7DQV5eKXavbHY/C1dG7bDJL8qEe0rcU5V/oSe/dQ
	3ETtBTk8CTzLWkg2tvC1JEhwlIePJTA9KOtcb1F9t1AhvyEKdj67nrAU9KQxUWJkJOQVCIpw8Fh
	GjTp5WPdMtAAmLKD7vIAy6p60ZV62fJ5/bZ6npdiyO81X3yak8zl8w34waCja/Od8+hmIU7Zi3g
	oq7WAA4/cbPxaxxyIHzD+gHU7LsiF+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.856400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E37474EB8057795756363DBD703D89781887D15642B42685E7FC2086B0846F872000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_021249_767700_4AA3402A 
X-CRM114-Status: GOOD (  14.60  )
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

Support for multiple RDMA/WROT waits for GCE events.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../platform/mediatek/mdp3/mdp_cfg_data.c     |  2 ++
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 27 +++++++++++++------
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  2 ++
 3 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c b/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
index 6f77c33074ec..3834efe54e17 100644
--- a/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
+++ b/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
@@ -56,8 +56,10 @@ static const struct mdp_platform_config mt8183_plat_cfg = {
 	.rdma_support_10bit		= true,
 	.rdma_rsz1_sram_sharing		= true,
 	.rdma_upsample_repeat_only	= true,
+	.rdma_event_num			= 1,
 	.rsz_disable_dcm_small_sample	= false,
 	.wrot_filter_constraint		= false,
+	.wrot_event_num			= 1,
 };
 
 static const u32 mt8183_mutex_idx[MDP_MAX_COMP_COUNT] = {
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index 1831e3d9b0e3..2bf4a6b391b7 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -251,14 +251,20 @@ static int config_rdma_subfrm(struct mdp_comp_ctx *ctx,
 
 static int wait_rdma_event(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 {
+	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
 	struct device *dev = &ctx->comp->mdp_dev->pdev->dev;
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
 
-	if (ctx->comp->alias_id == 0)
-		MM_REG_WAIT(cmd, ctx->comp->gce_event[MDP_GCE_EVENT_EOF]);
-	else
-		dev_err(dev, "Do not support RDMA1_DONE event\n");
+	if (!mdp_cfg)
+		return -EINVAL;
+
+	if (ctx->comp->alias_id >= mdp_cfg->rdma_event_num) {
+		dev_err(dev, "Invalid RDMA event %d\n", ctx->comp->alias_id);
+		return -EINVAL;
+	}
+
+	MM_REG_WAIT(cmd, ctx->comp->gce_event[MDP_GCE_EVENT_EOF]);
 
 	/* Disable RDMA */
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_EN, 0x0, BIT(0));
@@ -553,10 +559,15 @@ static int wait_wrot_event(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
 
-	if (ctx->comp->alias_id == 0)
-		MM_REG_WAIT(cmd, ctx->comp->gce_event[MDP_GCE_EVENT_EOF]);
-	else
-		dev_err(dev, "Do not support WROT1_DONE event\n");
+	if (!mdp_cfg)
+		return -EINVAL;
+
+	if (ctx->comp->alias_id >= mdp_cfg->wrot_event_num) {
+		dev_err(dev, "Invalid WROT event %d!\n", ctx->comp->alias_id);
+		return -EINVAL;
+	}
+
+	MM_REG_WAIT(cmd, ctx->comp->gce_event[MDP_GCE_EVENT_EOF]);
 
 	if (mdp_cfg && mdp_cfg->wrot_filter_constraint)
 		MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE, 0x0,
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 22d1b17ef2fc..e57c415a1c78 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -49,8 +49,10 @@ struct mdp_platform_config {
 	bool	rdma_support_10bit;
 	bool	rdma_rsz1_sram_sharing;
 	bool	rdma_upsample_repeat_only;
+	u32	rdma_event_num;
 	bool	rsz_disable_dcm_small_sample;
 	bool	wrot_filter_constraint;
+	u32	wrot_event_num;
 };
 
 /* indicate which mutex is used by each pipepline */
-- 
2.18.0


