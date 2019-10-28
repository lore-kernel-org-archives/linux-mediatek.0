Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C5D5CA9EC0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:39:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D2E721783
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:39:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sO9Yx3Cs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D2E721783
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8zdLus8YCWpMBBm3+up75lAG5QFOYBFJ1RxNommnPU=; b=sO9Yx3CsIvqEBT
	4dJQJqlA/WTcBRy2QK3kGVTvlxuuvBGxtV+ePEJAsP6Rf4HX9X57wSIOqmGtscIMFLl1UJQ8BXGhF
	RI1Bum8p9NoMDLuCwN/wE8x1MCClXY3eQ1w98sg6FodbKMdFFVOXf89W7ivJbH5UCw57KawB46gGh
	RCGUFCoE1RL9/ZzzR7ZKp6WeZAsl7otLCTY2jdvdC9z2D212MD2QjcuOmvdVwGTYnA71n3r+P7bxC
	fFJC8HFEiSar5cpbaLIoge5qdyHXQj2/vAhS6biTr5gWop10SCgNcrqiVls3j/BCRz5yUjgjNABNO
	71PKiNi3HyYb8H7FKAXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP82n-0004P1-Tr; Mon, 28 Oct 2019 16:39:01 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP7xU-00075R-Dx; Mon, 28 Oct 2019 16:33:34 +0000
Received: by mail-ot1-f65.google.com with SMTP id u13so7201041ote.0;
 Mon, 28 Oct 2019 09:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mxMsu5buQ7iHumyqQOK7pePSEYHVrJpDScdqrZRoUwA=;
 b=lOpnRhXCmfQTEi2Fusn1KvhOpdQFTwBggViweBYfUD3r9pkoabUxZcXE6BGG3V8yGO
 ibG+wODT5dZmxAuSMRc9qs2eTGrYifMshNNLWuGFbQ2fY5qDg7pkpEaA1hv2IyRE2emf
 KYfSPWzVgLlwMaFTB8EWR+O1RBDnNOArXjZcn1q278NF6uu7Tyq07h7C4E5Vg0pUPB3H
 Cy3K2r2yaYXG/La1YKaDgPpKQNERP9CekjwzGIP0jhrNw2nyVFCYyhHA9yzrcamoInuu
 dwJ71xBmZto0XmBUdFsWAC4jPrYXvd9PBOAlBDs62l+b0sWz2BkcefjfMES+TEuFLnTB
 1KdA==
X-Gm-Message-State: APjAAAU3TZ9FDirrr0Rf1hn0s1nC8mPK0rYtAdcobyNTLBIm5mEXzT+Q
 2v+5oC25rCSytusI/3Uv5g==
X-Google-Smtp-Source: APXvYqxOkIeS4BmL7xvWW0X3OFJHqHE79e6/UgYAXh9+BdleE4h11RfX6HaRFlUyGOi9IbQqg7eeRw==
X-Received: by 2002:a9d:4616:: with SMTP id y22mr13799435ote.319.1572280411103; 
 Mon, 28 Oct 2019 09:33:31 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e186sm354991oia.47.2019.10.28.09.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 09:33:30 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v3 12/25] PCI: v3-semi: Use pci_parse_request_of_pci_ranges()
Date: Mon, 28 Oct 2019 11:32:43 -0500
Message-Id: <20191028163256.8004-13-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028163256.8004-1-robh@kernel.org>
References: <20191028163256.8004-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_093332_548052_01D750DA 
X-CRM114-Status: GOOD (  14.05  )
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, linux-pci@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, Will Deacon <will@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Michal Simek <michal.simek@xilinx.com>,
 Christoph Hellwig <hch@infradead.org>, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Simon Horman <horms@verge.net.au>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Jingoo Han <jingoohan1@gmail.com>, rfi@lists.rocketboards.org,
 linux-renesas-soc@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert V3 host bridge to use the common
