Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD429606D803
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 14:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I3xBMZi+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:Date:From:References:In-Reply-To:Subject:Cc:To:
	Reply-To:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aCryBT0BxE4GLsnVX4YQvOoV2Sj/hFLWMgcKubFl8Vw=; b=I3xBMZi+CcTvPb
	ZzAXT1mxvxmFAl+BfpRzD05budokpcBusQihOFz7VGaOklruvglQfAc0L7Ff8ZeDlwpbr/oT/mLlw
	YOGsagdTW5S22bIBd8CY3Bv42qh3n8WUa+XZjXg0YTql1iFhgZPhGS9yzozQje9IOPv7fBUn4xm57
	1qVfdpNt5h6yRGvMZv9+u222uO9/Z8YXgMjKoUz43UnoAFcTp2gtTdex1xHSvGFLPrCyPs/DcTGWT
	tLuMfTtbN/6I93a35E6Ab04a72rJwvjW8n1fowhxe4RFziECya38Ow/5GAuyHDliL3xpQYjJxm0tB
	r/WOtQw1rIJ61lIrFLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhDa-0000000Eo5v-2dBU;
	Sat, 07 Nov 2026 14:16:30 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhDV-0000000Eo4r-2jWS
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 14:16:28 +0000
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAnvrOuMu9qM6GFAA--.6298S3;
	Sat, 07 Nov 2026 22:16:17 +0800 (CST)
To: nbd@nbd.name
To: lorenzo@kernel.org
To: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: lucid_duck@justthetip.ca
Cc: eason.lai@mediatek.com
Cc: angelogioacchino.delregno@collabora.com
Subject: [PATCH v2] wifi: mt76: fix skb leak in SDIO tx queue full path
In-Reply-To: <20260917154813.5823-1-lucid_duck@justthetip.ca>
References: <20260917122058.2150817-1-vulab@iscas.ac.cn>
 <20260917154813.5823-1-lucid_duck@justthetip.ca>
From: Wentao Liang <vulab@iscas.ac.cn>
Date: Sat, 07 Nov 2026 14:16:24 +0000
Message-ID: <179406098498.2377448.7089145955388574856@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAnvrOuMu9qM6GFAA--.6298S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGr48CF4rZr4kJFWDXryDAwb_yoW5GFWDpF
	W8K3yYvrn7Jrs7C3WkWF48Ja4Y9a1rGr98JryxW34rurs8Zr1Y9ay8Ca47ZrWrtrZ3Kaya
	qF40vrn8G3yDW3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Fb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkF7I0Ew4C26cxK6c8Ij28I
	cwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7IU5HT5JUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgcEA2rvBClMRAAAsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_061626_074213_493FEBCE 
X-CRM114-Status: GOOD (  11.96  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

The mt76 queue ops take ownership of the skb handed to tx_queue_skb():
the DMA implementation releases it through ieee80211_tx_status_ext() on
every error path, and the USB implementation was changed to do the same
by commit 82856da2d3b6 ("wifi: mt76: fix memory leak in USB TX path").

mt76s_tx_queue_skb() still returns -ENOSPC without releasing the skb.
The queue full check runs before tx_prepare_skb(), so no pktid has been
registered in wcid->pktid at that point; the skb only has to be completed
through ieee80211_tx_status_ext(), which also frees it.

Release the skb on the queue full path as well.

Fixes: d39b52e31aa6 ("mt76: introduce mt76_sdio module")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
Changes in v2:
- Sorry for the long delay in following up.
- Rebased on v7.4-rc1 and dropped the USB hunk, which is already fixed by
  82856da2d3b6 ("wifi: mt76: fix memory leak in USB TX path").
- Dropped the tx_prepare_skb() hunk, which is already fixed by
  808f2767d421 ("wifi: mt76: mt792x: Fix memory leak in SDIO TX path").
- Only the tx queue full path is handled now.

Disclosure: the candidate was found with our static analysis tooling, and
the audit and the fix were assisted by DeepSeek and GPT 6.1 sol.

 drivers/net/wireless/mediatek/mt76/sdio.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c b/drivers/net/wireless/mediatek/mt76/sdio.c
index ba5f123f7e39..c59553b29df3 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio.c
@@ -530,18 +530,15 @@ mt76s_tx_queue_skb(struct mt76_phy *phy, struct mt76_queue *q,
 	int err, len = skb->len;
 	u16 idx = q->head;
 
-	if (q->queued == q->ndesc)
-		return -ENOSPC;
+	if (q->queued == q->ndesc) {
+		err = -ENOSPC;
+		goto free_skb;
+	}
 
 	skb->prev = skb->next = NULL;
 	err = dev->drv->tx_prepare_skb(dev, NULL, qid, wcid, sta, &tx_info);
-	if (err < 0) {
-		status.skb = tx_info.skb;
-		spin_lock_bh(&dev->rx_lock);
-		ieee80211_tx_status_ext(dev->hw, &status);
-		spin_unlock_bh(&dev->rx_lock);
-		return err;
-	}
+	if (err < 0)
+		goto free_skb;
 
 	q->entry[q->head].skb = tx_info.skb;
 	q->entry[q->head].buf_sz = len;
@@ -553,6 +550,14 @@ mt76s_tx_queue_skb(struct mt76_phy *phy, struct mt76_queue *q,
 	q->queued++;
 
 	return idx;
+
+free_skb:
+	status.skb = tx_info.skb;
+	spin_lock_bh(&dev->rx_lock);
+	ieee80211_tx_status_ext(dev->hw, &status);
+	spin_unlock_bh(&dev->rx_lock);
+
+	return err;
 }
 
 static int
-- 
2.34.1


