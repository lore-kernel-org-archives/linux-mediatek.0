Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1A3C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 11:01:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EC6A6144E
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 11:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EC6A6144E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BVkWozks9I7dS1VyhXNYwjtwoAY8DIF6/XSPL6a4oBc=; b=MD851e2X0ibja8CRa+0VfsM7JU
	SHVdhSABkoirAhZEusSx0+9JkLokePaj/5Ww8AQKxZFfngqwXA5Mx0Cn2vKVjb4usi8Bm3vUoax/I
	9yVsJ2r2BRWGdibGcKWU4lStugHLZgiMmylX4AGtyGaZlKHuzmwGpNS5BH0SL2DEb51gRGt587ZZE
	Gffr0d/m9h0kz7gFrSPlGyJfyEV3d6b4OfQLqJpeRRS/vjUguJbNK+IHYX9qHQ32p1uKlrTLLbWPy
	NR9Y6irdUA+nrjZhV5bG5WhkYJhDEteRi9eVm+WdvGJaBQC9H8d5DNXZ5ZKugrw3sR/JKIZl30VUV
	MlMfTbaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc4Pd-005Wdw-ED; Thu, 29 Apr 2021 11:00:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc4Pb-005WdE-Mi; Thu, 29 Apr 2021 11:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=+Xil6gAEp1O1wwTat6Pzs8mEGBivA32lf3ycXFIcDPo=; b=Kbq81aRwAKjmHwPTV1mu3UxmVp
 CRM9UJXQAEhkdIRYriiN0UqVATRMfRa+HdxJvVPzhCKrfG6Cclh3DRD93kcZLKG9om60oXls32hnk
 FKsNFSKHcNDfCL/TEpQqHeKNlPVkxjFgV92FgFxq5S7YPRSFVk51hNn8wII+VL69CHOq8ikNwTHtg
 zf5Pf70c62VBa2XCzu0nXseNeUZxT+J9HhMmDDQOxEITY4BgLYUIF/jfgaALbGnvR2p5VJ0hWtqMw
 GqssjcxyTL3dcgtHKc/TkQKE8vWB8lWoS6Sxgzilf3XbPTa2rmEzapweF9QM03AyuqR1FaQAvCjpe
 0MWbAEkg==;
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc4PY-000Zsj-TF; Thu, 29 Apr 2021 11:00:50 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lc4PQ-0000ev-DZ; Thu, 29 Apr 2021 11:00:40 +0000
From: Colin King <colin.king@canonical.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] PCI: mediatek-gen3: Add missing null pointer check
Date: Thu, 29 Apr 2021 12:00:40 +0100
Message-Id: <20210429110040.63119-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_040049_098002_43B998AA 
X-CRM114-Status: GOOD (  10.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

The call to platform_get_resource_byname can potentially return null, so
add a null pointer check to avoid a null pointer dereference issue.

Addresses-Coverity: ("Dereference null return")
Fixes: 441903d9e8f0 ("PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 20165e4a75b2..3c5b97716d40 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -721,6 +721,8 @@ static int mtk_pcie_parse_port(struct mtk_pcie_port *port)
 	int ret;
 
 	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pcie-mac");
+	if (!regs)
+		return -EINVAL;
 	port->base = devm_ioremap_resource(dev, regs);
 	if (IS_ERR(port->base)) {
 		dev_err(dev, "failed to map register base\n");
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
