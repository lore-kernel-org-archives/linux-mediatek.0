Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0844CD128A
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 23:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqtSjhsIGMw3eisHvYjf5GhA8W6tXJZWoW+tqNLCeD8=; b=VuoUcBR4TCkktw3cMZNnhI7xfW
	k/C7ukfJovSWRTCoTXA1DvRaUlQ04T4L0tSRRb1GEkrmM2IrKou1S7XuemH1SX6x4PSl1nD9v6Iyr
	x3Huyeq4IjQ49NwRSIG24m18ZG+ZR2qKNRkUhPN4GmNIp57ZRf8Z13lD7BgztI6CBnHK6njLdVCHW
	EHek2pHb5KvyCvCDoENZSmnrLCwOCIMONHwL7ATwhM99oSqNo1SPXAAZeeXbniWWgE4mohuCzpggu
	uTcYY0LEWTqpkP+0VK/y5xEIHTt+AOuiVr7/Sj+ceW+i1+PzdL2pRa3ajEkv9l/kieCnRqERawEwA
	RTEoiR6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpzY7-0000000G7mx-1SSM;
	Thu, 28 Mar 2024 23:52:47 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpzXy-0000000G7hY-1iyN;
	Thu, 28 Mar 2024 23:52:40 +0000
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56be32b9775so1878405a12.1;
        Thu, 28 Mar 2024 16:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711669955; x=1712274755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqtSjhsIGMw3eisHvYjf5GhA8W6tXJZWoW+tqNLCeD8=;
        b=icPbRd2BKJSSJQFBXXXT+QTeE9DDU8sPL0bFDn1HnHzP7+vBF8tllNNAqjsc2Hp+Df
         Hd0qli9ITCicqBn2qju2btjQqE1hO2eScIfFtqWGyIYFwiegGdB1JrM0EAJrWAUT+7Qe
         dLD4ZvNK3Hknfm9yrFrdMZW0HYIFUI/gzRIpfBDl97IlaBjNi60m35WGzEPkgJ9nv4Dk
         75TcJ5/voOdORT4+bwngpUn51Tcu0WrXdOWO1AsrZjHRyomKs1zgSoQO2r63S62PaA+v
         M2/eOe73ibkFJLaX+zYB4Gg1l4ND+7sn4f1WXnKBbLfZz898XZGzn4nRUlmhzi5zlVq9
         ifxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVQik0TZO4MiL7b4zZpx9Fn+sHAqvuAh1qvVU9Qqa6JsXsfX98hAlnqNPKjEPsa2D4TQl+UiyOw+f1wGPo27OzMMyHeMBvJZsjjgBb5XHj0RJ9jKFigPNw2ZSL+TNdswTLhvM7F+xNVvjHTIBXj31vOWoyGKu7H1w=
X-Gm-Message-State: AOJu0Yw9SuMzER9VWdcZLNsniQ25F9D8+a6Ho0gvhe2z5rgOdj4A5K/j
	LgN2rR6/EqdJCiXDepS6skFw2oA1anCmh1+/4JNQy/NuvrfcoqXt
X-Google-Smtp-Source: AGHT+IG9vSwUMvZ2P+h61oiaTZLpn1bcN9YYag5Q+BphmZLDkUC5jfCveqGuLgKEPPELDEQBqvfaag==
X-Received: by 2002:a17:906:2dc1:b0:a4d:ffcb:1f4e with SMTP id h1-20020a1709062dc100b00a4dffcb1f4emr391810eji.75.1711669955247;
        Thu, 28 Mar 2024 16:52:35 -0700 (PDT)
Received: from localhost (fwdproxy-lla-005.fbsv.net. [2a03:2880:30ff:5::face:b00c])
        by smtp.gmail.com with ESMTPSA id gl17-20020a170906e0d100b00a4df6442e69sm1274302ejb.152.2024.03.28.16.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 16:52:34 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: aleksander.lobakin@intel.com,
	kuba@kernel.org,
	davem@davemloft.net,
	pabeni@redhat.com,
	edumazet@google.com,
	Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>
