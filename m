Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBAAC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 18:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3HZPjGWY4VRrAKXTzpvY38O5iWIBdVGuavEILhUuRQ=; b=Yo4ocDJGodcVD1urv00ZMVCT+G
	CSmcRdoEO8AD7HaIWZVCk9mXTj7zzA82g5jtkRcIqPz5FQJlVUnYaOGx27uV1P9qYPnO2XGgHHuDW
	pThiu90s7L/at1Eo3DCafORXu3NbGQK9w4ge0KLQdHikaMgDk/SZKdag4dQaDm0XGaDxTKOBMUiwD
	bhf3U2ulEoavfcCFrNeR68ob3OxMp0a5n7a6Bndljev6ds/NXC5uJCMBwqyG1NKIGw/BbO9rYR1FZ
	t+7AJvTYP2BgNnQdWvtWm62g3uNZHwrQyHCd12E+CIfeAwGgNqP4gdWGdb7RDhD0V4ei0WlmWOD5S
	aZ8tv9rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYVA6-0000000CM2i-1Zcl;
	Mon, 29 Jul 2024 18:31:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYV9K-0000000CLps-3xpx;
	Mon, 29 Jul 2024 18:31:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso20066145e9.0;
        Mon, 29 Jul 2024 11:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722277869; x=1722882669; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3HZPjGWY4VRrAKXTzpvY38O5iWIBdVGuavEILhUuRQ=;
        b=CpgMv0xuD+qrNnPoAneA8pN5fysR7KlkRGbsOOMu3sErif8j5kGKYdrvVWjLOzXZMm
         g+bXamZ4sCdkTH3T5Yce3H/f+pCZ5T1xB9F6ZKmHVANWAq7gNUam7Vu1roJd3C0Pq5x5
         aZT4DAtF97NhG5EPUVYg11TMklI9d7DPMaabax94eTAX5Ts3EYXJQiEL3xhpfap3Djbt
         2a9LydoiAzN0qa0qIiJuTLU4G3lzRxCm6Kd7kBfKes50ovyKjRGox40I8uycWCG7hBmL
         u6V8Gi1FMxlW1TapqRvAzZbj1qWZC00y0ivGr4ChJzGSbdBRecnMO+lVMMZNxuBaHMO7
         2Khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722277869; x=1722882669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3HZPjGWY4VRrAKXTzpvY38O5iWIBdVGuavEILhUuRQ=;
        b=xRlPe0PEVR90RSUxX9xY10SyvfC5TGhkSZtqH1Kmaz9OwXxLmv6n65T/APDLaJ79bp
         WqJKE3D3SE8J3oAZfPJh6O7OH1YuS10GYMQSVaEsBlBiHHQKO44tKkAf501r/99ufjml
         r3+qEGFdmHUA4H4/dE5XyLbDblTFTpFK8fCGUasRionNCHxVi9ynsGu+WHwPe89qZCkL
         zldzn3APWBdBfHEhOskdtYhrnncKsi5DXFQxHxcC5tMWOQAOcW8DBST11Qz8HtKt+VL6
         zY4+G3KiN6/+ZvbSgiRMkPnOfyF7bIGLYEbh96XZ/YnCyz+4arabje2XXOZnnQVvaPJl
         zVPA==
X-Forwarded-Encrypted: i=1; AJvYcCVJA0cmM385GSBbjG7SJZ0cjHADHnM1pigcRKmWPf4RhC3Pbc8u9QVanPgYudG6lBpKQrbgY6QZQsqTwTNeYVpIrUA0/X/EsnkyRXP6+fyIFuM0P1tcewlGEaE0Br+jlIGLrUX8blpiv5K/4679AzUrFkLFX96WSOU=
X-Gm-Message-State: AOJu0YwknWB9pb9jeNH9a/1vSX7HylzXwU4uc8S0w9lGDMGnqHBbjVvq
	XaVauOcv8NfI/Ikti4buB53fqKL4O0tHPUfUSjHbX23vdWOiFBg8
