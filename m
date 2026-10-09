Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B64ECA6015
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2026 05:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDt8xmkCjT/Lgq2VDXDSaI4X0hERcMtPjm6ARB67S9I=; b=ktQgc7eDvWO3S7DGMOLdijin8F
	B0SZiBKp+uzPnSFdaWkgeWT8PjHhNaMkIfu7K/z8TxkvPvTp0lcqgl9N4x6YrDqd67UpRjE4/yksk
	KoLObK+sTVKIOA6pQ8kGmpVqDjdQ/ph5Mm/K7PNwpasACdIqli9IDL4Mz2S/V3lx4jm9nvLkYZ/fA
	8hTEXYG2FXQ2yNS/htIX1k4aQTmdfKkipNKf4z7yCNURhoYjOvF4ycTSrxb6dXHVkb0rN1oRQnBIr
	GiH1BOQy7DP+WqhbarEOKEkjhLdeVlZz/xgZB2yu2ahYph+KgJ1phNKUlWIk5Ldh21/sxrUmP5eOM
	f4Y8WdGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF2nC-00000005VF9-3OWK;
	Fri, 09 Oct 2026 05:05:14 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF2n9-00000005VEJ-072q
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Oct 2026 05:05:12 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-3535a54bed9so1228373eec.1
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 22:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791522310; x=1792127110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WDt8xmkCjT/Lgq2VDXDSaI4X0hERcMtPjm6ARB67S9I=;
        b=s6kxWZ4ZgSzXDrwjYKa4NLJ+gRrwjgRofSq2qtD4fVMxZL+IFhddWXf//ymkBRGMwp
         /oDenKW1W3ei7ilYTvYrxH/pjPS3DNnvRQ4OeFt9HmWGMaDdjH7sZy3dhziSStbIXZTd
         jjLA6X32jexRmIsh0cSXE5uPvF4gAB2HUbd2Jujkkuf3KWFhgsQkUjvGrHENGmDu4B3w
         MY4KVvQ2oUqbWYYFbm90fsopJegJcJkc84KZDm2v/pIOcPpaVdzlAhbWn+dR6ocaSfEz
         xj6csqmjzfBzceKQk7tI2JlLx9z2KdaUP80ZCfcsm7lUk/vANHOVThhIC7x0hfTT0mE6
         wPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791522310; x=1792127110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WDt8xmkCjT/Lgq2VDXDSaI4X0hERcMtPjm6ARB67S9I=;
        b=sBqcN9SAyfmCrAkViyqLbFeL60WQol0u067QaNgIE5nm0oPOxNQ3lPu5fy5VEhsnQA
         keGVDEydlUdD2zYLlTcJt16zHAEhFlYtLd7mT4lmVzggaAP1XefXiGSVIWEZsxFKEgf7
         wMNey9v+e7DrNNVqxYfcZSUIUBwGlz3RZ6eT6qMZw4y23ttlWiVdweNi7ywpUrWNXpsX
         GeBOqtGeUfdh+p4jryhZPWtFRPqlprTxx/YXU4M8DRkfHejUVGeANpzNaZJR5LMIrQ5W
         qfGb993NX467k3Gr13W8IRHBbScRhcL2BUlUxKOVADIGZpUazVyFh5TB0LsUDwy/UD5N
         nmNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlHzokIXfumQ0p60vXH5BMQUHKSahTgxPsjMNqKqW9mdHenxkxcKHdCel+Gre9+ynqJJIIk6VUZTKXASmM0w==@lists.infradead.org
X-Gm-Message-State: AFq9FYKeG3Pe91daOpXQ+43AR9eifNceRkZE8Rui3ybMxtyFwEpXs0DD
	DipUezlirFb7UcdjZSlFl7bxT1nDJOJ/tSPvC85ddHtu8dZFiXcRADsV
