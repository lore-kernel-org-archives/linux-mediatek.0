Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AA9C5B572
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 09:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=luZ6/X1fUnmPIAGg7u9rfHAcCpIwRBZ6wNZmQs6CnhI=; b=PFW3CfQU0JweCuAIXR+Ea1BqUO
	PWfN2/2+c9ji9jNh4ZhIGuG05KeGLmm88AhJiRe9iZ58kz7s2arhYvBxtYfF9I7oPv7HFqbCTAfLr
	TCG1GIPXnXgZW/dqiWWbUltcwv69s5uTzh63FPQs0Jr4lzoNNRBCKQ8DbOMLRYizIHvQaNPZqcgnP
	X0SHzIevpIype9KBLNgEZCBzuEkBxYpZ4Cq3Vr6iqtN0vFAZnOIIqiH+JVEHK+KXXKqVioRRpezLX
	/R67tlU4XZmRlGJFC6FF76EtGB90Xvx7SNCOvpFNg4qldobhQfnf8gtcgqs+7c7yE2CLXAoKeraa6
	QjB7xsAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtIP-00000005m8A-0vvK;
	Mon, 17 Aug 2026 09:06:17 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtIK-00000005m3P-1rQS
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 09:06:16 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-480033bdcf4so1822655f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 02:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786957570; x=1787562370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=luZ6/X1fUnmPIAGg7u9rfHAcCpIwRBZ6wNZmQs6CnhI=;
        b=Ip1Ud9S8MhhCovqAhdNEJFh++pNSlHArG+k0drRnSqKZAnTMuWkWr3VUTS/3kgDkjF
         CaeITAMzO6lTu0ApbNeHkiXaPPB6IRd8GdYO7yKHJbG/zHRog5WgKPXcPdb7LqLQjBns
         /QYrZlpp09qIR2haoDRZLLYjDMJkBy3RxTtvfE5DvWXWouQjeOOgioktjxWgr+5hm+mx
         lItSoTze6yEkyKljJj0ksZTD1yeQktRrFp6obHEE69efp3+X30FEgjD7TpfAFHyq3Wuz
         BBPCt+FsSrmCneHv1vSPKU4SJKZGtsJixspea0dBIi8dcjK8GwRrfUcJlzEp4N3TZGdv
         hSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957570; x=1787562370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=luZ6/X1fUnmPIAGg7u9rfHAcCpIwRBZ6wNZmQs6CnhI=;
        b=UDtbCd/owVzUnip3qtUAHQu7pdcD+adTJqplS8k+P4KCXrD8F33G6LDKzVMkRUpXQ8
         4Rt/7UfxWEM2nmJHM4nZOH/cf4qlmTxoPt4yZvsJbYqLbAF+UiphN/LROVR36BwJdrPq
         wrjiMrBfDvxoVn6osVTdGOTiq/Y7uhVJujoVaLgBfJJGTSAD2CbgxilWJSJnjZFcWnV/
         HWwXwJdvCDn3OP9xtR4AqN7Th/FAvar11TdOF4aoP6yFbHhuOzZPH1wieRtrX3Zvpv3B
         1y8NBV2dDC4K/kcFZXSafnbGsyD1MrfgVvpWLK82QyE/BUdzDnSCmhE58icxLfnXIGlF
         vHig==
X-Forwarded-Encrypted: i=1; AHgh+RoD6r0jTGLw8ruGczt14yelt5eexdHWETjFjLBXkiC4pGonOf7z1m9FVNhMQYsl8iLLpggy6i7zA8Aky5Obtg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8jV26DGsmJ9cFAX6ox8dbPOex/nOW8VmKxb/cZr/oQyLzIvdK
	gTtv4bFmKxaPPbJOe9Dk6xo9G6dFVJSgLIzn6mqYprkwU/fJZ03T+iJ8rd3DEcY7
X-Gm-Gg: AR+sD12+n3QMJKZjRvmUmZ1BZ/wePZq8NZSQ8jpl3TTCpG+6/6LmBQTcV103ZJJn37x
	fFzEbpc5EKwgBoAqRsg0yPdRMe7UAySWhybD8yDG30sgoueChCeXkQLrSKftBBMJf4wkgwqRuqh
	MN2Xvbzy5w2Nd1uDTYhE+o6N82W/ky6jn8KcyzyXScwXcU/hISTqoKN4fi8hFU7kdKsAah0snSu
	ExKjF4QQln/E6wOyxoXZotLpkAg6gGKE5I4jgBZVNFZWMxJEL93INqLUV5WreXsW22vd3qP0uy+
	8tUOqIGUD/AzXT9gU3WU8cSnT+L+kouNLVLO098s6//Nli05isLXzLSNHwy2cR88F3mPQ2z0Zy8
	3S5ZcdC0G3Jna0QtZhFdlI4nXGS1TzOAQwkzwgMgenbllxAKkH+nnOXV0/3uRwwTfWlwdTBMASw
	cerXWPAkFkWyWMMQvIhajdDS9dflHLU1KG/QIWmrd7ijtwp6NkO0+WGh36hv/e2H7mvo5LF5YLX
	v5A+fnCek8PXuWmJqmVt68oOVWw7ctfYXrtO9imE31iSwufmhKUiEI=
