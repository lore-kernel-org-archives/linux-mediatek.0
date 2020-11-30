Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAEB1C63777
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 03:41:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C90C206F9
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 03:41:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qsPFKJrz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="XXL3FNIC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C90C206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4Xd7JXQJwORe2kQwvdilMziKdYuc9AqGPeu95gjT5aE=; b=qsPFKJrzOmLGY5AtMxJnJzPxlr
	G5P07jwFQrgUXMtPSx/FktAAWbGwQXDYCCukLWc1ynLsBKMMyrknppuSN04gz2QS9vP0Cyn8OCT2J
	UsCzcSQlnEAcHgNX/jgjI/heZqsx8Yn3uWGmSZsqqqGQB9znVueoXZxWgKRfiiNNdfo8mO/z19kH3
	Txj9xHyDFml1s9oXBM8AUZWcGrj5Rq/C07WVW/td9E1SeNBa7E7l62fk+gn2YoohPhLE5FIROmuOS
	Lq/cFC5rLKfFoS71kOpVHaafNk64FrkhWwDC7OrprqM2aBtnsgdWLVuGlgy3vhvOWHCbXQmZk1KEw
	6LHPG7tA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kja3s-0003fO-M3; Mon, 30 Nov 2020 03:41:12 +0000
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kja3n-0003eZ-7R
 for linux-mediatek@lists.infradead.org; Mon, 30 Nov 2020 03:41:08 +0000
Received: by mail-qt1-x849.google.com with SMTP id z8so7418782qti.17
 for <linux-mediatek@lists.infradead.org>; Sun, 29 Nov 2020 19:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=t4fLql8tHd4V6/duVaePgm5PJmh4ozJmqo/1RhL4xGg=;
 b=XXL3FNICF2bqY+E2EHD6AsEA4IYfCpwH3ahZ+bN6j+oa6zGAlbkOYcdp307p3GUqrI
 7gNpgG673E83FtFtvXipraoEZNZ/4bdne+USRpbH8E1fS3zhZ4BePyvk+S8WVH89KADo
 TDIKsLoCtBW5ZlWvGshTag+LpzJaseYKVQl67W34dDckd5Z/ZoICEED4bDas/IahxiXG
 P3BQ5X1+TbxcPBBqv8bSvFL6Wyp+brzu42SSu9f0qS7mXOxS+Qtg7L1Ug3A4vx7qTHNF
 qGvHirvpMYGyOON8PbVmACrtwj7BK6IT8mj/M9r9rr+NaJQUeWWtK1BC0nAJpGkSz/2F
 xdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=t4fLql8tHd4V6/duVaePgm5PJmh4ozJmqo/1RhL4xGg=;
 b=SLOT1saB5coVaW2dNlgym6KMKINydbJdsvZSkafVXKEuad08Ka3SuxCC4iNWBlCziH
 OSFV6M0JUpLu4mFHbwJCUm/P3AYKy8zEAfq1fJe+n/WmscUUHfHDtlP9XPWG7/dPgqrG
 FLHHWvwZg3eiwUW8I/NdmH4bDb16o22pCbq0OvJonT3QDi0D9EColsOCgKodAxNx513o
 GMxm4TTuTqy89dwvY+XzS49rRJBd+/PyrJA2/WuvjbyS8sTyPvTjACF7NadKpDtJG3Am
 B1ig+AnP8TrFN5FLz/i7IkMHs4QEad12UwDMHPUijbhtjNkJmSg9ElMlV0lSWGpracER
 hWIg==
X-Gm-Message-State: AOAM5307c6pTaQJedGXYCaIwjS2xzj+QhpNdm4iS1TTjfk36o1ZnM6fQ
 64ikP6ytGwHbm60OV4L5fSVXBppPCDzx
X-Google-Smtp-Source: ABdhPJzvyraEkqM9bHTK1/LSmVjZLGK8+8tAtjJxn6YprL1w9Tg9R3zqfenk+hqQYXecu1mOIE6E2Znj5K3Q
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:190f:: with SMTP id
 er15mr18369153qvb.33.1606707662553; Sun, 29 Nov 2020 19:41:02 -0800 (PST)
Date: Mon, 30 Nov 2020 11:40:25 +0800
Message-Id: <20201130034025.3232229-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v3] remoteproc/mediatek: read IPI buffer offset from FW
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_224107_327778_AD7BC630 
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
Cc: mathieu.poirier@linaro.org, erin.lo@mediatek.com,
 linux-remoteproc@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, pihsun@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Reads the IPI buffer offset from the FW binary.  The information resides
in addr of .ipi_buffer section.

Moves scp_ipi_init() to scp_load() phase.  The IPI buffer can be
initialized only if the offset is clear.

To backward compatible to MT8183 SCP, specify the offset in the board
specific mtk_scp_of_data.  Reads the default offset if the firmware
doesn't have it.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Previous discussion:
https://patchwork.kernel.org/project/linux-remoteproc/patch/20201127092941.1646260-1-tzungbi@google.com/

