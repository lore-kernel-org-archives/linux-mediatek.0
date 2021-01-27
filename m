Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF80FC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 08:32:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 501292073C
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 08:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 501292073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6/h2QBqzNZjRII9BkKTZIyWSxXOr6bvOkN6wCk5IE1A=; b=1TEuKwRegwHSKzfMKM6z92RJr
	x6mVr+ydlSuKkbKCQ6IXoBRgJeXdTM5VMp0UEDqwXBgAqBsWXZ1K36NEFlipsxqqNvROpVL/a0iwS
	KpS2MkGDYuueNFxbUbSEZJpouIY0Dvs1Q7eePCpDJ75XffSfqlTypwSreEZV2GYrp6uuYAhl5mNhs
	8U3joYqHtTonc6akVswWr1q7dwgDapkb8reCgUgB8UXx3xdxi9bZOvLqW3R96PV8GYCuV9xNxgM92
	5NeHATwWLcZ4j4uenF7O3qnP3Hd5yjmPhgyGYRP1TsE66qe6aK7NnV1FYqodCWPMsPY+kgqeQPjCS
	V2JUNna5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4gFp-0005r4-Sl; Wed, 27 Jan 2021 08:32:45 +0000
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4gFo-0005ps-C5
 for linux-mediatek@lists.infradead.org; Wed, 27 Jan 2021 08:32:45 +0000
Received: by mail-qk1-x749.google.com with SMTP id d194so941760qke.3
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Jan 2021 00:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=RaHwNMHy6Q38UiSowCFhrFgySXI51I5XcIPwGHCFzHA=;
 b=gt9CAJsB4pywidn35l9GS7kegoCleTTUcDZQcAThNVCvSLsL96zDlM02lHQsGfKQ4c
 nsHoKonjbw5h9LIEPq4EboL2a1/SsfYSAUu/BUE/cwZnBWXda+GTE9VNTxAl1MQ9ztOQ
 6gc8/U7UN3d21+aj9xiGZGioe1yftTZmpYLKQN9YWg+z/TRqfPjgCc+2macCjkKVx28A
 qHAjRc8Qs0f8MmcSNqAu9+fZnYQ5UW0EQT8ibFMEem5CnFSMe5v62wxmy9417Kk0613z
 8zigCiHr9ge6GEe+D6moVsmhYHXFMeVM4b0IJnK/ECA6/6A/j6higCoRvB91xZxYNpkB
 lwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=RaHwNMHy6Q38UiSowCFhrFgySXI51I5XcIPwGHCFzHA=;
 b=b7Rr4ZPkAoLApihJiRbloQX9mzNbeeFzxb7qHUjKouUY52xJ9AF89NUG8zrrGIftoB
 ZAiLfJ7RI9Ik6r3d6nlPkCGXP0stF1eRdDMLNYyZ5e2kB2Cidexg7knjZ2usIFrAuG6L
 x0Rdey4tBguJnG0axHh9+pJVq77CXaqEUV6xpTwLs1IsbO0ggJdhvL781vYSjOWqBAPa
 dtD4xgJoWSGeUnmqp3GPVTtzznMyjUVYcZY8nAXYK0vUqTQbcAh2+0pXekaGJx9iTbPp
 7ECQn9xna2npDJBUIykst4A6WitrzB0F2zaRgyUmAorEPbgvsQKcpizIxhrKKdv621o+
 y6/A==
X-Gm-Message-State: AOAM531yYblls1+YH6n1xOscHTKMxXE5At3u9U5L02RrtxNftUuvGgIx
 N9LSWKPN/eS745EiJnNGNl1jacyFQhMs
X-Google-Smtp-Source: ABdhPJxPwHBmIFY24IEnCMNSrpm1zBwNilXq7JcimT+k2/ombKudG+h8PD0tqcATpEqofEfIQ5a7TWoIaljj
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:d17d:c7bb:69a2:7e2f])
 (user=tzungbi job=sendgmr) by 2002:ad4:4cd0:: with SMTP id
 i16mr2727580qvz.49.1611736360511; Wed, 27 Jan 2021 00:32:40 -0800 (PST)
Date: Wed, 27 Jan 2021 16:31:36 +0800
In-Reply-To: <20210127083136.3745652-1-tzungbi@google.com>
Message-Id: <20210127083136.3745652-5-tzungbi@google.com>
Mime-Version: 1.0
References: <20210127083136.3745652-1-tzungbi@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH v3 4/4] remoteproc/mediatek: support L1TCM
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_033244_417871_2DB0840E 
X-CRM114-Status: GOOD (  17.50  )
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
Cc: devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
 linux-remoteproc@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

L1TCM is a high performance memory region in MT8192 SCP.

Reads L1TCM memory region from DTS to determine if the machine supports.
Loads L1TCM memory region to SCP sys if the firmware provides.

Starts from MT8192 SCP, the firmware contains physical addresses for
each memory region, for instance:

