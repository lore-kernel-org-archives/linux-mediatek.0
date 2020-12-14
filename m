Return-Path: <SRS0=EHBe=FS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D973C4361B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 05:06:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CA112085B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 05:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CA112085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pj5pMH4lhE02UDv99kJvBAoV3MYJy5PE5Ux5Cb8AaPk=; b=q5E0/U6Cu0mY2m7aJmgIYG2XX
	Oyo32NU4x8Ssh9wwqQ1ZwQjD3wgFUr5kAqd1ISbRXQ2iZB+UAbyKL20Q38weJi3gXfUCQvo11p4B5
	7Wd7ceKsgt7zTjEpRiOYwH88tUAlA+DAB217syYtxyFg5fxTc2TSzlgw9wo95txR8+LtXXegRK7Ia
	ocXZMbIM5nhJh995RYuDBhsrS8hnlA49lnRvH/zPorq6b0EuJsBdkzr06FlusQSTXlDtgh4nGzEak
	oeiIrq209brl+6HL9vlFDXlbgzXrw8BW7qVcUM1S5KAnh8EPJ4PgaYDApUY3ZTSwuwklt9hdYVxey
	OWeDPZ3Ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kog3Y-0003jQ-92; Mon, 14 Dec 2020 05:05:56 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kog3W-0003iE-GU
 for linux-mediatek@lists.infradead.org; Mon, 14 Dec 2020 05:05:55 +0000
Received: by mail-yb1-xb49.google.com with SMTP id h75so19478225ybg.18
 for <linux-mediatek@lists.infradead.org>; Sun, 13 Dec 2020 21:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=O8AQ7ej0ikQ65amEV9o8gcBkhCb1EY1FP1shGPZnluE=;
 b=gAlYmzUImi7M03yomHNsSVy3NExu5+4A/Qrw7vRXcVwz//y+DBgdvi57zqhwy5g+Od
 aq5Q688wbUQL/1Wdei7DG/nb58SUqAvCceYqYyyrv0BCqkOLpq/btHVrwq3Ngzz+8em1
 QMKh3ro0T4cLY3VLJ0emN/yQtyaHhx+ClZ/f5GNCqOc7Nth25qSgtlQX7T/3sxBfN8Jr
 HpjD7aFSaU+r3BJA9E9QQdz1R7cw0Jfa2ffcb6WBvdCTJm56ZMexzMTx8HauMpUo7K5a
 VCneyUB+qlM6t6jjqJAk7ri3OZVes/P6eGoKjpcLt+RdUXRat9ej/0HgsIENeM1xj5ja
 PuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=O8AQ7ej0ikQ65amEV9o8gcBkhCb1EY1FP1shGPZnluE=;
 b=GP2qrwXgnxjCFz68N14Iz3UJtxSHGietE26fM6LJRVy++Rr/BcDLYXtFqTtv2auGnq
 a1VapLpCBgPtRzaMGnBNMsPJ3I1HNrt82VG1Kzmt6UYS2a4dBUA1JdGkHFuJa5kNKW9+
 3SD5IyYPTMd5qGF8CAugtaNFPNR3PkowQHg/YNtQMrEiJTnU1AooZFfqqxqOEMcwxBUd
 WjbEblyGOptKOd0/I9aAblHspP4AmNVodsfMiQ7I6PwHrWa/m/I0VNps4O5TeItcakor
 qh+82TteMxR+Lim/gA2Y7zzD553OI6CEryeij4WfikwIyQI0JhF7VeLql2vekZIEU/Ef
 e/PA==
X-Gm-Message-State: AOAM533YrR63IGykq7D3+ACQjvWbLk8W9lshylL7u/eGqWmDO1SQ5Ngf
 MbNDr2eN0caFQeBEOoQP7M4T8wnYgpuV
