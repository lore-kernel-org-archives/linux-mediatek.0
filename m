Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCD0C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 15:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PPD8gJ9cV6O2k5z5drN4BDffP3RH4AxPBal9IAvehBg=; b=IpyNExT2sSkBkRHP4vkAK4RaEm
	3DMWUSJn8jSjyV0aEkT0n5Y+E5otn4qnnL3kO+Pfdp+g00ib9zjC42JOW49H9pXz+GaEktoQCQ0rq
	7Q7QklL5bRpUIs7VAokltbyHoFrJ0iyq0Tt1+uHZl7PiN7yU1WZZmqCPIk4B9iht+SbWk652f0SBA
	Sa8C62m0UyfXIvgR9vsREjVgIUvBLzeFwwI17r8kSgSFXNJSDcbL6HmRBAPGoNlZ09xRoF0cQTFJL
	dEiz8kVyWie78rucBCOvx1J5EE/q9x/6cR30N0SHUgABsVhn3wI0lpf1c8RCQ+AL3Vlh9p1scNTS2
	WSU31+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdWsZ-00000000ihX-14et;
	Mon, 12 Aug 2024 15:22:39 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdWrx-00000000iXJ-0Nvl;
	Mon, 12 Aug 2024 15:22:02 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3686b285969so2505856f8f.0;
        Mon, 12 Aug 2024 08:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723476119; x=1724080919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PPD8gJ9cV6O2k5z5drN4BDffP3RH4AxPBal9IAvehBg=;
        b=XMREmbI3MIrm+MC4Ry4oGIxYLcDshGrIKRPPpB+KP7fvjUbd4OS2189CEzYQYB/5xB
         GxJpIcUTpfzN+nc3Y0L78l+4GenYsQHEcT5G9kil4dPVfGgMUPY+BGsrd7RGeWdj4yhE
         6RGf3hFnZYdQATep9hV8anYmPsMxyxMyJtBubZ4/w6a7Cy3B5wFMvumiUXPj7NGALMaf
         2QCHHkOydpBSYKwXYHueC6yD38O2ksOsDP082cTFZ1gxBKCkKuyFqCuPNlHtAyMK6VvF
         P2XzCTVZgMY12llFfR6c01XiOCkaInUaSTXz+Skm1scRaDOwNIps647Ec07e/ykrbP7i
         djyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723476119; x=1724080919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPD8gJ9cV6O2k5z5drN4BDffP3RH4AxPBal9IAvehBg=;
        b=xUJzbdvIoLQJC64EqJbX4rO4VTfafu/XNhmMeXbg3ggR2H9F3n+7T/6HbhM+lWtdd3
         b6vN+lisKxG35P6ISRs9kX0fAk4qQ2a+pO8WA5etgBnL5L1Q83aypZ942s427o3jW+H7
         zSj1w2AY4d2B2OY13G3IpveZi7EgtQeZAZCALf3Tfp2lt9m/U6qA295dITZgKjMB4Zkm
         Z1pO0QPDmp0uXnrsNiOn01mv+ESeEkY+HHjp1TddcbZKwK0nMq5BOlWYjtBL4GyW0Dk/
         HSvzQBYVVJ/MAvcbSikGBtf0in6f/xtJSVML8JTDdaQbgAF/4tmBgDc36rffBRXajwMP
         3aXw==
X-Forwarded-Encrypted: i=1; AJvYcCVF+5bCkTJXfn531kcTkRhgi9eMHjQY15duYxJ7vOEsv8NVpe3OrBNNxPtoaCN0FAcTFYnWCgxq/50rbvbfeg76KJAFwId8el5VCZQ4g5TTDI4RhjG6rcbq7So10FSRlGsW/Q263kQnOUlLijdGrmpdvp2JHTezyPU=
X-Gm-Message-State: AOJu0Yyxxz6B+3HOLbnf140hMJXQ19ll4nRi87htlys34QDesyOjgvPg
	UnE63cRiSFvhA08fYhq3bpWXPb8nr16TgrzI0X9I0x3fNayg4D4D
X-Google-Smtp-Source: AGHT+IG5B4/73W1aLnLgYfjQ+u1fYxYYhA6rdRE3eEvzEhcHKfoxCgLH5sWm8jJSTeIvBvUOSmXxlA==
X-Received: by 2002:adf:fc47:0:b0:367:993e:874f with SMTP id ffacd0b85a97d-3716ccfecc3mr461173f8f.34.1723476118929;
        Mon, 12 Aug 2024 08:21:58 -0700 (PDT)
Received: from yifee.lan ([176.230.105.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4cfeedc8sm7860752f8f.55.2024.08.12.08.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 08:21:58 -0700 (PDT)
From: Elad Yifee <eladwf@gmail.com>
To: 
Cc: eladwf@gmail.com,
	daniel@makrotopia.org,
	Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen Lin <chen45464546@163.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v2] net: ethernet: mtk_eth_soc: fix memory leak in LRO rings release
Date: Mon, 12 Aug 2024 18:21:19 +0300
Message-ID: <20240812152126.14598-1-eladwf@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_082201_151113_224C30AF 
X-CRM114-Status: GOOD (  11.36  )
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

For LRO we allocate more than one page, yet 'skb_free_frag' is used
to free the buffer, which only frees a single page.
Fix it by using 'free_pages' instead.

Fixes: 2f2c0d2919a1 ("net: ethernet: mtk_eth_soc: fix misuse of mem alloc interface netdev[napi]_alloc_frag")
Signed-off-by: Elad Yifee <eladwf@gmail.com>
---
v2: fixed compilation warnings
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 16ca427cf4c3..e25b552d70f7 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1762,8 +1762,10 @@ static void mtk_rx_put_buff(struct mtk_rx_ring *ring, void *data, bool napi)
 	if (ring->page_pool)
 		page_pool_put_full_page(ring->page_pool,
 					virt_to_head_page(data), napi);
-	else
+	else if (ring->frag_size <= PAGE_SIZE)
 		skb_free_frag(data);
+	else
+		free_pages(unsigned long)data, get_order(mtk_max_frag_size(ring->frag_size)));
 }
 
 static int mtk_xdp_frame_map(struct mtk_eth *eth, struct net_device *dev,
@@ -2132,7 +2134,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 				ring->buf_size, DMA_FROM_DEVICE);
 			if (unlikely(dma_mapping_error(eth->dma_dev,
 						       dma_addr))) {
-				skb_free_frag(new_data);
+				mtk_rx_put_buff(ring, new_data, true);
 				netdev->stats.rx_dropped++;
 				goto release_desc;
 			}
@@ -2146,7 +2148,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			skb = build_skb(data, ring->frag_size);
 			if (unlikely(!skb)) {
 				netdev->stats.rx_dropped++;
-				skb_free_frag(data);
+				mtk_rx_put_buff(ring, data, true);
 				goto skip_rx;
 			}
 
@@ -2691,7 +2693,7 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 				ring->buf_size, DMA_FROM_DEVICE);
 			if (unlikely(dma_mapping_error(eth->dma_dev,
 						       dma_addr))) {
-				skb_free_frag(data);
+				mtk_rx_put_buff(ring, data, false);
 				return -ENOMEM;
 			}
 		}
-- 
2.45.2


