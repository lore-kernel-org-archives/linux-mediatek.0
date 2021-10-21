Return-Path: <SRS0=9f7n=PJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1023CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 06:36:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D578D61284
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 06:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D578D61284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9yUshE4SxvrgsCvzMJ2svmhUehFP9XLPU5/rXRT038=; b=hg2hwrYLi6ByU3
	D3/OhREkLnUa09rgn36Z7CsphzZ8h5voO5vbk/ENgA4suzRx+L5eHfH0wlO3uQCy72z3lRsHWdZB8
	dv1QE4UzX8sIjBif33gQebF37soBlFU2GheIem1bWUdoS6Lo0jAsq08YicmDzOcWmUDOM4eBw260a
	D1YPiTL2/L0ze7zmk15RS3ErsXIbqVkDbJDIbELdrP9+Nq8htgrgORZiZFv83FgK2bRFpu3P5SbuQ
	ETl90E66pzdQzfg9zjMO37FOXv7Z0gCfMvI3WoYyY7min4EYa6M/faFS6lYLwZ3FzOP3y3ditUwyO
	ndoyh7Udls02hl74BTxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdRgY-006XSv-O4; Thu, 21 Oct 2021 06:36:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdRf6-006Wfm-4g; Thu, 21 Oct 2021 06:34:49 +0000
X-UUID: bcef2ddd6f9d4122b36a96d790bbebba-20211020
X-UUID: bcef2ddd6f9d4122b36a96d790bbebba-20211020
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1536580375; Wed, 20 Oct 2021 23:34:42 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Oct 2021 23:34:41 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 21 Oct 2021 14:34:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 21 Oct 2021 14:34:26 +0800
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
Subject: [PATCH v1 4/4] media: platform: mtk-mdp3: Set rdma compression reg in
 each frame
Date: Thu, 21 Oct 2021 14:34:14 +0800
Message-ID: <20211021063414.23663-5-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211021063414.23663-1-roy-cw.yeh@mediatek.com>
References: <20211021063414.23663-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_233448_202280_31BE017E 
X-CRM114-Status: GOOD (  13.83  )
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
 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c | 10 ++++++----
 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
index 12d6c88c68d2..dc0d1b3ff218 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
@@ -178,15 +178,17 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
 			/* Setup Compression Control */
 			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,
 				     rdma->comp_ctrl, write_mask);
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
 
+			/* Setup Compression Control */
+			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,
+				     rdma->comp_ctrl, write_mask);
+		} else {
 			/* Setup Compression Control */
 			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,
 				     rdma->comp_ctrl, write_mask);
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
index 875326afb686..1a15490d45e7 100644
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
