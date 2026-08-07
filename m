Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C13C5AC7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 06:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cfbg4OKMiHxX0/fCplY4WZEaCh6mteG/jz44Jr9wKjY=; b=DThrwP4kxKCmiav0N2BP6j3o10
	X7prTBHGUQwPZ3LZWMYS/alfIEXN+hXkspGRBEC9C3ovdynHHap+C619DPZmmd+f9tYgIIRa9KTbc
	xQPUptW+7eGOMsKBlILj01KaemwMT5l8KZpo6cFFsXMlBpyGL/ohwP65O8q/HgHMIO0AmFv4ZhhGF
	Xf17OxpJG9f65y6RnQZiWLactdYXR0IvVgvOnlu6Ygww99P9JfI0KnHNHZJnYWQUinQ3wb+v2bWhs
	9GkeWMhtgy59Nkn7tOIw8B+50OZ3+PcsjIoDY4RG4DIJWAoBCTHWnhnZbEWtCWTEvxlRKvsu1v+Gw
	KJ9gznhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEGZ-00000007BbK-2KFk;
	Fri, 07 Aug 2026 06:41:15 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEGW-00000007BaX-2S6g
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 06:41:14 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2792327f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 23:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786084870; x=1786689670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cfbg4OKMiHxX0/fCplY4WZEaCh6mteG/jz44Jr9wKjY=;
        b=qAOLZQQ4y2BnXYdTkSucz9dXvpjcmqSEQ536GIU5w6KBvVvke2i8+TK7pVSnJhaN+i
         H3kP/JCA/iVEHnPBwQraVqJfOwpW0sKrl5LSRkfr70vf106YO9J69qFX9ygmCDr3Xd25
         9PtayQuzus47EO0XkF9PXpF7gu+k6h89C8MZzeg8Rjo/grpAO5mzngGG912aqZBiyTpo
         /MCr6aK+NuEoZ++lcGcd+uJ2iIkWNY2c6PkGNYrl7mKc88ZpPFt33sR8FhmNDTpc9JhK
         DiiN7Peb0NfWbU7b1No066mDyOkQHygz1m7a6eIriDZQf/+e1v+KBaXkxZy74O/du/xK
         HIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786084870; x=1786689670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cfbg4OKMiHxX0/fCplY4WZEaCh6mteG/jz44Jr9wKjY=;
        b=oOQC33ChvqNj0MnWAdkurpVy3Sy2BQLhj39XSz+CoaBK/SCei5y1ftkep2pCip97Ae
         rm5Hq1etfQFDEEkSIkE+rWoMVhd7WuGUsfl+h+wc/agg2Em0eZvg1NxkZ40piVhD5s9D
         A0x/dpQr41cN/Zv0gWd+Xi5awjfq+cGYxvUKDGheZQkjO1hSIViebxcCQICqZKh/XoLc
         nSlxHT6448Of5Mse+QYD0jgwzjuj/chaT+VP6aFwRv6Qm4AzVwWdji+1B7BInF17widd
         y8wjDzshL3sRYhDX6k1PXKexASxwRW3/fNx0B7FJ3siaXDeio1iWBEoW6WwoSF6q+xMM
         O9gQ==
X-Forwarded-Encrypted: i=1; AHgh+RrOmD4Vn81/0q2aCn9Rqi1MQfETwKbQGE7YITADT0FeDBRFqwaXLE6vYLHC/O7KVmk037z0SbvJWAwEbw8omg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTiI+kHRmpmHMy1HaTuqvxBVtoudee02X8+eK9rD8ZhQZY/c/P
	Cn3fKDDJeSSewDvYebjg/o10qNwEeK3GxO/qPKtEKCqyX5ymsIgzWNYg
X-Gm-Gg: AR+sD12OC70QMRWpSEbmC0QoybePiscWOuSj7fcT776J7SlY5dYTI7wnimCf3YxkiYx
	f2XFyU4XNG3s7IAIK7xk2R1RXXm6POZAYLFt/wMxBYO1/l+YZ4OuqItOrOalTkAu4HFhLy/B2oC
	XY/3o5wTIN5E70qE66Xu3zHm/OuY48Ep2HIU1EEkMSWx+7ZTJvg941PvIO4O5nry+NAx5Rbi1DT
	vWajcGGhhKX1/59QbPyz1dGkjm3w2iQ4zWGrWGHMEPSMJWyuA6kYNF5rtAs9PN4lFKTWil+IqK9
	TQ4NAV+vqnCcLBJdurEsliZwuOIy317sUhUK+WMR1NN2drhgKqRmQQHD0AAP32dtf7pB6rjFibC
	VxjD05/hP8uiWp3XtT4mRnkyvYlmiuDDZShaqgd0cKj1aekhb1lFNbzHpV+ZpCpFbqIhe9/BRPj
	6a8a15ey5jg+bzrNzXKf+Du8h+C5VdHSVBpcdV7Wemkg00aohYmomO2hc=
X-Received: by 2002:a05:6000:2981:20b0:476:7036:f854 with SMTP id ffacd0b85a97d-47ffd93cfadmr8835774f8f.21.1786084870270;
        Thu, 06 Aug 2026 23:41:10 -0700 (PDT)
