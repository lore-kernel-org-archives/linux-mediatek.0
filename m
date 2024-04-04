Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FDACD1292
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 11:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGHHnAjzHXOHKZAHNwNt7Xm//rgfn0lSUB+nM5VysgU=; b=KORO7tSAykufsjBExhzEb/qdkz
	uzDQfaBWJ0B5WGlGh1SU1Ss/udzvXlX9lUPwym07JO+a17GGtVid1q7TYaD3JrXbQPBsoILhjks2m
	VM6ChzCyOoABZ90BS3orwL1ZN+7P3rOpJk2PdfubturwRPiyjJRf5AJpApE3Q05hBBTsXja8NJOFr
	h3cHrJX6lrVHV+srzBD4+W271D78G+szbBQoLtnxvYN2/1TtQl6Y89v8CNipcHgk2q9TzWi0aDGQ8
	BZT+Dy1NkUd67QsAv20eJKfMC/S67UpVogNZpjok1NeWfpA4fVbp//Oj3RMIjce9uXUwdGvBJ996N
	qOw6JqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLbl-00000002RXb-319X;
	Thu, 04 Apr 2024 11:50:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLbW-00000002ROh-14ch;
	Thu, 04 Apr 2024 11:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bGHHnAjzHXOHKZAHNwNt7Xm//rgfn0lSUB+nM5VysgU=; b=MK5pPAYEcUrBo1VXVgphWilkKU
	Yn2u6241mq8q0XrJlAG867LgwgfVVgMaXz2p6bOwjQdKFZNI+Tet90KLDOU1aiWQ61WuAt3n83Yln
	J5A3+PdJUyxaT2CImh9v60JxNr/o7w09QBybRl6nP3UiKGCbspzj5rPuxYqbBkQWEzGhW+vQE0dpQ
	M71Iou2d6PtTPQcpa9Nc9U1ZV/QJZ9fWLGoeEuUCJI/o/dMMR/jd3ia7G1mjrj+MXmynBCXsK25Su
	e9a3l38WyWavZ832EGX6acQNz1t7DYWdrINJSs/3Nwu2lEF7UOMIYmqiWZ5APKg1Bb1BiHbElCk6S
	GqvVaZDg==;
Received: from mail-ej1-f53.google.com ([209.85.218.53])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLbR-0000000504a-2oqe;
	Thu, 04 Apr 2024 11:50:00 +0000
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a4715991c32so135007666b.1;
        Thu, 04 Apr 2024 04:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712231396; x=1712836196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGHHnAjzHXOHKZAHNwNt7Xm//rgfn0lSUB+nM5VysgU=;
        b=H8Zu+B7M9Vg3rxLoeGZhW4va7hzaBqgUAheWp9Mky6hAA+QFwd+7JbapPKQe/rr18u
         an4CWk//+cUyDI3D1yH8AMSTPzcbiETU8KvG+NBWbN84mK9R1M5HJbh/bjLijKm6rDVi
         vtdwiz7Lsot3r3qOP854Wr5FS8pUsjs430P7r6N7rV2LOH2vLiyLn5P3Ax82ZicVbE7w
         61sb2AkZL62uPmqVFQ4crnU+h6Epeb1V6eQxU9W9AA+3eMdbYZsM8rUKceATT3w3gwmR
         1rYVR8v1W8LNwAj1xH2C/MdufvDb3dWkXHJYBpE2tWFPjmaxS1fPtQTjHaRE1rm65rOV
         5Kbg==
X-Forwarded-Encrypted: i=1; AJvYcCXNVCSd5h00EQknP5rJOKmaQcVTJA4gn5rOAkkecPS5ah+8bozIa5RKt/91kdttGlmofm3Omz+nqBb8zjwECCq6tQs/2vq3kzadzYEweCR0dTqkBoa7kZfS5RYV3yYcN6Rgk7bZmu00VY+o4wXVjk1Zmch18wLDI5M=
X-Gm-Message-State: AOJu0Yz1WtiNUhO6EEkxKpydQrls6nc7QIIw407EgED1Gs/tgRUDtUdN
	KZ4khdmKSa8nQRm19SxVBPymw9OP8HWliruJxe/2FXf31EWrxz8z
X-Google-Smtp-Source: AGHT+IE3t+BLSiVw4qYEsUV6AW+ru3gx9jWHG3rLtC0+vGDymiwEFCGXCLHQkfj2msACqNOeoyP0iw==
X-Received: by 2002:a17:906:268b:b0:a4e:6414:5afd with SMTP id t11-20020a170906268b00b00a4e64145afdmr1390682ejc.52.1712231396634;
        Thu, 04 Apr 2024 04:49:56 -0700 (PDT)
Received: from localhost (fwdproxy-lla-007.fbsv.net. [2a03:2880:30ff:7::face:b00c])
        by smtp.gmail.com with ESMTPSA id wy11-20020a170906fe0b00b00a4e4a3e69acsm6635185ejb.71.2024.04.04.04.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 04:49:56 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: aleksander.lobakin@intel.com,
	kuba@kernel.org,
	davem@davemloft.net,
	pabeni@redhat.com,
	edumazet@google.com,
	elder@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org,
	taras.chornyi@plvision.eu,
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
	bpf@vger.kernel.org
Subject: [PATCH net-next v3 3/5] net: mediatek: mtk_eth_sock: allocate dummy net_device dynamically
Date: Thu,  4 Apr 2024 04:48:43 -0700
Message-ID: <20240404114854.2498663-4-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240404114854.2498663-1-leitao@debian.org>
References: <20240404114854.2498663-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_124958_490137_95BF0819 
X-CRM114-Status: GOOD (  15.73  )
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
index caa13b9cedff..d7a96dc11c07 100644
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
 
+	free_netdev(eth->dummy_dev);
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