X-Google-Smtp-Source: ABdhPJzYd4yzUs4s/dbBiPexbPY/mAOMAuQC9Ou4EpN65HOJGafhsgMH0K2WpP+bNPDuHLaSPs8tULOfD93H
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:d92:: with SMTP id
 140mr35243043ybn.101.1607922350995; 
 Sun, 13 Dec 2020 21:05:50 -0800 (PST)
Date: Mon, 14 Dec 2020 13:05:21 +0800
In-Reply-To: <20201214050521.845396-1-tzungbi@google.com>
Message-Id: <20201214050521.845396-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20201214050521.845396-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH 2/2] remoteproc/mediatek: support L1TCM
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_000554_567456_67317067 
X-CRM114-Status: GOOD (  16.61  )
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
Cc: matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, tzungbi@google.com,
 devicetree@vger.kernel.org
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
 drivers/remoteproc/mtk_common.h |  5 +++
 drivers/remoteproc/mtk_scp.c    | 54 +++++++++++++++++++++++++++++++--
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 988edb4977c3..94bc54b224ee 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -75,6 +75,7 @@ struct mtk_scp_of_data {
 	void (*scp_reset_assert)(struct mtk_scp *scp);
 	void (*scp_reset_deassert)(struct mtk_scp *scp);
 	void (*scp_stop)(struct mtk_scp *scp);
+	void *(*scp_da_to_va)(struct mtk_scp *scp, u64 da, size_t len);
 
 	u32 host_to_scp_reg;
 	u32 host_to_scp_int_bit;
@@ -89,6 +90,10 @@ struct mtk_scp {
 	void __iomem *reg_base;
 	void __iomem *sram_base;
 	size_t sram_size;
+	phys_addr_t sram_phys;
+	void __iomem *l1tcm_base;
+	size_t l1tcm_size;
+	phys_addr_t l1tcm_phys;
 
 	const struct mtk_scp_of_data *data;
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e0c235690361..f025aba67abc 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -458,9 +458,8 @@ static int scp_start(struct rproc *rproc)
 	return ret;
 }
 
-static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
+static void *mt8183_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
 {
-	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
 	int offset;
 
 	if (da < scp->sram_size) {
@@ -476,6 +475,42 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
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
@@ -714,6 +749,19 @@ static int scp_probe(struct platform_device *pdev)
 		goto free_rproc;
 	}
 	scp->sram_size = resource_size(res);
+	scp->sram_phys = res->start;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
+	if (res) {
+		scp->l1tcm_base = devm_ioremap_resource(dev, res);
+		if (IS_ERR((__force void *)scp->l1tcm_base)) {
+			dev_err(dev, "Failed to parse and map l1tcm memory\n");
+			ret = PTR_ERR((__force void *)scp->l1tcm_base);
+			goto free_rproc;
+		}
+		scp->l1tcm_size = resource_size(res);
+		scp->l1tcm_phys = res->start;
+	}
 
 	mutex_init(&scp->send_lock);
 	for (i = 0; i < SCP_IPI_MAX; i++)
@@ -803,6 +851,7 @@ static const struct mtk_scp_of_data mt8183_of_data = {
 	.scp_reset_assert = mt8183_scp_reset_assert,
 	.scp_reset_deassert = mt8183_scp_reset_deassert,
 	.scp_stop = mt8183_scp_stop,
+	.scp_da_to_va = mt8183_scp_da_to_va,
 	.host_to_scp_reg = MT8183_HOST_TO_SCP,
 	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
 	.ipi_buf_offset = 0x7bdb0,
@@ -814,6 +863,7 @@ static const struct mtk_scp_of_data mt8192_of_data = {
 	.scp_reset_assert = mt8192_scp_reset_assert,
 	.scp_reset_deassert = mt8192_scp_reset_deassert,
 	.scp_stop = mt8192_scp_stop,
+	.scp_da_to_va = mt8192_scp_da_to_va,
 	.host_to_scp_reg = MT8192_GIPC_IN_SET,
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
 };
-- 
2.29.2.684.gfbc64c5ab5-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
