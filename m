Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE42C7618A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 16:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOx58xhjMFGv+0FnBpdzP0CdIdHRC9I8u554r/lS/7Q=; b=yO2adKoFyXxmINo9VZzPvYWLqi
	NlH7OYvLy7Yc9HbJIKREYJ0BdbFGlIayuOZD7v5+rdvdFZv9p9Q05szOv6Wc2rXmXAMkDYuYBtRrH
	oLhyw9ut4qMvCaWDk889KOdK1bVnHOH1SHOwRqMKKs6pLlR+h/tt1LXRDiXsaKbeWkB7YI+VEEjpq
	b0P/c3YeCM9mNUHw4TKB69Mlp8+lCqXmXqI2IGaFNVMBMqi1dsunGH/rztNgvqksQKT7zjbOXmVkg
	6CB1QoUOb8J8XK8fmEzU+ALse0hfqbAzXq1hdQoRjkt64OBXPfhr67F/oDGBtlOOfop8M93QQqewx
	+rnv6qag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peIqz-009u4u-2q;
	Mon, 20 Mar 2023 16:59:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peIqw-009u3e-2d
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Mar 2023 16:59:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1919561708;
	Mon, 20 Mar 2023 16:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226FBC433EF;
	Mon, 20 Mar 2023 16:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679331561;
	bh=JtDTeOb+XfC/OkGaG3mNl+0+89/XnhPEztBv7Gcpg0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mgnp5ehW8FoncfryGLBiiQ7ZfcPZRvHraZzOp9LBphJgbNAoghJsjwI/+It5GkAWf
	 AVcHZIwVL36R39b4KNfytJXLwE491hffko00Y36Fmxw0879/hrWfELOoWamZPb7yPM
	 fcMgV51QMuZNCwCYHj7kgvc4noeICyEwxh9xcg1txK59UMhrwufkGyXj1uS8fwgjHi
	 kjcybCx3hYxgqVJd0quEib0FtpXD4F/8PxsFcEKh5J0h60QhC86P6/TOxoOvMcxIAD
	 vsb2FjYq8S8m2y9G391+VgXH+cAlKka9nJKWQMCGassbE7Zp3AB0xpNIvr0X4vNKRt
	 EjKLAk3sRZGjQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo.bianconi@redhat.com,
	daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH net-next 08/10] net: ethernet: mtk_wed: move dlm a dedicated dts node
Date: Mon, 20 Mar 2023 17:58:02 +0100
Message-Id: <a51411424bdb0a5c1a1662e157521bb101f52fe4.1679330630.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1679330630.git.lorenzo@kernel.org>
References: <cover.1679330630.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_095922_890389_0178F117 
X-CRM114-Status: GOOD (  12.24  )
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

Since the dlm memory region is not part of the RAM SoC, move dlm in a
deidicated syscon node.
This patch helps to keep backward-compatibility with older version of
uboot codebase where we have a limit of 8 reserved-memory dts child
nodes.
Keep backward-compatibility with older dts version where dlm was defined
as reserved-memory child node.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 95d890870984..e479ff924ed6 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -799,6 +799,24 @@ mtk_wed_rro_alloc(struct mtk_wed_device *dev)
 	struct device_node *np;
 	int index;
 
+	np = of_parse_phandle(dev->hw->node, "mediatek,wo-dlm", 0);
+	if (np) {
+		struct resource res;
+		int ret;
+
+		ret = of_address_to_resource(np, 0, &res);
+		of_node_put(np);
+
+		if (ret < 0)
+			return ret;
+
+		dev->rro.miod_phys = res.start;
+		goto out;
+	}
+
+	/* For backward compatibility, we need to check if DLM
+	 * node is defined through reserved memory property.
+	 */
 	index = of_property_match_string(dev->hw->node, "memory-region-names",
 					 "wo-dlm");
 	if (index < 0)
@@ -815,6 +833,7 @@ mtk_wed_rro_alloc(struct mtk_wed_device *dev)
 		return -ENODEV;
 
 	dev->rro.miod_phys = rmem->base;
+out:
 	dev->rro.fdbk_phys = MTK_WED_MIOD_COUNT + dev->rro.miod_phys;
 
 	return mtk_wed_rro_ring_alloc(dev, &dev->rro.ring,
-- 
2.39.2


