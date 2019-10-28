Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084D2CA9EC0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:37:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDAD9214E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:37:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wseq9FVy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDAD9214E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2wNBUsBO3GoapdyUSfw/sb4aumteuVT7obD4CWZTgQ=; b=Wseq9FVyc56zzO
	TzojBmdtfKlx2xDK+7PRY86vIEaQBGKmOnVryrEegx0l6lF6/zjR87bKU6Zorjyabhfi1yfKfyLkd
	JuVpfYrGeux/1P6p8GJL0Lu86n0tOgH1MJFVb4EboXklqcgOcDh7l+K7Kd060Mlmedec+WMIUrpdU
	W/PjZghn8Ecec7wIfG0Z//1yOPJx6w5Fo/9OnmqweBoVOweBSyFVubwKhXlQrcdLYagPKEdddZZse
	p/w+HWknfRb/7FyF865dbFersZJTA1EaczIQKIniQVF4fKan8z05nGZC4FHP95UkDMyLOMujF/92S
	dwqAfLG+KZPg14pNOjoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP816-0002jr-3D; Mon, 28 Oct 2019 16:37:16 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP7xC-0006rJ-Bw; Mon, 28 Oct 2019 16:33:16 +0000
Received: by mail-ot1-f67.google.com with SMTP id m19so7200317otp.1;
 Mon, 28 Oct 2019 09:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t7u4vSL0DP54jAwq/M7JASt/IhO5e5uqSLWCi0kiWfU=;
 b=gZGhaahvPeC1AnC1yZoGDMWZqn5MkgKQRl8eFPEqVY/sJH+P+EAeQU/h8zpU/L1090
 ubMdaNAA9ZiRE3ml0I1lf5WNzGs0OyxOvDOcq1vOdJi+PZDRSWeoHxEfA8zonhBilCCd
 YHmI+KSuXMu+lE8Ewi66zMeGi2N6E/ojXOtFG8F2m5P1mZShyM4R8xjV/pUtOpaqLjPD
 tLnu0kLd2w8y0L+NX/twI9suO/l0AbeCFM+MxWJ6sI4xQqQZOLGypAAlEuQhqxVDV4WE
 BFB9lI9aOB6LbkKKDaO8dWDhQdazrzkzwdP4klY62saPzQwuZOw+VVkRYjxx02YoLZ74
 ynHQ==
X-Gm-Message-State: APjAAAWL0MsBYi54b5ljlZoYQBDnTeNkJwG24XK4wSpWGZdt/sfGNt1g
 TsrqQRFcZAnc+UgMd44nMQ==
X-Google-Smtp-Source: APXvYqySAp0eSGQqHJLCI+ocWp45cw+8XpbJ73Hq5r/2RLRIlfj8dRzgqT5GxLaG1O+5Nr5aFn7huw==
X-Received: by 2002:a9d:12f0:: with SMTP id g103mr8868885otg.219.1572280392987; 
 Mon, 28 Oct 2019 09:33:12 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e186sm354991oia.47.2019.10.28.09.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 09:33:12 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v3 06/25] PCI: faraday: Use pci_parse_request_of_pci_ranges()
Date: Mon, 28 Oct 2019 11:32:37 -0500
Message-Id: <20191028163256.8004-7-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028163256.8004-1-robh@kernel.org>
References: <20191028163256.8004-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_093314_423117_B96D0AE6 
X-CRM114-Status: GOOD (  15.71  )
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

Convert the Faraday host bridge to use the common
pci_parse_request_of_pci_ranges().

There's no need to assign the resources to a temporary list first. Just
use bridge->windows directly and remove all the temporary list handling.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Andrew Murray <andrew.murray@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Remove temporary resource list
---
 drivers/pci/controller/pci-ftpci100.c | 51 ++++++---------------------
 1 file changed, 11 insertions(+), 40 deletions(-)

diff --git a/drivers/pci/controller/pci-ftpci100.c b/drivers/pci/controller/pci-ftpci100.c
index bf5ece5d9291..75603348b88a 100644
--- a/drivers/pci/controller/pci-ftpci100.c
+++ b/drivers/pci/controller/pci-ftpci100.c
@@ -430,10 +430,8 @@ static int faraday_pci_probe(struct platform_device *pdev)
 	const struct faraday_pci_variant *variant =
 		of_device_get_match_data(dev);
 	struct resource *regs;
-	resource_size_t io_base;
 	struct resource_entry *win;
 	struct faraday_pci *p;
-	struct resource *mem;
 	struct resource *io;
 	struct pci_host_bridge *host;
 	struct clk *clk;
@@ -441,7 +439,6 @@ static int faraday_pci_probe(struct platform_device *pdev)
 	unsigned char cur_bus_speed = PCI_SPEED_33MHz;
 	int ret;
 	u32 val;
-	LIST_HEAD(res);
 
 	host = devm_pci_alloc_host_bridge(dev, sizeof(*p));
 	if (!host)
@@ -480,44 +477,20 @@ static int faraday_pci_probe(struct platform_device *pdev)
 	if (IS_ERR(p->base))
 		return PTR_ERR(p->base);
 
-	ret = devm_of_pci_get_host_bridge_resources(dev, 0, 0xff,
-						    &res, &io_base);
+	ret = pci_parse_request_of_pci_ranges(dev, &host->windows, NULL);
 	if (ret)
 		return ret;
 
-	ret = devm_request_pci_bus_resources(dev, &res);
-	if (ret)
-		return ret;
-
-	/* Get the I/O and memory ranges from DT */
-	resource_list_for_each_entry(win, &res) {
-		switch (resource_type(win->res)) {
-		case IORESOURCE_IO:
-			io = win->res;
-			io->name = "Gemini PCI I/O";
-			if (!faraday_res_to_memcfg(io->start - win->offset,
-						   resource_size(io), &val)) {
-				/* setup I/O space size */
-				writel(val, p->base + PCI_IOSIZE);
-			} else {
-				dev_err(dev, "illegal IO mem size\n");
-				return -EINVAL;
-			}
-			ret = devm_pci_remap_iospace(dev, io, io_base);
-			if (ret) {
-				dev_warn(dev, "error %d: failed to map resource %pR\n",
-					 ret, io);
-				continue;
-			}
-			break;
-		case IORESOURCE_MEM:
-			mem = win->res;
-			mem->name = "Gemini PCI MEM";
-			break;
-		case IORESOURCE_BUS:
-			break;
-		default:
-			break;
+	win = resource_list_first_type(&host->windows, IORESOURCE_IO);
+	if (win) {
+		io = win->res;
+		if (!faraday_res_to_memcfg(io->start - win->offset,
+					   resource_size(io), &val)) {
+			/* setup I/O space size */
+			writel(val, p->base + PCI_IOSIZE);
+		} else {
+			dev_err(dev, "illegal IO mem size\n");
+			return -EINVAL;
 		}
 	}
 
@@ -569,7 +542,6 @@ static int faraday_pci_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	list_splice_init(&res, &host->windows);
 	ret = pci_scan_root_bus_bridge(host);
 	if (ret) {
 		dev_err(dev, "failed to scan host: %d\n", ret);
@@ -581,7 +553,6 @@ static int faraday_pci_probe(struct platform_device *pdev)
 
 	pci_bus_assign_resources(p->bus);
 	pci_bus_add_devices(p->bus);
-	pci_free_resource_list(&res);
 
 	return 0;
 }
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
