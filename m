Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18C3C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jun 2022 08:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VO53xqHaWbeh3+vxOlM67NldvzWgmKrHrMGxSMcCCKA=; b=olqWcyMB7jkrLx
	Cv5XRKnVy+NrfmA/1dKFYs53qJ+Dt5V/40IcgfGJMHIC69/Zuo07sPTW8U+idXSUhjhDPdLtOJHab
	eeOuO8+3+VF2dtlfH8bgLvz3J+yfRjO8yAvLyyRBc+8SZnfoa11JJ1BcUL5Ba9p456NV1aMoXVzJR
	Z5V8xCPYVAQwsbx6xU24AuAjKsmJKr0q48iW3CS4RcKbPBhKlzT2a+KOQVuOZK7xmjsikLZeZrxNX
	9G/lMyWazUiaC/Hxau++m/1wovZvvWnf6oj1vCtKAdgjZTUlIjniVTOKfjv93rQ/Ijjr72CjPQVCA
	FpnwkqbIGjJy87YxjvgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2xi-006iVk-Hm; Fri, 03 Jun 2022 08:47:18 +0000
Received: from m12-15.163.com ([220.181.12.15])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2xU-006iTA-P0; Fri, 03 Jun 2022 08:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=W3JiO5UY4+ex2grmCg
	7a8OXWeSx+fkxzA9451eGZd0s=; b=YuhlqzOr9G8xK8pkLg/tE3S9E681hv6NV2
	VXIjYyQi3jN07ADjbnem/+QrB+WVwOUJuMeBzioFUkPJDbGuZ1p1wa6H1zZ7ZEXY
	7+aCwf/70VdFCinfg/t6YUxRFKy3DRtmTzuMA/YCn5663Qw6cGEVPjAnXPNgDefy
	8RLlGw5Tk=
Received: from localhost.localdomain (unknown [218.88.124.148])
	by smtp11 (Coremail) with SMTP id D8CowAB3U9ltypliCzpDFw--.50149S2;
	Fri, 03 Jun 2022 16:46:41 +0800 (CST)
From: Chen Lin <chen45464546@163.com>
To: nbd@nbd.name,
	kuba@kernel.org
Cc: john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alexander.duyck@gmail.com,
	Chen Lin <chen45464546@163.com>
Subject: [PATCH v2] net: ethernet: mtk_eth_soc: fix misuse of mem alloc interface netdev[napi]_alloc_frag
Date: Fri,  3 Jun 2022 16:46:08 +0800
Message-Id: <1654245968-8067-1-git-send-email-chen45464546@163.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <2997c5b0-3611-5e00-466c-b2966f09f067@nbd.name>
References: <2997c5b0-3611-5e00-466c-b2966f09f067@nbd.name>
X-CM-TRANSID: D8CowAB3U9ltypliCzpDFw--.50149S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFyfKF13AFy7trWxWry5twb_yoW8CFyUpF
	WUta4fAFW8Ar4DGws5Aa1UZF45Kw18trWDKr13Z34fZwnxtFWFkryktFWUCFySkrWDCF1f
	trs0vr9I9F98Gw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR4xRDUUUUU=
X-Originating-IP: [218.88.124.148]
X-CM-SenderInfo: hfkh0kqvuwkkiuw6il2tof0z/xtbB2BEVnmBHKy0oDwAAsE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_014705_184371_A4CA51C1 
X-CRM114-Status: GOOD (  12.37  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When rx_flag == MTK_RX_FLAGS_HWLRO, 
rx_data_len = MTK_MAX_LRO_RX_LENGTH(4096 * 3) > PAGE_SIZE.
netdev_alloc_frag is for alloction of page fragment only.
Reference to other drivers and Documentation/vm/page_frags.rst

Branch to use alloc_pages when ring->frag_size > PAGE_SIZE.

Signed-off-by: Chen Lin <chen45464546@163.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c |   22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index b3b3c07..772d903 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1467,7 +1467,16 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			goto release_desc;
 
 		/* alloc new buffer */
-		new_data = napi_alloc_frag(ring->frag_size);
+		if (ring->frag_size <= PAGE_SIZE) {
+			new_data = napi_alloc_frag(ring->frag_size);
+		} else {
+			struct page *page;
+			unsigned int order = get_order(ring->frag_size);
+
+			page = alloc_pages(GFP_ATOMIC | __GFP_COMP |
+					    __GFP_NOWARN, order);
+			new_data = page ? page_address(page) : NULL;
+		}
 		if (unlikely(!new_data)) {
 			netdev->stats.rx_dropped++;
 			goto release_desc;
@@ -1914,7 +1923,16 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 		return -ENOMEM;
 
 	for (i = 0; i < rx_dma_size; i++) {
-		ring->data[i] = netdev_alloc_frag(ring->frag_size);
+		if (ring->frag_size <= PAGE_SIZE) {
+			ring->data[i] = netdev_alloc_frag(ring->frag_size);
+		} else {
+			struct page *page;
+			unsigned int order = get_order(ring->frag_size);
+
+			page = alloc_pages(GFP_KERNEL | __GFP_COMP |
+					    __GFP_NOWARN, order);
+			ring->data[i] = page ? page_address(page) : NULL;
+		}
 		if (!ring->data[i])
 			return -ENOMEM;
 	}
-- 
1.7.9.5


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
