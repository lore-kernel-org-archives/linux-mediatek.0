Return-Path: <SRS0=1cO+=GX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A18BFC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 19:34:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28B4123432
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 19:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28B4123432
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XLrKhQq9n7S8VEbF6D37jw2mbMVHMEtbf6RgiOteoQA=; b=q1r0LcuNbqX+MnLI2+HWjjfqp
	ffm0q2jgc15UO8JaSmyCAdpYIDrC593Lyw+77XvfGXtZnAzBe6S7y5aLOstBzTmF+qM+QuGNgt2a0
	x0zpRuhZGIJl4XJ/oUrbT8yo0hrG3Q5OFkZ8IcW8Rly6aQK+QbQh4p30H34Pyce4SSwnCAxuFYmF0
	tBujJgwGIt+BOLDfgv7ZGbgbLvoJVj4xNhKt0wVeRmDBRZFcB9afmbTqoFT4l0Tg/H7/nOlRvRPC2
	7zWj+d3Frs3xsa124plXqwMe520ltrp9Kot0uYd4+iY/jd2UeLexqNY5w1bsPukQUpws/aCYmI3i/
	6BeAtpw+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2JFQ-0005UM-5I; Wed, 20 Jan 2021 19:34:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2JF2-0005Mp-SH
 for linux-mediatek@lists.infradead.org; Wed, 20 Jan 2021 19:34:17 +0000
X-UUID: de326923c4c740698c1f9150775c9566-20210120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=brxyV32mJTSRsw1MjKwBaoJioIMV508dOhMJ0m4eCB0=; 
 b=LZdDT3MqVaqDoCdgsUlBOf4tCqbPV4k4FTy2OfYpXuOQX8xoCTxw5ikIGZyOA19NT9Ivrc/vxkJlrOnrui+Pqeuo2yAP/lsLFoId/uhOwvCFfqIU0kA385WeBzdX17JkfiN2D6Lw4VsEc5gdAXF7EuaCQXJe2cH7RT5/xUdO/Oc=;
