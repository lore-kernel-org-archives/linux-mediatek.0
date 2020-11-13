Return-Path: <SRS0=9UGu=ET=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A8FC55ABD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 07:02:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A563120B80
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 07:02:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h4wkHlzW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="kvbaWn8T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A563120B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GWbhq1m25hnGBgawN5Iqeu2YX9q0oCOSEBZ/KuLzmlA=; b=h4wkHlzWdip4oq49Y53LlQ9NE
	XenSoaxg5nWDbhuMv+PZzqCmZpxozOtCvUAPlqTDI0A+VItpH5FEE7CVoxfkSoZVDiPg7HfoI+KF2
	AYNrxcBz0HrAPz6+HWpHtjoFmUOHoIwhYx6f27JiGijYr1FMpX+PSGreBU/lUUvMrWYDjabcb0eJ8
	DMVjWP7+91wAUcxrlrinrCFBMHPH3bJr1euFzwjrLgtYZjNTXPQCX0lJobj8O0ROQLv0sHye7Bf3d
	ldhxD4rwc9FDXLQ6wnaqgRTaT1h1JN+tn02e/FByEakrspGK4ROuu6Q7xqIy3TVUHm/csRu8l++Cp
	c8WdY4Abg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdT6Y-00025W-Ag; Fri, 13 Nov 2020 07:02:42 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdT6N-000220-R4
 for linux-mediatek@lists.infradead.org; Fri, 13 Nov 2020 07:02:33 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id w8so9400522ybj.14
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2020 23:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=KvPsPLQiA3J/ICPhBCOBZKmQ9l/RY+N6rBWXD1vxO1k=;
 b=kvbaWn8T7Am7Uf08B5wsbwLdCAihTEC//+EKBw9cvtRXjqWFW87Ncth52qdSjQv0yE
 To9eSNI/KOIubMc/Wf/EsHlvBEtna19kH9uycdn6S8UkDgpyNxPZdi6TogksY5gEIKxg
 jKCbnD5sRKDDZWqYkkejxloJNsgijndMvrEnTPbBCvHEW92vi/TO8vJ3Gwt5geZFd6ql
 Y5xF1lyT2YovN1uv4tC7NTYiAbdZrDSSIwRzIjL5Mk0tf8fq1jwtCdCp2/hOmLmmMc+t
 fmuwiZEgnBKXZOVVm1w6sC3Oo0pEEEPTlu7cruopHjmwtws656tpdhOOpWrTBXvKbPd3
 weCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=KvPsPLQiA3J/ICPhBCOBZKmQ9l/RY+N6rBWXD1vxO1k=;
 b=sk85HzdyVzGtRJ47odai2TRjOhh2eH8DQHFil+Sr9UN3uoHxavWp+qSIkTk5IEiYLP
 S09bZo2Rwjp3LkwEAt9MYRIWomkAozRb1Wx1kDUjCeNkGJoi9UB2p4UiY7mdUPrIcxIr
 kz9xrEyvfOkAFLImKCmpgm1Ja8rgCG/YxBO5XO4ZyTKCfTtDQiepctdYhN9+3kbnxCgn
 Yu6ZxQNNZ2u1tbzeDlcilMuTHgXUaJjG5+A68xNm8C1a+Ymr5qRT2INb1VhJOUuew9P9
 0y/IS9Snqb7YdMgXirmAS4dNRICciWQ+1vP21QZVUrO7iEeWFE02B6sdBM55Bp2QAFY0
 iGeg==
X-Gm-Message-State: AOAM533Xx8yjToQKwo9BcjaIcJef26na75RslyDL/vgw/7tFDfDBW2Dh
 z/ZblvWgvglJLeo4Xr9Eny612cHjixgp
X-Google-Smtp-Source: ABdhPJwbbPEv9MHXFOI3knNNSs9fzqwySa2PCJnM6BXBhbtes93vbVSN29Gi68W+LJeiRCUWteeU/M8sx3p/
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:9d08:: with SMTP id
 i8mr995320ybp.2.1605250948538; Thu, 12 Nov 2020 23:02:28 -0800 (PST)
Date: Fri, 13 Nov 2020 15:02:07 +0800
In-Reply-To: <20201113070207.836613-1-tzungbi@google.com>
Message-Id: <20201113070207.836613-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20201113070207.836613-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH 3/3] remoteproc/mediatek: read IPI buffer offset from FW
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_020231_934195_4ABDF73F 
X-CRM114-Status: GOOD (  16.67  )
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
Cc: linux-remoteproc@vger.kernel.org, tzungbi@google.com,
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
specific mtk_scp_of_data.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_scp.c | 73 ++++++++++++++++++++++++------------
 1 file changed, 49 insertions(+), 24 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 60ba4cece074..80ab5a30ea47 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -21,7 +21,7 @@
 #include "remoteproc_internal.h"
 
 #define MAX_CODE_SIZE 0x500000
-#define SCP_FW_END 0x7C000
+#define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
 
 /**
  * scp_get() - get a reference to SCP.
@@ -119,16 +119,24 @@ static void scp_ipi_handler(struct mtk_scp *scp)
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
+	ret = scp_elf_read_ipi_buf_addr(scp, fw, &offset);
+	if (ret)
+		return ret;
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
 
@@ -271,6 +279,32 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
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
@@ -350,11 +384,15 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
 
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
 
@@ -680,19 +718,6 @@ static int scp_probe(struct platform_device *pdev)
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
-- 
2.29.2.299.gdc1121823c-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