X-Gm-Gg: AYBFou1lmhPdNQywaBUv1OIqBTg09saivupG4VsOFLCE1bhHh8gkdRHAw5zYdVKGpu9
	MNlyfGMbfkVnZwR2NYRZWbTGXrQYsuqgyoMqUeFOS+EOcje1O67MfUtojvsDQFf70hZgXcZfD1k
	RCDKXx0adyLWpX6hFG1n+xKQ4FvYs2Hv8c5dT8yeeyQH6jNtxB9QZ9HRUj4LMLZ0Vx11sQ9evVD
	5OIz6DHbcjsjxcBCE4QODPW59EiBZCe9+lMi/mpM2sT9zfeDuNY3r14s/QI3cw1d77rqvmIEfLc
	UakKl7lCyz4zGfC9VCbsz6iLEQb6+DKblV/Htn20J0e8iwoKsikcajhKAKSxDzPcNgyBzKK3Cd1
	6KI/HuEA7x7+ScoLn5yp0jaAqO6uKoHAtV32SdLUlsmfV13stbH7EW5EdG2iFTp4EuuwH7DFM7c
	Iva7eeqrphR+xgQJxnXqCSvrvzCqvhjKdZx7qBGKwqspT6bqxS2FFwvQQmAd6Iude3IaNrz/pAT
	ez8z9lvXx6bluEiPbaiRBpn7k4Cmi+CLaWAnj2VtejvGCfpXw==
X-Received: by 2002:a05:7300:4349:b0:351:62fe:62 with SMTP id 5a478bee46e88-3537e0b81famr1908803eec.19.1791522309753;
        Thu, 08 Oct 2026 22:05:09 -0700 (PDT)
Received: from nbai25050026.. ([2403:8600:2090:6f:a2c1:990e:e510:6920])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab786fsm3505072eec.19.2026.10.08.22.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 22:05:09 -0700 (PDT)
From: SAYANTAN NANDY <sayantann11@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bread.hsu@airoha.com,
	sayantan.nandy@airoha.com,
	SAYANTAN NANDY <sayantann11@gmail.com>
Subject: [PATCH net v2] net: airoha: keep PPE offload when NPU refuses flow stats
Date: Fri,  9 Oct 2026 10:33:22 +0530
Message-ID: <20261009050322.39060-1-sayantann11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008094828.15458-1-sayantann11@gmail.com>
References: <20261008094828.15458-1-sayantann11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_220511_102596_CF43A04C 
X-CRM114-Status: GOOD (  21.83  )
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

From: Chad Monroe <chad@monroe.io>

With flow stats enabled, PPE offload setup requests flow statistics
from the NPU. If the running NPU firmware does not support flow
counters, the request fails and the current setup path aborts PPE
offload.

Treat flow statistics as an optional capability so that a failure to
set up the counters does not prevent normal PPE offload. Record
whether flow statistics are available and continue PPE initialization
when the NPU refuses the flow-statistics request.

Also treat a zero NPU statistics address returned by the firmware as a
refusal. The host-side DMA buffer (foe_stats_dma) is allocated by
dmam_alloc_coherent() in airoha_ppe_init() from system memory. The NPU
statistics address (npu_stats_addr) is a separate allocation from the
NPU firmware's internal SRAM pool. When that pool is exhausted, the
firmware replies with success and npu_stats_addr = 0. A zero address
does not provide a usable counter region and must not be passed to
devm_ioremap().

When flow stats are available, clear PSE_PORT6_SHARE_DIS so that PSE
port 6 (CDM3 path to the NPU) participates in shared-buffer flow
control, which the counter traffic path needs.

When flow statistics are unavailable, PPE continues to operate without
NPU flow counters while retaining normal offload functionality.

This combines the original SmartRG/Airoha fixes for:
- keeping PPE offload active when the NPU refuses flow statistics
- treating a zero NPU statistics address as a flow-statistics refusal

Based on the original SmartRG/Airoha work by Chad Monroe:
5ce96ab ("SDG-9458: keep PPE offload when NPU refuses flow stats")
0ad8528 ("SDG-9458: airoha: treat a zero NPU stats address as a refusal")
Fixes: b81e0f2b58be ("net: airoha: Add FLOW_CLS_STATS callback support")
Tested-on: AN7581 with MT7992
Signed-off-by: Chad Monroe <chad@monroe.io>
Signed-off-by: SAYANTAN NANDY <sayantann11@gmail.com>
---

Changes since v1:
- Rename flow_stats to flow_stats_cap (Lorenzo).
- Explain that npu_stats_addr is an NPU firmware SRAM allocation,
  distinct from the host-side foe_stats_dma buffer (Lorenzo).
