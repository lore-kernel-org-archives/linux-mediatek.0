Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1D6606A33B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JiSydLBe;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F13E/eUn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SAlISZPlGKgE20NTOOmnOxWiPG/pnscyYEr/0HgCOWM=; b=JiSydLBeQ1+YHg6NDUgCgxP0ND
	yQXGYsRT749IXsxQgi6MuRoYFiqvy5x6uDY2ZeaKvLUBgUdD0mTOf8rEfcU9M8ciRzekwuoKXdS1E
	tt6qHmaFABjoKKBfaPc2UPmMuCDDSqXXT1C76ur5M/ZnKAiahJ3FGJudF3pn1TcmNsZyZeIOb1u14
	QYGoLYH1BSZg9wtt6OE6hoh4nWWTqhrWq2Tyd1HnFnzjGqERv0TEie/Peh1DJi3cUSu5sUhdJpQXP
	yl8J3StMmlIOi0conzZ4IHCtyXcjK+aCpq9Lz3aRii8KVYkdzboBP9KYTRPdS0YOxZWQA792RoSi9
	ut6Mi/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNk4-0000000BiKx-3Rmu;
	Thu, 26 Nov 2026 00:53:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNjr-0000000BiDM-3HJl;
	Thu, 26 Nov 2026 00:53:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F7A3618F2;
	Thu, 26 Nov 2026 00:53:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654406;
	b=s+rglzAVPWk5L/tloduIk2SA1s9KS3kfHwj4nvtrquOPRs5C5Q2wCNQLW1/b1lUXecyF
	 xt9XWQqww8InM5/S8KyWFMcyiOxebQcOf+H7qTnuS0vw4YWENtYQx/oOG48+feV3+oY0s
	 0OQr1nYhPZoAGpfJSDRFp+X6iUnqQz6LQYd0W88qeo2rcYDEQdRNCW7DENhhxWpBUk6vw
	 CIT7dR9HU9qs7qH8Z+jq2rXpA6btnv8U43J1dqh9vcB6xKCvpkmhn83t1x4El5rhy6Bgt
	 78NQGAs5QwL+gCtLhVAAkXy14oOKZ3LG7XRovwzUYe04pIpLwg00KbNNsRt62bXfzUA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654406;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SAlISZPlGKgE20NTOOmnOxWiPG/pnscyYEr/0HgCOWM=;
	b=dU95FOjJJeE9opwqd7WVXFlD4Aym4h7KXGlQdqsB5HrE7xWq50MailffAiPLK+sY6p/K
	 12ZEzcuhVVeIDYvjcdWFl4T5U6B/BVOmio/R8nXSUu4XBi73xYECuY/seK2UrrBS3oReQ
	 z6SBuA2AOnyLJPFhuLeMNOXiSADiI27tvA77cKWQwh8PYC1DNgR8QP44tDq8My8asnQWa
	 ZmXh23QSdrr0hv6v1stUMw1MT1uKhAjdPk/bgJDrw0J2e7g9sx0bnRa3CnkVnx5azTQeA
	 ND5uKg4UYgak8JIKpkKuLD0K2PzIlLZA0dKLAf9yodqb5ZiEgOBamiMOJv7efbqo3pw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6AC641F000C6;
	Thu, 26 Nov 2026 00:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654406;
	bh=SAlISZPlGKgE20NTOOmnOxWiPG/pnscyYEr/0HgCOWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=F13E/eUnebHnngKUoE9DfnBnfJpWG9/YbsF0HoKkou91n1WuFsxTA/q3hOhiOYw9D
	 vtOon3GZ65yQoXPM/eD51Bpaxicju15U5TgaFt5YiUzjBEERrmKIMRb/ja3I2xPjI1
	 SMBAegEUQf/nUREl2SwYxbuGDfEC7+KDcukXcvUBZFUq3ao06fnY/oJUwgc2Bj7ZzG
	 YhhLO+ltYalFuOJl8HV72MkcALzKc8kjvBTe+oJC3yuMO0ArqZQSnfadVejE1qPZ/x
	 9dJwqS98u965iR7fZ6+uxzlIhddpZKFJt9HXa7yReA11/x9si/zGEjlsK9fehRtMWL
	 i7gdcXTiPuaZA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E31DF4D119;
	Thu, 26 Nov 2026 00:53:15 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, linux-sound@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: mediatek: mtk-btcvsd: check bt_reg_pkt_w for
 0xdeadfeed in btcvsd_tx_clean_buffer()
Date: Thu, 26 Nov 2026 00:53:15 +0000
Message-Id: <20261126005314.71606-2-iasnezhkov@gmail.com>
In-Reply-To: <20261126005314.71606-1-iasnezhkov@gmail.com>
References: <20261126005314.71606-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654394; l=1768;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=od5JgiRPKhJS8T2nyAhO51juiYOD8biytma5Vs2f0n4=;
 b=0x0khT7NbeBEi+gu6pYGVAaIuWAMKLi2x60dVwh5I9qZLlynk19VXXXdkGP4QwFE7QcJubYOD
 pEl9zSUNn+cCkAw9SJpX6FkTwL1p337hT3xy+B8HqvWBaAgbkI/FWR3
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

mtk_btcvsd_read_from_bt(), mtk_btcvsd_write_to_bt(), and the loopback
path in mtk_btcvsd_snd_irq_handler() all read *bt->bt_reg_pkt_w and
bail out on the 0xdeadfeed sentinel returned when BT connsys SRAM is
unpowered or resetting.

btcvsd_tx_clean_buffer(), called from mtk_pcm_btcvsd_hw_free() and the
TX mute path, writes mute frames directly to previously cached
bt_sram_addr[] addresses without checking whether BT connsys SRAM is
still powered. If BT entered sleep or reset after those addresses were
recorded, writing to the cached SRAM addresses accesses unpowered BT
SRAM under tx_lock.

Return 0 early when num_valid_addr is zero so closing an unused stream
does not touch BT registers, and otherwise verify *bt->bt_reg_pkt_w !=
0xdeadfeed under tx_lock before writing mute frames.

Found and drafted with an AI coding assistant while bringing up MT6789.

Fixes: 4bd8597dc36c ("ASoC: mediatek: add btcvsd driver")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 sound/soc/mediatek/common/mtk-btcvsd.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index 19329dd..752856a 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -335,6 +335,15 @@ static int btcvsd_tx_clean_buffer(struct mtk_btcvsd_snd *bt)
 	dev_info(bt->dev, "%s(), band %d, num_valid_addr %u\n",
 		 __func__, band, num_valid_addr);
 
+	if (!num_valid_addr)
+		return 0;
+
+	if (*bt->bt_reg_pkt_w == 0xdeadfeed) {
+		dev_warn(bt->dev, "%s(), connsys_addr_tx == 0xdeadfeed\n",
+			 __func__);
+		return -EIO;
+	}
+
 	for (i = 0; i < num_valid_addr; i++) {
 		void *dst;
 
-- 
2.54.0 (Apple Git-157)




