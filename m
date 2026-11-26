Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E768606A31E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K27PaS8/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kF996sml
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QvMJOhFakPcL4F+qx6uzaaYRnxvtYK5E3EhTI8tmZKM=; b=K27PaS8/6VER/V8hOXIltmF9/w
	lrC5/18r/KMALpUOXFN93zJvoOX0RrjWUg6EV65FHhIZVRGyP+tuqsn+uiVVDWCa3kPIGC2sAjyk5
	Gc9Vt4so5E1ohnA9625kCdxFSSqPjMhK/ihGszkqCDAfatZAM54UHGAOF/8UeEKJLdXMWuYY8nm/x
	ow7RyCY+0fuw/GDYmWS2Zll8B7YkY6KkLWQqCH3LLzWJIGbw3wmMIAITwKs8+82hU1fF3UzTXHBTA
	p+VtEsfcbefnsdUmsq09UszS9+D8KgKgV6wNx0Ra3p0cSvosKpL3+Ut/1/zSD8JCXJG7VitvNk9BB
	HBT9bJZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNQZ-0000000Bf4J-3WMs;
	Thu, 26 Nov 2026 00:33:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNQS-0000000Bf0X-0tkF;
	Thu, 26 Nov 2026 00:33:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A819B61ECF;
	Thu, 26 Nov 2026 00:33:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795653202;
	b=Lnro5f6OwnHz42H1dXVcEwT2EDEUphyxP26ZCTxJUa6k1ULHc3Z13bEGZ7yWUyNXpGUH
	 S9CNIPwqvgwYHOjvnnV6Sz2lWyhCPiVpwDWn5c8d/1Qzz/6uHdd+rB8eH4qGK0ZsjSZdF
	 7ry2nO8gdfQ+ZZodpK7A0OSzA16W7XXrJLEGIRbm6ytigGH4jF6DLkMExwEY+beLwEYWS
	 SbLjUVFnaJBVbBGWfpWgfhpI70gZnltqej123TNW5rVqdDYF8C/HQ4XNdjgiIOohx/qTB
	 Z5bHDWS8QLqJgt0HMdSWuIJb4Sr4HTwV4WvOLACxU3HfBJ5sUWpRK1OB5ZQCfGaqcng==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795653202;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=QvMJOhFakPcL4F+qx6uzaaYRnxvtYK5E3EhTI8tmZKM=;
	b=F+XTi5CBM6mkqza1uZMHiJLcDvohoFnnT9xGzVWNftP7R568ZOXow0bgtY+j/DhCX0ZP
	 C9svfNlqmMikDItvhfwk0/gX6hue7i+5yeXi6ty0mWh/RQnW9m5+5OpBgs47zrovu7Ibf
	 Hllj6hg4ntkxGA3oIRFEUWTTJuAgAteXZjecwWWFqqwsx//w/U6CYTt+nIT88yBzjPpr4
	 PihjmxVENmoCV5p4wZ4m4hBYybMtoYutT2GCVjHJiWV/JGRxdvQkfTJRuX1t0bK7XVuKz
	 qJqm+RKrVP+aLyi4cNdF95T7Cb6HdBDrnvfW+btfWlo3AkgdDwbjdN66hVZA6EWi0Fw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E163B1F000C0;
	Thu, 26 Nov 2026 00:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653202;
	bh=QvMJOhFakPcL4F+qx6uzaaYRnxvtYK5E3EhTI8tmZKM=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=kF996sml7XULg/eXZv6SVRtoUqqIxbny8RXxFadJWQvCuUwQsR77bvosbqNFR+fUc
	 yWZJMiN217dJt2/ymO7uQHr8RCe2Y6IRDdyd5OXywS/g/QqMrS/+mCAPd6IdybR+bF
	 f5azS/4iFFZTcURYX0nAqODTa0IXn0efN2Ilf+UbUiJQRplmBrOf6YriZVN5WhpQds
	 t5jvoDdR48NiUSWOpyLlw3NivcB5+5ge8zMWtCZ4/ZZ9AYMRO5yrcEs9NcXzEBWzmm
	 wrK3/RL9v0SiFRYGiYXTEI/tQ/oKS+QqbOejXxpxWBnOrZYuNeGFuARZFTB+tOoBkT
	 0sCdqXyNgRGhg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 78EF64D108;
	Thu, 26 Nov 2026 00:33:15 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: broonie@kernel.org
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] spi: mt65xx: avoid division by zero when speed_hz is zero
Date: Thu, 26 Nov 2026 00:33:14 +0000
Message-Id: <20261126003314.49090-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795653194; l=1286;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=EATIDf77MiZZ99Ojdza/GsLWfdou7DzHCfNg7tDlYcg=;
 b=m7g3ptY0Ru5dhWfJGTBqNbiQNerQr4f2yzwodq/jQ8gf+QSArAGoVHVqHF7s32M3MRClM0Hf2
 hIs6EkndoZdCrsClfyjPaDDv6MQjUW3jvMI+SPbRtejjwvQytiEty2X
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

spi-mt65xx does not set host->max_speed_hz, so if a slave device omits
spi-max-frequency in DT and a transfer leaves speed_hz unset,
__spi_validate() passes speed_hz == 0 to mtk_spi_prepare_transfer().

Because 0 < mdata->spi_clk_hz / 2 is true, DIV_ROUND_UP(mdata->spi_clk_hz,
speed_hz) divides by zero (undefined behavior; on arm64 udiv returns 0,
which then underflows sck_time - 1 to 0xffff).

Guard the division on speed_hz != 0 so zero speed falls back to div = 1.

Found and drafted with an AI coding assistant.

Fixes: a568231f4632 ("spi: mediatek: Add spi bus for Mediatek MT8173")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 drivers/spi/spi-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 8b4deef..2baea0c 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -509,7 +509,7 @@ static void mtk_spi_prepare_transfer(struct spi_controller *host,
 	u32 div, sck_time, reg_val;
 	struct mtk_spi *mdata = spi_controller_get_devdata(host);
 
-	if (speed_hz < mdata->spi_clk_hz / 2)
+	if (speed_hz && speed_hz < mdata->spi_clk_hz / 2)
 		div = DIV_ROUND_UP(mdata->spi_clk_hz, speed_hz);
 	else
 		div = 1;
-- 
2.54.0 (Apple Git-157)




