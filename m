Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C6CC64E7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 09:30:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CD2F206B2
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 09:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nt4TTDao";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="U7SYomBZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CD2F206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XPZ55bq09mI+NmzM2yTZAMDm7HhtrzwFmmK87F2SsAM=; b=Nt4TTDaoHSXY363xhf73jcuu7I
	F6v35szHt1ABBk5bKkFPS1iu3XeF6BtuJqMTEU2Tdckne6Wu+4xNqUk5rrmvD+Jb6h5N1UM/ANomP
	W7wM2gjyG0rz296QYjtKCXn/rty/A8CQQBUVs3de7lNElogXJ/qgucQXo8KiWLF1uimcQthZuKS5S
	9pVqGkYTMV5PmsL2j0NFmthlZnk2gAY7/s5/lM/g58sdN/tZ0/n+nZvqFbNyuk7XhmDAahWcZCYYy
	xQYi0vRxZgLWCK/UoHc3sQv1B/P4v456LZ96PetIzh4/mE/G0IDMgonuaxjxf752ATni5Qd2IwZrY
	KRubhGrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kia59-0001Uy-WD; Fri, 27 Nov 2020 09:30:24 +0000
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kia54-0001Tc-Q7
 for linux-mediatek@lists.infradead.org; Fri, 27 Nov 2020 09:30:20 +0000
Received: by mail-qt1-x849.google.com with SMTP id v9so2902910qtw.12
 for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2020 01:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=G2nRnTMvMHzL0pssVZ9j+N4BueXIkkDpFiReYAP2EPk=;
 b=U7SYomBZ8bTO5HYsWoJbCSSKduoMS6hJ1d8aQeL6mSnl1W5zAZr+gjanQ3FcI3FLPT
 vOJKP5xZbHJttoOjZdZMclKLPHpcpg0VcYRrfqmzJpdTTLZ8s02s94ObOJyStTrC/TiO
 3EcUk0NLGPhzsobAyr59Br5y4fx1Fr1WRL5UboTKREqOEsHKJaHJNaCUVNQThLfopd8b
 koLF+s4imsdgTrCCySG+qesjIQGneA+6X03ycb6BXSf264JB+UAectiSuIuj/aLlhp5q
 202QAgpUYwAJfkyuTdOsXterzZSBkO3MK/3mO7WzBV11SOPJRayQu7hdWTlEh28uWri2
 7VwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=G2nRnTMvMHzL0pssVZ9j+N4BueXIkkDpFiReYAP2EPk=;
 b=NdvV0USBaIhUHRmElJUoFzKF3GUJ9cW1Vx7Z3EcZgDMhFK1IfGw21y4w//e3sDB/Dk
 mcSiygnaHbBPniup7pDNpet47MzLv4DEnOFFaAr8+ibWYPZBONVUTu/6gavhKxOL8u44
 MZ4KatE1FRHwF3R0x8KE+mfRc6b8TPMJM2xw5m7zp3bF2iBTWDjElv1PpwM5VSlRqU4S
 X8sC6e8pguDfKEaBwFT2aUD232jrVapJ+jW4jq866QF3EVxni+2AN305O+30BcKJNqBN
 mncEzPfWKj1iSlc2WeD5qoU3oItqHK9Le8Cvy2+cMNiS6/09pAT/YZbwK0cBpwAAd4R2
 D62w==
X-Gm-Message-State: AOAM5319PWzKaEPPM95SYvWs6nU4cES6XHk84rpq12Auu1SzEYz0aW49
 luPt+wsbzrev2GL5IbuGaJPYMxRZ0Rgd
X-Google-Smtp-Source: ABdhPJx6mscbpsH8qZuJ6gMH52Dnivs1BabDL+T3CMBLWtLYD/NXJQ/OxbUCDguG/TDvwJJqlUhF6D0buoIX
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:be02:: with SMTP id
 k2mr7428605qvg.49.1606469414080; Fri, 27 Nov 2020 01:30:14 -0800 (PST)
Date: Fri, 27 Nov 2020 17:29:41 +0800
Message-Id: <20201127092941.1646260-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [RESEND PATCH v2] remoteproc/mediatek: read IPI buffer offset from FW
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_043018_941490_2C3822EA 
X-CRM114-Status: GOOD (  18.61  )
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
Cc: mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@google.com>, linux-mediatek@lists.infradead.org,
 pihsun@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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
The patch bases on https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/log/?h=for-next

The first 2 patches in the series
https://patchwork.kernel.org/project/linux-remoteproc/cover/20201116084413.3312631-1-tzungbi@google.com/
have been merged to remoteproc for-next branch.

Follow up the discussion in
https://patchwork.kernel.org/project/linux-remoteproc/patch/20201116084413.3312631-4-tzungbi@google.com/#23784483

The patch breaks MTK SCP when working with legacy SCP firmware.  We're
aware of it and will upgrade the devices' kernel and SCP firmware
carefully.  Other than that, AFAICT, no other devices in the wild are
using this driver.

 drivers/remoteproc/mtk_scp.c | 73 ++++++++++++++++++++++++------------
 1 file changed, 49 insertions(+), 24 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 7e0f1e1a335b..4467ed646bb1 100644
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
2.29.2.454.gaff20da3a2-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
