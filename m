Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B41D606A326
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 03:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4hpamf8y;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CFlj7F9h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4lG89XlZpENs4zeOK9AgQPwgrP8/MDI8XqvYIIzJlLQ=; b=4hpamf8yepI4wphzt9HhcVnQFW
	nRm4wN60vrRkizBuShAujxPRIFoOKqwhYbkQtlsd1ARC/tW2Ufr8dql1dRu0SyeeTNoiA8MZKu52A
	JuedgwVk5MZKMf/V6lSF835UKVE3zVl5oSStk2GFZuWXeGKWL0y0/nyzXDxJGahTdY2rYKATsG6hP
	aXPRNRd+Mgud/T26/k5TCMxhMeaS1yObrK49Le/Sh2Fp+LpJAZctb3vnGIouQYglkMCWtD4wXiTaZ
	fWFVULnnUdjKGWhP5jQKTYgcWhpXzDFcuZ0Utxh5BlyuR+8rCq8sVZtWLAKOLVg+bPQvLqwAuFIS/
	IUm+qJJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPst-0000000ByMX-3f0S;
	Thu, 26 Nov 2026 03:10:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPsQ-0000000By5S-0sHS
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 03:10:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F261D4485C;
	Thu, 26 Nov 2026 03:10:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795662625;
	b=ruMEuNhGqaYyJWXuJrOcvzOvoyoe11W+FqlzyHPsaNlF27ntRT77L8B1y6QQGNTgP0Qy
	 MPyEm/cvKRtwpfbpCWKfqVnuBr+7F7fXNucd4J8wH3/BzOgBaTpHAy4epNSUprfYJQdX4
	 f5R4NrnGBczZ/8z0f21cBGPKDCIXpbFz1mDAVupfI1zKbLw+lGqpl3+LphSVDHLaOOmo/
	 FbcTYkWQKJp/HnmhnkHx905qc6ND7qryYZzs1ong/fTqJcCZcuObzdv907CLVn1MCx79l
	 VENUW2/cZh0LkTf5+31nPwYktJZZ1C9zOWgUkY/mXuu1CdyUC3Bfx40WV+lKxXxw9uw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795662625;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4lG89XlZpENs4zeOK9AgQPwgrP8/MDI8XqvYIIzJlLQ=;
	b=tdv6I+xMBwMoRb/RQLgntPs5aJLIXwLqdVDFHkUYtBtRCoBVXb6STYPgo5lwafRglVzy
	 HGbc2TPW9QnAM2bYWJlKHojgm4aIUpspLVqGqDeZDSz5l5p/7bu9C637B99zamBNDWc4Q
	 Gof8hRGDxmU/KCMcroke6cpiTSvmDIjkDZf/U9PovpkW86ljjd09tqAb0rVbQECki3uMT
	 NwmlWDpq1tgwMgaUyJDyIalVN+jqGEUp0V1UQ47XKDkQm8efLSGlm9IlDay6V2loVUxdk
	 LaD9KN95qnwGyY0pZTrelVsGigL+Vw+arSQI7KBWh3rZ248PEoadyWzgIIzUHnUkBQQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5BF961F000D8;
	Thu, 26 Nov 2026 03:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795662625;
	bh=4lG89XlZpENs4zeOK9AgQPwgrP8/MDI8XqvYIIzJlLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=CFlj7F9hoQIW2QayZZ0MLnnUVKbHhRDLOdrsXmkpgB3T6jRLnUeIFa6dfx3DLC5xN
	 QDgk0AayYAGuCaXV9BFLA+ulzGKx4998cuhLs5mFugjzIGqsEYGCcgQTMJ2Yqeg+ae
	 E744hp4ndLnBlVkTKP74/u/0voDTA6RRGSx3ff5pZBp1hBEhy/QUVO6uIB2YUkonzY
	 JRa26t+nDvFR11s6+PfymfdVGFoYhhQnYJynBCChhMrF5IRhsA2Hfg+mBqg3ytgZNM
	 5D2wVtt1QRJ/JM1U03F8DXbT/ginHE5MsopD9wM4vqG8Z0trZLmQh2pCqWIEFaQiXJ
	 HRgJcE0D5KQhg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BE8194D1F0;
	Thu, 26 Nov 2026 03:10:09 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: peter.wang@mediatek.com, stanley.chu@mediatek.com, 
 martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 louisalexis.eyraud@collabora.com, linux-scsi@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] scsi: ufs: mediatek: allow clock scaling when
 ufs_fde is absent
Date: Thu, 26 Nov 2026 03:10:10 +0000
Message-Id: <20261126031008.27506-3-iasnezhkov@gmail.com>
In-Reply-To: <20261126031008.27506-1-iasnezhkov@gmail.com>
References: <20261126031008.27506-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795662608; l=1692;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=JrSCC6bqmjDSayjLVPuM/lqnbwzNiJ316tX4mC55cw0=;
 b=WlJ6RSWIlNpmwPCJm9rOCp74Wf4sAwQyre/FuX8xHvV2Wb1+gnofB6HT01qI3BxFab/QSk/hk
 T5xVyGu9vKxASqXffTcrtdDdaR1GyjXEyN/3ew8a14trS8Y3MznGiAW
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

Fixes: 5e5976f5242d ("scsi: ufs: host: mediatek: Support FDE (AES) clock scaling")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
Changes since v1:
- Moved AI coding assistant note below ---.
- Found on hardware and drafted with an AI coding assistant.

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



