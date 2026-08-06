Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94414C55ABF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 14:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u9Cf19exgJUbhMN18jsPNMaqk2I9uUSBPntYyt77HUc=; b=DJnYw3Y4aWvvU7si2nusRWQ5fT
	/Q+x0Kw+qfgHbDX8NzNGoxiuSYK0Dv6QOFWfb7L3FF3lhAd0fTi7iDxBD2z4313SnsSpuGCDnitHW
	GhmrIWGrHcT9dk8hAjoA+iQCWZXY3lhtVIr3eQIQbAhZvPdh1tQhboQwCO/CID7Pb0lQVb/Mx8EJP
	wyW3qJ/t8l72LDesLyqL4zh+Sf6xrqx0AIefZuLSotC1riMU1si00050J8HhdV6F6RMTH//Iu3P6t
	oVWbrObzpk2/EK1MUgsS2vRQ43eOIl66eIkg4s1ZGxnOhjSA+Hp9HJ2zCQ3eyeiTCccjW0FUDyL/K
	gWXE6H0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrz5K-00000005ykb-1iNV;
	Thu, 06 Aug 2026 14:28:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrz5H-00000005yjq-1V0z
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 14:28:37 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-495590dde14so25997045e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 07:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786026513; x=1786631313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u9Cf19exgJUbhMN18jsPNMaqk2I9uUSBPntYyt77HUc=;
        b=TDXL02+i1uaz5VzwVHH0aLQf/kZU5j5Qv0oiAKmqyK/3V+LWz3jm91jLpqRb7ycx3A
         0ZJLmKnCJinuMWt08CoauucqV28r7z3xQxSI0LDRxQE9ZASfRYmK1cW80oXO7vElhPMJ
         3RW564ICud/Dvn8mKTAzOPuoC51xjKa9rgzQjiL694p1Cy/g7HlNsdT11DZaIuickJQQ
         hCHJ6tyg0sPHtdBZYargFdCvNRBMFYSTNwaHSowqAZZUlcmcjyZSHCDHG/kH0hSOxh7Z
         1jWMSopzFOqGIhyoBCs9v60SM00w4+kkjLX4i/vQUepMaW39v+u6FMalSTNSHVBge+F4
         MBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786026513; x=1786631313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9Cf19exgJUbhMN18jsPNMaqk2I9uUSBPntYyt77HUc=;
        b=ZEL3LLKKUfhdRPx4+44W9Lg+kLNk6djkaPSEfEF2lcjrl78UnMhWMTNfsJlwjJQ4Lu
         G2NpyVC/xsA81jLW5u6RNLAd87oDuaO8Bmq+MbN+0GCdmuMyGCReqwt1KqPo3nDpDoK9
         ZEwrSSn7Ui9xrrSFcBMLiST2UGef+CwUy7hhixM5I9TnrtZq6L2rZEf3M1W8pGtSSAwi
         dZsNohGUaoO/qGZ/9hAzN8JXmnZC8DAYgiSgNHuO1EqgS7wx1ORFRoKU5TGFmsLoPlQu
         gtRvozZWKhr1HO1GooVF1cSNTUqKlatckvJTV3GXHC6tbzueyOxn+OHHQrfIIKzArG/n
         3DKA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+H+Ukd+0wBZwHhd01wi9tNMvhZHkVAvh4hqzTjCvaLrlyLSIrUyTj5OYkJOnYXaIS02Ywr+ygAs9BYSO3yQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxD2v1K+Vq68thBsp2r4HY5GYgGMs8cDI5/4W8qp9WFcwVj4oQY
	2J0O/n9RZiKlQIXVWJKFAsgw9TNbdpRi/1FmDzjCdBIRhCdJOcxBCjPy
X-Gm-Gg: AR+sD107k5r/xHs/YV+M98cRHT7YLmw53P8lvXQkvk3r27fG33MhzrH7XGyWxEaABO1
	fDass/KmyRw6TWChbtl7XZ9r9Ka7bTxp4bRPbLQ/kCkKdlKgzJnjDViJ1Ibcz9muDJ3/Z3hY/y/
	/38SAvNB0HKw6JyBJ+8h5V4r56o5YPq++TQMw/MShIiKkzFSkN8U/6avDv4WVR4+66bqx8WyLeu
	z7Y/sWL4/K8bzMvnF1oh5c4PYfTixnk/jud63xLIFr4ZT7KQld7/rhSJHVGihDI5pz/kKgUdilh
	wljNM1sJYA5NPQ3XXY1aBjS5D2/kFZ8egfERVZ+pUmf/hPTbUd65vLs30skUR87Jxj7nKEYj3Qa
	8KIohVCpyJ+I/HWm8JW1bTAMHuPPrMojz7WPQRmQXBJTUGrH+tFufiSQ4WJNIIUOPHpRxypWWH0
	BQy3fgy/X+3+JWv5kdRS43miiNq2ENVtsM4NOwa8TJDSjPkPgEfbL6E1s=