X-UUID: de326923c4c740698c1f9150775c9566-20210120
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1126029156; Wed, 20 Jan 2021 11:34:04 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Jan 2021 11:34:02 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Jan 2021 03:33:54 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 21 Jan 2021 03:33:54 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v6 05/15] mt76: mt7921: add DMA support
Date: Thu, 21 Jan 2021 03:33:41 +0800
Message-ID: <45a54e15dc414ef321f14092af252f92b4c7f8fb.1611060302.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1611060302.git.objelf@gmail.com>
References: <cover.1611060302.git.objelf@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 35843D017B78F0F0FA2146656207B4F2DF970BFCD8DAB3C7E45B4B9508EA2B812000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_143409_228911_3B8B2ECB 
X-CRM114-Status: GOOD (  20.72  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: ryder.lee@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 Eric.Liang@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, posh.sun@mediatek.com, YN.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, Soul.Huang@mediatek.com,
 Lorenzo Bianconi <lorenzo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Add DMA and register access support to MT7921e driver to set up the link
for the data movement between the host and MT7921 MAC, or the host and
MT7921 MCU.

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/dma.c   | 356 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |   3 +
 2 files changed, 359 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/dma.c

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
new file mode 100644
index 000000000000..cd9665610284
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
@@ -0,0 +1,356 @@
+// SPDX-License-Identifier: ISC
+/* Copyright (C) 2020 MediaTek Inc. */
+
+#include "mt7921.h"
+#include "../dma.h"
+#include "mac.h"
+
+int mt7921_init_tx_queues(struct mt7921_phy *phy, int idx, int n_desc)
+{
+	int i, err;
+
+	err = mt76_init_tx_queue(phy->mt76, 0, idx, n_desc, MT_TX_RING_BASE);
+	if (err < 0)
+		return err;
+
+	for (i = 0; i <= MT_TXQ_PSD; i++)
+		phy->mt76->q_tx[i] = phy->mt76->q_tx[0];
+
+	return 0;
+}
+
+void mt7921_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
+			 struct sk_buff *skb)
+{
+	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
+	__le32 *rxd = (__le32 *)skb->data;
+	enum rx_pkt_type type;
+	u16 flag;
+
+	type = FIELD_GET(MT_RXD0_PKT_TYPE, le32_to_cpu(rxd[0]));
+	flag = FIELD_GET(MT_RXD0_PKT_FLAG, le32_to_cpu(rxd[0]));
+
+	if (type == PKT_TYPE_RX_EVENT && flag == 0x1)
+		type = PKT_TYPE_NORMAL_MCU;
+
+	switch (type) {
+	case PKT_TYPE_TXRX_NOTIFY:
+		mt7921_mac_tx_free(dev, skb);
+		break;
+	case PKT_TYPE_RX_EVENT:
+		mt7921_mcu_rx_event(dev, skb);
+		break;
+	case PKT_TYPE_NORMAL_MCU:
+	case PKT_TYPE_NORMAL:
+		if (!mt7921_mac_fill_rx(dev, skb)) {
+			mt76_rx(&dev->mt76, q, skb);
+			return;
+		}
+		fallthrough;
+	default:
+		dev_kfree_skb(skb);
+		break;
+	}
+}
+
+static void
+mt7921_tx_cleanup(struct mt7921_dev *dev)
+{
+	mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_WM], false);
+	mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_WA], false);
+}
+
+static int mt7921_poll_tx(struct napi_struct *napi, int budget)
+{
+	struct mt7921_dev *dev;
+
+	dev = container_of(napi, struct mt7921_dev, mt76.tx_napi);
+
+	mt7921_tx_cleanup(dev);
+
+	if (napi_complete_done(napi, 0))
+		mt7921_irq_enable(dev, MT_INT_TX_DONE_ALL);
+
+	return 0;
+}
+
+void mt7921_dma_prefetch(struct mt7921_dev *dev)
+{
+#define PREFETCH(base, depth)	((base) << 16 | (depth))
+
+	mt76_wr(dev, MT_WFDMA0_RX_RING0_EXT_CTRL, PREFETCH(0x0, 0x4));
+	mt76_wr(dev, MT_WFDMA0_RX_RING2_EXT_CTRL, PREFETCH(0x40, 0x4));
+	mt76_wr(dev, MT_WFDMA0_RX_RING3_EXT_CTRL, PREFETCH(0x80, 0x4));
+	mt76_wr(dev, MT_WFDMA0_RX_RING4_EXT_CTRL, PREFETCH(0xc0, 0x4));
+	mt76_wr(dev, MT_WFDMA0_RX_RING5_EXT_CTRL, PREFETCH(0x100, 0x4));
+
+	mt76_wr(dev, MT_WFDMA0_TX_RING0_EXT_CTRL, PREFETCH(0x140, 0x4));
+	mt76_wr(dev, MT_WFDMA0_TX_RING1_EXT_CTRL, PREFETCH(0x180, 0x4));
+	mt76_wr(dev, MT_WFDMA0_TX_RING2_EXT_CTRL, PREFETCH(0x1c0, 0x4));
+	mt76_wr(dev, MT_WFDMA0_TX_RING3_EXT_CTRL, PREFETCH(0x200, 0x4));
+	mt76_wr(dev, MT_WFDMA0_TX_RING4_EXT_CTRL, PREFETCH(0x240, 0x4));
+	mt76_wr(dev, MT_WFDMA0_TX_RING5_EXT_CTRL, PREFETCH(0x280, 0x4));
+	mt76_wr(dev, MT_WFDMA0_TX_RING6_EXT_CTRL, PREFETCH(0x2c0, 0x4));
+	mt76_wr(dev, MT_WFDMA0_TX_RING16_EXT_CTRL, PREFETCH(0x340, 0x4));
+	mt76_wr(dev, MT_WFDMA0_TX_RING17_EXT_CTRL, PREFETCH(0x380, 0x4));
+}
+
+static u32 __mt7921_reg_addr(struct mt7921_dev *dev, u32 addr)
+{
+	static const struct {
+		u32 phys;
+		u32 mapped;
+		u32 size;
+	} fixed_map[] = {
+		{ 0x00400000, 0x80000, 0x10000}, /* WF_MCU_SYSRAM */
+		{ 0x00410000, 0x90000, 0x10000}, /* WF_MCU_SYSRAM (configure register) */
+		{ 0x40000000, 0x70000, 0x10000}, /* WF_UMAC_SYSRAM */
+		{ 0x54000000, 0x02000, 0x1000 }, /* WFDMA PCIE0 MCU DMA0 */
+		{ 0x55000000, 0x03000, 0x1000 }, /* WFDMA PCIE0 MCU DMA1 */
+		{ 0x58000000, 0x06000, 0x1000 }, /* WFDMA PCIE1 MCU DMA0 (MEM_DMA) */
+		{ 0x59000000, 0x07000, 0x1000 }, /* WFDMA PCIE1 MCU DMA1 */
+		{ 0x7c000000, 0xf0000, 0x10000 }, /* CONN_INFRA */
+		{ 0x7c020000, 0xd0000, 0x10000 }, /* CONN_INFRA, WFDMA */
+		{ 0x7c060000, 0xe0000, 0x10000}, /* CONN_INFRA, conn_host_csr_top */
+		{ 0x80020000, 0xb0000, 0x10000 }, /* WF_TOP_MISC_OFF */
+		{ 0x81020000, 0xc0000, 0x10000 }, /* WF_TOP_MISC_ON */
+		{ 0x820c0000, 0x08000, 0x4000 }, /* WF_UMAC_TOP (PLE) */
+		{ 0x820c8000, 0x0c000, 0x2000 }, /* WF_UMAC_TOP (PSE) */
+		{ 0x820cc000, 0x0e000, 0x2000 }, /* WF_UMAC_TOP (PP) */
+		{ 0x820ce000, 0x21c00, 0x0200 }, /* WF_LMAC_TOP (WF_SEC) */
+		{ 0x820cf000, 0x22000, 0x1000 }, /* WF_LMAC_TOP (WF_PF) */
+		{ 0x820d0000, 0x30000, 0x10000 }, /* WF_LMAC_TOP (WF_WTBLON) */
+		{ 0x820e0000, 0x20000, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_CFG) */
+		{ 0x820e1000, 0x20400, 0x0200 }, /* WF_LMAC_TOP BN0 (WF_TRB) */
+		{ 0x820e2000, 0x20800, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_AGG) */
+		{ 0x820e3000, 0x20c00, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_ARB) */
+		{ 0x820e4000, 0x21000, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_TMAC) */
+		{ 0x820e5000, 0x21400, 0x0800 }, /* WF_LMAC_TOP BN0 (WF_RMAC) */
+		{ 0x820e7000, 0x21e00, 0x0200 }, /* WF_LMAC_TOP BN0 (WF_DMA) */
+		{ 0x820e9000, 0x23400, 0x0200 }, /* WF_LMAC_TOP BN0 (WF_WTBLOFF) */
+		{ 0x820ea000, 0x24000, 0x0200 }, /* WF_LMAC_TOP BN0 (WF_ETBF) */
+		{ 0x820eb000, 0x24200, 0x0400 }, /* WF_LMAC_TOP BN0 (WF_LPON) */
+		{ 0x820ec000, 0x24600, 0x0200 }, /* WF_LMAC_TOP BN0 (WF_INT) */
+		{ 0x820ed000, 0x24800, 0x0800 }, /* WF_LMAC_TOP BN0 (WF_MIB) */
+		{ 0x820f0000, 0xa0000, 0x0400 }, /* WF_LMAC_TOP BN1 (WF_CFG) */
+		{ 0x820f1000, 0xa0600, 0x0200 }, /* WF_LMAC_TOP BN1 (WF_TRB) */
+		{ 0x820f2000, 0xa0800, 0x0400 }, /* WF_LMAC_TOP BN1 (WF_AGG) */
+		{ 0x820f3000, 0xa0c00, 0x0400 }, /* WF_LMAC_TOP BN1 (WF_ARB) */
+		{ 0x820f4000, 0xa1000, 0x0400 }, /* WF_LMAC_TOP BN1 (WF_TMAC) */
+		{ 0x820f5000, 0xa1400, 0x0800 }, /* WF_LMAC_TOP BN1 (WF_RMAC) */
+		{ 0x820f7000, 0xa1e00, 0x0200 }, /* WF_LMAC_TOP BN1 (WF_DMA) */
+		{ 0x820f9000, 0xa3400, 0x0200 }, /* WF_LMAC_TOP BN1 (WF_WTBLOFF) */
+		{ 0x820fa000, 0xa4000, 0x0200 }, /* WF_LMAC_TOP BN1 (WF_ETBF) */
+		{ 0x820fb000, 0xa4200, 0x0400 }, /* WF_LMAC_TOP BN1 (WF_LPON) */
+		{ 0x820fc000, 0xa4600, 0x0200 }, /* WF_LMAC_TOP BN1 (WF_INT) */
+		{ 0x820fd000, 0xa4800, 0x0800 }, /* WF_LMAC_TOP BN1 (WF_MIB) */
+	};
+	int i;
+
+	if (addr < 0x100000)
+		return addr;
+
+	for (i = 0; i < ARRAY_SIZE(fixed_map); i++) {
+		u32 ofs;
+
+		if (addr < fixed_map[i].phys)
+			continue;
+
+		ofs = addr - fixed_map[i].phys;
+		if (ofs > fixed_map[i].size)
+			continue;
+
+		return fixed_map[i].mapped + ofs;
+	}
+
+	if ((addr >= 0x18000000 && addr < 0x18c00000) ||
+	    (addr >= 0x70000000 && addr < 0x78000000) ||
+	    (addr >= 0x7c000000 && addr < 0x7c400000))
+		return mt7921_reg_map_l1(dev, addr);
+
+	dev_err(dev->mt76.dev, "Access currently unsupported address %08x\n",
+		addr);
+
+	return 0;
+}
+
+static u32 mt7921_rr(struct mt76_dev *mdev, u32 offset)
+{
+	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
+	u32 addr = __mt7921_reg_addr(dev, offset);
+
+	return dev->bus_ops->rr(mdev, addr);
+}
+
+static void mt7921_wr(struct mt76_dev *mdev, u32 offset, u32 val)
+{
+	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
+	u32 addr = __mt7921_reg_addr(dev, offset);
+
+	dev->bus_ops->wr(mdev, addr, val);
+}
+
+static u32 mt7921_rmw(struct mt76_dev *mdev, u32 offset, u32 mask, u32 val)
+{
+	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
+	u32 addr = __mt7921_reg_addr(dev, offset);
+
+	return dev->bus_ops->rmw(mdev, addr, mask, val);
+}
+
+static int mt7921_dmashdl_disabled(struct mt7921_dev *dev)
+{
+	mt76_clear(dev, MT_WFDMA0_GLO_CFG_EXT0, MT_WFDMA0_CSR_TX_DMASHDL_ENABLE);
+	mt76_set(dev, MT_DMASHDL_SW_CONTROL, MT_DMASHDL_DMASHDL_BYPASS);
+
+	return 0;
+}
+
+int mt7921_dma_init(struct mt7921_dev *dev)
+{
+	/* Increase buffer size to receive large VHT/HE MPDUs */
+	struct mt76_bus_ops *bus_ops;
+	int rx_buf_size = MT_RX_BUF_SIZE * 2;
+	int ret;
+
+	dev->bus_ops = dev->mt76.bus;
+	bus_ops = devm_kmemdup(dev->mt76.dev, dev->bus_ops, sizeof(*bus_ops),
+			       GFP_KERNEL);
+	if (!bus_ops)
+		return -ENOMEM;
+
+	bus_ops->rr = mt7921_rr;
+	bus_ops->wr = mt7921_wr;
+	bus_ops->rmw = mt7921_rmw;
+	dev->mt76.bus = bus_ops;
+
+	mt76_dma_attach(&dev->mt76);
+
+	/* reset */
+	mt76_clear(dev, MT_WFDMA0_RST,
+		   MT_WFDMA0_RST_DMASHDL_ALL_RST |
+		   MT_WFDMA0_RST_LOGIC_RST);
+
+	mt76_set(dev, MT_WFDMA0_RST,
+		 MT_WFDMA0_RST_DMASHDL_ALL_RST |
+		 MT_WFDMA0_RST_LOGIC_RST);
+
+	ret = mt7921_dmashdl_disabled(dev);
+	if (ret)
+		return ret;
+
+	/* disable WFDMA0 */
+	mt76_clear(dev, MT_WFDMA0_GLO_CFG,
+		   MT_WFDMA0_GLO_CFG_TX_DMA_EN |
+		   MT_WFDMA0_GLO_CFG_RX_DMA_EN |
+		   MT_WFDMA0_GLO_CFG_CSR_DISP_BASE_PTR_CHAIN_EN |
+		   MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
+		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO |
+		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
+
+	mt76_poll(dev, MT_WFDMA0_GLO_CFG,
+		  MT_WFDMA0_GLO_CFG_TX_DMA_BUSY |
+		  MT_WFDMA0_GLO_CFG_RX_DMA_BUSY, 0, 1000);
+
+	/* init tx queue */
+	ret = mt7921_init_tx_queues(&dev->phy, MT7921_TXQ_BAND0,
+				    MT7921_TX_RING_SIZE);
+	if (ret)
+		return ret;
+
+	mt76_wr(dev, MT_WFDMA0_TX_RING0_EXT_CTRL, 0x4);
+
+	/* command to WM */
+	ret = mt76_init_mcu_queue(&dev->mt76, MT_MCUQ_WM, MT7921_TXQ_MCU_WM,
+				  MT7921_TX_MCU_RING_SIZE, MT_TX_RING_BASE);
+	if (ret)
+		return ret;
+
+	/* firmware download */
+	ret = mt76_init_mcu_queue(&dev->mt76, MT_MCUQ_FWDL, MT7921_TXQ_FWDL,
+				  MT7921_TX_FWDL_RING_SIZE, MT_TX_RING_BASE);
+	if (ret)
+		return ret;
+
+	/* event from WM before firmware download */
+	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MCU],
+			       MT7921_RXQ_MCU_WM,
+			       MT7921_RX_MCU_RING_SIZE,
+			       rx_buf_size, MT_RX_EVENT_RING_BASE);
+	if (ret)
+		return ret;
+
+	/* Change mcu queue after firmware download */
+	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MCU_WA],
+			       MT7921_RXQ_MCU_WM,
+			       MT7921_RX_MCU_RING_SIZE,
+			       rx_buf_size, MT_WFDMA0(0x540));
+	if (ret)
+		return ret;
+
+	/* rx data */
+	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MAIN],
+			       MT7921_RXQ_BAND0, MT7921_RX_RING_SIZE,
+			       rx_buf_size, MT_RX_DATA_RING_BASE);
+	if (ret)
+		return ret;
+
+	ret = mt76_init_queues(dev);
+	if (ret < 0)
+		return ret;
+
+	netif_tx_napi_add(&dev->mt76.napi_dev, &dev->mt76.tx_napi,
+			  mt7921_poll_tx, NAPI_POLL_WEIGHT);
+	napi_enable(&dev->mt76.tx_napi);
+
+	/* configure perfetch settings */
+	mt7921_dma_prefetch(dev);
+
+	/* reset dma idx */
+	mt76_wr(dev, MT_WFDMA0_RST_DTX_PTR, ~0);
+
+	/* configure delay interrupt */
+	mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG0, 0);
+
+	mt76_set(dev, MT_WFDMA0_GLO_CFG,
+		 MT_WFDMA0_GLO_CFG_TX_WB_DDONE |
+		 MT_WFDMA0_GLO_CFG_FIFO_LITTLE_ENDIAN |
+		 MT_WFDMA0_GLO_CFG_CLK_GAT_DIS |
+		 MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
+		 MT_WFDMA0_GLO_CFG_CSR_DISP_BASE_PTR_CHAIN_EN |
+		 MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
+
+	mt76_set(dev, MT_WFDMA0_GLO_CFG,
+		 MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN);
+
+	mt76_set(dev, 0x54000120, BIT(1));
+
+	/* enable interrupts for TX/RX rings */
+	mt7921_irq_enable(dev, MT_INT_RX_DONE_ALL | MT_INT_TX_DONE_ALL |
+			  MT_INT_MCU_CMD);
+
+	return 0;
+}
+
+void mt7921_dma_cleanup(struct mt7921_dev *dev)
+{
+	/* disable */
+	mt76_clear(dev, MT_WFDMA0_GLO_CFG,
+		   MT_WFDMA0_GLO_CFG_TX_DMA_EN |
+		   MT_WFDMA0_GLO_CFG_RX_DMA_EN |
+		   MT_WFDMA0_GLO_CFG_CSR_DISP_BASE_PTR_CHAIN_EN |
+		   MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
+		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO |
+		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
+
+	/* reset */
+	mt76_clear(dev, MT_WFDMA0_RST,
+		   MT_WFDMA0_RST_DMASHDL_ALL_RST |
+		   MT_WFDMA0_RST_LOGIC_RST);
+
+	mt76_set(dev, MT_WFDMA0_RST,
+		 MT_WFDMA0_RST_DMASHDL_ALL_RST |
+		 MT_WFDMA0_RST_LOGIC_RST);
+
+	mt76_dma_cleanup(&dev->mt76);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 853432d749ec..a5d3f5023ea4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -1204,6 +1204,9 @@ mt7921_dma_reset(struct mt7921_phy *phy)
 		mt76_queue_rx_reset(dev, i);
 	}
 
+	/* re-init prefetch settings after reset */
+	mt7921_dma_prefetch(dev);
+
 	mt76_set(dev, MT_WFDMA0_GLO_CFG,
 		 MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN);
 }
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