Changes from v2:
- to backward-compatible, reads the default offset if the firmware doesn't
  have it

 drivers/remoteproc/mtk_common.h |  2 +
 drivers/remoteproc/mtk_scp.c    | 79 +++++++++++++++++++++++----------
 2 files changed, 57 insertions(+), 24 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index b3397d327786..5169ddce2dc7 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -78,6 +78,8 @@ struct mtk_scp_of_data {
 
 	u32 host_to_scp_reg;
 	u32 host_to_scp_int_bit;
+
+	size_t ipi_buf_offset;
 };
 
 struct mtk_scp {
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 5f42b9ce7185..5392c2fff682 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -21,7 +21,7 @@
 #include "remoteproc_internal.h"
 
 #define MAX_CODE_SIZE 0x500000
-#define SCP_FW_END 0x7C000
+#define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
 
 /**
  * scp_get() - get a reference to SCP.
@@ -119,16 +119,29 @@ static void scp_ipi_handler(struct mtk_scp *scp)
 	wake_up(&scp->ack_wq);
 }
 
-static int scp_ipi_init(struct mtk_scp *scp)
+static int scp_elf_read_ipi_buf_addr(struct mtk_scp *scp,
+				     const struct firmware *fw,
+				     size_t *offset);
+
+static int scp_ipi_init(struct mtk_scp *scp, const struct firmware *fw)
 {
-	size_t send_offset = SCP_FW_END - sizeof(struct mtk_share_obj);
-	size_t recv_offset = send_offset - sizeof(struct mtk_share_obj);
+	int ret;
+	size_t offset;
+
+	/* read the ipi buf addr from FW itself first */
+	ret = scp_elf_read_ipi_buf_addr(scp, fw, &offset);
+	if (ret) {
+		/* use default ipi buf addr if the FW doesn't have it */
+		offset = scp->data->ipi_buf_offset;
+		if (!offset)
+			return ret;
+	}
+	dev_info(scp->dev, "IPI buf addr %#010zx\n", offset);
 
-	/* shared buffer initialization */
-	scp->recv_buf =
-		(struct mtk_share_obj __iomem *)(scp->sram_base + recv_offset);
-	scp->send_buf =
-		(struct mtk_share_obj __iomem *)(scp->sram_base + send_offset);
+	scp->recv_buf = (struct mtk_share_obj __iomem *)
+			(scp->sram_base + offset);
+	scp->send_buf = (struct mtk_share_obj __iomem *)
+			(scp->sram_base + offset + sizeof(*scp->recv_buf));
 	memset_io(scp->recv_buf, 0, sizeof(*scp->recv_buf));
 	memset_io(scp->send_buf, 0, sizeof(*scp->send_buf));
 
@@ -271,6 +284,32 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
+static int scp_elf_read_ipi_buf_addr(struct mtk_scp *scp,
+				     const struct firmware *fw,
+				     size_t *offset)
+{
+	struct elf32_hdr *ehdr;
+	struct elf32_shdr *shdr, *shdr_strtab;
+	int i;
+	const u8 *elf_data = fw->data;
+	const char *strtab;
+
+	ehdr = (struct elf32_hdr *)elf_data;
+	shdr = (struct elf32_shdr *)(elf_data + ehdr->e_shoff);
+	shdr_strtab = shdr + ehdr->e_shstrndx;
+	strtab = (const char *)(elf_data + shdr_strtab->sh_offset);
+
+	for (i = 0; i < ehdr->e_shnum; i++, shdr++) {
+		if (strcmp(strtab + shdr->sh_name,
+			   SECTION_NAME_IPI_BUFFER) == 0) {
+			*offset = shdr->sh_addr;
+			return 0;
+		}
+	}
+
+	return -ENOENT;
+}
+
 static int mt8183_scp_before_load(struct mtk_scp *scp)
 {
 	/* Clear SCP to host interrupt */
@@ -350,11 +389,15 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
 
 	ret = scp->data->scp_before_load(scp);
 	if (ret < 0)
-		return ret;
+		goto leave;
 
 	ret = scp_elf_load_segments(rproc, fw);
-	clk_disable_unprepare(scp->clk);
+	if (ret)
+		goto leave;
 
+	ret = scp_ipi_init(scp, fw);
+leave:
+	clk_disable_unprepare(scp->clk);
 	return ret;
 }
 
@@ -680,19 +723,6 @@ static int scp_probe(struct platform_device *pdev)
 		goto release_dev_mem;
 	}
 
-	ret = clk_prepare_enable(scp->clk);
-	if (ret) {
-		dev_err(dev, "failed to enable clocks\n");
-		goto release_dev_mem;
-	}
-
-	ret = scp_ipi_init(scp);
-	clk_disable_unprepare(scp->clk);
-	if (ret) {
-		dev_err(dev, "Failed to init ipi\n");
-		goto release_dev_mem;
-	}
-
 	/* register SCP initialization IPI */
 	ret = scp_ipi_register(scp, SCP_IPI_INIT, scp_init_ipi_handler, scp);
 	if (ret) {
@@ -760,6 +790,7 @@ static const struct mtk_scp_of_data mt8183_of_data = {
 	.scp_stop = mt8183_scp_stop,
 	.host_to_scp_reg = MT8183_HOST_TO_SCP,
 	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
+	.ipi_buf_offset = 0x7bdb0,
 };
 
 static const struct mtk_scp_of_data mt8192_of_data = {
-- 
2.29.2.454.gaff20da3a2-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