Program Headers:
  Type   Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
  LOAD   0xXXXXXX 0xXXXXXXXX 0x10500000 0xXXXXX 0xXXXXX XXX 0xXXXX
  LOAD   0xXXXXXX 0xXXXXXXXX 0x10700000 0xXXXXX 0xXXXXX XXX 0xXXXX
  LOAD   0xXXXXXX 0xXXXXXXXX 0x50000000 0xXXXXX 0xXXXXX XXX 0xXXXX

Kernel driver can use the "PhysAddr" (i.e. da in the da_to_va callbacks)
to know the ELF segment belongs to which region.

To backward compatible to MT8183 SCP, separates the da_to_va callbacks
for new and legacy version.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_common.h |  5 +++
 drivers/remoteproc/mtk_scp.c    | 56 +++++++++++++++++++++++++++++++--
 2 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 204691138677..61901f5efa05 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -77,6 +77,7 @@ struct mtk_scp_of_data {
 	void (*scp_reset_assert)(struct mtk_scp *scp);
 	void (*scp_reset_deassert)(struct mtk_scp *scp);
 	void (*scp_stop)(struct mtk_scp *scp);
+	void *(*scp_da_to_va)(struct mtk_scp *scp, u64 da, size_t len);
 
 	u32 host_to_scp_reg;
 	u32 host_to_scp_int_bit;
@@ -91,6 +92,10 @@ struct mtk_scp {
 	void __iomem *reg_base;
 	void __iomem *sram_base;
 	size_t sram_size;
+	phys_addr_t sram_phys;
+	void __iomem *l1tcm_base;
+	size_t l1tcm_size;
+	phys_addr_t l1tcm_phys;
 
 	const struct mtk_scp_of_data *data;
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 05b157689121..ce727598c41c 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -463,9 +463,8 @@ static int scp_start(struct rproc *rproc)
 	return ret;
 }
 
-static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *mt8183_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
 {
-	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
 	int offset;
 
 	if (da < scp->sram_size) {
@@ -481,6 +480,42 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
 	return NULL;
 }
 
+static void *mt8192_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
+{
+	int offset;
+
+	if (da >= scp->sram_phys &&
+	    (da + len) <= scp->sram_phys + scp->sram_size) {
+		offset = da - scp->sram_phys;
+		return (void __force *)scp->sram_base + offset;
+	}
+
+	/* optional memory region */
+	if (scp->l1tcm_size &&
+	    da >= scp->l1tcm_phys &&
+	    (da + len) <= scp->l1tcm_phys + scp->l1tcm_size) {
+		offset = da - scp->l1tcm_phys;
+		return (void __force *)scp->l1tcm_base + offset;
+	}
+
+	/* optional memory region */
+	if (scp->dram_size &&
+	    da >= scp->dma_addr &&
+	    (da + len) <= scp->dma_addr + scp->dram_size) {
+		offset = da - scp->dma_addr;
+		return scp->cpu_addr + offset;
+	}
+
+	return NULL;
+}
+
+static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
+{
+	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
+
+	return scp->data->scp_da_to_va(scp, da, len);
+}
+
 static void mt8183_scp_stop(struct mtk_scp *scp)
 {
 	/* Disable SCP watchdog */
@@ -719,6 +754,21 @@ static int scp_probe(struct platform_device *pdev)
 		goto free_rproc;
 	}
 	scp->sram_size = resource_size(res);
+	scp->sram_phys = res->start;
+
+	/* l1tcm is an optional memory region */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
+	scp->l1tcm_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR((__force void *)scp->l1tcm_base)) {
+		ret = PTR_ERR((__force void *)scp->l1tcm_base);
+		if (ret != -EINVAL) {
+			dev_err(dev, "Failed to map l1tcm memory\n");
+			goto free_rproc;
+		}
+	} else {
+		scp->l1tcm_size = resource_size(res);
+		scp->l1tcm_phys = res->start;
+	}
 
 	mutex_init(&scp->send_lock);
 	for (i = 0; i < SCP_IPI_MAX; i++)
@@ -807,6 +857,7 @@ static const struct mtk_scp_of_data mt8183_of_data = {
 	.scp_reset_assert = mt8183_scp_reset_assert,
 	.scp_reset_deassert = mt8183_scp_reset_deassert,
 	.scp_stop = mt8183_scp_stop,
+	.scp_da_to_va = mt8183_scp_da_to_va,
 	.host_to_scp_reg = MT8183_HOST_TO_SCP,
 	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
 	.ipi_buf_offset = 0x7bdb0,
@@ -818,6 +869,7 @@ static const struct mtk_scp_of_data mt8192_of_data = {
 	.scp_reset_assert = mt8192_scp_reset_assert,
 	.scp_reset_deassert = mt8192_scp_reset_deassert,
 	.scp_stop = mt8192_scp_stop,
+	.scp_da_to_va = mt8192_scp_da_to_va,
 	.host_to_scp_reg = MT8192_GIPC_IN_SET,
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
 };
-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
