Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440E5CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 10:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iw+gk7q3KdDrEFpfKAVU2pj/lRqRo+UXqe4olXFJMEQ=; b=G7QDDDFnFhGpTk7hONQ1Dj1S35
	8Ocz3M0ozxM63OWjI11l2z6uELWTkfDxTLfbI7BYOxvwTe4YMUwxZyhX2v/rwSnnXZhlYv81Tvg02
	n9iz38s2n6x/Z6LZdJx7fvgVfqMcm6zjjbAtf4icViJKHm1Rw50/0ZK1wh/PuCEJJg1zyeuhubfBQ
	/YItbE244MVPvg4UfWV5J1Jh+rlzRT8ZeF5DpGVsMCquMnckopAnNWTEy4rU7BLperCIicV6Ma5KT
	mmF2laDsk9wyQ7PlsTYX7BwdnJQSTYQnL4PFku+Tu0kHYDE3WbFF5Vjr4gR1dnIKt8GkQxyReplrP
	+A+405Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBWu-00F8b0-0T;
	Mon, 18 Sep 2023 10:31:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBWr-00F8Xl-0E
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 10:30:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5F29EB80B68;
	Mon, 18 Sep 2023 10:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25B5C433C8;
	Mon, 18 Sep 2023 10:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695033054;
	bh=uFy0yaIXeuU1WIHiqXjw8Vi32xgRKC9435bq8I2+iF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HX4aURsqL0JgOYPp+6WXMXMShA0/RVotAGBBynZTw11q8A/1WOa8DF7Z7Zo4H2iKf
	 xtpRH6ZxNORB9Jnar3jH3YvgSDU0o0Hi29PltbfuZ2yhAykPdTKRkz0+CJb7AzDUts
	 CBhGiahvbBqXUUtES2WNGCUwZcSHSGfWaGsjEH0GHUvIexLBgpLWipFlhk8kX+JycZ
	 K8hRzDi3jKaFflUJ1a7o2OhX7ajFddmg6fq7eYktf29VliMFu8smEyxO7ogLxFwYgc
	 qkAEC0PgxdGORGrQe8wkNVQoFFuKCu8ySkVnmZu687uBdqXcXwrPDEniXM1E6dXvo5
	 PCKK5poh4ObPA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: lorenzo.bianconi@redhat.com,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	daniel@makrotopia.org,
	linux-mediatek@lists.infradead.org,
	sujuan.chen@mediatek.com,
	horms@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 net-next 16/17] net: ethernet: mtk_wed: debugfs: add WED 3.0 debugfs entries
Date: Mon, 18 Sep 2023 12:29:18 +0200
Message-ID: <371463e9403e27b68b6149965edb7cf636ca7d67.1695032291.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695032290.git.lorenzo@kernel.org>
References: <cover.1695032290.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_033057_444961_1CE8BA70 
X-CRM114-Status: GOOD (  12.19  )
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

From: Sujuan Chen <sujuan.chen@mediatek.com>

Introduce WED3.0 debugfs entries useful for debugging.

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
---
 .../net/ethernet/mediatek/mtk_wed_debugfs.c   | 371 +++++++++++++++++-
 1 file changed, 369 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c b/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
