Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2998C88E5C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 05:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WVOHsi5wK8IUeKTXKaFBxVem+p3DhnYKQL8R4DBSpiI=; b=0HNxbj4Gjqc7zzVjGavuTxTA7A
	Za6OJpu+jh40QacFEbnm6VH4Gxt26eNCfXmapaDf2/A1zX1x6qihYm2ilNgwwsY0CB+SmHE66bqkB
	W2/DsHrq1B02cJOnJYc0g1DMRGp8rqWcD0fMgMFV57Ivqm5z72YZeo+V9VY/Qx87z4XV7BhWZpGn3
	DivAKsuAPAmwoWxv4Z3Z7rveUyvVnaXDMdkfJofa+EfM9ucfoEYCA0hvAEuWRq6eb0pVZpgIOCr/O
	BPCE9Il8bFDB5Ac98Jega97OK9MoWFEiQq0BU80K2l0ohudxKdcXfNDrWOaxQBd5z8/poEAfuyzv4
	c/RGM2zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6i0X-00000008N8r-2ss6;
	Wed, 16 Sep 2026 05:16:33 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6i0T-00000008N8B-2V45
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 05:16:32 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d9004a1ac0so3955905ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 22:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789535789; x=1790140589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WVOHsi5wK8IUeKTXKaFBxVem+p3DhnYKQL8R4DBSpiI=;
        b=FgneBKDVo+TYfkomZNe7D5E4loWqAlj/t6QU/JTiumTn7mVbfUtxC5T3K9ehScEwj0
         Kj/aBiGzZDNk+cGTBPWekGJCFqKbjC7J3zxMTgEtU8BzGsgoy64t+PURln16mGDkW9d1
         cpBPwf3zwshlDYbIDCT1q4nmN5bkLEafqViH2mvLKvZcY+2idIeO5nZxCZrDBD7+TeZQ
         ticc9VhfD+IASHkKwWO2EjRsbX/O7c4pTE3xipeLHurCiI2Afuvy8WloJd7F9BNOg4pl
         0taaRg9yZc0Saxw3odv2qXpjuo9E0OG5fXgxX+43hc9eJOmML1HCr8aRV9fpPL/RN34d
         afGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535789; x=1790140589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVOHsi5wK8IUeKTXKaFBxVem+p3DhnYKQL8R4DBSpiI=;
        b=gWF3fL5+sMe2dMtuI1VTyk/RKZWXtN8PcThWdmXZ3i4O7Os6iQm1TbhFFvWsj7Fq9H
         wv4CzIqlQOLcS48fE3cOtZXJiw4nRFTI3UXGqDBzzIrQkZH2YzmlYYw7Eo7SBhlTdxJy
         h/cromW4DlW1iFlI4Y+DxnYeHmEX5tcVk+X9pq2nSdEeKCfxsYwWKHF1Br/X+HSz5aiT
         004y3lRUD1D9vO6fSMpmOJksZVzhh5e1fBxqD5RDN8kU38mLzf93iVl6ukPxY/06CboW
         CzRi1PEhoxJZvLF1//7y/C6MUC218XtNTL4SoHiCjzeBmjF2OrqT/WlMz/2mJUzIUvFA
         UlMg==
X-Forwarded-Encrypted: i=1; AKwUvBxkGf49j+hfhIcyniRjBqvDyFlOGS2/LHBKpRC4zKAdhb5dIMLFvcRXimq8v2S21wFTkTPgYnIR+avAI0nm7g==@lists.infradead.org
X-Gm-Message-State: AFuF++mhOZ3TFNWyctms6DqZZYH6us3aFri3f9pzk9PYnb+K9/llhtb6
	IapgdG5bho+PmZe2N5VIbXKINwOR0t5PjQniqcqOUcqxOtcRJf90ed15ZkxpTGKA
X-Gm-Gg: AYBFou2qzGLkMfhFGJusfZvcQ1514CqiUR2+tOahRLZJEoKVCFhgSb4y/8rrEBlYsx7
	nbIBjBWesgrIph85MqfmwzvNlCHpKBjNAqCDz+x2YndMyIq2g06iK77/7YXw+Wt4yU3oShhl8WY
	5QL+k2ZzfYLIexjNSXTL9GiBigu0HVvdanj81g4QUQIfM1uPlyl/opNqkXhR2bPahNuJ2pAiQpP
	bMJPpBT1DHKUmfK0SLl8iZXTYDZK7yF1//u481h05B/bxB53vixhBOFlww/8Lo3I+AK46MynESm
	jEbweMLRZdWNWG7CN/ZVs4G96Y6TfJCiGXcpVbumiSIPwP66HXq6bS2mPwk1P7g/Wd+SekHn9B4
	deuYP1NuQYTq0on1CpXyruLm8DYWnYBUTa0ViB7aL82wmEF90ciW5+1Rw2Mogyt4vB3SbM1iuRH
	/1oX+wNuRa6tBqKZvp6MU1WZekuS7iZs59glVrUkNehoar4ws90yxXAXkmjzOXJxtY9O2y
X-Received: by 2002:a17:90b:2645:b0:398:9be9:ab92 with SMTP id 98e67ed59e1d1-39e1e5777famr3113557a91.23.1789535788375;
        Tue, 15 Sep 2026 22:16:28 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bb22ee5sm2428218a91.5.2026.09.15.22.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:16:27 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] net: mediatek: fix PPE resource leak on remove
Date: Wed, 16 Sep 2026 13:16:18 +0800
Message-ID: <20260916051618.2904439-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_221631_344798_23AD93B8 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

mtk_ppe_init() initializes the l2_flows rhashtable for each PPE
instance.

The probe failure path releases these resources with
mtk_ppe_deinit(). However, after a successful probe, mtk_remove()
tears down the network devices without calling mtk_ppe_deinit(),
leaving the PPE rhashtable resources allocated.

Call mtk_ppe_deinit() during device removal before freeing the network
devices.

This issue was found by manual code inspection.

Fixes: 33fc42de3327 ("net: ethernet: mtk_eth_soc: support creating mac address based offload entries")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index be3bd025c41a..04d0a1eec4cf 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -5394,6 +5394,7 @@ static void mtk_remove(struct platform_device *pdev)
 
 	netif_napi_del(&eth->tx_napi);
 	netif_napi_del(&eth->rx_napi);
+	mtk_ppe_deinit(eth);
 	mtk_cleanup(eth);
 	free_netdev(eth->dummy_dev);
 	mtk_mdio_cleanup(eth);
-- 
2.43.0


