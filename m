Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5008E606A31E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 23:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DI9Nk0ic;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijep9NGn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6WScmZhGnz6xs9qVATpJ7harTen3WQLAwO1wmN8eQAA=; b=DI9Nk0icD/vXt3wiTh5skrbNc/
	wNNy1zifRs7pqpjec/j6KrNz1Yk2kSZZK9sPvhXC6e32vWwSL4sAp2nXN2LX5+Y5Q4GGebxmWCgw2
	6U5bTMQ5TAspXtl9qr1sKC8y/RqJi4Yzl1PPq6HwgDRFUvjpjH7RcCkcNiEoCzbkKuwnWQB7hv6KI
	Fazv7HnSh7WMwOWDe4EFV/6VPH9eetkgXQaQM3rDUYX1DHCSN7rpmcclatk5LItpnYBe9kS5UAxpE
	hsiZKtv630jc1RQYvuvw45dYXSsKyKE/kuH7Rk67bLHjQlswc7SOzLiC4xKdY7Xiq+kjeuGtgeEgQ
	nC8JUT3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMjJ-0000000Bbmn-0DK2;
	Wed, 25 Nov 2026 23:48:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMjE-0000000BbkM-2BC4;
	Wed, 25 Nov 2026 23:48:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F2F7E61EDA;
	Wed, 25 Nov 2026 23:48:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795650523;
	b=izMk7UwZ7c7G2Gsv341NaPLB9KQ8gkcCra4qT8kxeKuh8rEKjyoFFigY4FyO7mN4l36Y
	 /HKkkQK7Qe190bXzfZMtxruQm+uJIYNXcOhWDaJtV956UdSdy7vETe/iHGLHnOoYLsevf
	 TOmECViBqboVyqA2pMeGTdc1Pikg6jyfsimRhBHpWyBiwfUuoA4GD/vXP/nR0bYHIg37P
	 9cSSP34lV5GrwCQlZIENOAAkBy9xeurprIUHA2/umgjj2GxWhj2MbamY9HcYg3MHPZa+/
	 4WJbErGLtoKm8lM56xgVbga6BSEUK/KaLWD/TsXzU3cVFYtARGsqkhylbXQR8H1unDg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795650523;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=6WScmZhGnz6xs9qVATpJ7harTen3WQLAwO1wmN8eQAA=;
	b=uL8u1tr17KZPfZ0QvrjJVlLRrMygqXJga/Gqp7yoQwl2ihEgLIUwzrJqgKeIXyX1Tf19
	 Mk8REus7TqL6dmSI0g12LY0P0sfOFTQ9Imd806tqDNFmQ+uiXEi2lDqYwjmPKck838BIE
	 D9HZD1F4tKKiBFLSlbGXrM8HLxeL357ficEInmDStanj8pG3YQaqCPR90sQqXLw3kKq1A
	 P3LkuChIE9a4hwpjeU12a3s982lGo0oij0NN8BWHZzTt9gHWd9YoCrZPjTcR+pA6VYl5f
	 TK9ETVm3Xk3O19kObmoORW8zVckpyXD07S1O1PvZ3xqEIQRHEK6J8F1bUlXhDP8NkbQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8BD101F000C4;
	Wed, 25 Nov 2026 23:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795650523;
	bh=6WScmZhGnz6xs9qVATpJ7harTen3WQLAwO1wmN8eQAA=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=ijep9NGnKaFYAr4/8k8Oh9YjfIbH62AVLHx0UnmV9Nr+gbIe4X+3KD2nUkz6HJbjQ
	 cy6lSYNKeIaFTfiz7r8hmZpQXxRzYmugDmEFTI8kYj+J3RBDbCeLYOOVvftMEpJUJo
	 BsPyiBkFQR2t3w4GFoVM5VH01qw/S2yHjziayuU01XX3MT6ukf+Of5rfEjQE5y0H2I
	 cQzS0+7kpuiTkERVj/2WfrqaV7Cj2iMY88jblrMWyf4i7xU2p6A+Xh6fBWxfWt4ib8
	 Dxc72tNbok/klaJQFivxUdH6FnM94GU5SxrC6qOAPxsegH4x3eVc2JuI6937iVakgr
	 MYsRPegnzT3Ug==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 14CD34D0CB;
	Wed, 25 Nov 2026 23:48:31 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, linux-sound@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mtk-btcvsd: guard against 0xdeadfeed in
 btcvsd_tx_clean_buffer()
Date: Wed, 25 Nov 2026 23:48:30 +0000
Message-Id: <20261125234830.94895-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795650510; l=1783;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=W9UyHqccaU9sJaYlkqCsX581VyBG8Z+037komTBj1Ts=;
 b=F9wU7UgJiGB2P7BStff8lAWPeen21Nkm66rJ9rRHWpCkZFY0WYH0G/B5l0W93ngFGlAbZw9Ud
 4ETAUZd1+ooDxOSjHeaJt/7+hfBhl3sX3fMZ/KatqJ8iz7nMHDgESuG
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

mtk_btcvsd_read_from_bt() and mtk_btcvsd_write_to_bt() both reject the
0xdeadfeed sentinel returned by the BT connsys SRAM pointer register
when BT SRAM is unpowered or resetting, and check the SRAM address
before dereferencing it. btcvsd_tx_clean_buffer(), however, casts each
stored bt_sram_addr[] entry straight to a pointer and writes mute frames
through mtk_btcvsd_snd_data_transfer() without checking for 0xdeadfeed
or NULL.

If an invalid or reset SRAM address is recorded or cleared concurrently
around hw_free / mute transitions, btcvsd_tx_clean_buffer() dereferences
an invalid address in atomic context under tx_lock.

Skip any bt_sram_addr[] slot holding 0xdeadfeed or 0 before transferring
mute data.

Found and drafted with an AI coding assistant while bringing up MT6789.

Fixes: 4bd8597dc36c ("ASoC: mediatek: add btcvsd driver")
Fixes: d067b3378a78 ("ASoC: mediatek: mtk-btcvsd: Add checks for write and read of mtk_btcvsd_snd")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 sound/soc/mediatek/common/mtk-btcvsd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index 19329dd..1f52567 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -341,6 +341,10 @@ static int btcvsd_tx_clean_buffer(struct mtk_btcvsd_snd *bt)
 		dev_info(bt->dev, "%s(), clean addr 0x%lx\n", __func__,
 			 bt->tx->buffer_info.bt_sram_addr[i]);
 
+		if (bt->tx->buffer_info.bt_sram_addr[i] == 0xdeadfeed ||
+		    !bt->tx->buffer_info.bt_sram_addr[i])
+			continue;
+
 		dst = (void *)bt->tx->buffer_info.bt_sram_addr[i];
 
 		mtk_btcvsd_snd_data_transfer(BT_SCO_DIRECT_ARM2BT,
-- 
2.54.0 (Apple Git-157)