index 8999d0c743f3..781c691473e1 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
@@ -11,6 +11,7 @@ struct reg_dump {
 	u16 offset;
 	u8 type;
 	u8 base;
+	u32 mask;
 };
 
 enum {
@@ -25,6 +26,8 @@ enum {
 
 #define DUMP_STR(_str) { _str, 0, DUMP_TYPE_STRING }
 #define DUMP_REG(_reg, ...) { #_reg, MTK_##_reg, __VA_ARGS__ }
+#define DUMP_REG_MASK(_reg, _mask)	\
+	{ #_mask, MTK_##_reg, DUMP_TYPE_WED, 0, MTK_##_mask }
 #define DUMP_RING(_prefix, _base, ...)				\
 	{ _prefix " BASE", _base, __VA_ARGS__ },		\
 	{ _prefix " CNT",  _base + 0x4, __VA_ARGS__ },	\
@@ -32,6 +35,7 @@ enum {
 	{ _prefix " DIDX", _base + 0xc, __VA_ARGS__ }
 
 #define DUMP_WED(_reg) DUMP_REG(_reg, DUMP_TYPE_WED)
+#define DUMP_WED_MASK(_reg, _mask) DUMP_REG_MASK(_reg, _mask)
 #define DUMP_WED_RING(_base) DUMP_RING(#_base, MTK_##_base, DUMP_TYPE_WED)
 
 #define DUMP_WDMA(_reg) DUMP_REG(_reg, DUMP_TYPE_WDMA)
@@ -212,18 +216,372 @@ wed_rxinfo_show(struct seq_file *s, void *data)
 		DUMP_WED(WED_RTQM_Q2B_MIB),
 		DUMP_WED(WED_RTQM_PFDBK_MIB),
 	};
+	static const struct reg_dump regs_wed_v3[] = {
+		DUMP_STR("WED RX RRO DATA"),
+		DUMP_WED_RING(WED_RRO_RX_D_RX(0)),
+		DUMP_WED_RING(WED_RRO_RX_D_RX(1)),
+
+		DUMP_STR("WED RX MSDU PAGE"),
+		DUMP_WED_RING(WED_RRO_MSDU_PG_CTRL0(0)),
+		DUMP_WED_RING(WED_RRO_MSDU_PG_CTRL0(1)),
+		DUMP_WED_RING(WED_RRO_MSDU_PG_CTRL0(2)),
+
+		DUMP_STR("WED RX IND CMD"),
+		DUMP_WED(WED_IND_CMD_RX_CTRL1),
+		DUMP_WED_MASK(WED_IND_CMD_RX_CTRL2, WED_IND_CMD_MAX_CNT),
+		DUMP_WED_MASK(WED_IND_CMD_RX_CTRL0, WED_IND_CMD_PROC_IDX),
+		DUMP_WED_MASK(RRO_IND_CMD_SIGNATURE, RRO_IND_CMD_DMA_IDX),
+		DUMP_WED_MASK(WED_IND_CMD_RX_CTRL0, WED_IND_CMD_MAGIC_CNT),
+		DUMP_WED_MASK(RRO_IND_CMD_SIGNATURE, RRO_IND_CMD_MAGIC_CNT),
+		DUMP_WED_MASK(WED_IND_CMD_RX_CTRL0,
+			      WED_IND_CMD_PREFETCH_FREE_CNT),
+		DUMP_WED_MASK(WED_RRO_CFG1, WED_RRO_CFG1_PARTICL_SE_ID),
+
+		DUMP_STR("WED ADDR ELEM"),
+		DUMP_WED(WED_ADDR_ELEM_CFG0),
+		DUMP_WED_MASK(WED_ADDR_ELEM_CFG1,
+			      WED_ADDR_ELEM_PREFETCH_FREE_CNT),
+
+		DUMP_STR("WED Route QM"),
+		DUMP_WED(WED_RTQM_ENQ_I2Q_DMAD_CNT),
+		DUMP_WED(WED_RTQM_ENQ_I2N_DMAD_CNT),
+		DUMP_WED(WED_RTQM_ENQ_I2Q_PKT_CNT),
+		DUMP_WED(WED_RTQM_ENQ_I2N_PKT_CNT),
+		DUMP_WED(WED_RTQM_ENQ_USED_ENTRY_CNT),
+		DUMP_WED(WED_RTQM_ENQ_ERR_CNT),
+
+		DUMP_WED(WED_RTQM_DEQ_DMAD_CNT),
+		DUMP_WED(WED_RTQM_DEQ_Q2I_DMAD_CNT),
+		DUMP_WED(WED_RTQM_DEQ_PKT_CNT),
+		DUMP_WED(WED_RTQM_DEQ_Q2I_PKT_CNT),
+		DUMP_WED(WED_RTQM_DEQ_USED_PFDBK_CNT),
+		DUMP_WED(WED_RTQM_DEQ_ERR_CNT),
+	};
 	struct mtk_wed_hw *hw = s->private;
 	struct mtk_wed_device *dev = hw->wed_dev;
 
 	if (dev) {
 		dump_wed_regs(s, dev, regs_common, ARRAY_SIZE(regs_common));
-		dump_wed_regs(s, dev, regs_wed_v2, ARRAY_SIZE(regs_wed_v2));
+		if (mtk_wed_is_v2(hw))
+			dump_wed_regs(s, dev,
+				      regs_wed_v2, ARRAY_SIZE(regs_wed_v2));
+		else
+			dump_wed_regs(s, dev,
+				      regs_wed_v3, ARRAY_SIZE(regs_wed_v3));
 	}
 
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(wed_rxinfo);
 
+static int
+wed_amsdu_show(struct seq_file *s, void *data)
+{
+	static const struct reg_dump regs[] = {
+		DUMP_STR("WED AMDSU INFO"),
+		DUMP_WED(WED_MON_AMSDU_FIFO_DMAD),
+
+		DUMP_STR("WED AMDSU ENG0 INFO"),
+		DUMP_WED(WED_MON_AMSDU_ENG_DMAD(0)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QFPL(0)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QENI(0)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QENO(0)),
+		DUMP_WED(WED_MON_AMSDU_ENG_MERG(0)),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT8(0),
+			      WED_AMSDU_ENG_MAX_PL_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT8(0),
+			      WED_AMSDU_ENG_MAX_QGPP_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(0),
+			      WED_AMSDU_ENG_CUR_ENTRY),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(0),
+			      WED_AMSDU_ENG_MAX_BUF_MERGED),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(0),
+			      WED_AMSDU_ENG_MAX_MSDU_MERGED),
+
+		DUMP_STR("WED AMDSU ENG1 INFO"),
+		DUMP_WED(WED_MON_AMSDU_ENG_DMAD(1)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QFPL(1)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QENI(1)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QENO(1)),
+		DUMP_WED(WED_MON_AMSDU_ENG_MERG(1)),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT8(1),
+			      WED_AMSDU_ENG_MAX_PL_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT8(1),
+			      WED_AMSDU_ENG_MAX_QGPP_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(1),
+			      WED_AMSDU_ENG_CUR_ENTRY),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(2),
+			      WED_AMSDU_ENG_MAX_BUF_MERGED),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(2),
+			      WED_AMSDU_ENG_MAX_MSDU_MERGED),
+
+		DUMP_STR("WED AMDSU ENG2 INFO"),
+		DUMP_WED(WED_MON_AMSDU_ENG_DMAD(2)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QFPL(2)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QENI(2)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QENO(2)),
+		DUMP_WED(WED_MON_AMSDU_ENG_MERG(2)),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT8(2),
+			      WED_AMSDU_ENG_MAX_PL_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT8(2),
+			      WED_AMSDU_ENG_MAX_QGPP_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(2),
+			      WED_AMSDU_ENG_CUR_ENTRY),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(2),
+			      WED_AMSDU_ENG_MAX_BUF_MERGED),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(2),
+			      WED_AMSDU_ENG_MAX_MSDU_MERGED),
+
+		DUMP_STR("WED AMDSU ENG3 INFO"),
+		DUMP_WED(WED_MON_AMSDU_ENG_DMAD(3)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QFPL(3)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QENI(3)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QENO(3)),
+		DUMP_WED(WED_MON_AMSDU_ENG_MERG(3)),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT8(3),
+			      WED_AMSDU_ENG_MAX_PL_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT8(3),
+			      WED_AMSDU_ENG_MAX_QGPP_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(3),
+			      WED_AMSDU_ENG_CUR_ENTRY),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(3),
+			      WED_AMSDU_ENG_MAX_BUF_MERGED),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(3),
+			      WED_AMSDU_ENG_MAX_MSDU_MERGED),
+
+		DUMP_STR("WED AMDSU ENG4 INFO"),
+		DUMP_WED(WED_MON_AMSDU_ENG_DMAD(4)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QFPL(4)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QENI(4)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QENO(4)),
+		DUMP_WED(WED_MON_AMSDU_ENG_MERG(4)),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT8(4),
+			      WED_AMSDU_ENG_MAX_PL_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT8(4),
+			      WED_AMSDU_ENG_MAX_QGPP_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(4),
+			      WED_AMSDU_ENG_CUR_ENTRY),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(4),
+			      WED_AMSDU_ENG_MAX_BUF_MERGED),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(4),
+			      WED_AMSDU_ENG_MAX_MSDU_MERGED),
+
+		DUMP_STR("WED AMDSU ENG5 INFO"),
+		DUMP_WED(WED_MON_AMSDU_ENG_DMAD(5)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QFPL(5)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QENI(5)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QENO(5)),
+		DUMP_WED(WED_MON_AMSDU_ENG_MERG(5)),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT8(5),
+			      WED_AMSDU_ENG_MAX_PL_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT8(5),
+			      WED_AMSDU_ENG_MAX_QGPP_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(5),
+			      WED_AMSDU_ENG_CUR_ENTRY),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(5),
+			      WED_AMSDU_ENG_MAX_BUF_MERGED),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(5),
+			      WED_AMSDU_ENG_MAX_MSDU_MERGED),
+
+		DUMP_STR("WED AMDSU ENG6 INFO"),
+		DUMP_WED(WED_MON_AMSDU_ENG_DMAD(6)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QFPL(6)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QENI(6)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QENO(6)),
+		DUMP_WED(WED_MON_AMSDU_ENG_MERG(6)),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT8(6),
+			      WED_AMSDU_ENG_MAX_PL_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT8(6),
+			      WED_AMSDU_ENG_MAX_QGPP_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(6),
+			      WED_AMSDU_ENG_CUR_ENTRY),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(6),
+			      WED_AMSDU_ENG_MAX_BUF_MERGED),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(6),
+			      WED_AMSDU_ENG_MAX_MSDU_MERGED),
+
+		DUMP_STR("WED AMDSU ENG7 INFO"),
+		DUMP_WED(WED_MON_AMSDU_ENG_DMAD(7)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QFPL(7)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QENI(7)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QENO(7)),
+		DUMP_WED(WED_MON_AMSDU_ENG_MERG(7)),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT8(7),
+			      WED_AMSDU_ENG_MAX_PL_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT8(7),
+			      WED_AMSDU_ENG_MAX_QGPP_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(7),
+			      WED_AMSDU_ENG_CUR_ENTRY),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(7),
+			      WED_AMSDU_ENG_MAX_BUF_MERGED),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(4),
+			      WED_AMSDU_ENG_MAX_MSDU_MERGED),
+
+		DUMP_STR("WED AMDSU ENG8 INFO"),
+		DUMP_WED(WED_MON_AMSDU_ENG_DMAD(8)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QFPL(8)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QENI(8)),
+		DUMP_WED(WED_MON_AMSDU_ENG_QENO(8)),
+		DUMP_WED(WED_MON_AMSDU_ENG_MERG(8)),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT8(8),
+			      WED_AMSDU_ENG_MAX_PL_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT8(8),
+			      WED_AMSDU_ENG_MAX_QGPP_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(8),
+			      WED_AMSDU_ENG_CUR_ENTRY),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(8),
+			      WED_AMSDU_ENG_MAX_BUF_MERGED),
+		DUMP_WED_MASK(WED_MON_AMSDU_ENG_CNT9(8),
+			      WED_AMSDU_ENG_MAX_MSDU_MERGED),
+
+		DUMP_STR("WED QMEM INFO"),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_CNT(0), WED_AMSDU_QMEM_FQ_CNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_CNT(0), WED_AMSDU_QMEM_SP_QCNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_CNT(1), WED_AMSDU_QMEM_TID0_QCNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_CNT(1), WED_AMSDU_QMEM_TID1_QCNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_CNT(2), WED_AMSDU_QMEM_TID2_QCNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_CNT(2), WED_AMSDU_QMEM_TID3_QCNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_CNT(3), WED_AMSDU_QMEM_TID4_QCNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_CNT(3), WED_AMSDU_QMEM_TID5_QCNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_CNT(4), WED_AMSDU_QMEM_TID6_QCNT),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_CNT(4), WED_AMSDU_QMEM_TID7_QCNT),
+
+		DUMP_STR("WED QMEM HEAD INFO"),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(0), WED_AMSDU_QMEM_FQ_HEAD),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(0), WED_AMSDU_QMEM_SP_QHEAD),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(1), WED_AMSDU_QMEM_TID0_QHEAD),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(1), WED_AMSDU_QMEM_TID1_QHEAD),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(2), WED_AMSDU_QMEM_TID2_QHEAD),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(2), WED_AMSDU_QMEM_TID3_QHEAD),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(3), WED_AMSDU_QMEM_TID4_QHEAD),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(3), WED_AMSDU_QMEM_TID5_QHEAD),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(4), WED_AMSDU_QMEM_TID6_QHEAD),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(4), WED_AMSDU_QMEM_TID7_QHEAD),
+
+		DUMP_STR("WED QMEM TAIL INFO"),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(5), WED_AMSDU_QMEM_FQ_TAIL),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(5), WED_AMSDU_QMEM_SP_QTAIL),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(6), WED_AMSDU_QMEM_TID0_QTAIL),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(6), WED_AMSDU_QMEM_TID1_QTAIL),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(7), WED_AMSDU_QMEM_TID2_QTAIL),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(7), WED_AMSDU_QMEM_TID3_QTAIL),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(8), WED_AMSDU_QMEM_TID4_QTAIL),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(8), WED_AMSDU_QMEM_TID5_QTAIL),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(9), WED_AMSDU_QMEM_TID6_QTAIL),
+		DUMP_WED_MASK(WED_MON_AMSDU_QMEM_PTR(9), WED_AMSDU_QMEM_TID7_QTAIL),
+
+		DUMP_STR("WED HIFTXD MSDU INFO"),
+		DUMP_WED(WED_MON_AMSDU_HIFTXD_FETCH_MSDU(1)),
+		DUMP_WED(WED_MON_AMSDU_HIFTXD_FETCH_MSDU(2)),
+		DUMP_WED(WED_MON_AMSDU_HIFTXD_FETCH_MSDU(3)),
+		DUMP_WED(WED_MON_AMSDU_HIFTXD_FETCH_MSDU(4)),
+		DUMP_WED(WED_MON_AMSDU_HIFTXD_FETCH_MSDU(5)),
+		DUMP_WED(WED_MON_AMSDU_HIFTXD_FETCH_MSDU(6)),
+		DUMP_WED(WED_MON_AMSDU_HIFTXD_FETCH_MSDU(7)),
+		DUMP_WED(WED_MON_AMSDU_HIFTXD_FETCH_MSDU(8)),
+		DUMP_WED(WED_MON_AMSDU_HIFTXD_FETCH_MSDU(9)),
+		DUMP_WED(WED_MON_AMSDU_HIFTXD_FETCH_MSDU(10)),
+		DUMP_WED(WED_MON_AMSDU_HIFTXD_FETCH_MSDU(11)),
+		DUMP_WED(WED_MON_AMSDU_HIFTXD_FETCH_MSDU(12)),
+		DUMP_WED(WED_MON_AMSDU_HIFTXD_FETCH_MSDU(13)),
+	};
+	struct mtk_wed_hw *hw = s->private;
+	struct mtk_wed_device *dev = hw->wed_dev;
+
+	if (dev)
+		dump_wed_regs(s, dev, regs, ARRAY_SIZE(regs));
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(wed_amsdu);
+
+static int
+wed_rtqm_show(struct seq_file *s, void *data)
+{
+	static const struct reg_dump regs[] = {
+		DUMP_STR("WED Route QM IGRS0(N2H + Recycle)"),
+		DUMP_WED(WED_RTQM_IGRS0_I2HW_DMAD_CNT),
+		DUMP_WED(WED_RTQM_IGRS0_I2H_DMAD_CNT(0)),
+		DUMP_WED(WED_RTQM_IGRS0_I2H_DMAD_CNT(1)),
+		DUMP_WED(WED_RTQM_IGRS0_I2HW_PKT_CNT),
+		DUMP_WED(WED_RTQM_IGRS0_I2H_PKT_CNT(0)),
+		DUMP_WED(WED_RTQM_IGRS0_I2H_PKT_CNT(0)),
+		DUMP_WED(WED_RTQM_IGRS0_FDROP_CNT),
+
+		DUMP_STR("WED Route QM IGRS1(Legacy)"),
+		DUMP_WED(WED_RTQM_IGRS1_I2HW_DMAD_CNT),
+		DUMP_WED(WED_RTQM_IGRS1_I2H_DMAD_CNT(0)),
+		DUMP_WED(WED_RTQM_IGRS1_I2H_DMAD_CNT(1)),
+		DUMP_WED(WED_RTQM_IGRS1_I2HW_PKT_CNT),
+		DUMP_WED(WED_RTQM_IGRS1_I2H_PKT_CNT(0)),
+		DUMP_WED(WED_RTQM_IGRS1_I2H_PKT_CNT(1)),
+		DUMP_WED(WED_RTQM_IGRS1_FDROP_CNT),
+
+		DUMP_STR("WED Route QM IGRS2(RRO3.0)"),
+		DUMP_WED(WED_RTQM_IGRS2_I2HW_DMAD_CNT),
+		DUMP_WED(WED_RTQM_IGRS2_I2H_DMAD_CNT(0)),
+		DUMP_WED(WED_RTQM_IGRS2_I2H_DMAD_CNT(1)),
+		DUMP_WED(WED_RTQM_IGRS2_I2HW_PKT_CNT),
+		DUMP_WED(WED_RTQM_IGRS2_I2H_PKT_CNT(0)),
+		DUMP_WED(WED_RTQM_IGRS2_I2H_PKT_CNT(1)),
+		DUMP_WED(WED_RTQM_IGRS2_FDROP_CNT),
+
+		DUMP_STR("WED Route QM IGRS3(DEBUG)"),
+		DUMP_WED(WED_RTQM_IGRS2_I2HW_DMAD_CNT),
+		DUMP_WED(WED_RTQM_IGRS3_I2H_DMAD_CNT(0)),
+		DUMP_WED(WED_RTQM_IGRS3_I2H_DMAD_CNT(1)),
+		DUMP_WED(WED_RTQM_IGRS3_I2HW_PKT_CNT),
+		DUMP_WED(WED_RTQM_IGRS3_I2H_PKT_CNT(0)),
+		DUMP_WED(WED_RTQM_IGRS3_I2H_PKT_CNT(1)),
+		DUMP_WED(WED_RTQM_IGRS3_FDROP_CNT),
+	};
+	struct mtk_wed_hw *hw = s->private;
+	struct mtk_wed_device *dev = hw->wed_dev;
+
+	if (dev)
+		dump_wed_regs(s, dev, regs, ARRAY_SIZE(regs));
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(wed_rtqm);
+
+static int
+wed_rro_show(struct seq_file *s, void *data)
+{
+	static const struct reg_dump regs[] = {
+		DUMP_STR("RRO/IND CMD CNT"),
+		DUMP_WED(WED_RX_IND_CMD_CNT(1)),
+		DUMP_WED(WED_RX_IND_CMD_CNT(2)),
+		DUMP_WED(WED_RX_IND_CMD_CNT(3)),
+		DUMP_WED(WED_RX_IND_CMD_CNT(4)),
+		DUMP_WED(WED_RX_IND_CMD_CNT(5)),
+		DUMP_WED(WED_RX_IND_CMD_CNT(6)),
+		DUMP_WED(WED_RX_IND_CMD_CNT(7)),
+		DUMP_WED(WED_RX_IND_CMD_CNT(8)),
+		DUMP_WED_MASK(WED_RX_IND_CMD_CNT(9),
+			      WED_IND_CMD_MAGIC_CNT_FAIL_CNT),
+
+		DUMP_WED(WED_RX_ADDR_ELEM_CNT(0)),
+		DUMP_WED_MASK(WED_RX_ADDR_ELEM_CNT(1),
+			      WED_ADDR_ELEM_SIG_FAIL_CNT),
+		DUMP_WED(WED_RX_MSDU_PG_CNT(1)),
+		DUMP_WED(WED_RX_MSDU_PG_CNT(2)),
+		DUMP_WED(WED_RX_MSDU_PG_CNT(3)),
+		DUMP_WED(WED_RX_MSDU_PG_CNT(4)),
+		DUMP_WED(WED_RX_MSDU_PG_CNT(5)),
+		DUMP_WED_MASK(WED_RX_PN_CHK_CNT,
+			      WED_PN_CHK_FAIL_CNT),
+	};
+	struct mtk_wed_hw *hw = s->private;
+	struct mtk_wed_device *dev = hw->wed_dev;
+
+	if (dev)
+		dump_wed_regs(s, dev, regs, ARRAY_SIZE(regs));
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(wed_rro);
+
 static int
 mtk_wed_reg_set(void *data, u64 val)
 {
@@ -264,7 +622,16 @@ void mtk_wed_hw_add_debugfs(struct mtk_wed_hw *hw)
 	debugfs_create_u32("regidx", 0600, dir, &hw->debugfs_reg);
 	debugfs_create_file_unsafe("regval", 0600, dir, hw, &fops_regval);
 	debugfs_create_file_unsafe("txinfo", 0400, dir, hw, &wed_txinfo_fops);
-	if (!mtk_wed_is_v1(hw))
+	if (!mtk_wed_is_v1(hw)) {
 		debugfs_create_file_unsafe("rxinfo", 0400, dir, hw,
 					   &wed_rxinfo_fops);
+		if (mtk_wed_is_v3_or_greater(hw)) {
+			debugfs_create_file_unsafe("amsdu", 0400, dir, hw,
+						   &wed_amsdu_fops);
+			debugfs_create_file_unsafe("rtqm", 0400, dir, hw,
+						   &wed_rtqm_fops);
+			debugfs_create_file_unsafe("rro", 0400, dir, hw,
+						   &wed_rro_fops);
+		}
+	}
 }
-- 
2.41.0


