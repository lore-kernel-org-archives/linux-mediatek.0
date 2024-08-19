Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0018C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 11:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4aTFlpXKurASa7thKvuwt90BLNVvPLIqquwM+xGZzHc=; b=y7cukmbDYX/j/4qrUwwLKF+wUr
	Tsv7iU4q2AZZUe1m9w5UPsD3UEzIygu/dkERD5FnC9gm3z4T+LH0ew+Ne/fmDxnciPOAS1JJV9qrW
	vVkanNwihTr3QwnCEsVE31F1YVdOhpTodowGkEPtqvKQQapOLc57l4tuBY9mrHItg1ReT3M+qfEI7
	UTbU5QGJoeNPxzsfwBxw3LEx8gX2g+iQfs6BV3wXT6+300k+ZhZNTMOO7BJtoLV3xLmCrA86MZkrd
	xUh8q6+OzNm8OAFEM7JAmrz4WAdcIdZETRopEIvvRih8qsHfoukTRzEdKz7yD0asYlJzdBr22teqt
	GWaQYUzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg0Ik-00000001Btq-34kE;
	Mon, 19 Aug 2024 11:11:54 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg0HA-00000001BRo-2cRz;
	Mon, 19 Aug 2024 11:10:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B33B1CE0A52;
	Mon, 19 Aug 2024 11:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702C9C4AF0C;
	Mon, 19 Aug 2024 11:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724065813;
	bh=hRlfP4Eb88D8IgNcliWrTMZtueZ9Wxlg1wLUE+yG/qs=;
	h=From:Date:Subject:To:Cc:From;
	b=fse6Iscoa6Y+WAZDq1+OL18a97PafMlO/bNnJz5KwKgpzMj04Ftd93IN8nk0M5152
	 KuckX0h6cQQaVO3BVm12uTtGZ7UGkW7gOJ8SX0YKp8ohfeZAnasHnB+QdykoVTSuyv
	 bQYe+idGS3bDXpycj1HFtr4ghNaxyONjA7O+5PLi+wcc6NTV8Zjt7l96X++IiMA15J
	 QUHNI8sp9nfHmWr3UlDaKMskgLUwx0ZxX4QlL/FDXlSXOzzco03nyFdcpkAHs5mCuq
	 tLAaBKCcCBZMriE+fMJl/D8SQM8btuV5oTDpF+s8gdHbr2S4nepZIoYoSWSX1uv/Oa
	 EqJwQCgV8Mjdw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 19 Aug 2024 13:10:09 +0200
Subject: [PATCH net-next] net: airoha: configure hw mac address according
 to the port id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240819-airoha-eth-wan-mac-addr-v1-1-e8d7c13b3182@kernel.org>
X-B4-Tracking: v=1; b=H4sIABAow2YC/0WNQQ6CMBBFr0Jm7SRtQSxcxbAY6NR2YcEB0YRwd
 xtYuHwv+e9vMLNEnqEtNhBe4xzHlEFfChgCpQdjdJnBKFMpqxukKGMg5CXghxI+aUByTlBVddm
 b3tmGCPJ6Evbxe5Tv3cnCr3c+WE7577fFUb+pK/pRsEatsZ88Ulk17AdlnbftaqDb9x/j83/Ps
 AAAAA==
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
X-CRM114-CacheID: sfid-20240819_041017_196883_15252BAF 
X-CRM114-Status: GOOD (  12.06  )
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

---
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 33 +++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 1fb46db0c1e9..4914565c2fac 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -67,6 +67,10 @@
 #define FE_RST_GDM3_MBI_ARB_MASK	BIT(2)
 #define FE_RST_CORE_MASK		BIT(0)
 
+#define REG_FE_WAN_MAC_H		0x0030
+#define REG_FE_WAN_MAC_LMIN		0x0034
+#define REG_FE_WAN_MAC_LMAX		0x0038
+
 #define REG_FE_LAN_MAC_H		0x0040
 #define REG_FE_LAN_MAC_LMIN		0x0044
 #define REG_FE_LAN_MAC_LMAX		0x0048
@@ -900,16 +904,31 @@ static void airoha_qdma_irq_disable(struct airoha_qdma *qdma, int index,
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
+	bool is_lan_port = airhoa_is_lan_gdm_port(port);
+	struct airoha_eth *eth = port->qdma->eth;
+	u32 val, reg;
 
 	val = (addr[0] << 16) | (addr[1] << 8) | addr[2];
-	airoha_fe_wr(eth, REG_FE_LAN_MAC_H, val);
+	reg = is_lan_port ? REG_FE_LAN_MAC_H : REG_FE_WAN_MAC_H;
+	airoha_fe_wr(eth, reg, val);
 
 	val = (addr[3] << 16) | (addr[4] << 8) | addr[5];
-	airoha_fe_wr(eth, REG_FE_LAN_MAC_LMIN, val);
-	airoha_fe_wr(eth, REG_FE_LAN_MAC_LMAX, val);
+	reg = is_lan_port ? REG_FE_LAN_MAC_LMIN : REG_FE_WAN_MAC_LMIN;
+	airoha_fe_wr(eth, reg, val);
+
+	reg = is_lan_port ? REG_FE_LAN_MAC_LMAX : REG_FE_WAN_MAC_LMAX;
+	airoha_fe_wr(eth, reg, val);
 }
 
 static void airoha_set_gdm_port_fwd_cfg(struct airoha_eth *eth, u32 addr,
@@ -2340,7 +2359,7 @@ static int airoha_dev_set_macaddr(struct net_device *dev, void *p)
 	if (err)
 		return err;
 
-	airoha_set_macaddr(port->qdma->eth, dev->dev_addr);
+	airoha_set_macaddr(port, dev->dev_addr);
 
 	return 0;
 }
@@ -2349,7 +2368,7 @@ static int airoha_dev_init(struct net_device *dev)
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


