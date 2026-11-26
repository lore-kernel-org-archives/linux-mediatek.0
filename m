Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069CB606A329
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D5CdnkzM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YPFYTn0j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mbwR7pFzsMlSflXFj+MFOyV2kETMAX7EmTdAVrfOIZQ=; b=D5CdnkzMUlRGQjIOmj6uK4l8vh
	5r8Gz2PeZwBEjvAQ3TtXyAIK84UYsD7k3s+Txu85G5RGqtmwL+H96SsDmSmuzTCca9rJJ0V5aJTW0
	iQuOhyn5OWGknhltqMchIB/85Gw5CHsOTKRpczLSacICzuOXfNC7txpNQhLxtCpP/9j5JMQO1VD2M
	O6ZH2l/WKBwiKObxEYL9e8c4TSREjSLxUFppIVumY5FdU0XpIFV0g2wRxC6wgCG1WHAl+CnJxBzSi
	TZ2FIhlO7+dzabws4e4vmZY/TyUVknEbpaVAlvgvlN2N1hU4JgNJcrnuWpiUJlbLwQUIwwFB/+uYF
	EQpzLZcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNlE-0000000BjEq-2rJ8;
	Thu, 26 Nov 2026 00:54:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNkC-0000000BiPP-1IAT
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 00:53:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 80E4D4653B;
	Thu, 26 Nov 2026 00:53:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654426;
	b=gW6ewdjPWO05WYQoBEVQoO06SwChh69WFslXGpcFzkXqEvHgdUG/Qw2vAhm9qw6eNghP
	 3v0l4+Q1YTDsXO96UeFU8RPrAW9LrZRNdBQV4xSpWZa3ACM16vnIrhBBVVxaJAzp5wX9f
	 JxzD93ut0c/SOL0Ra+5/bp0aH6IQqK0af/ZdZaBGiV2W718CUD+tci3EO/KhScFdLvPFS
	 id3s5BsilMVTEeWno+gyEvqXcnVIO5+mwSwxQkM9OyJRb/hyY9fntD1TJWONHV7RSeDEU
	 7HWDbOk3BlgI6/E7qP4K7/50YQuQvTKL9o/XQ/3HKKGYAVF9lLp26MVIfsZ+djek2SA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654426;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mbwR7pFzsMlSflXFj+MFOyV2kETMAX7EmTdAVrfOIZQ=;
	b=MXh1XIf4VUqYZC6DczfzGiaHzzs6OWWIT9HqqZM2kwgZa17tKN1v7kT/XuegX7as5VIk
	 HxFWu7UYz7DdPZ0XBohUgq8z/yfkKcG1+py823oZ6gU51OB/GeSpD1vjaHNWqGJx9YmwA
	 Rqwkxjr7rXW6a5XB+PGtdgK3EPs033cYmVvIWUKxU2aRt0PhKWjcFr7pUdu8zah8/0b2+
	 Pqt6IXV8ewHOMSjsMxKnkW80j5YzwuURZGqZUJGMqLXLWsqK6UG177ORCRLHGaNsH3BLA
	 d/2VcGt3i3TMykCf4wxpIk1g1y1mfLDyZvx574kWN1BozBGqtG2erucwHOjbM/xAM9A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5FFBC1F000C0;
	Thu, 26 Nov 2026 00:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654426;
	bh=mbwR7pFzsMlSflXFj+MFOyV2kETMAX7EmTdAVrfOIZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=YPFYTn0jPliDqbozyY1dPcK8k7HSbiMguwiBCG52VaK3sDwOnkd+cFt+//fDalChK
	 cNIk0LvE1z73CxO50Xi2aBe6hKRVDnMALFJVD8Kr+hGOxKuIBvHt3AMEG0vLxrzhmn
	 2Vu5t4tL8in+EM7cpuQ/ILt5zMI6E8tOPRYygqkHVXk0oyYjJ/j86g0fA/1aCLSzZl
	 wQPv4Ryc27lrlSlVhCkEyQhILDQgw+FkhAN1TwLIFi1WMpUleT0ggRUAaCBGMhm/eB
	 VLKQWLkUx2J8xg0qJ3V0/dbVErO53RlEXIa1+Mm8Wmj6E4YsPbXe6gJcVP0NomfcU9
	 9pouB/CfxJCJA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A89784D15B;
	Thu, 26 Nov 2026 00:53:30 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: peter.wang@mediatek.com, stanley.chu@mediatek.com, 
 martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 louisalexis.eyraud@collabora.com, linux-scsi@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] scsi: ufs: mediatek: allow clock scaling when ufs_fde
 is absent
Date: Thu, 26 Nov 2026 00:53:31 +0000
Message-Id: <20261126005329.72010-3-iasnezhkov@gmail.com>
In-Reply-To: <20261126005329.72010-1-iasnezhkov@gmail.com>
References: <20261126005329.72010-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654409; l=1626;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=8OS3QXdomVEfbjWk/ztdyTyuzUidpcMVUWrDaQs9DOU=;
 b=2Pi9eTfJLrBrCMBMGVAB7PZAVFxl78WCWdOWzMEBS0E4kVAKG1/ryG4svfqrjRMoWs2zeIRja
 C5lVPSHgrS7B8e9gudrXs5xjXY6ssrC2H7oT2fsR5v3TigDwRZnsjcF
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: iasnezhkov@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ilia Snezhkov <iasnezhkov@gmail.com>

ufs_mtk_is_clk_scale_ready() enables UFSHCD_CAP_CLK_SCALING whenever
ufs_sel, ufs_sel_max_src, and ufs_sel_min_src are present, treating the
FDE (AES) clock as optional. However, _ufs_mtk_clk_scale() bails out
early on !fde_clki, so on SoCs without a ufs_fde clock (such as MT6789)
ufshcd believes scaling succeeded and updates clki->curr_freq while the
ufs_sel mux never switches parents.

Only require clki (ufs_sel) in _ufs_mtk_clk_scale(), and gate
clk_fde_scale on fde_clki being non-NULL alongside its min/max parents.

Found on hardware and drafted with an AI coding assistant.

Fixes: 5e5976f5242d ("scsi: ufs: host: mediatek: Support FDE (AES) clock scaling")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 drivers/ufs/host/ufs-mediatek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 38d05ac..09b7993 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -2059,7 +2059,7 @@ static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up)
 	if (!hba->clk_scaling.is_initialized)
 		return;
 
-	if (!clki || !fde_clki)
+	if (!clki)
 		return;
 
 	reg = host->mclk.reg_vcore;
@@ -2067,7 +2067,7 @@ static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up)
 	if (reg && volt != 0)
 		clk_bind_vcore = true;
 
-	if (mclk->ufs_fde_max_clki && mclk->ufs_fde_min_clki)
+	if (fde_clki && mclk->ufs_fde_max_clki && mclk->ufs_fde_min_clki)
 		clk_fde_scale = true;
 
 	ret = clk_prepare_enable(clki->clk);
-- 
2.54.0 (Apple Git-157)