X-Received: by 2002:a05:6000:230d:b0:47f:8ce7:8684 with SMTP id ffacd0b85a97d-481607100bdmr40751188f8f.6.1786957568437;
        Mon, 17 Aug 2026 02:06:08 -0700 (PDT)
Received: from fedora ([46.205.219.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b2e9sm2507130f8f.9.2026.08.17.02.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:06:07 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	win847@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH v8] net: airoha: npu: use cacheline-sized buffers for mailbox DMA
Date: Mon, 17 Aug 2026 11:06:01 +0200
Message-ID: <20260817090601.1256389-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_020612_516949_C28EDA82 
X-CRM114-Status: GOOD (  11.18  )
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

Allocate at least SMP_CACHE_BYTES for each mailbox payload and map
ALIGN(len, SMP_CACHE_BYTES) with DMA_BIDIRECTIONAL while programming
the original payload length into the mailbox length register.

Tested on Quantum Fiber / Gemtek W1700K (EN7581 + MT7996), kernel
6.18.44, including two cold reboots and sustained WiFi use.

Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buffer")
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260814110017.2795022-1-pawlik.dan@gmail.com/
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260809152813.585797-1-pawlik.dan@gmail.com/
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260805070851.2885888-1-pawlik.dan@gmail.com/
Assisted-by: Cursor:composer-2
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 25 +++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index b679bed952de..d560b8763753 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -5,6 +5,7 @@
  */

 #include <linux/devcoredump.h>
+#include <linux/dma-mapping.h>
 #include <linux/firmware.h>
 #include <linux/platform_device.h>
 #include <linux/of_net.h>
@@ -160,15 +161,21 @@ struct wlan_mbox_data {
 	DECLARE_FLEX_ARRAY(u8, d);
 };

+static size_t airoha_npu_mbox_size(size_t len)
+{
+	return ALIGN(max(len, SMP_CACHE_BYTES), SMP_CACHE_BYTES);
+}
+
 static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 			       void *p, int size)
 {
 	u16 core = 0; /* FIXME */
 	u32 val, offset = core << 4;
 	dma_addr_t dma_addr;
+	size_t map_len = airoha_npu_mbox_size(size);
 	int ret;

-	dma_addr = dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
+	dma_addr = dma_map_single(npu->dev, p, map_len, DMA_BIDIRECTIONAL);
 	ret = dma_mapping_error(npu->dev, dma_addr);
 	if (ret)
 		return ret;
@@ -191,7 +198,7 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,

 	spin_unlock_bh(&npu->cores[core].lock);

-	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
+	dma_unmap_single(npu->dev, dma_addr, map_len, DMA_BIDIRECTIONAL);

 	return ret;
 }
@@ -333,7 +340,7 @@ static int airoha_npu_ppe_init(struct airoha_npu *npu)
 	struct ppe_mbox_data *ppe_data;
 	int err;

-	ppe_data = kzalloc_obj(*ppe_data);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_KERNEL);
 	if (!ppe_data)
 		return -ENOMEM;

@@ -354,7 +361,7 @@ static int airoha_npu_ppe_deinit(struct airoha_npu *npu)
 	struct ppe_mbox_data *ppe_data;
 	int err;

-	ppe_data = kzalloc_obj(*ppe_data);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_KERNEL);
 	if (!ppe_data)
 		return -ENOMEM;

@@ -375,7 +382,7 @@ static int airoha_npu_ppe_flush_sram_entries(struct airoha_npu *npu,
 	struct ppe_mbox_data *ppe_data;
 	int err;

-	ppe_data = kzalloc_obj(*ppe_data);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_KERNEL);
 	if (!ppe_data)
 		return -ENOMEM;

@@ -399,7 +406,7 @@ static int airoha_npu_foe_commit_entry(struct airoha_npu *npu,
 	struct ppe_mbox_data *ppe_data;
 	int err;

-	ppe_data = kzalloc_obj(*ppe_data, GFP_ATOMIC);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_ATOMIC);
 	if (!ppe_data)
 		return -ENOMEM;

@@ -434,7 +441,7 @@ static int airoha_npu_ppe_stats_setup(struct airoha_npu *npu,
 	int err, size = num_stats_entries * sizeof(*npu->stats);
 	struct ppe_mbox_data *ppe_data;

-	ppe_data = kzalloc_obj(*ppe_data, GFP_ATOMIC);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_ATOMIC);
 	if (!ppe_data)
 		return -ENOMEM;

@@ -466,7 +473,7 @@ static int airoha_npu_wlan_msg_send(struct airoha_npu *npu, int ifindex,
 	int err, len;

 	len = sizeof(*wlan_data) + data_len;
-	wlan_data = kzalloc(len, gfp);
+	wlan_data = kzalloc(airoha_npu_mbox_size(len), gfp);
 	if (!wlan_data)
 		return -ENOMEM;

@@ -489,7 +496,7 @@ static int airoha_npu_wlan_msg_get(struct airoha_npu *npu, int ifindex,
 	int err, len;

 	len = sizeof(*wlan_data) + data_len;
-	wlan_data = kzalloc(len, gfp);
+	wlan_data = kzalloc(airoha_npu_mbox_size(len), gfp);
 	if (!wlan_data)
 		return -ENOMEM;

--
2.55.0