Cc: quic_jjohnson@quicinc.com,
	kvalo@kernel.org,
	leon@kernel.org,
	dennis.dalessandro@cornelisnetworks.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	bpf@vger.kernel.org (open list:XDP (eXpress Data Path):Keyword:(?:\b|_)xdp(?:\b|_))
Subject: [PATCH net-next v2 3/5] net: mediatek: mtk_eth_sock: allocate dummy net_device dynamically
Date: Thu, 28 Mar 2024 16:52:03 -0700
Message-ID: <20240328235214.4079063-4-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328235214.4079063-1-leitao@debian.org>
References: <20240328235214.4079063-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_165238_500306_EB595FEB 
X-CRM114-Status: GOOD (  15.92  )
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

Embedding net_device into structures prohibits the usage of flexible
arrays in the net_device structure. For more details, see the discussion
at [1].

Un-embed the net_device from the private struct by converting it
into a pointer. Then use the leverage the new alloc_netdev_dummy()
helper to allocate and initialize dummy devices.

[1] https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 17 +++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  2 +-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index caa13b9cedff..cef96c048fdf 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1710,7 +1710,7 @@ static struct page_pool *mtk_create_page_pool(struct mtk_eth *eth,
 	if (IS_ERR(pp))
 		return pp;
 
-	err = __xdp_rxq_info_reg(xdp_q, &eth->dummy_dev, id,
+	err = __xdp_rxq_info_reg(xdp_q, eth->dummy_dev, id,
 				 eth->rx_napi.napi_id, PAGE_SIZE);
 	if (err < 0)
 		goto err_free_pp;
@@ -4188,6 +4188,8 @@ static int mtk_free_dev(struct mtk_eth *eth)
 		metadata_dst_free(eth->dsa_meta[i]);
 	}
 
+	kfree(eth->dummy_dev);
+
 	return 0;
 }
 
@@ -4983,9 +4985,14 @@ static int mtk_probe(struct platform_device *pdev)
 	/* we run 2 devices on the same DMA ring so we need a dummy device
 	 * for NAPI to work
 	 */
-	init_dummy_netdev(&eth->dummy_dev);
-	netif_napi_add(&eth->dummy_dev, &eth->tx_napi, mtk_napi_tx);
-	netif_napi_add(&eth->dummy_dev, &eth->rx_napi, mtk_napi_rx);
+	eth->dummy_dev = alloc_netdev_dummy(0);
+	if (!eth->dummy_dev) {
+		err = -ENOMEM;
+		dev_err(eth->dev, "failed to allocated dummy device\n");
+		goto err_unreg_netdev;
+	}
+	netif_napi_add(eth->dummy_dev, &eth->tx_napi, mtk_napi_tx);
+	netif_napi_add(eth->dummy_dev, &eth->rx_napi, mtk_napi_rx);
 
 	platform_set_drvdata(pdev, eth);
 	schedule_delayed_work(&eth->reset.monitor_work,
@@ -4993,6 +5000,8 @@ static int mtk_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_unreg_netdev:
+	mtk_unreg_dev(eth);
 err_deinit_ppe:
 	mtk_ppe_deinit(eth);
 	mtk_mdio_cleanup(eth);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 9ae3b8a71d0e..723fc637027c 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1242,7 +1242,7 @@ struct mtk_eth {
 	spinlock_t			page_lock;
 	spinlock_t			tx_irq_lock;
 	spinlock_t			rx_irq_lock;
-	struct net_device		dummy_dev;
+	struct net_device		*dummy_dev;
 	struct net_device		*netdev[MTK_MAX_DEVS];
 	struct mtk_mac			*mac[MTK_MAX_DEVS];
 	int				irq[3];
-- 
2.43.0


