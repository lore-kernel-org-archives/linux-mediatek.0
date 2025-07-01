Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE05DC7EE30
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jul 2025 22:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1OxUDcjIehJWhLW1NkIDPkxbfckpWJru7XEsBqBcGk=; b=HEIq3rLBHDN8N/IcU7iCFftz/c
	d8Jt/LLTccHEV+q9KIKnPNQSUFoAOhQX0B2/WJYf0/G6o2onZxdvk6mrPMchP2y6iYWqBKt5P6omI
	o+OYb2X5LW48eY9ajw/S/MSL5mC3sWTimS7JUqSQYZ0vOLbNJfAKi9zuEcaxSsNinb+B4JENkzi0g
	wgOaDodbO1F33enTa6+E7xKnAg6bw2A/z6dAvPHqgFrEcxlvxnSMCY+FKj0Wx37K0ReV/IR5YObqc
	US5XfGvAFL/iBMLjZCRwr2ejQ6sPYdXvGoylOeL0E3n2/Gz/s8kfeS2T4VvEc9tHeTQC1ZziOKJeY
	ICknfmhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjuN-00000006ol5-3UxL;
	Tue, 01 Jul 2025 22:56:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjOU-00000006mDT-1e0r;
	Tue, 01 Jul 2025 22:24:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9767BA5341E;
	Tue,  1 Jul 2025 22:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E154FC4CEEB;
	Tue,  1 Jul 2025 22:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751408641;
	bh=L4tJw4hsttorpP+qYBOR1FpFss4EbxB4am5UrHANugQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SERKQbIYvexa87rKN5AKXXF9n0mPV4PJF8rqWbsgSfqj5njfCItuwQXfS/CTUkXlA
	 EmBxgkC5hLJ5DAUxCON0wSPU3pC2XAVDjzCgTyGIEcn6UT2439OKC6SgcswRr+x7nD
	 Lb7qcgfnPE5CUS+H9CvV//EDbG445SUDPnT3z04LiReiIngtYGqwQdUZcVyKo1KDlY
	 eGSkM4D+xhy7ofSMFMOLfQScV3y3OfQ3Ju0hRWhRLDkuzsLUk99sOsuesuzUXtC6IT
	 AEO6ePy6+DFgW8slSeTKdFKq/ARAUQH1MIbWFgtTWPafcZzg9BqdbXsTbOPoHxJXIL
	 w69LeEeQg7Pcg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 02 Jul 2025 00:23:30 +0200
Subject: [PATCH net-next 1/6] net: airoha: npu: Add NPU wlan memory
 initialization commands
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-airoha-en7581-wlan-offlaod-v1-1-803009700b38@kernel.org>
References: <20250702-airoha-en7581-wlan-offlaod-v1-0-803009700b38@kernel.org>
In-Reply-To: <20250702-airoha-en7581-wlan-offlaod-v1-0-803009700b38@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_152402_571021_C70F9AB4 
X-CRM114-Status: GOOD (  14.12  )
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

Introduce wlan_init_reserved_memory callback used by MT76 driver during
NPU wlan offloading setup.
This is a preliminary patch to enable wlan flowtable offload for EN7581
SoC with MT76 driver.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 123 +++++++++++++++++++++++++++++++
 drivers/net/ethernet/airoha/airoha_npu.h |   1 +
 2 files changed, 124 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 0e5b8c21b9aa8bacdfb2e1572afe4324003e8279..f8057072cfd7bb114e34af176aabaa1ef9f052c0 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -124,6 +124,54 @@ struct ppe_mbox_data {
 	};
 };
 
