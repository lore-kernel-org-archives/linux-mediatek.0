Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966B3C531DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Aug 2024 07:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V+cGqTEzljDAxYgLfuTlsCaAW9mimr8aq/bikzjBwWs=; b=u4+kOl/+afvjsMoH96nQBdG+HC
	c8IkcC2m/IPgZcTorncaqCKdCf5wrHDRZMJd/ZFF1zuTBcu2Wl0MavGQacytwDgie9m5a5fO5BPTd
	qyAhrgDWqSgiV3vMB++WrrEPTuOflI8R4YENyRpVNG5iORqTWyYLE+Fv4uHfRsS2Mvl5PMNDdwKAl
	iFtUmlXw+aC1OVieMbpPC2uD+IOMGTt9Ho6fY5ufLVViAhAnSwyzQbURC8CvkL7OqFShi7sLnMz7N
	BQFLQ/KU6RaNqqNp1hsSDeVlnWtOb1QGmwUvLmHbuqvpXhl5B7L9gpHZJDnW8TI6VgxIPlZ523kvS
	WqJ66OiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgfos-00000007vLQ-07ES;
	Wed, 21 Aug 2024 07:31:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgfo9-00000007vDS-2XUK;
	Wed, 21 Aug 2024 07:31:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 23EAEA410DE;
	Wed, 21 Aug 2024 07:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF817C32786;
	Wed, 21 Aug 2024 07:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724225464;
	bh=e7dYysvJxqrEQeB1fTSrqO1cw5Vz4LQ15wNULOJH7fE=;
	h=From:Date:Subject:To:Cc:From;
	b=EAXrAUoQ78LnnKL4hp34i4yntiyRZRR/d/q18wj5Eu/WOGDwUGyMgMYyuIvOILAAQ
	 Tkyjx0nHrMj6wm+ekLS9KRpNGbQRlF3iRdwjaxq2GwMMo0bD7MHcQb/1h4LhJdmBWG
	 L6d0jo7DWKhKnewDuujJGZmmR2qjC8OiH2Cs4FYGdgyF8NVS3g4zpzQpmv+4TsrlxX
	 gfw/SdhoSEeFs7KwV9R0njuF9SVfMOUGglv16iDlpjUh2cXCAB0l2RwitlaZ6BFZSy
	 9q9sH1Hv2WHAwaCtiklX9nUz2oxr6N5FyU4hyv+9PUCf5levsuTH1Gsp+UJvBTuPp2
	 PHafTF2b/QxAA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 21 Aug 2024 09:30:14 +0200
Subject: [PATCH net-next v2] net: airoha: configure hw mac address
 according to the port id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240821-airoha-eth-wan-mac-addr-v2-1-8706d0cd6cd5@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIWXxWYC/4WOwQ6CMBBEf4X07Jq2IBRP/ofxsNAtNCrVBVFj+
 HcLHDx6fJPMm/mInthTL/bJRzCNvvehi6A3iahb7BoCbyMLLXUmjSoBPYcWgYYWntjBFWtAaxl
 klqeVrqwpEUVs35icfy3m42llpvsjDgxr+PPHudleyB24wJCDUlDdHGCaleRqaawz+1GLWdP6f
 gj8Xv6OavH8vTYqUEDGFrVKq1QZfTgTd3TZBm7EaZqmL/MzGjUGAQAA
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 lorenzo.bianconi83@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_003105_803832_05770E60 
X-CRM114-Status: GOOD (  12.44  )
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

GDM1 port on EN7581 SoC is connected to the lan dsa switch.
GDM{2,3,4} can be used as wan port connected to an external
phy module. Configure hw mac address registers according to the port id.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- improve code readability adding reg offset for {LAN,WAN}_LMIN and
  {LAN,WAN}_LMAX regs
- fix signed-off-by tag
- Link to v1: https://lore.kernel.org/r/20240819-airoha-eth-wan-mac-addr-v1-1-e8d7c13b3182@kernel.org
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 32 +++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 1fb46db0c1e9..0c012efca3b0 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -67,9 +67,11 @@
 #define FE_RST_GDM3_MBI_ARB_MASK	BIT(2)
 #define FE_RST_CORE_MASK		BIT(0)
 
+#define REG_FE_WAN_MAC_H		0x0030
 #define REG_FE_LAN_MAC_H		0x0040
-#define REG_FE_LAN_MAC_LMIN		0x0044
-#define REG_FE_LAN_MAC_LMAX		0x0048
+
+#define REG_FE_MAC_LMIN(_n)		((_n) + 0x04)
+#define REG_FE_MAC_LMAX(_n)		((_n) + 0x08)
 
 #define REG_FE_CDM1_OQ_MAP0		0x0050
 #define REG_FE_CDM1_OQ_MAP1		0x0054
@@ -900,16 +902,28 @@ static void airoha_qdma_irq_disable(struct airoha_qdma *qdma, int index,
 	airoha_qdma_set_irqmask(qdma, index, mask, 0);
 }
 
-static void airoha_set_macaddr(struct airoha_eth *eth, const u8 *addr)
+static bool airhoa_is_lan_gdm_port(struct airoha_gdm_port *port)
 {
-	u32 val;
+	/* GDM1 port on EN7581 SoC is connected to the lan dsa switch.
+	 * GDM{2,3,4} can be used as wan port connected to an external
+	 * phy module.
+	 */
+	return port->id == 1;
+}
+
+static void airoha_set_macaddr(struct airoha_gdm_port *port, const u8 *addr)
+{
+	struct airoha_eth *eth = port->qdma->eth;
+	u32 val, reg;
 
+	reg = airhoa_is_lan_gdm_port(port) ? REG_FE_LAN_MAC_H
+					   : REG_FE_WAN_MAC_H;
 	val = (addr[0] << 16) | (addr[1] << 8) | addr[2];
-	airoha_fe_wr(eth, REG_FE_LAN_MAC_H, val);
+	airoha_fe_wr(eth, reg, val);
 
 	val = (addr[3] << 16) | (addr[4] << 8) | addr[5];
-	airoha_fe_wr(eth, REG_FE_LAN_MAC_LMIN, val);
-	airoha_fe_wr(eth, REG_FE_LAN_MAC_LMAX, val);
+	airoha_fe_wr(eth, REG_FE_MAC_LMIN(reg), val);
+	airoha_fe_wr(eth, REG_FE_MAC_LMAX(reg), val);
 }
 
 static void airoha_set_gdm_port_fwd_cfg(struct airoha_eth *eth, u32 addr,
@@ -2340,7 +2354,7 @@ static int airoha_dev_set_macaddr(struct net_device *dev, void *p)
 	if (err)
 		return err;
 
-	airoha_set_macaddr(port->qdma->eth, dev->dev_addr);
+	airoha_set_macaddr(port, dev->dev_addr);
 
 	return 0;
 }
@@ -2349,7 +2363,7 @@ static int airoha_dev_init(struct net_device *dev)
 {
 	struct airoha_gdm_port *port = netdev_priv(dev);
 
-	airoha_set_macaddr(port->qdma->eth, dev->dev_addr);
+	airoha_set_macaddr(port, dev->dev_addr);
 
 	return 0;
 }

---
base-commit: a99ef548bba01435f19137cf1670861be1c1ee4b
change-id: 20240819-airoha-eth-wan-mac-addr-0463b2bd89aa
prerequisite-change-id: 20240705-for-6-11-bpf-a349efc08df8:v2

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


