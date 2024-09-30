Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995FDCE8340
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 13:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hpdJasFGTd4mURB6VVD+Sev7x7HRQtJLzMRHSEf5CVg=; b=GjpCyJp5ejlgwOHfQZis+0gi7y
	dw0MWxLzCoZO/VJaGpUhVzhOOP1V22ZaKOw8Xu+7QQNDuGjLKvW+6F0yUb7fppQZ+pYwoSjvP552+
	HpUtbFEjsrORjcWvlI2S5E5cFMKOfctGerz+QSfhycWwQDAP2bnEOnH2QGdES6f78wCS6KyOG3HxS
	zB5x5Xas/VcFXmyhgZYezz+oMt/yvBVrQzFy5DFgRIK59Kct2so2ccvrT1nwH3Mzx/O2VR6x+Pxso
	vF+w9yNCy1haXhWejYi7lQrYb5qGvIvOz4nmoaVEKmJ5djyuUOr1JEiKqZsuvKVIgXUETZD7q+R3Z
	qVLtQYLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGKm-0000000HGd0-2Pc5;
	Mon, 30 Sep 2024 13:21:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFzR-0000000HB49-1iMZ;
	Mon, 30 Sep 2024 12:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=hpdJasFGTd4mURB6VVD+Sev7x7HRQtJLzMRHSEf5CVg=; b=mjCymu8adEDoGDStAc/pbZuQZ9
	GMUpa3yzq5S/a5TNArijx05TXVhnrEFODc6SvuzHN4QeN1J6Bd0+X4kMDdISMfbozK1U6SiGbOGuL
	vw+Nbyk8OehwdpSXOTHS7dJj3Izbwpn3JTFUvXALy6cd/ptvBYAPFfHjN65nJm+1E4cMfXuuhHiH9
	3cbL68q9HDw8N5kcu2TnOp+NLj/Kif3eDzef0THwP07/TaUPfW6LNYhWwkfDUjTUjIgx23BeBWURt
	s+DjOIZsTUSGZ8CvXi5KhTB4Vuk35rD+ZuPIZWVmp2TssioGAZzaAFIOsw7+20a3LzECkE3X0J6rn
	Z1FXKS1g==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFzO-00000002omS-0p18;
	Mon, 30 Sep 2024 12:59:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D1EB95C1055;
	Mon, 30 Sep 2024 12:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6EDC4CEC7;
	Mon, 30 Sep 2024 12:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727701134;
	bh=2E4v7T24qXp0WYaYw6Eg3YjxMdh70IbNU9K6KfS9QWc=;
	h=From:Date:Subject:To:Cc:From;
	b=DkmDBejjC5EV0i5N6yRjDJ7WNH91YSIY5hM5z1Ahd23gx5sWyIF7/7DHH49TRP80h
	 MIXs8AMXqdMkFG/6RlOgAPEui0pAs3JMArT9rjFjNoKADaXp3FjEMHsP4oxWdT/73G
	 UdEwYLGQ3XhPdXpCqxc4ry6PKz1/iHVS6l6b3QFrygnrO0EaDsyqOyzTGmtgbOlIXe
	 l6qmCRyUzy9donyXAUvma3o3jFwrfJsqBRjsVtj6jipjVroRFdsiiJp3UkvdTGtUTo
	 oSsgVD9MFVQ5IjRZ7Zwisb5duG7SM5qFzm5yY3YqR171+WxJ0xNW1sFi6hY09KsTMD
	 ggs8neTCs1K5g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 30 Sep 2024 14:58:35 +0200
Subject: [PATCH net-next] net: airoha: Implement BQL support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-en7581-bql-v1-1-064cdd570068@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHqg+mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDS2MD3dQ8c1MLQ92kwhxdU1MjUzOzNCMDc4tUJaCGgqLUtMwKsGHRsbW
 1AD70SoFcAAAA
To: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 upstream@airoha.com
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_135858_660240_B846E1CB 
X-CRM114-Status: GOOD (  14.30  )
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

Introduce BQL support in the airoha_eth driver to avoid queuing to much
packets into the device hw queues and keep the latency small.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 930f180688e5..6dfde2828d93 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -786,6 +786,7 @@ struct airoha_hw_stats {
 };
 
 struct airoha_qdma {
+	struct airoha_gdm_port *port;
 	struct airoha_eth *eth;
 	void __iomem *regs;
 
@@ -1658,6 +1659,7 @@ static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
 
 	while (irq_q->queued > 0 && done < budget) {
 		u32 qid, last, val = irq_q->q[irq_q->head];
+		u32 bytes = 0, count = 0;
 		struct airoha_queue *q;
 
 		if (val == 0xff)
@@ -1684,7 +1686,6 @@ static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
 			struct airoha_qdma_desc *desc = &q->desc[q->tail];
 			struct airoha_queue_entry *e = &q->entry[q->tail];
 			u32 desc_ctrl = le32_to_cpu(desc->ctrl);
-			struct sk_buff *skb = e->skb;
 			u16 index = q->tail;
 
 			if (!(desc_ctrl & QDMA_DESC_DONE_MASK) &&
@@ -1700,15 +1701,11 @@ static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
 			WRITE_ONCE(desc->msg0, 0);
 			WRITE_ONCE(desc->msg1, 0);
 
-			if (skb) {
-				struct netdev_queue *txq;
-
-				txq = netdev_get_tx_queue(skb->dev, qid);
-				if (netif_tx_queue_stopped(txq) &&
-				    q->ndesc - q->queued >= q->free_thr)
-					netif_tx_wake_queue(txq);
+			if (e->skb) {
+				bytes += e->skb->len;
+				count++;
 
-				dev_kfree_skb_any(skb);
+				dev_kfree_skb_any(e->skb);
 				e->skb = NULL;
 			}
 
@@ -1716,6 +1713,16 @@ static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
 				break;
 		}
 
+		if (qdma->port) {
+			struct netdev_queue *txq;
+
+			txq = netdev_get_tx_queue(qdma->port->dev, qid);
+			netdev_tx_completed_queue(txq, count, bytes);
+			if (netif_tx_queue_stopped(txq) &&
+			    q->ndesc - q->queued >= q->free_thr)
+				netif_tx_wake_queue(txq);
+		}
+
 		spin_unlock_bh(&q->lock);
 	}
 
@@ -2482,6 +2489,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	q->head = index;
 	q->queued += i;
 
+	netdev_tx_sent_queue(txq, skb->len);
 	skb_tx_timestamp(skb);
 	if (q->ndesc - q->queued < q->free_thr)
 		netif_tx_stop_queue(txq);
@@ -2650,6 +2658,7 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth, struct device_node *np)
 	port->dev = dev;
 	port->id = id;
 	eth->ports[index] = port;
+	qdma->port = port;
 
 	return register_netdev(dev);
 }

---
base-commit: c824deb1a89755f70156b5cdaf569fca80698719
change-id: 20240930-en7581-bql-552566f2078e

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


