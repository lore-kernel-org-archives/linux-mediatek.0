Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80FACDB47E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 10:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPnnzxxCNPcOeTpS+uzko8RbLXYJkwtSQkGIpN8bVeA=; b=z9vtqLFTY5c4DCBSe+2kCtrYr5
	spwKslD3ggXx8bY5QXuLzZ/UJXfmpyVX5chiJY5kHwDdqxFeMacMh4jH0wOTDKr8WSBghMSNAJxI+
	qbBFgadpKy1PPWOEIPkM3MJmN2+ZuSKLXYqI6+d11QsZk3V94HgDG++dcAoJOmFoOB4VRTn2dcdHY
	0ahs3e+C3kcdgUjpxJlbAXXmUO+zLM0GbnjSMzMujcOXJigmbzW5HceIqUDW/fYEIrDIUn0PwHAXI
	uKhQOoOvuJ4eEQ5LJoUa2e8PwW5LPorZZX9pc4pNukzSTeuqcSbcxfEbNUsE2FNkdb/PP8shUgfBe
	q9bZzplw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3uN-00ESIu-2Q;
	Wed, 18 Oct 2023 10:36:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3u8-00ESEA-1s;
	Wed, 18 Oct 2023 10:35:58 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C18CE66072F9;
	Wed, 18 Oct 2023 11:35:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697625354;
	bh=qSJVq/b4D8UjdqABYk/0aBKvObDzMxIbLfNO6pNiZLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BagiP+OducprYfnStMX3ElLM+4QfEeSFY8/gvXtfYRhallWgW7hO/1SpNS9fO1uaf
	 fwSSSy5GgfyspHknx8sjG26iezlIXdekTyrQNBWkY6eyoDRGQtinV0GxgZxa4cRoQL
	 qZLie21aHIGsqtffw6KTTWFgStOHst8f8NfwNPzZLEqTwSsmQZ0B8kx+XE91WRZUIr
	 DT6L1ayv13glc1i59F/sr+vmkxlRwBRwBTdgSloEXTJwf7ku0lv9z+v0ficE/fVtC3
	 560L9CFWeiZccHFfMkDvcrQG9PAHB7N0cgdvjePoe3qVDYlkjb+JH/5W/vpfKnWgRA
	 3LyLnVRrx5q5Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	msp@baylibre.com,
	amergnat@baylibre.com,
	yangyingliang@huawei.com,
	u.kleine-koenig@pengutronix.de,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 1/2] clk: mediatek: clk-mux: Support custom parent indices for muxes
Date: Wed, 18 Oct 2023 12:35:45 +0200
Message-ID: <20231018103546.48174-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231018103546.48174-1-angelogioacchino.delregno@collabora.com>
References: <20231018103546.48174-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_033556_873164_7095028F 
X-CRM114-Status: GOOD (  18.09  )
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

Add support for customized parent indices for MediaTek muxes: this is
necessary for the case in which we want to exclude some clocks from
a mux's parent clocks list, where the exclusions are not from the
very bottom of the list but either in the middle or the beginning.

Example:
- MUX1 (all parents)
  - parent1; idx=0
  - parent2; idx=1
  - parent3; idx=2

- MUX1 (wanted parents)
  - parent1; idx=0
  - parent3; idx=2

To achieve that add a `parent_index` array pointer to struct mtk_mux,
then in .set_parent(), .get_parent() callbacks check if this array
was populated and eventually get the index from that.

Also, to avoid updating all clock drivers for all SoCs, rename the
"main" macro to __GATE_CLR_SET_UPD_FLAGS (so, `__` was added) and
add the new member to it; furthermore, GATE_CLK_SET_UPD_FLAGS has
been reintroduced as being fully compatible with the older version.

The new parent_index can be specified with the new `_INDEXED`
variants of the MUX_GATE_CLR_SET_UPD_xxxx macros.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mux.c | 14 +++++++++++
 drivers/clk/mediatek/clk-mux.h | 43 ++++++++++++++++++++++++++++++----
 2 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index c93bc7f926e5..60990296450b 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -89,6 +89,17 @@ static u8 mtk_clk_mux_get_parent(struct clk_hw *hw)
 	regmap_read(mux->regmap, mux->data->mux_ofs, &val);
 	val = (val >> mux->data->mux_shift) & mask;
 
