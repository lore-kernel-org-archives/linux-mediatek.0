Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA65C4742C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:45:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B801A208C7
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:45:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kpoay+wp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="i/S6gd7T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B801A208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3pYXlMDuTZayZXYEnR98sj0lhjsnLlQ4GaYHOqB+S2U=; b=Kpoay+wpqA85nYSOvoc/Xgmj0
	Mk2RjYU4+Gs+Z4iAi1V4CTmdKqAEqpAv8Omx6CwxcyxSA1G5QaofLvUTa/1pmpmILWnu5dJpJWpw1
	+UuASg7kv4m2wh9eWJM4OngIegq6kd3UsE79n5OMB4/5LnrFVXTXStv6XOnIpWjWcUItQHKAHs+U5
	fV19EosiVp00raJaJwtIoTQqkuUfEhYJe1RLhpUhPj2XF22RCc7WsYabqGCafFn5BYAQrKaUriYl5
	cxK1aMWyT/DmBsFJKW0gA9OcFQJhzM68ub2A+pgfeWFz/Qp6fvndFODh+DnqA80SjHfNE2og5Lq1w
	Q2sVlQG0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kea8R-0004FM-0O; Mon, 16 Nov 2020 08:45:15 +0000
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kea7z-00042U-6H
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 08:44:53 +0000
Received: by mail-qt1-x849.google.com with SMTP id o1so9682638qtp.7
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 00:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=A53CN07MXASBO5jvUKHBpKj9L55WcyFviEc+clg6PhA=;
 b=i/S6gd7Tg9y5CTA6qeQQf0oOlqA9kbS65lJTOiCbv103fuKCJpXUBCIDaWMlvpxWwT
 UY3lrD8Btcvct2pd+Fgy15hCeUxRCDKlebTAJFjM+oeWZ/5eS4fSNUBOoML10d03tGcT
 1l6YL/RDauxZpDKIcpffN45aoc4V2LDp6zK71sZDeDvT0OcCFx6euf6MJXGLlYMqAc2R
 pkqNQWrrKBkURv4OnmYI4nYOwGx7rIgWaecbQbrnkH47bebB3qfbzgGOnXJAOfREIvBw
 dQ7yYlQwG2eVxIpiOzWEAgJUvzZJQPFuOLamobP8hO5Iq1Dde3JThNyDqrMIor+QI2B+
 f6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=A53CN07MXASBO5jvUKHBpKj9L55WcyFviEc+clg6PhA=;
 b=bH52v7rU+EQQbrwnvhrL91fS7Am2PGEle9gVa3zOgKDl73u/ShQ8VIzzlWdQwMbeQH
 lJGqbbx928BdUu6RxGiX8s3iU1mcOxiTg53rkp3dj7+PnjNnfavrYmMeo04DpHSWtGE9
 NSYioEzfDcbdsQ4kphJIkSavbq1YSayfcPXWNVeVqD01LeoT4BOe95tMhQ6i+e26joEU
 W/y91SG+jZ3t5gzfeHUiedakES6l/rT/edFaIxocjORObGrxwailPmE0qXKBnIfla5mG
 7kr1vhhidSsDAoDyUORd10HoVJ0CKBj+RhZFxPG6rr5MTFDFHvnoZkS39Os2iRG6uzLK
 vuvA==
X-Gm-Message-State: AOAM532LlvEzf7WOtmoROSr61wRB4XGB20DozeKn2biDEcn0ZMLOyLdn
 Cz4m64PISEOPaSAwMeOBzINA7he9UWSk
X-Google-Smtp-Source: ABdhPJw38q3RH4TOjkGa40R3bWJx8iEXJezrd8qKsUYOP6fmVJWIttlc3MpvyHhW9eW1ykc9wTiFoTSO8eqZ
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:b648:: with SMTP id
 q8mr14586186qvf.33.1605516282945; Mon, 16 Nov 2020 00:44:42 -0800 (PST)
Date: Mon, 16 Nov 2020 16:44:13 +0800
In-Reply-To: <20201116084413.3312631-1-tzungbi@google.com>
Message-Id: <20201116084413.3312631-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20201116084413.3312631-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 3/3] remoteproc/mediatek: read IPI buffer offset from FW
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_034447_309064_14F8C078 
X-CRM114-Status: GOOD (  16.73  )
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

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_scp.c | 73 ++++++++++++++++++++++++------------
 1 file changed, 49 insertions(+), 24 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 74ed675f61a6..0ea3427cddc6 100644
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
