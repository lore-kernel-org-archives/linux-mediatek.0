Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA6BC2BA1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 10:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuc45dcsOFbDklcbCax139/gFsVDU2FrxHYl+FzFARc=; b=WVrvz9NvIlddFE51m/cdcb7NBZ
	TnPH+lH31MAb+/hWSR3XhjJZ8CVSxfibNwfSxD06yXtdE+YruYc8NwGlMATdWm5KYVL8pv3lWNws7
	Og1uWqDnNSRn3d6fqNYrbfwnRUoZ36DVes/G9+N/l54T1MA7S41RCCMMuSdrQd7xQsiIg0syBsheC
	sh1abSsGZoiaTolOWuHwORZji1KKZWzbbiQILeuj1G4s/VRCfmO33eN+WdhJtX6B1mNZM+1tiS8hf
	531cG6n3S/y0Sp+AVtrijBxnjHE2/OfZrwbfTPd3Og+9+psWIeZBP4GPwvQqg8cIgj4LtHxBDUyX4
	ogU0hmKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEiV-00000004VYS-3e5R;
	Thu, 20 Jun 2024 10:08:31 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEi8-00000004VJk-37bB;
	Thu, 20 Jun 2024 10:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718878086;
	bh=sKfuDPm0OAAN0rcXZxSfirkK6rJX8HN3Ps/0YrvMzTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X/p8SCWvK4KdRf8+yrMiUmtbizUsMaUK3NU8hD5F+oPD2sG21vS2UEhwv9kMzTLnt
	 Vy49BBq19VnIr5OG47pbT6XNnO70XjtKbuXGrwdqDgmB0YCh+JO3mokMsl6uk3M7OP
	 mbfIYetcovSGCulGMLc5uykdrQVGXb6zwQGAHXF5e3uiZlGGw+0wqjc/9xlwpl+Rjo
	 wH0wWtXmmgVJqgGUVD5gFLrzUtREkhUI8naF+kX0sTPi2nzWcO94umMgZqGzQT+ro7
	 a05A9rPd24i5aAFgT0QnKDqGlsIfMdBg+7awt30Wzt+sL3JxH4UCb1l2/XLNlC+1yz
	 UHz4bXcqa3VqA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1D26437821B0;
	Thu, 20 Jun 2024 10:08:06 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jassisinghbrar@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	houlong.wei@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/4] mailbox: mtk-cmdq: Move and partially refactor clocks probe
Date: Thu, 20 Jun 2024 12:07:48 +0200
Message-ID: <20240620100750.1075790-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620100750.1075790-1-angelogioacchino.delregno@collabora.com>
References: <20240620100750.1075790-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_030808_947499_CEFCD314 
X-CRM114-Status: GOOD (  18.25  )
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

Move the clocks probe to a new cmdq_get_clocks() function; while
at it, partially refactor the code:

Drop the clk_names[] array and assign clock names to the array
of clk_bulk_data with devm_kasprintf() instead, slightly reduce
the indentation for the multi-gce clock probe path and add a
comment describing the reason why we get clocks of other GCE
instance instead of just the clock from the one that it is
getting probed.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 79 +++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 28 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 66dbc8e846d8..a3f57151a221 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -578,16 +578,59 @@ static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
 	return &mbox->chans[ind];
 }
 
+static int cmdq_get_clocks(struct device *dev, struct cmdq *cmdq)
+{
+	static const char * const gce_name = "gce";
+	struct device_node *node, *parent = dev->of_node->parent;
+	struct clk_bulk_data *clks;
+
+	if (cmdq->pdata->gce_num == 1) {
+		clks = &cmdq->clocks[0];
+
+		clks->id = gce_name;
+		clks->clk = devm_clk_get(dev, NULL);
+		if (IS_ERR(clks->clk))
+			return dev_err_probe(dev, PTR_ERR(clks->clk),
+					     "failed to get gce clock\n");
+
+		return 0;
+	}
+
+	/*
+	 * If there is more than one GCE, get the clocks for the others too,
+	 * as the clock of the main GCE must be enabled for additional IPs
+	 * to be reachable.
+	 */
+	for_each_child_of_node(parent, node) {
+		int alias_id = of_alias_get_id(node, gce_name);
+
+		if (alias_id < 0 || alias_id >= cmdq->pdata->gce_num)
+			continue;
+
+		clks = &cmdq->clocks[alias_id];
+
+		clks->id = devm_kasprintf(dev, GFP_KERNEL, "gce%d", alias_id);
+		if (!clks->id) {
+			of_node_put(node);
+			return -ENOMEM;
+		}
+
+		clks->clk = of_clk_get(node, 0);
+		if (IS_ERR(clks->clk)) {
+			of_node_put(node);
+			return dev_err_probe(dev, PTR_ERR(clks->clk),
+					     "failed to get gce%d clock\n", alias_id);
+		}
+	}
+
+	return 0;
+}
+
 static int cmdq_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct cmdq *cmdq;
 	int err, i;
-	struct device_node *phandle = dev->of_node;
-	struct device_node *node;
-	int alias_id = 0;
-	static const char * const clk_name = "gce";
-	static const char * const clk_names[] = { "gce0", "gce1" };
 
 	cmdq = devm_kzalloc(dev, sizeof(*cmdq), GFP_KERNEL);
 	if (!cmdq)
@@ -612,29 +655,9 @@ static int cmdq_probe(struct platform_device *pdev)
 	dev_dbg(dev, "cmdq device: addr:0x%p, va:0x%p, irq:%d\n",
 		dev, cmdq->base, cmdq->irq);
 
-	if (cmdq->pdata->gce_num > 1) {
-		for_each_child_of_node(phandle->parent, node) {
-			alias_id = of_alias_get_id(node, clk_name);
-			if (alias_id >= 0 && alias_id < cmdq->pdata->gce_num) {
-				cmdq->clocks[alias_id].id = clk_names[alias_id];
-				cmdq->clocks[alias_id].clk = of_clk_get(node, 0);
-				if (IS_ERR(cmdq->clocks[alias_id].clk)) {
-					of_node_put(node);
-					return dev_err_probe(dev,
-							     PTR_ERR(cmdq->clocks[alias_id].clk),
-							     "failed to get gce clk: %d\n",
-							     alias_id);
-				}
-			}
-		}
-	} else {
-		cmdq->clocks[alias_id].id = clk_name;
-		cmdq->clocks[alias_id].clk = devm_clk_get(&pdev->dev, NULL);
-		if (IS_ERR(cmdq->clocks[alias_id].clk)) {
-			return dev_err_probe(dev, PTR_ERR(cmdq->clocks[alias_id].clk),
-					     "failed to get gce clk\n");
-		}
-	}
+	err = cmdq_get_clocks(dev, cmdq);
+	if (err)
+		return err;
 
 	cmdq->mbox.dev = dev;
 	cmdq->mbox.chans = devm_kcalloc(dev, cmdq->pdata->thread_nr,
-- 
2.45.2