- Explain why PSE_PORT6_SHARE_DIS is cleared for counter traffic
  (Lorenzo).
- Use airoha_fe_clear() and shorten the warning message (Lorenzo).
- Add hardware testing information requested by netdev-bot.

 drivers/net/ethernet/airoha/airoha_eth.h  |  1 +
 drivers/net/ethernet/airoha/airoha_npu.c  |  8 ++++++++
 drivers/net/ethernet/airoha/airoha_ppe.c  | 17 +++++++++++------
 drivers/net/ethernet/airoha/airoha_regs.h |  2 ++
 4 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 8277c1c87bb3..da4a3ba69e3c 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -617,6 +617,7 @@ struct airoha_ppe {
 
 	void *foe;
 	dma_addr_t foe_dma;
+	bool flow_stats_cap;
 
 	struct rhashtable l2_flows;
 
diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 4d3195eb00f7..b32a01dbe06b 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -450,6 +450,14 @@ static int airoha_npu_ppe_stats_setup(struct airoha_npu *npu,
 	if (err)
 		goto out;
 
+	/* The firmware reports success with a zero address when its SRAM
+	 * pool has no room left for the counters.
+	 */
+	if (!ppe_data->stats_info.npu_stats_addr) {
+		err = -ENOSPC;
+		goto out;
+	}
+
 	npu->stats = devm_ioremap(npu->dev,
 				  ppe_data->stats_info.npu_stats_addr,
 				  size);
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 92611802801e..0957f331478a 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -37,10 +37,7 @@ static const struct rhashtable_params airoha_l2_flow_table_params = {
 
 static int airoha_ppe_get_num_stats_entries(struct airoha_ppe *ppe)
 {
-	if (!IS_ENABLED(CONFIG_NET_AIROHA_FLOW_STATS))
-		return -EOPNOTSUPP;
-
-	if (airoha_is_7583(ppe->eth))
+	if (!ppe->flow_stats_cap)
 		return -EOPNOTSUPP;
 
 	return PPE_STATS_NUM_ENTRIES;
@@ -144,6 +141,9 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 	sram_ppe_num_data_entries =
 		PPE_RAM_NUM_ENTRIES_SHIFT(sram_ppe_num_data_entries);
 
+	if (ppe->flow_stats_cap)
+		airoha_fe_clear(eth, PSE_FC_CFG, PSE_PORT6_SHARE_DIS);
+
 	for (i = 0; i < eth->soc->num_ppe; i++) {
 		airoha_fe_wr(eth, REG_PPE_TB_BASE(i),
 			     ppe->foe_dma + sram_tb_size);
@@ -1456,8 +1456,11 @@ static int airoha_ppe_offload_setup(struct airoha_eth *eth)
 	if (ppe_num_stats_entries > 0) {
 		err = npu->ops.ppe_init_stats(npu, ppe->foe_stats_dma,
 					      ppe_num_stats_entries);
-		if (err)
-			goto error_npu_put;
+		if (err) {
+			dev_warn(eth->dev, "NPU refused flow stats (%d)\n",
+				 err);
+			ppe->flow_stats_cap = false;
+		}
 	}
 
 	airoha_ppe_hw_init(ppe);
@@ -1608,6 +1611,8 @@ int airoha_ppe_init(struct airoha_eth *eth)
 	ppe->dev.priv = ppe;
 	ppe->eth = eth;
 	eth->ppe = ppe;
+	ppe->flow_stats_cap = IS_ENABLED(CONFIG_NET_AIROHA_FLOW_STATS) &&
+			  !airoha_is_7583(eth);
 
 	ppe_num_entries = airoha_ppe_get_total_num_entries(ppe);
 	foe_size = ppe_num_entries * sizeof(struct airoha_foe_entry);
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 442b48c9b991..aee06c058586 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -72,6 +72,8 @@
 #define PSE_CFG_OQ_RSV_MASK		GENMASK(13, 0)
 
 #define PSE_FQ_CFG			0x008c
+#define PSE_FC_CFG			0x0098
+#define PSE_PORT6_SHARE_DIS		BIT(22)
 #define PSE_FQ_LIMIT_MASK		GENMASK(14, 0)
 
 #define REG_FE_PSE_BUF_SET		0x0090
-- 
2.43.0


