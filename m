Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E345AC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 08:18:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8533123447
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 08:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8533123447
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LEbf1dB/+kdwDiXZl6dG0H6opaQlQGv8645QeeLMTl0=; b=FEOnJSaDQluIpCW8mlKMDdaNd
	nYKnXVu3Br4bXoaZUz8PrUA4uprfjgtt5mdDWZxwOUlUCIMbrFytwMTPJItWsE3BcYhksdGWUqPWE
	FuP0EI4czsZpxletk+k/eVq48b8NdJMLTQH3M1u6oPlH6irNz5iKVe2NKLkNk56seuE/PW8uQmjW3
	65HtqlVb2X7Uzmb3nBg/Huhd5HAvX91BumJJkN899vU0qt6qDRfup6X133mTKnGGv51bSv31LIsfh
	DPCwJCnDOk+H1G9VRdQRoRa15zajw44aQrhX1WZ6JAieJwYBYi62UTO+TO7Cfepy33IMoWlL7NgTj
	R3Phpe/gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxmyQ-0003By-LU; Fri, 08 Jan 2021 08:18:18 +0000
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxmyO-00039d-BQ
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 08:18:17 +0000
Received: by mail-qt1-x849.google.com with SMTP id c14so7759240qtn.5
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Jan 2021 00:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=LPy4kNss0vjaYMzm9yB8ZiYIGPp2YbxLPVEf6yAWf0E=;
 b=svCkAik61y2tqlI8QaAncQGfiqLGdx5ZK5/6jZwHf12GHTZ4tQSTP+82FWBOi0RfRY
 kHHnn5asv2m5TUtnsm/WXAjaf7y6sC8QUobHAXRKLBePbWoFeANyfK4fSDYosMcDQN3q
 fHABjoi4xqsrNzSpz61bjhugyeGHkYg+gxbvjouet+cJsMxu/clNaKRgSaUWSv4Au7nW
 Netk0E+Vw8siXB+M+rQ5K6CWnhaHYi3tdI/64hm9ShUzdauoHMijY/7rtEDf3wBk8yCj
 HyEHrnn1umGjn4zYtKv/ZRXHBTPy7eLsLbsIO/8pfpR4fR/aKzvwk/G7qH49x5i+slcM
 3F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=LPy4kNss0vjaYMzm9yB8ZiYIGPp2YbxLPVEf6yAWf0E=;
 b=aQ+Bk90UCkYNyrtFz3MKe1A/YC25xd3wDQr69OvgvXmSPc3SBO5oFqLAQIgOeybVgD
 jaHcaRMJsqkRSPA26bk2YrgJPUgxzQlU5U5A3TeJ5kI19T6QGl+zRxVarOsPsJMzNyYr
 OGGmCJGku8wgz1g7I43GmyCf5Q976lTndub8yUI1w2Bt8qSFDQmMZmlLz0P8wc7J+Eai
 nCcAcpn22Z/3vuHTenCVJ6DhdJw86ZYrS09TqCYICrvhCDRyzkFVISCDGus6VU+oG8M9
 EP98pKDW9zhq9wZDf1hYpmdqe5+28WikTTbLOx9X1a/d3Rx/+Cc4Sl6mAD5sxU4VtmMa
 6hug==
X-Gm-Message-State: AOAM530vEjPgrzFoGFj0izU2LcHUpF5EsfsgQ3VoaEWCo7SZtvZjuvDD
 Dyy5kZPKzs3lkYYX2vl+AIb5iizaBx71
X-Google-Smtp-Source: ABdhPJwCuBbyszBJxL/WGIggEGfWdYN2ks6dq347se1rJMLcshWX3ZB6Svohs/cFLFVUi1NxZfF6HQDb5DBm
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:8445:: with SMTP id
 l63mr2381601qva.60.1610093887875; Fri, 08 Jan 2021 00:18:07 -0800 (PST)
Date: Fri,  8 Jan 2021 16:17:38 +0800
In-Reply-To: <20210108081738.2175224-1-tzungbi@google.com>
Message-Id: <20210108081738.2175224-5-tzungbi@google.com>
Mime-Version: 1.0
References: <20210108081738.2175224-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v2 4/4] remoteproc/mediatek: support L1TCM
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_031816_424659_CEC68E53 
X-CRM114-Status: GOOD (  17.66  )
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

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v1[1]:
- Uses -EINVAL to determine the memory region isn't specified to make
  the intent more clear.

[1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201214050521.845396-3-tzungbi@google.com/

 drivers/remoteproc/mtk_common.h |  5 +++
 drivers/remoteproc/mtk_scp.c    | 56 +++++++++++++++++++++++++++++++--
 2 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 661c998288d7..5f7cd2336cef 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -76,6 +76,7 @@ struct mtk_scp_of_data {
 	void (*scp_reset_assert)(struct mtk_scp *scp);
 	void (*scp_reset_deassert)(struct mtk_scp *scp);
 	void (*scp_stop)(struct mtk_scp *scp);
+	void *(*scp_da_to_va)(struct mtk_scp *scp, u64 da, size_t len);
 
 	u32 host_to_scp_reg;
 	u32 host_to_scp_int_bit;
@@ -90,6 +91,10 @@ struct mtk_scp {
 	void __iomem *reg_base;
 	void __iomem *sram_base;
 	size_t sram_size;
+	phys_addr_t sram_phys;
+	void __iomem *l1tcm_base;
+	size_t l1tcm_size;
+	phys_addr_t l1tcm_phys;
 
 	const struct mtk_scp_of_data *data;
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index c33c41fe54cd..96ee61bf9245 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -461,9 +461,8 @@ static int scp_start(struct rproc *rproc)
 	return ret;
 }
 
-static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *mt8183_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
 {
-	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
 	int offset;
 
 	if (da < scp->sram_size) {
@@ -479,6 +478,42 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
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
@@ -717,6 +752,21 @@ static int scp_probe(struct platform_device *pdev)
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
@@ -805,6 +855,7 @@ static const struct mtk_scp_of_data mt8183_of_data = {
 	.scp_reset_assert = mt8183_scp_reset_assert,
 	.scp_reset_deassert = mt8183_scp_reset_deassert,
 	.scp_stop = mt8183_scp_stop,
+	.scp_da_to_va = mt8183_scp_da_to_va,
 	.host_to_scp_reg = MT8183_HOST_TO_SCP,
 	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
 	.ipi_buf_offset = 0x7bdb0,
@@ -816,6 +867,7 @@ static const struct mtk_scp_of_data mt8192_of_data = {
 	.scp_reset_assert = mt8192_scp_reset_assert,
 	.scp_reset_deassert = mt8192_scp_reset_deassert,
 	.scp_stop = mt8192_scp_stop,
+	.scp_da_to_va = mt8192_scp_da_to_va,
 	.host_to_scp_reg = MT8192_GIPC_IN_SET,
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
 };
-- 
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