X-Received: by 2002:a05:600c:1913:b0:499:5282:f8d1 with SMTP id 5b1f17b1804b1-4995282f8dfmr99990265e9.12.1786026513176;
        Thu, 06 Aug 2026 07:28:33 -0700 (PDT)
Received: from fedora ([46.205.219.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995422b741sm72692255e9.14.2026.08.06.07.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:28:32 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	win847@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH v3] net: airoha: npu: use coherent DMA for mailbox messages
Date: Thu,  6 Aug 2026 16:28:16 +0200
Message-ID: <20260806142816.511515-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_072835_434229_542584B5 
X-CRM114-Status: GOOD (  20.39  )
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

Commit 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox
buffer") switched airoha_npu_send_msg() to DMA_BIDIRECTIONAL so
non-coherent CPUs invalidate caches before reading NPU GET responses.

On EN7581 + MT7996 that change regresses probe: the mailbox completes
successfully, but WLAN_FUNC_GET_WAIT_NPU_VERSION still reads as 0.0 and
mt76 never binds NPU offload. Healthy boards report 0.1111.

airoha_npu_send_msg() is also used from PPE foe_commit under
spin_lock_bh(), so per-message dma_alloc_coherent(GFP_ATOMIC) is a poor
fit. Allocate one device-managed coherent bounce buffer per NPU core at
probe and reuse it under the existing per-core mailbox lock. That also
keeps the buffer valid if the NPU completes a write after a mailbox
timeout.

Pass an optional reply buffer into airoha_npu_send_msg() so GET callers
(e.g. airoha_npu_wlan_msg_get) copy the response payload once instead of
bouncing through the request allocation.

Verified on Quantum Fiber / Gemtek W1700K (EN7581 + MT7996).

Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buffer")
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260805070851.2885888-1-pawlik.dan@gmail.com/
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260806072601.1815487-1-pawlik.dan@gmail.com/
Assisted-by: Cursor:composer-2
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
v3:
- move coherent mailbox buffer into struct airoha_npu_core (buf/addr)
- allocate one buffer per core at probe
- add optional reply buffer to airoha_npu_send_msg() to avoid the extra
  copy in airoha_npu_wlan_msg_get()
- document AIROHA_NPU_MBOX_SIZE vs ppe_mbox_data / WLAN payloads

v2:
- allocate one coherent mailbox buffer at probe and reuse it under the
  per-core lock instead of per-message dma_alloc_coherent(GFP_ATOMIC)

 drivers/net/ethernet/airoha/airoha_npu.c  | 67 ++++++++++++++++-------
 include/linux/soc/airoha/airoha_offload.h |  3 +
 2 files changed, 51 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index b679bed952de..e1e0ddb92f03 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -23,6 +23,12 @@
 #define NPU_EN7581_FIRMWARE_RV32_MAX_SIZE	0x200000
 #define NPU_EN7581_FIRMWARE_DATA_MAX_SIZE	0x10000
 #define NPU_DUMP_SIZE				512
+/*
+ * Mailbox DMA payload size. Covers sizeof(struct ppe_mbox_data) (28) and
+ * WLAN TLV messages (header + payload); largest in-tree WLAN payload today
+ * is 16 bytes (INODE_TXRX_REG_ADDR). Keep headroom for future commands.
+ */
+#define AIROHA_NPU_MBOX_SIZE			256
 
 #define REG_NPU_LOCAL_SRAM		0x0
 
@@ -161,21 +167,32 @@ struct wlan_mbox_data {
 };
 
 static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
-			       void *p, int size)
+			       const void *req, int size,
+			       void *rsp, int rsp_off, int rsp_len)
 {
 	u16 core = 0; /* FIXME */
+	struct airoha_npu_core *c = &npu->cores[core];
 	u32 val, offset = core << 4;
-	dma_addr_t dma_addr;
 	int ret;
 
-	dma_addr = dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
-	ret = dma_mapping_error(npu->dev, dma_addr);
-	if (ret)
-		return ret;
+	if (size > AIROHA_NPU_MBOX_SIZE ||
+	    (rsp && (rsp_off < 0 || rsp_len < 0 ||
+		     rsp_off + rsp_len > size)))
+		return -EINVAL;
 
-	spin_lock_bh(&npu->cores[core].lock);
+	/*
+	 * Mailbox payloads are bidirectional (CPU request, NPU response).
+	 * On EN7581+MT7996, streaming DMA_BIDIRECTIONAL against the
+	 * caller kzalloc() buffer can leave WLAN_FUNC_GET_WAIT_NPU_VERSION
+	 * reading as 0.0 despite MBOX success. Reuse a probe-time coherent
+	 * bounce buffer under the per-core lock (also used from PPE
+	 * foe_commit under atomic context).
+	 */
+	spin_lock_bh(&c->lock);
+
+	memcpy(c->buf, req, size);
 
-	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, dma_addr);
+	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, c->addr);
 	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, size);
 	regmap_read(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, &val);
 	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, val + 1);
