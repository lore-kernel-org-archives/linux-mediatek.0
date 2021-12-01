Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62A1C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 09:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bo3tDVEM63YxD6sUyxcJ4fouyO/741JM0w9FEIYaFPk=; b=HC1qG3o9RwpS0R
	3G3tON56r3VbIhj+Ky7AM03t3BSBDhFqkvvnEAMrRLl8Q0QxExf7WGODqDNIcLn1+44371v/FPQvH
	d5tCfPryatOm45Q5Es5ivVY5ishbvHG58zmIcGRd0F0+W6hQb6H79H4ryyjcyzEqj37YoFNioF4vK
	Yf2lVVh3mVYB54bUFyMk1tT/aQTioUWuSrHxPYkegzhQ/UEtP2ovi0xGeaYUHiK/Tp+WajQ5/t0Xt
	00FSpdUbodrhbu+5YMhyh76diENGCXidN/NR6MYy3wasts+arvJ8+yW2b3mxPIVvGnLBHKiTuj0E8
	yHxmvocLvw7R6RXCJ65Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msMHw-007zmS-BY; Wed, 01 Dec 2021 09:52:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msMHT-007zSK-4c; Wed, 01 Dec 2021 09:52:04 +0000
X-UUID: 1c08a1b5bf334249a5000c46d83efb8d-20211201
X-UUID: 1c08a1b5bf334249a5000c46d83efb8d-20211201
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 681526568; Wed, 01 Dec 2021 02:51:59 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Dec 2021 01:51:04 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 1 Dec 2021 17:51:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 1 Dec 2021 17:51:02 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jernej Skrabec <jernej.skrabec@siol.net>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Alexandre Courbot <acourbot@chromium.org>, <tfiga@chromium.org>,
 <drinkcat@chromium.org>, <pihsun@chromium.org>, <hsinyi@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <randy.wu@mediatek.com>,
 <moudy.ho@mediatek.com>, <jason-jh.lin@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
 <srv_heupstream@mediatek.com>
Subject: [PATCH v9 3/7] soc: mediatek: mutex: add support for MDP
Date: Wed, 1 Dec 2021 17:50:27 +0800
Message-ID: <20211201095031.31606-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211201095031.31606-1-moudy.ho@mediatek.com>
References: <20211201095031.31606-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_015203_224409_C9844B6B 
X-CRM114-Status: GOOD (  15.70  )
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

For the purpose of module independence, related settings should be moved
from MDP to the corresponding driver.
This patch adds more 8183 MDP settings and interface.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c       | 33 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mutex.h |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 2ca55bb5a8be..e5e6255f5b84 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -119,6 +119,10 @@
 #define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
 #define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
 
+#define MT8183_MUTEX_MDP_START			5
+#define MT8183_MUTEX_MDP_MOD_MASK		0x07FFFFFF
+#define MT8183_MUTEX_MDP_SOF_MASK		0x00000007
+
 struct mtk_mutex {
 	int id;
 	bool claimed;
@@ -139,6 +143,9 @@ struct mtk_mutex_data {
 	const unsigned int *mutex_sof;
 	const unsigned int mutex_mod_reg;
 	const unsigned int mutex_sof_reg;
+	const unsigned int *mutex_mdp_offset;
+	const unsigned int mutex_mdp_mod_mask;
+	const unsigned int mutex_mdp_sof_mask;
 	const bool no_clk;
 };
 
@@ -264,6 +271,14 @@ static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
 	[MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
 };
 
+/* indicate which mutex is used by each pipepline */
+static const unsigned int mt8183_mutex_mdp_offset[MDP_PIPE_MAX] = {
+	[MDP_PIPE_IMGI] = MT8183_MUTEX_MDP_START,
+	[MDP_PIPE_RDMA0] = MT8183_MUTEX_MDP_START + 1,
+	[MDP_PIPE_WPEI] = MT8183_MUTEX_MDP_START + 2,
+	[MDP_PIPE_WPEI2] = MT8183_MUTEX_MDP_START + 3
+};
+
 static const struct mtk_mutex_data mt2701_mutex_driver_data = {
 	.mutex_mod = mt2701_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
@@ -298,6 +313,9 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
 	.mutex_sof = mt8183_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
+	.mutex_mdp_offset = mt8183_mutex_mdp_offset,
+	.mutex_mdp_mod_mask = MT8183_MUTEX_MDP_MOD_MASK,
+	.mutex_mdp_sof_mask = MT8183_MUTEX_MDP_SOF_MASK,
 	.no_clk = true,
 };
 
@@ -323,6 +341,21 @@ struct mtk_mutex *mtk_mutex_get(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_get);
 
+struct mtk_mutex *mtk_mutex_mdp_get(struct device *dev,
+				    enum mtk_mdp_pipe_id id)
+{
+	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
+	int i = mtx->data->mutex_mdp_offset[id];
+
+	if (!mtx->mutex[i].claimed) {
+		mtx->mutex[i].claimed = true;
+		return &mtx->mutex[i];
+	}
+
+	return ERR_PTR(-EBUSY);
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_mdp_get);
+
 void mtk_mutex_put(struct mtk_mutex *mutex)
 {
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
index 6fe4ffbde290..099ddb025d79 100644
--- a/include/linux/soc/mediatek/mtk-mutex.h
+++ b/include/linux/soc/mediatek/mtk-mutex.h
@@ -11,6 +11,8 @@ struct device;
 struct mtk_mutex;
 
 struct mtk_mutex *mtk_mutex_get(struct device *dev);
+struct mtk_mutex *mtk_mutex_mdp_get(struct device *dev,
+				    enum mtk_mdp_pipe_id id);
 int mtk_mutex_prepare(struct mtk_mutex *mutex);
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
