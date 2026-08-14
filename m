Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB61C5B572
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2026 11:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZWrUQY6MdEmAwjEPwEDco+lhwZ1hkXa6LAwLt7wwMi0=; b=BvSHId5xqGkYqIGksVX/epy/z7
	Q/dtEIAtiU/rPSb2MaZ0WhSZbWOWoKzodScOOp4br36Y+n4MFdy05UySIrN36p67P8020cvItx0ov
	awantDCZ3gd9pSHFd/YR53mRS+YOtCpB2k9Tiirlz9NwArPDrXxefLVItfEDkte5q5fGWj6BC+gBo
	HMIWTwLMYoL8zrLxZhxis9vACSpSc7g05WVC24Wp4aqp9P1zZYah/m+AQirOXbBiErIauhRwQdo7k
	C5hQv59vh9hJgbEnvjwelwsg19hd298Hm6on/eFBvBWBQ/pdIYAsAU2q2dZxDrTtVgyQ2I8mOD9Ty
	wW15W5tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wupeQ-00000002Yic-2Wrf;
	Fri, 14 Aug 2026 11:00:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wupeO-00000002Yhr-1J5t
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Aug 2026 11:00:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso8725275e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Aug 2026 04:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786705234; x=1787310034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZWrUQY6MdEmAwjEPwEDco+lhwZ1hkXa6LAwLt7wwMi0=;
        b=P2iUgLFqkZ6+b98UfoFph8YORb+flSFGS+WzWyiW/XU2KNH5GvQVyn6WU8ShGAXZlr
         ZSLd6kYY/4BfXUVb7HIZ9lq9CEnIdlZ2shVRHf4bvKNjvSgZIUmK6wgpT1U/9dQ0Rz68
         6JkUXsnzjQ947HWtxwXlswp6WYDQSXeClhMliYqmxS4Qfuwz/2pHQqYJEibquLcF4LW+
         0K3CJlQErnGZ1Ydf+CvlPyBGowPF+AX2lYwLUB0P1MNFzLuMaEVNzh5weoDgIs1V5ETN
         QnUXrw5iECJ86viMsA6teXW6PSla7JsMHjBmqk33DJCdlEuB7sWiC/DcL5RSA4/yhHls
         fb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786705234; x=1787310034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZWrUQY6MdEmAwjEPwEDco+lhwZ1hkXa6LAwLt7wwMi0=;
        b=Fr57EuZ3bor1BP+sl94wypHhowgjsvfoMfaR24/WS2B3rmvOJwDnOs30fR7YHErqjm
         oM6Rc4fCUztVCcIl3JsvB8beHWE9xJ07PXkVNdDd3B293GSNj2MO8jBjIHzLz9Vuswn0
         MdIHnM4TcjUt5d3RghVU8BL87ac/c1WXNa/Q+irExXCLiKbhMiapnuvwnvF8fLBBl4MB
         lFpkAf/R5eIixvAD/dtXw0Z/2P+piz+9Bw2pLI0MgxO5NP381htiRlpGY+GmaEUujAs4
         M+B9sTzmYf/7bkkVACC4xzmoc/neIOKHZ4FmfLiDGj2yHbroWdXUz4d53uyP4RYsbS61
         Phaw==
X-Forwarded-Encrypted: i=1; AHgh+RrovmKbTpF4AG6kJK6tbjCNDIYlMwlICXoMewvoKScU00n62HKsRg8gzxbQOISouGAR3omQBiddDzN4DEa5Ww==@lists.infradead.org
X-Gm-Message-State: AOJu0YydkpbXt2i8K902yAy32D1K6CrSv8mvrMf7GXwzv0L8vV08fHLz
	LLz+nqX/HJQGNxwyxdJiZA9xp5Q2WRzrZnM/9lROJEMPwpMmmC9U3ynllfQRz2+Z
