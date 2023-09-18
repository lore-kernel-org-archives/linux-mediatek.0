Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5483C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 10:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfnulowigIUOkqyitOIxW89DWKAVguz4Fuukz0jA744=; b=TGJP3v81MYNWUwLcnrNAnSpTMF
	SWwrbDjqxJb7OixP6HfbII6jXX1F5oF/7sX61lAtFbPAZ3N01pFf8iq7ALKNbw1+vZt14GDUp9bWq
	yW+gExRI5tcK9w98VWX1GKqD+7a2flLenToO9jVuuu7itZjYqOug/BT9GN48tfqau+mIarGgr9zis
	2wzuZA0NiUiIRrLlLfBSH9sYLU+sNtW3taohVsdOBnQ5OyhPuYctHhRdOMDJknbrfIMnbCn+rimsw
	XjVTiYMM+xzx1piwvB5S63Srfk3012cr6KQdLElaM70eN1UxCVMM43wuoxzuveHUCA9ENnHoR3DSO
	L5k3Gqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBWp-00F8X6-25;
	Mon, 18 Sep 2023 10:30:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBWl-00F8T1-1e
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 10:30:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 033ED6108C;
	Mon, 18 Sep 2023 10:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9CDC433C8;
	Mon, 18 Sep 2023 10:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695033050;
	bh=H1Y7Lku2iwyhO5rgpqu7MyjoFTetMe1zN/nVR4VhRB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rrXbkBBqXY1URyvMvkAMSqiRQfDXOzp6R0p4nvXl0xhCL0hj4nDjyyUyhjq6ZNUnx
	 h728rD3T3llJ1lH75pxQgLhBTMnIj4gyaUhELluhVo297Ytpzil7XpjtkYwg3SROtO
	 B811j/34LlhaOEwNM59Ee7Qib+VIc9usLa3lttuQubb9iIlpxdacpj5EKestv6di9Z
	 YOFnkCG5QiODlIKb/dTtZLkq0CpzXtCuFljHsXaE2PWGq+o5MnRkf9E8mQXTzgRBM6
	 sEVTqUKeM1k3plISkk4nDjLS+KDw1uz0wGDrofD20ELte9IHEHPQkZ4hxpyUJqKWgr
	 aYCr2LZn7Vaww==
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
Subject: [PATCH v2 net-next 15/17] net: ethernet: mtk_wed: debugfs: move wed_v2 specific regs out of regs array
Date: Mon, 18 Sep 2023 12:29:17 +0200
Message-ID: <8573eee3b97741a942a554786c3d3f830b629571.1695032291.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695032290.git.lorenzo@kernel.org>
References: <cover.1695032290.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_033051_631336_7077495D 
X-CRM114-Status: GOOD (  10.33  )
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

Move specific WED2.0 debugfs entries out of regs array. This is a
preliminary patch to introduce WED 3.0 debugfs info.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/ethernet/mediatek/mtk_wed_debugfs.c   | 33 ++++++++++---------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c b/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
index 674e919d0d3a..8999d0c743f3 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
@@ -151,7 +151,7 @@ DEFINE_SHOW_ATTRIBUTE(wed_txinfo);
 static int
 wed_rxinfo_show(struct seq_file *s, void *data)
 {
-	static const struct reg_dump regs[] = {
+	static const struct reg_dump regs_common[] = {
 		DUMP_STR("WPDMA RX"),
 		DUMP_WPDMA_RX_RING(0),
 		DUMP_WPDMA_RX_RING(1),
@@ -169,7 +169,7 @@ wed_rxinfo_show(struct seq_file *s, void *data)
 		DUMP_WED_RING(WED_RING_RX_DATA(0)),
 		DUMP_WED_RING(WED_RING_RX_DATA(1)),
 
-		DUMP_STR("WED RRO"),
+		DUMP_STR("WED WO RRO"),
 		DUMP_WED_RRO_RING(WED_RROQM_MIOD_CTRL0),
 		DUMP_WED(WED_RROQM_MID_MIB),
 		DUMP_WED(WED_RROQM_MOD_MIB),
@@ -180,17 +180,6 @@ wed_rxinfo_show(struct seq_file *s, void *data)
 		DUMP_WED(WED_RROQM_FDBK_ANC_MIB),
 		DUMP_WED(WED_RROQM_FDBK_ANC2H_MIB),
 
-		DUMP_STR("WED Route QM"),
-		DUMP_WED(WED_RTQM_R2H_MIB(0)),
-		DUMP_WED(WED_RTQM_R2Q_MIB(0)),
-		DUMP_WED(WED_RTQM_Q2H_MIB(0)),
-		DUMP_WED(WED_RTQM_R2H_MIB(1)),
-		DUMP_WED(WED_RTQM_R2Q_MIB(1)),
-		DUMP_WED(WED_RTQM_Q2H_MIB(1)),
-		DUMP_WED(WED_RTQM_Q2N_MIB),
-		DUMP_WED(WED_RTQM_Q2B_MIB),
-		DUMP_WED(WED_RTQM_PFDBK_MIB),
-
 		DUMP_STR("WED WDMA TX"),
 		DUMP_WED(WED_WDMA_TX_MIB),
 		DUMP_WED_RING(WED_WDMA_RING_TX),
@@ -211,11 +200,25 @@ wed_rxinfo_show(struct seq_file *s, void *data)
 		DUMP_WED(WED_RX_BM_INTF),
 		DUMP_WED(WED_RX_BM_ERR_STS),
 	};
+	static const struct reg_dump regs_wed_v2[] = {
+		DUMP_STR("WED Route QM"),
+		DUMP_WED(WED_RTQM_R2H_MIB(0)),
+		DUMP_WED(WED_RTQM_R2Q_MIB(0)),
+		DUMP_WED(WED_RTQM_Q2H_MIB(0)),
+		DUMP_WED(WED_RTQM_R2H_MIB(1)),
+		DUMP_WED(WED_RTQM_R2Q_MIB(1)),
+		DUMP_WED(WED_RTQM_Q2H_MIB(1)),
+		DUMP_WED(WED_RTQM_Q2N_MIB),
+		DUMP_WED(WED_RTQM_Q2B_MIB),
+		DUMP_WED(WED_RTQM_PFDBK_MIB),
+	};
 	struct mtk_wed_hw *hw = s->private;
 	struct mtk_wed_device *dev = hw->wed_dev;
 
-	if (dev)
-		dump_wed_regs(s, dev, regs, ARRAY_SIZE(regs));
+	if (dev) {
+		dump_wed_regs(s, dev, regs_common, ARRAY_SIZE(regs_common));
+		dump_wed_regs(s, dev, regs_wed_v2, ARRAY_SIZE(regs_wed_v2));
+	}
 
 	return 0;
 }
-- 
2.41.0