@@ -189,9 +206,10 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 	if (!ret && FIELD_GET(MBOX_MSG_STATUS, val) != NPU_MBOX_SUCCESS)
 		ret = -EINVAL;
 
-	spin_unlock_bh(&npu->cores[core].lock);
+	if (!ret && rsp)
+		memcpy(rsp, c->buf + rsp_off, rsp_len);
 
-	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
+	spin_unlock_bh(&c->lock);
 
 	return ret;
 }
@@ -343,7 +361,7 @@ static int airoha_npu_ppe_init(struct airoha_npu *npu)
 	ppe_data->init_info.wan_mode = QDMA_WAN_ETHER;
 
 	err = airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
-				  sizeof(*ppe_data));
+				  sizeof(*ppe_data), NULL, 0, 0);
 	kfree(ppe_data);
 
 	return err;
@@ -362,7 +380,7 @@ static int airoha_npu_ppe_deinit(struct airoha_npu *npu)
 	ppe_data->func_id = PPE_FUNC_SET_WAIT_HWNAT_DEINIT;
 
 	err = airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
-				  sizeof(*ppe_data));
+				  sizeof(*ppe_data), NULL, 0, 0);
 	kfree(ppe_data);
 
 	return err;
@@ -386,7 +404,7 @@ static int airoha_npu_ppe_flush_sram_entries(struct airoha_npu *npu,
 	ppe_data->set_info.size = sram_num_entries;
 
 	err = airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
-				  sizeof(*ppe_data));
+				  sizeof(*ppe_data), NULL, 0, 0);
 	kfree(ppe_data);
 
 	return err;
@@ -411,7 +429,7 @@ static int airoha_npu_foe_commit_entry(struct airoha_npu *npu,
 					  : PPE_SRAM_SET_ENTRY;
 
 	err = airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
-				  sizeof(*ppe_data));
+				  sizeof(*ppe_data), NULL, 0, 0);
 	if (err)
 		goto out;
 
@@ -420,7 +438,7 @@ static int airoha_npu_foe_commit_entry(struct airoha_npu *npu,
 	ppe_data->set_info.size = sizeof(u32);
 
 	err = airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
-				  sizeof(*ppe_data));
+				  sizeof(*ppe_data), NULL, 0, 0);
 out:
 	kfree(ppe_data);
 
@@ -443,6 +461,7 @@ static int airoha_npu_ppe_stats_setup(struct airoha_npu *npu,
 	ppe_data->stats_info.foe_stats_addr = foe_stats_addr;
 
 	err = airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
+				  sizeof(*ppe_data), ppe_data, 0,
 				  sizeof(*ppe_data));
 	if (err)
 		goto out;
@@ -475,7 +494,8 @@ static int airoha_npu_wlan_msg_send(struct airoha_npu *npu, int ifindex,
 	wlan_data->func_id = func_id;
 	memcpy(wlan_data->d, data, data_len);
 
-	err = airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len);
+	err = airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len,
+				  NULL, 0, 0);
 	kfree(wlan_data);
 
 	return err;
@@ -497,9 +517,9 @@ static int airoha_npu_wlan_msg_get(struct airoha_npu *npu, int ifindex,
 	wlan_data->func_type = NPU_OP_GET;
 	wlan_data->func_id = func_id;
 
-	err = airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len);
-	if (!err)
-		memcpy(data, wlan_data->d, data_len);
+	err = airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len,
+				  data, offsetof(struct wlan_mbox_data, d),
+				  data_len);
 	kfree(wlan_data);
 
 	return err;
@@ -770,6 +790,15 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	for (i = 0; i < ARRAY_SIZE(npu->cores); i++) {
+		struct airoha_npu_core *core = &npu->cores[i];
+
+		core->buf = dmam_alloc_coherent(dev, AIROHA_NPU_MBOX_SIZE,
+						&core->addr, GFP_KERNEL);
+		if (!core->buf)
+			return -ENOMEM;
+	}
+
 	err = airoha_npu_run_firmware(dev, base, &res);
 	if (err)
 		return dev_err_probe(dev, err, "failed to run npu firmware\n");
diff --git a/include/linux/soc/airoha/airoha_offload.h b/include/linux/soc/airoha/airoha_offload.h
index 7589fccfeef6..16a988ad7467 100644
--- a/include/linux/soc/airoha/airoha_offload.h
+++ b/include/linux/soc/airoha/airoha_offload.h
@@ -173,6 +173,9 @@ struct airoha_npu {
 		/* protect concurrent npu memory accesses */
 		spinlock_t lock;
 		struct work_struct wdt_work;
+		/* Coherent bounce buffer for mailbox cmd/rsp */
+		void *buf;
+		dma_addr_t addr;
 	} cores[NPU_NUM_CORES];
 
 	int irqs[NPU_NUM_IRQ];
-- 
2.55.0