X-Gm-Gg: AR+sD11IOneHcvCBo+qlfBtWyfLNK1OxvZ9cLKVbiFnatPhkQoNJstsA3/pqgEQ7XTC
	f+GaTmacEkoh+PWqNHQl4LeW5FYWIbpsOtyVgxJGKFCZFdMywfge4K5dlU4f5E6GHYcYqUCkfB5
	cS/kj6RNtSFJOOsjDseQaCbQ6e6nH8ZAcSvMnccDqn5DB1cwcEy16xDmIznq3Qam8Wo6EeOZ/J7
	y6xtd7boz66aBFHKamwHSNodFbfSWn7K9Jjyh8yJT8vvxXRMfqqFZQdlennW2f3qOXwyuJiXBt9
	Bm7vD1f5QtBo7WdTY8V4sYdvguBAfV3Uy5c4qcbf0hW+zb5CZBEjZuoGNuX2trO9e8HdYHHczk0
	9bMrkCNc0wW3uzSWnHJYR7o1oXfO3Q8NGqg1Sq2SrT354JivzPO/kQ3hAxWGng0bSyD++3v469w
	6nwYl4/gtNpRVO6KpQyDi28SneO3c0Ljl+BZBerTF+nOq7FcVhYJvSMX+uUFxUNpTx9MUd+fdaM
	bMgQ0f/yLp++C0ZXHBHo3gPrRLmmWKh6blKYnhF7Pc=
X-Received: by 2002:a05:600c:6dc3:b0:499:78b3:7b36 with SMTP id 5b1f17b1804b1-4998798091amr44356085e9.11.1786705234133;
        Fri, 14 Aug 2026 04:00:34 -0700 (PDT)
Received: from fedora ([46.205.219.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f200752sm7813507f8f.1.2026.08.14.04.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 04:00:33 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	win847@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH v7] net: airoha: npu: use aligned streaming DMA for mailbox messages
Date: Fri, 14 Aug 2026 13:00:17 +0200
Message-ID: <20260814110017.2795022-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_040036_381176_7935E318 
X-CRM114-Status: GOOD (  19.03  )
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

On EN7581 + MT7996 (Gemtek W1700K), mapping small caller buffers with
DMA_BIDIRECTIONAL regresses NPU version probe: the mailbox completes
successfully but WLAN_FUNC_GET_WAIT_NPU_VERSION reads as 0.0 instead of
0.1111.

Bounce mailbox traffic through a per-core cacheline-aligned buffer
allocated at probe. Map ALIGN(len, SMP_CACHE_BYTES) with
DMA_BIDIRECTIONAL while programming the original payload length into the
mailbox length register. Copy the reply only after dma_unmap_single() so
the CPU sees the NPU-written payload on non-coherent DMA.

Introduce __airoha_npu_send_msg() with an optional reply pointer so GET
callers can copy the trailing response payload once. Keep
airoha_npu_send_msg() as a wrapper that copies the full response back
into the caller buffer, matching the old bidirectional mapping.

Tested on Quantum Fiber / Gemtek W1700K (EN7581 + MT7996), kernel
6.18.44, including two cold reboots and sustained WiFi use.

Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buffer")
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260805070851.2885888-1-pawlik.dan@gmail.com/
Assisted-by: Cursor:composer-2
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c  | 62 ++++++++++++++++++-----
 include/linux/soc/airoha/airoha_offload.h |  1 +
 2 files changed, 49 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index b679bed952de..2ba78bf0e97b 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/devcoredump.h>
+#include <linux/dma-mapping.h>
 #include <linux/firmware.h>
 #include <linux/platform_device.h>
 #include <linux/of_net.h>
@@ -23,6 +24,8 @@
 #define NPU_EN7581_FIRMWARE_RV32_MAX_SIZE	0x200000
 #define NPU_EN7581_FIRMWARE_DATA_MAX_SIZE	0x10000
 #define NPU_DUMP_SIZE				512
+/* Maximum mailbox DMA payload (PPE ~28 bytes, WLAN TLV up to 24). */
+#define AIROHA_NPU_MBOX_SIZE			256
 
 #define REG_NPU_LOCAL_SRAM		0x0
 
@@ -160,23 +163,33 @@ struct wlan_mbox_data {
 	DECLARE_FLEX_ARRAY(u8, d);
 };
 
-static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
-			       void *p, int size)
+static int __airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
+				 const void *data, int len, void *reply,
+				 u16 reply_len)
 {
-	u16 core = 0; /* FIXME */
-	u32 val, offset = core << 4;
+	struct airoha_npu_core *core = &npu->cores[0]; /* FIXME: core */
 	dma_addr_t dma_addr;
+	unsigned int map_len = ALIGN(len, SMP_CACHE_BYTES);
+	u32 val, offset = 0;
 	int ret;
 
-	dma_addr = dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
+	if (len <= 0 || len > AIROHA_NPU_MBOX_SIZE)
+		return -EINVAL;
+
+	if (reply && reply_len > len)
+		return -EINVAL;
+
+	spin_lock_bh(&core->lock);
+
+	memcpy(core->buf, data, len);
+
+	dma_addr = dma_map_single(npu->dev, core->buf, map_len, DMA_BIDIRECTIONAL);
 	ret = dma_mapping_error(npu->dev, dma_addr);
 	if (ret)
-		return ret;
-
-	spin_lock_bh(&npu->cores[core].lock);
+		goto unlock;
 
 	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, dma_addr);
