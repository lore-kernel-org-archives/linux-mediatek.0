Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759E360A3837
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 09:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yJ0Ii+hl;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ewfTgzr0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VDwFEGyVQgtBZkQFcesk6CRn82+sTJh+EWU2kWF78Wg=; b=yJ0Ii+hlmvB7yc
	GR5TtExcwntv5nQlTGCIk+TZD8b/B6Nf5JziJGxSqw44F32M5oQF4R+7oXdM/8XoaIQzUk/eu/YqY
	xGrQTuIcC5lijBQFhZ44KgFrOKFsXHPdYWRO0Fp1xMF21aSm/QuQj2pnUfUCmkN3g1QHk9FgGob+u
	CdAoOKyOo8cw0yG+KpnMS6ahqj8N9Ea0AzTKWQMeJF0btCSlJ2TJ5Ji/k4u8VHUNOYcGjx11eOFNi
	dRdL1B4CWzdCBoxdQZEA8/qtONuxc4BXMtEaGWATTzDRo1hrFK8iYndKxs2FXIIz8aHA66/L9tRkI
	9IjozmZsF/Nswzdl80IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHT7-00000002AF7-02Cw;
	Mon, 26 Oct 2026 09:58:17 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSx-00000002A4x-3iKe
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 09:58:10 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1237299b3a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 02:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008687; x=1793613487; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDwFEGyVQgtBZkQFcesk6CRn82+sTJh+EWU2kWF78Wg=;
        b=ewfTgzr0vaia0Stg6x7fCEi9Wpn7ttYHLsLWQMj4645YkXB2wcN88vo+QaSgewdNh7
         awiu4FnZyzsbIeV1nC1RTDQoQF714ey+apc1K2idUl6R1YNobp0NKZhWjxF6GTdbiPRP
         lellNuZIhofxaKDv3pG5i0V+kNClp9rNvVsjYkaHB7yjXKyLUhJ4uBl4Tr85v7TtBnKR
         ybjt/Hyzr/+If7grCqQLt8ON2xZLeVdEOf+/GdHqmZVgLv5fozm00HCJ+8khAfSxtwtx
         YD/Zb3StO7dkc7EUByAZxI3g8GNOivSlpyd9h7AlTKqvGBCxfsM23udo4NpY7KXxSgYF
         gRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008687; x=1793613487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VDwFEGyVQgtBZkQFcesk6CRn82+sTJh+EWU2kWF78Wg=;
        b=UN1U0AOWwYxHIFigKWq3yFhItxngLtKA47M1dQTxuEWeqYe6tWRz9Mxmf2dWlnmvmC
         0gNZ/vO3u35KhGQdrIFXJqcVu0SKs+2J3NfwSzTN879THrSUz1ko9ZlNVWqyQx0FT/b9
         RTxbYNBOr0bfe2HUyc6Y8zJf2gMXmRR2b6m8UNm6AGZ+zGJJlJsi9gOHE7uhvuG5l7t6
         p5HOS2zoSjXu3C05ib3V9Sj4P321KqASc0Xm1P80CxF8BcbrVRLH+U/DmX7kbWBAKCMQ
         mjRChJ7BaWVO9uObPZ6jz3H2XcIumiBqPdOUOKrFhNr8TKR7uWfaUMGqyCW5Xk3EExfH
         TCwg==
X-Forwarded-Encrypted: i=1; AKwUvBwNNXufX9kupNSVGxrdlZ7Aeea/nTHGKqWSNry3Xg/zGvqFZ9TmxUmx6B5PZknr/jkfG2DmrteWRRmgYitT5w==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6eHpuoDUn3G/9/jYrmxBukvTDzyAwSTuEd4zcpap9yY3LeioG
	Z0SraYGQhFn9egkwChFEzeeol8hIMTmSI2XJVJxWicNDfcMsI0JpRJrrkfnmSAcQ
