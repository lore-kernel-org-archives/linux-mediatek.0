Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41072C433E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:50:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFD912068F
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:50:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dgSgPgX3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oK0pLZKj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFD912068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drlIm233YGovqFvPGaU/JkDBswjknBC14tx+VnNXnbY=; b=dgSgPgX3wP7blvAqBg9AEqWIXp
	0uYhFik45dY76rmWrvMZpV1F7cneZNWURsyYXbx7pn0lh+Od/Krza8PGd5nzI5Pvffud1UWl00R2r
	DjyVpexSx+t2hfrmbVat06O45OhddbJj1nL2FCtUH6xyIHAt/p4VcmE0rb3TbtCCRhnOB1fC1dFNx
	alJhJIAHpDqMFesrOxgskZKU3Kwgw2ysqOWgWc6V/4U02xPO7gBmMh3S1wpOy5MdIlVcwmABXRZbF
	wv37Gwk6ccqHsmxhv62Fsl4rRgO5+N55I1djpqUjCHdeFou94xOaa0RBklJ8AEap7RNvAW8gR8mvz
	JhySZyTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysTV-00072D-Uh; Fri, 24 Jul 2020 07:50:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysMP-0002qe-Mc; Fri, 24 Jul 2020 07:43:18 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC146207DF;
 Fri, 24 Jul 2020 07:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595576597;
 bh=vVrPJpnrKh1wJ6LdbFf4wRAAhGQO0li9B4zgOch67X8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oK0pLZKjQDf+Gnf2KXF0LQzFxSNdIcpwyg7pDNWGC7k/+0ja4u68Lfe+iWj8hqiic
 X1Ws8IdNMfZt0c5n7CaA5h2wow7rTsnHXmpi2YpSXv3agbQFETi8OJ/fFx9FsQjVyH
 8lh+MllUjS/K+1KK9WrKZd6eWb8e6oPEoPESjfLM=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Kukjin Kim <kgene@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 26/29] memory: fsl_ifc: Fix whitespace issues
Date: Fri, 24 Jul 2020 09:40:35 +0200
Message-Id: <20200724074038.5597-27-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_034317_904746_1C835054 
X-CRM114-Status: GOOD (  18.37  )
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix minor whitespace and comment issues.  Do not break message strings.
No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 drivers/memory/fsl_ifc.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
index a2c971743ffe..89f99b5b6450 100644
--- a/drivers/memory/fsl_ifc.c
+++ b/drivers/memory/fsl_ifc.c
@@ -53,6 +53,7 @@ int fsl_ifc_find(phys_addr_t addr_base)
 
 	for (i = 0; i < fsl_ifc_ctrl_dev->banks; i++) {
 		u32 cspr = ifc_in32(&fsl_ifc_ctrl_dev->gregs->cspr_cs[i].cspr);
+
 		if (cspr & CSPR_V && (cspr & CSPR_BA) ==
 				convert_ifc_address(addr_base))
 			return i;
@@ -153,8 +154,8 @@ static irqreturn_t fsl_ifc_ctrl_irq(int irqno, void *data)
 	/* read for chip select error */
 	cs_err = ifc_in32(&ifc->cm_evter_stat);
 	if (cs_err) {
-		dev_err(ctrl->dev, "transaction sent to IFC is not mapped to"
-				"any memory bank 0x%08X\n", cs_err);
+		dev_err(ctrl->dev, "transaction sent to IFC is not mapped to any memory bank 0x%08X\n",
+			cs_err);
 		/* clear the chip select error */
 		ifc_out32(IFC_CM_EVTER_STAT_CSER, &ifc->cm_evter_stat);
 
@@ -163,24 +164,24 @@ static irqreturn_t fsl_ifc_ctrl_irq(int irqno, void *data)
 		err_addr = ifc_in32(&ifc->cm_erattr1);
 
 		if (status & IFC_CM_ERATTR0_ERTYP_READ)
-			dev_err(ctrl->dev, "Read transaction error"
-				"CM_ERATTR0 0x%08X\n", status);
+			dev_err(ctrl->dev, "Read transaction error CM_ERATTR0 0x%08X\n",
+				status);
 		else
-			dev_err(ctrl->dev, "Write transaction error"
-				"CM_ERATTR0 0x%08X\n", status);
+			dev_err(ctrl->dev, "Write transaction error CM_ERATTR0 0x%08X\n",
+				status);
 
 		err_axiid = (status & IFC_CM_ERATTR0_ERAID) >>
 					IFC_CM_ERATTR0_ERAID_SHIFT;
-		dev_err(ctrl->dev, "AXI ID of the error"
-					"transaction 0x%08X\n", err_axiid);
+		dev_err(ctrl->dev, "AXI ID of the error transaction 0x%08X\n",
+			err_axiid);
 
 		err_srcid = (status & IFC_CM_ERATTR0_ESRCID) >>
 					IFC_CM_ERATTR0_ESRCID_SHIFT;
-		dev_err(ctrl->dev, "SRC ID of the error"
-					"transaction 0x%08X\n", err_srcid);
+		dev_err(ctrl->dev, "SRC ID of the error transaction 0x%08X\n",
+			err_srcid);
 
-		dev_err(ctrl->dev, "Transaction Address corresponding to error"
-					"ERADDR 0x%08X\n", err_addr);
+		dev_err(ctrl->dev, "Transaction Address corresponding to error ERADDR 0x%08X\n",
+			err_addr);
 
 		ret = IRQ_HANDLED;
 	}
@@ -199,7 +200,7 @@ static irqreturn_t fsl_ifc_ctrl_irq(int irqno, void *data)
  * the resources needed for the controller only.  The
  * resources for the NAND banks themselves are allocated
  * in the chip probe function.
-*/
+ */
 static int fsl_ifc_ctrl_probe(struct platform_device *dev)
 {
 	int ret = 0;
@@ -250,8 +251,7 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
 	/* get the Controller level irq */
 	fsl_ifc_ctrl_dev->irq = irq_of_parse_and_map(dev->dev.of_node, 0);
 	if (fsl_ifc_ctrl_dev->irq == 0) {
-		dev_err(&dev->dev, "failed to get irq resource "
-							"for IFC\n");
+		dev_err(&dev->dev, "failed to get irq resource for IFC\n");
 		ret = -ENODEV;
 		goto err;
 	}
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