+enum {
+	WLAN_FUNC_SET_WAIT_PCIE_ADDR,
+	WLAN_FUNC_SET_WAIT_DESC,
+	WLAN_FUNC_SET_WAIT_NPU_INIT_DONE,
+	WLAN_FUNC_SET_WAIT_TRAN_TO_CPU,
+	WLAN_FUNC_SET_WAIT_BA_WIN_SIZE,
+	WLAN_FUNC_SET_WAIT_DRIVER_MODEL,
+	WLAN_FUNC_SET_WAIT_DEL_STA,
+	WLAN_FUNC_SET_WAIT_DRAM_BA_NODE_ADDR,
+	WLAN_FUNC_SET_WAIT_PKT_BUF_ADDR,
+	WLAN_FUNC_SET_WAIT_IS_TEST_NOBA,
+	WLAN_FUNC_SET_WAIT_FLUSHONE_TIMEOUT,
+	WLAN_FUNC_SET_WAIT_FLUSHALL_TIMEOUT,
+	WLAN_FUNC_SET_WAIT_IS_FORCE_TO_CPU,
+	WLAN_FUNC_SET_WAIT_PCIE_STATE,
+	WLAN_FUNC_SET_WAIT_PCIE_PORT_TYPE,
+	WLAN_FUNC_SET_WAIT_ERROR_RETRY_TIMES,
+	WLAN_FUNC_SET_WAIT_BAR_INFO,
+	WLAN_FUNC_SET_WAIT_FAST_FLAG,
+	WLAN_FUNC_SET_WAIT_NPU_BAND0_ONCPU,
+	WLAN_FUNC_SET_WAIT_TX_RING_PCIE_ADDR,
+	WLAN_FUNC_SET_WAIT_TX_DESC_HW_BASE,
+	WLAN_FUNC_SET_WAIT_TX_BUF_SPACE_HW_BASE,
+	WLAN_FUNC_SET_WAIT_RX_RING_FOR_TXDONE_HW_BASE,
+	WLAN_FUNC_SET_WAIT_TX_PKT_BUF_ADDR,
+	WLAN_FUNC_SET_WAIT_INODE_TXRX_REG_ADDR,
+	WLAN_FUNC_SET_WAIT_INODE_DEBUG_FLAG,
+	WLAN_FUNC_SET_WAIT_INODE_HW_CFG_INFO,
+	WLAN_FUNC_SET_WAIT_INODE_STOP_ACTION,
+	WLAN_FUNC_SET_WAIT_INODE_PCIE_SWAP,
+	WLAN_FUNC_SET_WAIT_RATELIMIT_CTRL,
+	WLAN_FUNC_SET_WAIT_HWNAT_INIT,
+	WLAN_FUNC_SET_WAIT_ARHT_CHIP_INFO,
+	WLAN_FUNC_SET_WAIT_TX_BUF_CHECK_ADDR,
+	WLAN_FUNC_SET_WAIT_DEBUG_ARRAY_ADDR,
+};
+
+#define WLAN_MAX_STATS_SIZE	4408
+struct wlan_mbox_data {
+	u32 ifindex:4;
+	u32 func_type:4;
+	u32 func_id;
+	union {
+		u32 data;
+		u8 stats[WLAN_MAX_STATS_SIZE];
+	};
+};
+
 static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 			       void *p, int size)
 {
@@ -390,6 +438,80 @@ static int airoha_npu_stats_setup(struct airoha_npu *npu,
 	return err;
 }
 
+static int airoha_npu_wlan_send_msg(struct airoha_npu *npu, int ifindex,
+				    int func_id, u32 data, gfp_t gfp)
+{
+	struct wlan_mbox_data *wlan_data;
+	int err;
+
+	wlan_data = kzalloc(sizeof(*wlan_data), gfp);
+	if (!wlan_data)
+		return -ENOMEM;
+
+	wlan_data->ifindex = ifindex;
+	wlan_data->func_type = NPU_OP_SET;
+	wlan_data->func_id = func_id;
+	wlan_data->data = data;
+
+	err = airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data,
+				  sizeof(*wlan_data));
+	kfree(wlan_data);
+
+	return err;
+}
+
+static int airoha_npu_wlan_set_reserved_memory(struct airoha_npu *npu,
+					       int ifindex, const char *name,
+					       int func_id)
+{
+	struct device *dev = npu->dev;
+	struct reserved_mem *rmem;
+	struct device_node *np;
+	int index;
+
+	index = of_property_match_string(dev->of_node, "memory-region-names",
+					 name);
+	if (index < 0)
+		return -ENODEV;
+
+	np = of_parse_phandle(dev->of_node, "memory-region", index);
+	if (!np)
+		return -ENODEV;
+
+	rmem = of_reserved_mem_lookup(np);
+	of_node_put(np);
+
+	return airoha_npu_wlan_send_msg(npu, ifindex, func_id, rmem->base,
+					GFP_KERNEL);
+}
+
+static int airoha_npu_wlan_init_memory(struct airoha_npu *npu)
+{
+	int err, cmd = WLAN_FUNC_SET_WAIT_NPU_BAND0_ONCPU;
+
+	err = airoha_npu_wlan_send_msg(npu, 1, cmd, 0, GFP_KERNEL);
+	if (err)
+		return err;
+
+	cmd = WLAN_FUNC_SET_WAIT_TX_BUF_CHECK_ADDR;
+	err = airoha_npu_wlan_set_reserved_memory(npu, 0, "tx-bufid", cmd);
+	if (err)
+		return err;
+
+	cmd = WLAN_FUNC_SET_WAIT_PKT_BUF_ADDR;
+	err = airoha_npu_wlan_set_reserved_memory(npu, 0, "pkt", cmd);
+	if (err)
+		return err;
+
+	cmd = WLAN_FUNC_SET_WAIT_TX_PKT_BUF_ADDR;
+	err = airoha_npu_wlan_set_reserved_memory(npu, 0, "tx-pkt", cmd);
+	if (err)
+		return err;
+
+	cmd = WLAN_FUNC_SET_WAIT_IS_FORCE_TO_CPU;
+	return airoha_npu_wlan_send_msg(npu, 0, cmd, 0, GFP_KERNEL);
+}
+
 struct airoha_npu *airoha_npu_get(struct device *dev, dma_addr_t *stats_addr)
 {
 	struct platform_device *pdev;
@@ -493,6 +615,7 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	npu->ops.ppe_deinit = airoha_npu_ppe_deinit;
 	npu->ops.ppe_flush_sram_entries = airoha_npu_ppe_flush_sram_entries;
 	npu->ops.ppe_foe_commit_entry = airoha_npu_foe_commit_entry;
+	npu->ops.wlan_init_reserved_memory = airoha_npu_wlan_init_memory;
 
 	npu->regmap = devm_regmap_init_mmio(dev, base, &regmap_config);
 	if (IS_ERR(npu->regmap))
diff --git a/drivers/net/ethernet/airoha/airoha_npu.h b/drivers/net/ethernet/airoha/airoha_npu.h
index 98ec3be74ce450bf4fa8bc771d19d174e8c157e5..242f0d15b2f7c262daaf7bb78ee386ccc8a0433d 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.h
+++ b/drivers/net/ethernet/airoha/airoha_npu.h
@@ -29,6 +29,7 @@ struct airoha_npu {
 					    dma_addr_t foe_addr,
 					    u32 entry_size, u32 hash,
 					    bool ppe2);
+		int (*wlan_init_reserved_memory)(struct airoha_npu *npu);
 	} ops;
 };
 

-- 
2.50.0


