Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2ABC001B0
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 21:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f9vd/UBc1SwqgKl3wWxYWn0N3AMiNAnsf5IgxuUq+0U=; b=OIEc86fIpPjSkrp73KhJ4KtIFr
	uMKn44lc5ZILvBCxHg/WYyyqebqSzAk7ehbWtRfzHkcFiWvEhVvtw7X+69p9ITorTfp/l/QJZfk1w
	aUnNkaU7ksNjW/yqJLjE8APl0oO7A4WkWIAfTkiKEqrcfDHvaejzBvu+VCtgiVsAbOQkTnREYnYDr
	YNaDYqB/8GCRFtxcqXEermB76yI0NAKcODhg6X7rlxIc71KnHeSUa+uPRKVlY9whXpEVwQTBnO+YD
	QSFxLQRkNA8tXb9QJgJIuscTZ31fmgEvMsg/wcVK9+7XyOvD0vo2DWH3B8lhtTVul26wVB/vOVDyQ
	WxP4FLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKQAj-007GOo-2X;
	Fri, 14 Jul 2023 21:17:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKQAf-007GNn-2S;
	Fri, 14 Jul 2023 21:17:51 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6AC5D6607061;
	Fri, 14 Jul 2023 22:17:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689369466;
	bh=XnDJ8qbJU/PYiUdNGYMysu5RX/VThqsRxmhyWnGafds=;
	h=From:To:Cc:Subject:Date:From;
	b=jZRn7K12Ns+WqeS++HfR8mExp7Lsn3OxEK67DFBBgAU/8urfa5rPaiCXQgAX/DYFq
	 ebqxYECWUitP5vuJTx1N9Id5lzngzet/pCwkF0pNfakzsfbL5IsLvFhp70RIcMTYkL
	 7e5kYJ/+f5khcACX/Uv/82igcOV/Zx+06fGkG6N0ZKLfisLSjaJeq2wEVPbrFxVqa/
	 4WJ7pJCZ+xQmvVW63BOLR0MMMw+1nz4c0Az68yu3QfhDMR5s9bEOXKBC2aIy1fDZ3s
	 OmSxY2fQEhGDiUvU3LG+Z+Ij3Oxs+tiV+S8XQcXlu5qUhyptNoL9c1L5T9dpOsONH3
	 olYTtoKPudFaw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	James Lo <james.lo@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] spmi: mtk-pmif: Serialize PMIF status check and command submission
Date: Fri, 14 Jul 2023 17:17:10 -0400
Message-ID: <20230714211739.42928-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_141750_139643_1C0DF4D0 
X-CRM114-Status: GOOD (  19.40  )
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

Before writing the read or write command to the SPMI arbiter through the
PMIF interface, the current status of the channel is checked to ensure
it is idle. However, since the status only changes from idle when the
command is written, it is possible for two concurrent calls to determine
that the channel is idle and simultaneously send their commands. At this
point the PMIF interface hangs, with the status register no longer being
updated, and thus causing all subsequent operations to time out.

This was observed on the mt8195-cherry-tomato-r2 machine, particularly
after commit 46600ab142f8 ("regulator: Set PROBE_PREFER_ASYNCHRONOUS for
drivers between 5.10 and 5.15") was applied, since then the two MT6315
devices present on the SPMI bus would probe assynchronously and
sometimes read the bus simultaneously, breaking the PMIF interface and
consequently slowing down the whole system.

To fix the issue, introduce locking around the channel status check and
the command write, so that both become an atomic operation. A spinlock
is used since this is a fast bus, as indicated by the usage of the
atomic variant of readl_poll, and '.fast_io = true' being used in the
mt6315 driver, so spinlocks are already used for the regmap access.

Fixes: b45b3ccef8c0 ("spmi: mediatek: Add support for MT6873/8192")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 drivers/spmi/spmi-mtk-pmif.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index b3c991e1ea40..208ba0adfb98 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -50,6 +50,7 @@ struct pmif {
 	struct clk_bulk_data clks[PMIF_MAX_CLKS];
 	size_t nclks;
 	const struct pmif_data *data;
+	spinlock_t lock;
 };
 
 static const char * const pmif_clock_names[] = {
@@ -314,6 +315,7 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	struct ch_reg *inf_reg;
 	int ret;
 	u32 data, cmd;
+	unsigned long flags;
 
 	/* Check for argument validation. */
 	if (sid & ~0xf) {
@@ -334,6 +336,7 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	else
 		return -EINVAL;
 
+	spin_lock_irqsave(&arb->lock, flags);
 	/* Wait for Software Interface FSM state to be IDLE. */
 	inf_reg = &arb->chan;
 	ret = readl_poll_timeout_atomic(arb->base + arb->data->regs[inf_reg->ch_sta],
@@ -350,6 +353,7 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	/* Send the command. */
 	cmd = (opc << 30) | (sid << 24) | ((len - 1) << 16) | addr;
 	pmif_writel(arb, cmd, inf_reg->ch_send);
+	spin_unlock_irqrestore(&arb->lock, flags);
 
 	/*
 	 * Wait for Software Interface FSM state to be WFVLDCLR,
@@ -377,6 +381,7 @@ static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	struct ch_reg *inf_reg;
 	int ret;
 	u32 data, cmd;
+	unsigned long flags;
 
 	if (len > 4) {
 		dev_err(&ctrl->dev, "pmif supports 1..4 bytes per trans, but:%zu requested", len);
@@ -394,6 +399,7 @@ static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	else
 		return -EINVAL;
 
+	spin_lock_irqsave(&arb->lock, flags);
 	/* Wait for Software Interface FSM state to be IDLE. */
 	inf_reg = &arb->chan;
 	ret = readl_poll_timeout_atomic(arb->base + arb->data->regs[inf_reg->ch_sta],
@@ -414,6 +420,7 @@ static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	/* Send the command. */
 	cmd = (opc << 30) | BIT(29) | (sid << 24) | ((len - 1) << 16) | addr;
 	pmif_writel(arb, cmd, inf_reg->ch_send);
+	spin_unlock_irqrestore(&arb->lock, flags);
 
 	return 0;
 }
@@ -488,6 +495,8 @@ static int mtk_spmi_probe(struct platform_device *pdev)
 	arb->chan.ch_send = PMIF_SWINF_0_ACC + chan_offset;
 	arb->chan.ch_rdy = PMIF_SWINF_0_VLD_CLR + chan_offset;
 
+	spin_lock_init(&arb->lock);
+
 	platform_set_drvdata(pdev, ctrl);
 
 	err = spmi_controller_add(ctrl);
-- 
2.41.0