+	if (mux->data->parent_index) {
+		int i;
+
+		for (i = 0; i < mux->data->num_parents; i++)
+			if (mux->data->parent_index[i] == val)
+				return i;
+
+		/* Not found: return an impossible index to generate error */
+		return mux->data->num_parents + 1;
+	}
+
 	return val;
 }
 
@@ -104,6 +115,9 @@ static int mtk_clk_mux_set_parent_setclr_lock(struct clk_hw *hw, u8 index)
 	else
 		__acquire(mux->lock);
 
+	if (mux->data->parent_index)
+		index = mux->data->parent_index[index];
+
 	regmap_read(mux->regmap, mux->data->mux_ofs, &orig);
 	val = (orig & ~(mask << mux->data->mux_shift))
 			| (index << mux->data->mux_shift);
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index 7ecb963b0ec6..943ad1d7ce4b 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -21,6 +21,7 @@ struct mtk_mux {
 	int id;
 	const char *name;
 	const char * const *parent_names;
+	const u8 *parent_index;
 	unsigned int flags;
 
 	u32 mux_ofs;
@@ -37,9 +38,10 @@ struct mtk_mux {
 	signed char num_parents;
 };
 
-#define GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,		\
-			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
-			_gate, _upd_ofs, _upd, _flags, _ops) {		\
+#define __GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _paridx,		\
+			 _num_parents, _mux_ofs, _mux_set_ofs,		\
+			 _mux_clr_ofs, _shift, _width, _gate, _upd_ofs,	\
+			 _upd, _flags, _ops) {				\
 		.id = _id,						\
 		.name = _name,						\
 		.mux_ofs = _mux_ofs,					\
@@ -51,11 +53,28 @@ struct mtk_mux {
 		.gate_shift = _gate,					\
 		.upd_shift = _upd,					\
 		.parent_names = _parents,				\
-		.num_parents = ARRAY_SIZE(_parents),			\
+		.parent_index = _paridx,				\
+		.num_parents = _num_parents,				\
 		.flags = _flags,					\
 		.ops = &_ops,						\
 	}
 
+#define GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,		\
+			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
+			_gate, _upd_ofs, _upd, _flags, _ops)		\
+		__GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents,		\
+			NULL, ARRAY_SIZE(_parents), _mux_ofs,		\
+			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
+			_gate, _upd_ofs, _upd, _flags, _ops)		\
+
+#define GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name, _parents, _paridx,	\
+			 _mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,	\
+			 _width, _gate, _upd_ofs, _upd, _flags, _ops)	\
+		__GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents,		\
+			_paridx, ARRAY_SIZE(_paridx), _mux_ofs,		\
+			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
+			_gate, _upd_ofs, _upd, _flags, _ops)		\
+
 extern const struct clk_ops mtk_mux_clr_set_upd_ops;
 extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
 
@@ -67,6 +86,14 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
 			_gate, _upd_ofs, _upd, _flags,			\
 			mtk_mux_gate_clr_set_upd_ops)
 
+#define MUX_GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name, _parents,	\
+			_paridx, _mux_ofs, _mux_set_ofs, _mux_clr_ofs,	\
+			_shift, _width, _gate, _upd_ofs, _upd, _flags)	\
+		GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name, _parents,	\
+			_paridx, _mux_ofs, _mux_set_ofs, _mux_clr_ofs,	\
+			_shift, _width, _gate, _upd_ofs, _upd, _flags,	\
+			mtk_mux_gate_clr_set_upd_ops)
+
 #define MUX_GATE_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,		\
 			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
 			_gate, _upd_ofs, _upd)				\
@@ -75,6 +102,14 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
 			_width, _gate, _upd_ofs, _upd,			\
 			CLK_SET_RATE_PARENT)
 
+#define MUX_GATE_CLR_SET_UPD_INDEXED(_id, _name, _parents, _paridx,	\
+			_mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,	\
+			_width, _gate, _upd_ofs, _upd)			\
+		MUX_GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name,		\
+			_parents, _paridx, _mux_ofs, _mux_set_ofs,	\
+			_mux_clr_ofs, _shift, _width, _gate, _upd_ofs,	\
+			_upd, CLK_SET_RATE_PARENT)
+
 #define MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,			\
 			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
 			_upd_ofs, _upd)					\
-- 
2.42.0


