Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9772BC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 11:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LhfwdcjTzzbd0mFsU+duelbRvVrXRmi2HbyEFpXejpw=; b=w/pGxQA49b2vWKx5ANK0SIIEx2
	aZScOPQnqrhflHEbozTGcN4ulhydGlJyU6btQDRjhArnREzJL2NS7U0F9ScSEymtIcl0mMZ5epRmz
	7Lic5jbCGqSIGbKgOzT1RqeMGSfCUmvqLmGXjVDz4A2vbRvwodu7Ai86LNv0zvfCGfqUppgvfqWxf
	mWqPEsBvXef6m0YBtEzd9SNZ6uNNYGeBNjEqp0/m37+ZXwQ1H8j6Wxo1xFotHj3z4Rm9qpFSG2pfO
	rJzRXkxl/o+BoGf6fKdY9zf7W+CamCinL54CXc3gv0BDm6GGhfK4Bi+NDu3nnD50P50YkrtK/dnZf
	SqwMnxDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osN1l-004uSE-IT; Tue, 08 Nov 2022 11:44:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osN1i-004uR1-EY; Tue, 08 Nov 2022 11:44:24 +0000
X-UUID: 1c47cbd24c3c4818a3db202e3a39c239-20221108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=LhfwdcjTzzbd0mFsU+duelbRvVrXRmi2HbyEFpXejpw=;
	b=Qhsi21WqFoMP1zmTaj8o+MmiLhAZufEP9RwIlqKX2N9lA2wOXZ9UmyLdvUk/X+s9uAHVmJCfKRERAqzslD7CbiuoRfa4Yt+JUFAO1Yc/nOY4DRz9BPu+zOpWpB7roNRTWYulqQZeXNXWVHJvHOc+xS4DVU5N89iUv2iIP4HO4Yk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:4e42d4d3-bdaf-479d-a800-b660edb29782,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:1fa808f4-a19e-4b45-8bfe-6a73c93611e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1c47cbd24c3c4818a3db202e3a39c239-20221108
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <haozhe.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1246680384; Tue, 08 Nov 2022 04:44:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 8 Nov 2022 18:54:04 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 8 Nov 2022 18:54:02 +0800
From: <haozhe.chang@mediatek.com>
To: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, "Intel
 Corporation" <linuxwwan@intel.com>, Chiranjeevi Rapolu
	<chiranjeevi.rapolu@linux.intel.com>, Liu Haijun <haijun.liu@mediatek.com>,
	"M Chetan Kumar" <m.chetan.kumar@linux.intel.com>, Ricardo Martinez
	<ricardo.martinez@linux.intel.com>, Loic Poulain <loic.poulain@linaro.org>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg
	<johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, "open
 list:MEDIATEK T7XX 5G WWAN MODEM DRIVER" <netdev@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
CC: <lambert.wang@mediatek.com>, <xiayu.zhang@mediatek.com>,
	<hua.yang@mediatek.com>, <srv_heupstream@mediatek.com>, haozhe chang
	<haozhe.chang@mediatek.com>
Subject: [PATCH v2] wwan: core: Support slicing in port TX flow of WWAN subsystem
Date: Tue, 8 Nov 2022 18:53:51 +0800
Message-ID: <20221108105352.89801-1-haozhe.chang@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_034422_527892_17368577 
X-CRM114-Status: GOOD (  24.47  )
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

From: haozhe chang <haozhe.chang@mediatek.com>

wwan_port_fops_write inputs the SKB parameter to the TX callback of
the WWAN device driver. However, the WWAN device (e.g., t7xx) may
have an MTU less than the size of SKB, causing the TX buffer to be
sliced and copied once more in the WWAN device driver.

This patch implements the slicing in the WWAN subsystem and gives
the WWAN devices driver the option to slice(by chunk) or not. By
doing so, the additional memory copy is reduced.

Meanwhile, this patch gives WWAN devices driver the option to reserve
headroom in SKB for the device-specific metadata.

Signed-off-by: haozhe chang <haozhe.chang@mediatek.com>

---
Changes in v2
  -send fragments to device driver by skb frag_list.
---
 drivers/net/wwan/t7xx/t7xx_port_wwan.c | 42 ++++++++++-------
 drivers/net/wwan/wwan_core.c           | 65 ++++++++++++++++++++------
 include/linux/wwan.h                   |  5 +-
 3 files changed, 80 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_port_wwan.c b/drivers/net/wwan/t7xx/t7xx_port_wwan.c
