Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67018C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 09:33:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26A13610CB
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 09:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26A13610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gso1za2JHKYUd+R8NaRH+uVVtJp+yxnWWotQR+ashzY=; b=EI3m67O+dCStXY
	PzZxRU6tffCSbrtnHLT3k3mdscNXXwpzBxKKAYxlQKpXLIzYlVmas7saS/49mXK/Bq4gCaN9UCMZE
	o0RkaElpO9Tlltouon/cPTzRqMRQqKDBUiQ9Gd8eRrq3+maFaqzChWv06pnC3p/7jEvAOFrOCfJKe
	RZe+9HZB6Y2gBkxgi3Z1iYHUe1f6LJziLmQkrjHyWu9IC2nY0s1V+CMFWHvj2FPMwiPpfxP1P4CKV
	WZ3ifZD8q/OFA+GAsKzM9v9mMUPSB5p69UETJelwDliOBGJvf/9elvj3SlVCEbHVmBWFUo74SnYu0
	sK14G+PO5yO2Mdf5mVYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdqvp-00ANhx-Cl; Fri, 22 Oct 2021 09:33:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdqvD-00ANXk-R4; Fri, 22 Oct 2021 09:33:09 +0000
X-UUID: cc522224749f40bc880601f1b1045d30-20211022
X-UUID: cc522224749f40bc880601f1b1045d30-20211022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 615662159; Fri, 22 Oct 2021 02:33:03 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Oct 2021 02:28:31 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 22 Oct 2021 17:28:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Oct 2021 17:28:28 +0800
From: roy-cw.yeh <roy-cw.yeh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Fabien Parent
 <fparent@baylibre.com>, "Roy-CW . Yeh" <roy-cw.yeh@mediatek.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 4/4] media: platform: mtk-mdp3: Set rdma compression reg in
 each frame
Date: Fri, 22 Oct 2021 17:28:27 +0800
Message-ID: <20211022092827.24631-5-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211022092827.24631-1-roy-cw.yeh@mediatek.com>
References: <20211022092827.24631-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_023307_886562_7FE377BB 
X-CRM114-Status: GOOD (  12.51  )
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

Set rdma compression reg in each frame

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c    | 18 ++++++------------
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c    |  2 +-
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
index 12d6c88c68d2..3424e609de55 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
@@ -174,24 +174,18 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
 				     ((width + 31) >> 5) << 5, 0x001FFFFF);
 			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_H_SIZE_IN_PXL,
 				     ((height + 7) >> 3) << 3, 0x001FFFFF);
-
-			/* Setup Compression Control */
-			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,
-				     rdma->comp_ctrl, write_mask);
-		}
-
-		if (mdp_cfg->rdma_support_afbc &&
-		    (MDP_COLOR_IS_COMPRESS(colorformat))) {
+		} else if (mdp_cfg->rdma_support_afbc &&
+			   (MDP_COLOR_IS_COMPRESS(colorformat))) {
 			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_SIZE_IN_PXL,
 				     ((width + 31) >> 5) << 5, 0x001FFFFF);
 			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_H_SIZE_IN_PXL,
 				     ((height + 7) >> 3) << 3, 0x001FFFFF);
-
-			/* Setup Compression Control */
-			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,
-				     rdma->comp_ctrl, write_mask);
 		}
 
+		/* Setup Compression Control */
+		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,
+			     rdma->comp_ctrl, write_mask);
+
 		if (mdp_cfg->rdma_esl_setting) {
 			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_0,
 				     rdma->dmabuf_con0, 0x0FFF00FF);
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
index 51f7ef2b31ce..06bcd7505c4b 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
@@ -34,7 +34,7 @@ static const struct mdp_platform_config mt8195_plat_cfg = {
 	.rdma_support_afbc              = true,
 	.rdma_esl_setting               = true,
 	.rdma_rsz1_sram_sharing         = false,
-	.rdma_upsample_repeat_only      = true,
+	.rdma_upsample_repeat_only      = false,
 	.rsz_disable_dcm_small_sample   = false,
 	.rsz_etc_control                = true,
 	.wrot_filter_constraint         = false,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
