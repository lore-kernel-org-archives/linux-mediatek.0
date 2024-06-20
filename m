Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D44C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 10:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNexE38T1XOJX3OeY5vUi1siBpItSGLAITa9a+bu2/g=; b=Bfejs3RbQiiFKIPzkddF/tSgIv
	N2smZjKGTcBamZMwRvn51ouxlQtSjKjHLjTCDvs2zxL75O9RcKI03N0dKR4PaEUONSJOTHeycbYI/
	qMby00JGNayrm10oXT4TlT0U7HrV3C3JKQ/SSAPp+KIVtAhacmy7r6tHq5l4nkCSnJznzQEZJJmuR
	0whItypPkL+AqJUwwUfRyrNL61WbIbCvRUMuzCDhM///BbcGEkZctP4rRkYjlcBGd2FhRAWxg1SSg
	ANR12aEu1tvEpyqGumSMtu2nuQig9CcwbTrvdCNe3kVakFH9uLIRVp/4EVshFxWld4tfHA4HBV8Cp
	19OLgxVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEiV-00000004VXy-1Zhm;
	Thu, 20 Jun 2024 10:08:31 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEi9-00000004VJn-1Jbp;
	Thu, 20 Jun 2024 10:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718878087;
	bh=ShQWh8bzftJTk5vQIrat2XfQUBjG3sEAiV/WjU/elxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C2HMPMDYVWcGq4PnV37zbmAF+xEMSeM1JJDsyy6MTm13uJQdDX6DxIhm5NRTlYTmP
	 /FukztWTTEajkuZYRD5GY8JiziXDIhKTLQlNy+PwIvnJH61PZUZR4n/g3ZJGF7D+Zf
	 WQQ7imfkObBRppAQYAsGwGPbHPmUz3Ma45O9nguyEdJXEl7hbKCibpTfieluNt67Dc
	 4Iv1hK0xUFvUGyZpfg6tz37WdVyTY6nCRzhrOXkf7IhZc2gKAPbrKvAmp7VVKiZx1V
	 kchRBPJvFtHZCY6RK11qtgAXxuP05p0olNt984jskAzWjihBkZAGbnMHkxwgMfQKRJ
	 3dM6Ef0eERang==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1AAE837821B5;
	Thu, 20 Jun 2024 10:08:07 +0000 (UTC)
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
Subject: [PATCH 3/4] mailbox: mtk-cmdq: Dynamically allocate clk_bulk_data structure
Date: Thu, 20 Jun 2024 12:07:49 +0200
Message-ID: <20240620100750.1075790-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620100750.1075790-1-angelogioacchino.delregno@collabora.com>
References: <20240620100750.1075790-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_030809_507441_A1F4596C 
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

Now that the clock probing code uses devm_kasprintf(), there is
no more restriction on the number of GCEs: dynamically allocate
the clk_bulk_data clocks array to improve flexibility and also
to get a slight memory saving on platforms featuring only one
CMDQ mailbox (and consequently only one Global Command Engine).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index a3f57151a221..2a71a5400088 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -22,7 +22,6 @@
 
 #define CMDQ_OP_CODE_MASK		(0xff << CMDQ_OP_CODE_SHIFT)
 #define CMDQ_NUM_CMD(t)			(t->cmd_buf_size / CMDQ_INST_SIZE)
-#define CMDQ_GCE_NUM_MAX		(2)
 
 #define CMDQ_CURR_IRQ_STATUS		0x10
 #define CMDQ_SYNC_TOKEN_UPDATE		0x68
@@ -81,7 +80,7 @@ struct cmdq {
 	u32			irq_mask;
 	const struct gce_plat	*pdata;
 	struct cmdq_thread	*thread;
-	struct clk_bulk_data	clocks[CMDQ_GCE_NUM_MAX];
+	struct clk_bulk_data	*clocks;
 	bool			suspended;
 };
 
@@ -584,6 +583,11 @@ static int cmdq_get_clocks(struct device *dev, struct cmdq *cmdq)
 	struct device_node *node, *parent = dev->of_node->parent;
 	struct clk_bulk_data *clks;
 
+	cmdq->clocks = devm_kcalloc(dev, cmdq->pdata->gce_num,
+				    sizeof(cmdq->clocks), GFP_KERNEL);
+	if (!cmdq->clocks)
+		return -ENOMEM;
+
 	if (cmdq->pdata->gce_num == 1) {
 		clks = &cmdq->clocks[0];
 
-- 
2.45.2