Received: from fedora ([46.205.219.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002150804sm2655044f8f.13.2026.08.06.23.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:41:09 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	win847@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH v4] net: airoha: npu: use coherent DMA for mailbox messages
Date: Fri,  7 Aug 2026 08:40:58 +0200
Message-ID: <20260807064058.1117747-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_234112_664237_190F74F5 
X-CRM114-Status: GOOD (  20.50  )
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

Introduce __airoha_npu_send_msg() with an optional reply pointer so GET
callers can copy the trailing response payload once. Keep
airoha_npu_send_msg() as a thin wrapper for SET paths.

Verified on Quantum Fiber / Gemtek W1700K (EN7581 + MT7996).

Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buffer")
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260805070851.2885888-1-pawlik.dan@gmail.com/
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260806072601.1815487-1-pawlik.dan@gmail.com/
Assisted-by: Cursor:composer-2
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
v4:
- drop rsp_off; copy trailing reply_len bytes into reply pointer
- split __airoha_npu_send_msg() + thin airoha_npu_send_msg() wrapper
  so SET callers stay unchanged
- fix reverse-christmas-tree local variable ordering
- constify data argument; clarify reply copy comment

v3:
- move coherent mailbox buffer into struct airoha_npu_core (buf/addr)
- allocate one buffer per core at probe
- add optional reply buffer to avoid the extra copy in
  airoha_npu_wlan_msg_get()
- document AIROHA_NPU_MBOX_SIZE vs ppe_mbox_data / WLAN payloads

v2:
- allocate one coherent mailbox buffer at probe and reuse it under the
  per-core lock instead of per-message dma_alloc_coherent(GFP_ATOMIC)

 drivers/net/ethernet/airoha/airoha_npu.c  | 70 +++++++++++++++++------
 include/linux/soc/airoha/airoha_offload.h |  3 +
 2 files changed, 54 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index b679bed952de..74da3c4d06e4 100644
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
 
@@ -160,23 +166,32 @@ struct wlan_mbox_data {
 	DECLARE_FLEX_ARRAY(u8, d);
 };
 
-static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
-			       void *p, int size)
+static int __airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
+				 const void *data, int len, void *reply,
+				 int reply_len)
 {
-	u16 core = 0; /* FIXME */
-	u32 val, offset = core << 4;
-	dma_addr_t dma_addr;
+	struct airoha_npu_core *c = &npu->cores[0]; /* FIXME: core */
+	u32 val, offset = 0;
 	int ret;
 
-	dma_addr = dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
-	ret = dma_mapping_error(npu->dev, dma_addr);
-	if (ret)
-		return ret;
+	if (len > AIROHA_NPU_MBOX_SIZE ||
+	    (reply && (reply_len < 0 || reply_len > len)))
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
+	memcpy(c->buf, data, len);
 
-	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, dma_addr);
-	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, size);
+	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, c->addr);
+	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, len);
 	regmap_read(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, &val);
 	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, val + 1);
 	val = FIELD_PREP(MBOX_MSG_FUNC_ID, func_id) | MBOX_MSG_WAIT_RSP;
@@ -189,13 +204,21 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 	if (!ret && FIELD_GET(MBOX_MSG_STATUS, val) != NPU_MBOX_SUCCESS)
 		ret = -EINVAL;
 
-	spin_unlock_bh(&npu->cores[core].lock);
+	/* Copy the trailing reply_len bytes of the response. */
+	if (!ret && reply)
+		memcpy(reply, c->buf + len - reply_len, reply_len);
 
-	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
+	spin_unlock_bh(&c->lock);
 
 	return ret;
 }
 
+static inline int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
+				      const void *data, int len)
+{
+	return __airoha_npu_send_msg(npu, func_id, data, len, NULL, 0);
+}
+
 static int airoha_npu_load_firmware(struct device *dev, void __iomem *addr,
 				    const char *fw_name, int fw_max_size)
 {
@@ -442,8 +465,9 @@ static int airoha_npu_ppe_stats_setup(struct airoha_npu *npu,
 	ppe_data->func_id = PPE_FUNC_SET_WAIT_FLOW_STATS_SETUP;
 	ppe_data->stats_info.foe_stats_addr = foe_stats_addr;
 
-	err = airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
-				  sizeof(*ppe_data));
+	err = __airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
+				    sizeof(*ppe_data), ppe_data,
+				    sizeof(*ppe_data));
 	if (err)
 		goto out;
 
@@ -497,9 +521,8 @@ static int airoha_npu_wlan_msg_get(struct airoha_npu *npu, int ifindex,
 	wlan_data->func_type = NPU_OP_GET;
 	wlan_data->func_id = func_id;
 
-	err = airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len);
-	if (!err)
-		memcpy(data, wlan_data->d, data_len);
+	err = __airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len,
+				    data, data_len);
 	kfree(wlan_data);
 
 	return err;
@@ -770,6 +793,15 @@ static int airoha_npu_probe(struct platform_device *pdev)
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