index 33931bfd78fd..74fa58575d5a 100644
--- a/drivers/net/wwan/t7xx/t7xx_port_wwan.c
+++ b/drivers/net/wwan/t7xx/t7xx_port_wwan.c
@@ -54,13 +54,13 @@ static void t7xx_port_ctrl_stop(struct wwan_port *port)
 static int t7xx_port_ctrl_tx(struct wwan_port *port, struct sk_buff *skb)
 {
 	struct t7xx_port *port_private = wwan_port_get_drvdata(port);
-	size_t len, offset, chunk_len = 0, txq_mtu = CLDMA_MTU;
 	const struct t7xx_port_conf *port_conf;
+	struct sk_buff *cur = skb, *cloned;
 	struct t7xx_fsm_ctl *ctl;
 	enum md_state md_state;
+	int cnt = 0, ret;
 
-	len = skb->len;
-	if (!len || !port_private->chan_enable)
+	if (!port_private->chan_enable)
 		return -EINVAL;
 
 	port_conf = port_private->port_conf;
@@ -72,33 +72,43 @@ static int t7xx_port_ctrl_tx(struct wwan_port *port, struct sk_buff *skb)
 		return -ENODEV;
 	}
 
-	for (offset = 0; offset < len; offset += chunk_len) {
-		struct sk_buff *skb_ccci;
-		int ret;
-
-		chunk_len = min(len - offset, txq_mtu - sizeof(struct ccci_header));
-		skb_ccci = t7xx_port_alloc_skb(chunk_len);
-		if (!skb_ccci)
-			return -ENOMEM;
-
-		skb_put_data(skb_ccci, skb->data + offset, chunk_len);
-		ret = t7xx_port_send_skb(port_private, skb_ccci, 0, 0);
+	while (cur) {
+		cloned = skb_clone(cur, GFP_KERNEL);
+		cloned->len = skb_headlen(cur);
+		ret = t7xx_port_send_skb(port_private, cloned, 0, 0);
 		if (ret) {
-			dev_kfree_skb_any(skb_ccci);
+			dev_kfree_skb(cloned);
 			dev_err(port_private->dev, "Write error on %s port, %d\n",
 				port_conf->name, ret);
-			return ret;
+			return cnt ? cnt + ret : ret;
 		}
+		cnt += cloned->len;
+		if (cur == skb)
+			cur = skb_shinfo(skb)->frag_list;
+		else
+			cur = cur->next;
 	}
 
 	dev_kfree_skb(skb);
 	return 0;
 }
 
+static size_t t7xx_port_tx_headroom(struct wwan_port *port)
+{
+	return sizeof(struct ccci_header);
+}
+
+static size_t t7xx_port_tx_chunk_len(struct wwan_port *port)
+{
+	return CLDMA_MTU - sizeof(struct ccci_header);
+}
+
 static const struct wwan_port_ops wwan_ops = {
 	.start = t7xx_port_ctrl_start,
 	.stop = t7xx_port_ctrl_stop,
 	.tx = t7xx_port_ctrl_tx,
+	.needed_headroom = t7xx_port_tx_headroom,
+	.tx_chunk_len = t7xx_port_tx_chunk_len,
 };
 
 static int t7xx_port_wwan_init(struct t7xx_port *port)
diff --git a/drivers/net/wwan/wwan_core.c b/drivers/net/wwan/wwan_core.c
index 62e9f7d6c9fe..ed78471f9e38 100644
--- a/drivers/net/wwan/wwan_core.c
+++ b/drivers/net/wwan/wwan_core.c
@@ -20,7 +20,7 @@
 #include <uapi/linux/wwan.h>
 
 /* Maximum number of minors in use */
-#define WWAN_MAX_MINORS		(1 << MINORBITS)
+#define WWAN_MAX_MINORS		BIT(MINORBITS)
 
 static DEFINE_MUTEX(wwan_register_lock); /* WWAN device create|remove lock */
 static DEFINE_IDA(minors); /* minors for WWAN port chardevs */
