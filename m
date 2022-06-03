Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF2AC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jun 2022 04:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5U4zT8aqvJ6FjTRmmFoy7n3t++IuFCB6w114LNkW6cs=; b=yDpKO/T/oIJfPc
	lOtobTgu9aRWYwhncesizfF8oQkIXYE7/P7TFxhfNGolUHlMaEBaMPNb5sohHaIMHGTpdT18hVTY5
	TQ90WJWu38z7oEhjp0qRzCihvlg71kQSB6kiSKizNndD3vChmPBpGEHzjXxPEY9YPgB93wfsVBbYl
	qY+MHuYqDTndssbREW2MPRXwJ3tkVpwJR/isSqy9a+3BDYKI4uJbW0JgC7eO6yNqBRbogv0KjX074
	+okduZY/vV3aPR4Nwu9x8b5tmyYMyv16QBYFmRL+/HuQZQ6NCVIKIGxKp13Nq5koxl0ww6KwjY4sT
	j1UfV8LDcO4SKW34Xpyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwyf7-005kNg-Kl; Fri, 03 Jun 2022 04:11:49 +0000
Received: from m12-15.163.com ([220.181.12.15])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwyev-005kKB-S9; Fri, 03 Jun 2022 04:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=ppRjE54dXKAoRtJpzS
	LrcjgNP0rfZu9Scloxgpg5394=; b=KZ+50YqReumkEfGv3P66uLecTSPM3Ycr7E
	U5TZBpFq3nQNfzvf8pGjNqzf9COQI2ZDAPF4m2HrZdzUJaLuu4T7Jy/RO8hFUxpp
	ILORy0a2O2PmIc8uqOzY0C7dvYZxhZOafMS7UXF+6PC6aYSh9hI0TdO1q8SYPfGF
	Y8d51FWcc=
Received: from localhost.localdomain (unknown [218.88.124.148])
	by smtp11 (Coremail) with SMTP id D8CowAAH6O_ZiZliCHYfFw--.40165S2;
	Fri, 03 Jun 2022 12:11:10 +0800 (CST)
From: Chen Lin <chen45464546@163.com>
To: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alexander.duyck@gmail.com,
	Chen Lin <chen45464546@163.com>
Subject: [PATCH] net: ethernet: mtk_eth_soc: fix misuse of mem alloc interface netdev_alloc_frag
Date: Fri,  3 Jun 2022 12:10:35 +0800
Message-Id: <1654229435-2934-1-git-send-email-chen45464546@163.com>
X-Mailer: git-send-email 1.7.9.5
X-CM-TRANSID: D8CowAAH6O_ZiZliCHYfFw--.40165S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xry3Wr4kGFy8XrW3Gry3urg_yoWkAFb_Cr
	1vvF43ZrWUGr1rKw42kr1ak342kF4kXwn5AFyaqFWaqw1Uur4kZr4Dur1rXFs7Ww1kAFZr
	Cr9xWa93Za4xKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRER6zUUUUUU==
X-Originating-IP: [218.88.124.148]
X-CM-SenderInfo: hfkh0kqvuwkkiuw6il2tof0z/xtbCqR4Vnl0DfymTNAAAsT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_211138_968047_FABF242D 
X-CRM114-Status: GOOD (  10.82  )
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

Branch to use kmalloc when rx_data_len > PAGE_SIZE.

Signed-off-by: Chen Lin <chen45464546@163.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index b3b3c07..d0eebca 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1914,7 +1914,10 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 		return -ENOMEM;
 
 	for (i = 0; i < rx_dma_size; i++) {
-		ring->data[i] = netdev_alloc_frag(ring->frag_size);
+		if (ring->frag_size <= PAGE_SIZE)
+			ring->data[i] = netdev_alloc_frag(ring->frag_size);
+		else
+			ring->data[i] = kmalloc(ring->frag_size, GFP_KERNEL);
 		if (!ring->data[i])
 			return -ENOMEM;
 	}
-- 
1.7.9.5


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