-	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, size);
+	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, len);
 	regmap_read(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, &val);
 	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, val + 1);
 	val = FIELD_PREP(MBOX_MSG_FUNC_ID, func_id) | MBOX_MSG_WAIT_RSP;
@@ -189,13 +202,23 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 	if (!ret && FIELD_GET(MBOX_MSG_STATUS, val) != NPU_MBOX_SUCCESS)
 		ret = -EINVAL;
 
-	spin_unlock_bh(&npu->cores[core].lock);
+	dma_unmap_single(npu->dev, dma_addr, map_len, DMA_BIDIRECTIONAL);
 
-	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
+	/* Copy the trailing reply_len bytes of the response. */
+	if (!ret && reply)
+		memcpy(reply, core->buf + len - reply_len, reply_len);
+unlock:
+	spin_unlock_bh(&core->lock);
 
 	return ret;
 }
 
+static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
+			       void *data, int len)
+{
+	return __airoha_npu_send_msg(npu, func_id, data, len, data, len);
+}
+
 static int airoha_npu_load_firmware(struct device *dev, void __iomem *addr,
 				    const char *fw_name, int fw_max_size)
 {
@@ -497,9 +520,8 @@ static int airoha_npu_wlan_msg_get(struct airoha_npu *npu, int ifindex,
 	wlan_data->func_type = NPU_OP_GET;
 	wlan_data->func_id = func_id;
 
-	err = airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len);
-	if (!err)
-		memcpy(data, wlan_data->d, data_len);
+	err = __airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len,
+				    data, data_len);
 	kfree(wlan_data);
 
 	return err;
@@ -770,6 +792,18 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	for (i = 0; i < ARRAY_SIZE(npu->cores); i++) {
+		struct airoha_npu_core *core = &npu->cores[i];
+		void *raw;
+
+		raw = devm_kmalloc(dev, AIROHA_NPU_MBOX_SIZE + SMP_CACHE_BYTES,
+				   GFP_KERNEL);
+		if (!raw)
+			return -ENOMEM;
+
+		core->buf = PTR_ALIGN(raw, SMP_CACHE_BYTES);
+	}
+
 	err = airoha_npu_run_firmware(dev, base, &res);
 	if (err)
 		return dev_err_probe(dev, err, "failed to run npu firmware\n");
diff --git a/include/linux/soc/airoha/airoha_offload.h b/include/linux/soc/airoha/airoha_offload.h
index 7589fccfeef6..f635766e3dba 100644
--- a/include/linux/soc/airoha/airoha_offload.h
+++ b/include/linux/soc/airoha/airoha_offload.h
@@ -173,6 +173,7 @@ struct airoha_npu {
 		/* protect concurrent npu memory accesses */
 		spinlock_t lock;
 		struct work_struct wdt_work;
+		void *buf; /* mailbox DMA bounce buffer */
 	} cores[NPU_NUM_CORES];
 
 	int irqs[NPU_NUM_IRQ];
-- 
2.55.0