@@ -67,6 +67,8 @@ struct wwan_device {
  * @rxq: Buffer inbound queue
  * @waitqueue: The waitqueue for port fops (read/write/poll)
  * @data_lock: Port specific data access serialization
+ * @headroom_len: SKB reserved headroom size
+ * @chunk_len: Chunk len to split packet
  * @at_data: AT port specific data
  */
 struct wwan_port {
@@ -79,6 +81,8 @@ struct wwan_port {
 	struct sk_buff_head rxq;
 	wait_queue_head_t waitqueue;
 	struct mutex data_lock;	/* Port specific data access serialization */
+	size_t headroom_len;
+	size_t chunk_len;
 	union {
 		struct {
 			struct ktermios termios;
@@ -550,8 +554,13 @@ static int wwan_port_op_start(struct wwan_port *port)
 	}
 
 	/* If port is already started, don't start again */
-	if (!port->start_count)
+	if (!port->start_count) {
 		ret = port->ops->start(port);
+		if (port->ops->tx_chunk_len)
+			port->chunk_len = port->ops->tx_chunk_len(port);
+		if (port->ops->needed_headroom)
+			port->headroom_len = port->ops->needed_headroom(port);
+	}
 
 	if (!ret)
 		port->start_count++;
@@ -698,30 +707,56 @@ static ssize_t wwan_port_fops_read(struct file *filp, char __user *buf,
 static ssize_t wwan_port_fops_write(struct file *filp, const char __user *buf,
 				    size_t count, loff_t *offp)
 {
+	size_t len, chunk_len, offset, allowed_chunk_len;
+	struct sk_buff *skb, *head = NULL, *tail = NULL;
 	struct wwan_port *port = filp->private_data;
-	struct sk_buff *skb;
 	int ret;
 
 	ret = wwan_wait_tx(port, !!(filp->f_flags & O_NONBLOCK));
 	if (ret)
 		return ret;
 
-	skb = alloc_skb(count, GFP_KERNEL);
-	if (!skb)
-		return -ENOMEM;
+	allowed_chunk_len = port->chunk_len ? port->chunk_len : count;
+	for (offset = 0; offset < count; offset += chunk_len) {
+		chunk_len = min(count - offset, allowed_chunk_len);
+		len = chunk_len + port->headroom_len;
+		skb = alloc_skb(len, GFP_KERNEL);
+		if (!skb) {
+			ret = -ENOMEM;
+			goto freeskb;
+		}
+		skb_reserve(skb, port->headroom_len);
+
+		if (!head) {
+			head = skb;
+		} else if (!tail) {
+			skb_shinfo(head)->frag_list = skb;
+			tail = skb;
+		} else {
+			tail->next = skb;
+			tail = skb;
+		}
 
-	if (copy_from_user(skb_put(skb, count), buf, count)) {
-		kfree_skb(skb);
-		return -EFAULT;
-	}
+		if (copy_from_user(skb_put(skb, chunk_len), buf + offset, chunk_len)) {
+			ret = -EFAULT;
+			goto freeskb;
+		}
 
-	ret = wwan_port_op_tx(port, skb, !!(filp->f_flags & O_NONBLOCK));
-	if (ret) {
-		kfree_skb(skb);
-		return ret;
+		if (skb != head) {
+			head->data_len += skb->len;
+			head->len += skb->len;
+			head->truesize += skb->truesize;
+		}
 	}
 
-	return count;
+	if (head) {
+		ret = wwan_port_op_tx(port, head, !!(filp->f_flags & O_NONBLOCK));
+		if (!ret)
+			return count;
+	}
+freeskb:
+	kfree_skb(head);
+	return ret;
 }
 
 static __poll_t wwan_port_fops_poll(struct file *filp, poll_table *wait)
diff --git a/include/linux/wwan.h b/include/linux/wwan.h
index 5ce2acf444fb..bdeeef59bbfd 100644
--- a/include/linux/wwan.h
+++ b/include/linux/wwan.h
@@ -46,6 +46,8 @@ struct wwan_port;
  * @tx: Non-blocking routine that sends WWAN port protocol data to the device.
  * @tx_blocking: Optional blocking routine that sends WWAN port protocol data
  *               to the device.
+ * @needed_headroom: Optional routine that sets reserve headroom of skb.
+ * @tx_chunk_len: Optional routine that sets chunk len to split.
  * @tx_poll: Optional routine that sets additional TX poll flags.
  *
  * The wwan_port_ops structure contains a list of low-level operations
@@ -58,6 +60,8 @@ struct wwan_port_ops {
 
 	/* Optional operations */
 	int (*tx_blocking)(struct wwan_port *port, struct sk_buff *skb);
+	size_t (*needed_headroom)(struct wwan_port *port);
+	size_t (*tx_chunk_len)(struct wwan_port *port);
 	__poll_t (*tx_poll)(struct wwan_port *port, struct file *filp,
 			    poll_table *wait);
 };
@@ -112,7 +116,6 @@ void wwan_port_rx(struct wwan_port *port, struct sk_buff *skb);
  */
 void wwan_port_txoff(struct wwan_port *port);
 
-
 /**
  * wwan_port_txon - Restart TX on WWAN port
  * @port: WWAN port for which TX must be restarted
-- 
2.17.0