X-Gm-Gg: AYBFou2bcN87k/9hXMbU+5vgAGetGiZtOTifBPcswhaF3h3sCJ0jfms+rgX4H+nw7GF
	KMgLDqGdw6Ci4OvaYZX+nu61vgw4lT5/2P/NsvXUjuwc3oBQoxXDkDeXIptnINomf+jLiAccDRg
	1I+TvK0Ie5PwBb5lknhaLvrvYaouPUA7E7sNqEv/eqGa4yC7GjMOswrClEIkEi31QYtsWduiS6R
	hezjL2h6JrX1VkoEauB7u/26KEnICsT0cqvgIGyqe9tsgO0H1/UVIBjbQ4jOi1873OlMiaZGLoK
	gzU2zsQR8ADC32HVLV34Sv58ffoO5QpTya9tlq2x6gzL9WGbGd9R7uoZLU34Kcql1uD+HkHdzly
	xtBheCJujcYh+QtlM7x+MUKvPM8H9mlzlL+dnRjeTMamuUwyoErRgteaUVLbDau2gFetoF5SFZD
	9DW94AtBSQfLcdb5Y6G8+MoY6x65gWv/hhM9gdmkWdN6+tzxxkcUY4A6SbSCv5FLiWeGLlHTO1k
	23/biZcvgcbKBKsJ04OfB8B9ii39+n8N4SDhZaV7wk6Uy4qIlo+fcxyt9yWobm1OeXQu8n3eEg0
	58dpAea7jw==
X-Received: by 2002:a05:6300:6bc9:b0:3e0:ee68:77e9 with SMTP id adf61e73a8af0-3e7bfa1f8ccmr4070259637.14.1793008686851;
        Mon, 26 Oct 2026 02:58:06 -0700 (PDT)
Received: from [127.0.1.1] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bf0f4dcsm1095577b3a.44.2026.10.26.02.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:58:06 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Mon, 26 Oct 2026 17:57:30 +0800
Subject: [PATCH net v6 3/4] net: ethernet: mtk_wed: free up rings during
 detach
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-wedfix-v6-3-a52f6b15d2fc@gmail.com>
References: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
In-Reply-To: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Sashiko <sashiko-bot@kernel.org>, Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793008668; l=1486;
 i=hujy652@gmail.com; s=20261026; h=from:subject:message-id;
 bh=UWHNlBK328nlitWq3waPngcB77Xg7ScOwadSLgwLsIE=;
 b=LcWwNARY5jB8Z5a4CvUeT9ByKEYHzcoTRjRnxOpYFt8K3OYc1Wc+OQfcw9T3+x6N+n9wZodMM
 vTQfLdPO0efAw5SswG0HyEDttPwooeBxSl8S8ABpC+lIWlPcNYoRqqJ
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=uXjqvnRsKEfHEyUr63sOg4fEJIDs4AmiW/rB1cWarXg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025807_963897_482AD48F 
X-CRM114-Status: GOOD (  10.14  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

During __mtk_wed_detach, rx_ring and tx_wdma aren't freed up.

Fix this by add them to mtk_wed_free_rx_rings.

This patch is pulled from mtk-openwrt-feeds to address Sashiko's review
and edit to rely on ring->desc instead of an extra flag.

Link: https://github.com/mediatek/mtk-openwrt-feeds/blob/main/25.12/files/target/linux/mediatek/patches-6.12/999-wed-04-Fix-reinsert-wifi-module-cause-memory-leak-issue.patch
Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/message/179000700034.2160803.10594281691384015089%40kernel.org
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 3f0be70c3f14..3044a7a8ea03 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -949,6 +949,14 @@ mtk_wed_free_ring(struct mtk_wed_device *dev, struct mtk_wed_ring *ring)
 static void
 mtk_wed_free_rx_rings(struct mtk_wed_device *dev)
 {
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dev->rx_ring); i++)
+		mtk_wed_free_ring(dev, &dev->rx_ring[i]);
+
+	for (i = 0; i < ARRAY_SIZE(dev->tx_wdma); i++)
+		mtk_wed_free_ring(dev, &dev->tx_wdma[i]);
+
 	mtk_wed_free_rx_buffer(dev);
 	mtk_wed_free_ring(dev, &dev->rro.ring);
 }

-- 
2.55.0