X-Google-Smtp-Source: AGHT+IGqZxgSP4lsPbAxAppqsr2GefFixDAdbJfCPlCS9IEnJzJghfslCrcUrnOqBBH8tG5Kr1hq0g==
X-Received: by 2002:adf:ec0f:0:b0:368:6620:20ec with SMTP id ffacd0b85a97d-36b5d08b948mr5667615f8f.43.1722277869212;
        Mon, 29 Jul 2024 11:31:09 -0700 (PDT)
Received: from yifee.lan ([176.230.105.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c0aa1sm12800165f8f.21.2024.07.29.11.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 11:31:09 -0700 (PDT)
From: Elad Yifee <eladwf@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
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
Cc: Elad Yifee <eladwf@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Joe Damato <jdamato@fastly.com>
Subject: [PATCH net-next v2 1/2] net: ethernet: mtk_eth_soc: use prefetch methods
Date: Mon, 29 Jul 2024 21:29:54 +0300
Message-ID: <20240729183038.1959-2-eladwf@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729183038.1959-1-eladwf@gmail.com>
References: <20240729183038.1959-1-eladwf@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_113111_003440_517C34C8 
X-CRM114-Status: GOOD (  13.79  )
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

Utilize kernel prefetch methods for faster cache line access.
This change boosts driver performance,
allowing the CPU to handle about 5% more packets/sec.

Signed-off-by: Elad Yifee <eladwf@gmail.com>
---
Changes in v2:
	- use net_prefetchw as suggested by Joe Damato
	- add (NET_SKB_PAD + eth->ip_align) offset to prefetched data
	- use eth->ip_align instead of NET_IP_ALIGN as it could be 0,
	depending on the platform 
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 16ca427cf4c3..4d0052dbe3f4 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1963,6 +1963,7 @@ static u32 mtk_xdp_run(struct mtk_eth *eth, struct mtk_rx_ring *ring,
 	if (!prog)
 		goto out;
 
+	net_prefetchw(xdp->data_hard_start);
 	act = bpf_prog_run_xdp(prog, xdp);
 	switch (act) {
 	case XDP_PASS:
@@ -2038,6 +2039,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 
 		idx = NEXT_DESP_IDX(ring->calc_idx, ring->dma_size);
 		rxd = ring->dma + idx * eth->soc->rx.desc_size;
+		prefetch(rxd);
 		data = ring->data[idx];
 
 		if (!mtk_rx_get_desc(eth, &trxd, rxd))
@@ -2105,6 +2107,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			if (ret != XDP_PASS)
 				goto skip_rx;
 
+			net_prefetch(xdp.data_meta);
 			skb = build_skb(data, PAGE_SIZE);
 			if (unlikely(!skb)) {
 				page_pool_put_full_page(ring->page_pool,
@@ -2113,6 +2116,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 				goto skip_rx;
 			}
 
+			net_prefetchw(skb->data);
 			skb_reserve(skb, xdp.data - xdp.data_hard_start);
 			skb_put(skb, xdp.data_end - xdp.data);
 			skb_mark_for_recycle(skb);
@@ -2143,6 +2147,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			dma_unmap_single(eth->dma_dev, ((u64)trxd.rxd1 | addr64),
 					 ring->buf_size, DMA_FROM_DEVICE);
 
+			net_prefetch(data + NET_SKB_PAD + eth->ip_align);
 			skb = build_skb(data, ring->frag_size);
 			if (unlikely(!skb)) {
 				netdev->stats.rx_dropped++;
@@ -2150,7 +2155,8 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 				goto skip_rx;
 			}
 
-			skb_reserve(skb, NET_SKB_PAD + NET_IP_ALIGN);
+			net_prefetchw(skb->data);
+			skb_reserve(skb, NET_SKB_PAD + eth->ip_align);
 			skb_put(skb, pktlen);
 		}
 
-- 
2.45.2


