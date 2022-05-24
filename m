Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4987C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 15:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FAJ42oLZUItNnc4mRId7h90naFqnwP3b1BW22eErkFg=; b=cI06LS5Yzd3FQ5
	cD2X9ayAP2FVLUTK6NG7A5iuPsP/JaR/TtoX5RoW5xJQgSFAuEMh2lwU4+7zop4627dq7PLE2cGX8
	QSJmjNJYPp41E+2L8mAlpjczgmLVZj7izy0HO7dflFiN7GaQ/KhMnYYX5EGqh8GyESubT2kefipIH
	LzR1AcyCzb7Wct8EQ/NqIcC3MFadHawzKef/OkGBMcIsEOpcznxQpi6AAnhPEAl5inCZj6T0N6zhR
	p6LNmGGHljP/c5or1xQNPBrEY/K2c8VyuqFOW9IAHfNmcIWRbnDvy4xeTYVPwZolJDh9c9iyf6iac
	q5mYOuj+rGpL++dPMQSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntWGJ-008OYt-38; Tue, 24 May 2022 15:15:55 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntWFj-008OML-Ov; Tue, 24 May 2022 15:15:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 098691F4245A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653405318;
 bh=Jw7Qs12cCaNOX3+lUyOyFDUD62eb1EsAiVttOmBXYhs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kQ+em6N60cpA2YXTjMqKs4bg02DieVGlrLgitwoWja7fCSSv2O7PL58BaQUck10er
 EEfM1cbBJO1fdSOecYaCjIAmz3qk68JapnydLS8M0yguy9eUXqNOT8o+n5ttjIbD1r
 5Sc7lCfMYpnvx+iosb+m5Fl0fRl84VEQ/tO3QXYFCz3UtLoqWLtdPzw2UyBSUs7vg1
 DV0KBgoFBcVHqeI7l7eDQZ1iMBWsAlM9jHwwp+xWbKRPOganWuot8FewTl7ouVak4j
 kLPjWibrJ6wyRB7uDcE4fChO93cyU2XbobmooLZPdcV2+gkjvRhl2mAc4W0/ICd18D
 pPYi4GHQsu+Pg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jassisinghbrar@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, houlong.wei@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 2/2] mailbox: mtk-cmdq-mailbox: Simplify getting multi-gce
 clocks
Date: Tue, 24 May 2022 17:15:12 +0200
Message-Id: <20220524151512.247435-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220524151512.247435-1-angelogioacchino.delregno@collabora.com>
References: <20220524151512.247435-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_081519_990186_FD2DE44E 
X-CRM114-Status: GOOD (  13.70  )
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

Instead of looking for gceX aliases across the entire devicetree and
getting clocks by then reading these nodes with of_clk_get(), since
the maximum number of GCEs is two, it is more convenient to simply
assign two clocks to both of the GCE nodes.

Luckily, as of now, there is no devicetree for any multi-gce device
upstream: remove the aforementioned mechanism in favor of getting
both "gce0" and "gce1" clocks with devm_clk_bulk_get() instead.

Compatibility with single-gce mailboxes is retained by assigning
only one id to the clk_bulk_data, as the number of clocks to handle
is already signaled by the "gce_num" member of struct cmdq.

While at it, also beautify the clocks get failure message.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 32 +++++++-----------------------
 1 file changed, 7 insertions(+), 25 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 2578e5aaa935..89a0fdde730c 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -527,11 +527,6 @@ static int cmdq_probe(struct platform_device *pdev)
 	struct cmdq *cmdq;
 	int err, i;
 	struct gce_plat *plat_data;
-	struct device_node *phandle = dev->of_node;
-	struct device_node *node;
-	int alias_id = 0;
-	static const char * const clk_name = "gce";
-	static const char * const clk_names[] = { "gce0", "gce1" };
 
 	cmdq = devm_kzalloc(dev, sizeof(*cmdq), GFP_KERNEL);
 	if (!cmdq)
@@ -567,29 +562,16 @@ static int cmdq_probe(struct platform_device *pdev)
 		dev, cmdq->base, cmdq->irq);
 
 	if (cmdq->gce_num > 1) {
-		for_each_child_of_node(phandle->parent, node) {
-			alias_id = of_alias_get_id(node, clk_name);
-			if (alias_id >= 0 && alias_id < cmdq->gce_num) {
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
+		cmdq->clocks[0].id = "gce0";
+		cmdq->clocks[1].id = "gce1";
 	} else {
-		cmdq->clocks[alias_id].id = clk_name;
-		cmdq->clocks[alias_id].clk = devm_clk_get(&pdev->dev, clk_name);
-		if (IS_ERR(cmdq->clocks[alias_id].clk)) {
-			return dev_err_probe(dev, PTR_ERR(cmdq->clocks[alias_id].clk),
-					     "failed to get gce clk\n");
-		}
+		cmdq->clocks[0].id = "gce";
 	}
 
+	err = devm_clk_bulk_get(&pdev->dev, cmdq->gce_num, cmdq->clocks);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to get GCE clocks\n");
+
 	cmdq->mbox.dev = dev;
 	cmdq->mbox.chans = devm_kcalloc(dev, cmdq->thread_nr,
 					sizeof(*cmdq->mbox.chans), GFP_KERNEL);
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