pci_parse_request_of_pci_ranges().

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Andrew Murray <andrew.murray@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/pci-v3-semi.c | 35 +++++-----------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/drivers/pci/controller/pci-v3-semi.c b/drivers/pci/controller/pci-v3-semi.c
index d219404bad92..96677520f6c1 100644
--- a/drivers/pci/controller/pci-v3-semi.c
+++ b/drivers/pci/controller/pci-v3-semi.c
@@ -241,10 +241,8 @@ struct v3_pci {
 	void __iomem *config_base;
 	struct pci_bus *bus;
 	u32 config_mem;
-	u32 io_mem;
 	u32 non_pre_mem;
 	u32 pre_mem;
-	phys_addr_t io_bus_addr;
 	phys_addr_t non_pre_bus_addr;
 	phys_addr_t pre_bus_addr;
 	struct regmap *map;
@@ -520,35 +518,22 @@ static int v3_integrator_init(struct v3_pci *v3)
 }
 
 static int v3_pci_setup_resource(struct v3_pci *v3,
-				 resource_size_t io_base,
 				 struct pci_host_bridge *host,
 				 struct resource_entry *win)
 {
 	struct device *dev = v3->dev;
 	struct resource *mem;
 	struct resource *io;
-	int ret;
 
 	switch (resource_type(win->res)) {
 	case IORESOURCE_IO:
 		io = win->res;
-		io->name = "V3 PCI I/O";
-		v3->io_mem = io_base;
-		v3->io_bus_addr = io->start - win->offset;
-		dev_dbg(dev, "I/O window %pR, bus addr %pap\n",
-			io, &v3->io_bus_addr);
-		ret = devm_pci_remap_iospace(dev, io, io_base);
-		if (ret) {
-			dev_warn(dev,
-				 "error %d: failed to map resource %pR\n",
-				 ret, io);
-			return ret;
-		}
+
 		/* Setup window 2 - PCI I/O */
-		writel(v3_addr_to_lb_base2(v3->io_mem) |
+		writel(v3_addr_to_lb_base2(pci_pio_to_address(io->start)) |
 		       V3_LB_BASE2_ENABLE,
 		       v3->base + V3_LB_BASE2);
-		writew(v3_addr_to_lb_map2(v3->io_bus_addr),
+		writew(v3_addr_to_lb_map2(io->start - win->offset),
 		       v3->base + V3_LB_MAP2);
 		break;
 	case IORESOURCE_MEM:
@@ -732,7 +717,6 @@ static int v3_pci_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	resource_size_t io_base;
 	struct resource *regs;
 	struct resource_entry *win;
 	struct v3_pci *v3;
@@ -741,7 +725,6 @@ static int v3_pci_probe(struct platform_device *pdev)
 	u16 val;
 	int irq;
 	int ret;
-	LIST_HEAD(res);
 
 	host = pci_alloc_host_bridge(sizeof(*v3));
 	if (!host)
@@ -793,12 +776,7 @@ static int v3_pci_probe(struct platform_device *pdev)
 	if (IS_ERR(v3->config_base))
 		return PTR_ERR(v3->config_base);
 
-	ret = devm_of_pci_get_host_bridge_resources(dev, 0, 0xff, &res,
-						    &io_base);
-	if (ret)
-		return ret;
-
-	ret = devm_request_pci_bus_resources(dev, &res);
+	ret = pci_parse_request_of_pci_ranges(dev, &host->windows, NULL);
 	if (ret)
 		return ret;
 
@@ -852,8 +830,8 @@ static int v3_pci_probe(struct platform_device *pdev)
 	writew(val, v3->base + V3_PCI_CMD);
 
 	/* Get the I/O and memory ranges from DT */
-	resource_list_for_each_entry(win, &res) {
-		ret = v3_pci_setup_resource(v3, io_base, host, win);
+	resource_list_for_each_entry(win, &host->windows) {
+		ret = v3_pci_setup_resource(v3, host, win);
 		if (ret) {
 			dev_err(dev, "error setting up resources\n");
 			return ret;
@@ -931,7 +909,6 @@ static int v3_pci_probe(struct platform_device *pdev)
 	val |= V3_SYSTEM_M_LOCK;
 	writew(val, v3->base + V3_SYSTEM);
 
-	list_splice_init(&res, &host->windows);
 	ret = pci_scan_root_bus_bridge(host);
 	if (ret) {
 		dev_err(dev, "failed to register host: %d\n", ret);
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
