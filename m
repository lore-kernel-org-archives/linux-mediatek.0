Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769D0CA9EC0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:37:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39637214E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:37:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tN+jLO2B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39637214E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=62QECBxx0fUr58GSXYIk7PwyVsldZK7WHXmIoucJCOA=; b=tN+jLO2BYc5mz2
	2Y1ml7qFDC868jAVAq3RWPzj7Q23C0+BUe3zm73/o8gg6OxBPuxZN9df/faJV8Kn9HKbpEUFxmP5M
	0AqnjTUozhq0p6+q6Q3CTyGYHJCy7/ygwRuE3jwRJxq6u3ENetPsbi8Zz/3iviOwOXjexvBSVR5Pj
	21303wnTXypI9Ta3squ4xvd5F437FhiuL88Ms9umoRxusPnLLy0v+TY2xzuUKNU5N8hsXlSP8b1zZ
	QVNn7qCi4lYHciU5TYvfd8ESWnTvuoaNe3whm4rFq1SUvzkkG6s9y4wxfs3QKD/vg3Mdkdc8DBmnI
	yQq7iFLKHhQipjygfCYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP819-0002m1-Iu; Mon, 28 Oct 2019 16:37:19 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP7xA-0006of-6W; Mon, 28 Oct 2019 16:33:14 +0000
Received: by mail-ot1-f68.google.com with SMTP id 41so7142930oti.12;
 Mon, 28 Oct 2019 09:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/baIkufFp5mlTrEe7IeynKuDaRx91+3hOWgRDUhWFkU=;
 b=fnVBZKfRj3Xaezfoe/eaDuOJY9jtt42/vVQRT8sh0zLP8fBZt2KzqlDJpNoG/hUM1o
 6C9shMQcD3mvS06gc8Q9VLalU82hl69VwY4YaMyXMSFgjmvl05wGR6TNE5rClDPM7fCz
 oBPwMLUpeU9MB0etxNR+/f6Rh8L6g0PT6/xyigORLfgMTVTGbU29iIQYFSq993gBnsfc
 rOV8zdsymfIQ9MDGw+ovz8HjiFl9fiiIc70r8hQFQ5BD9mjzkyAg8rAEoa6iCmeYvuCY
 UeKFyNtqUSH8BZCVdTgY21Q2hXNs2RFeiAiJvbHWA2jeVQcLz9yBTJQnV4StH7hgRqaO
 ufKg==
X-Gm-Message-State: APjAAAUold4zsK9dlxmGCbrNWotldpJUpeRr26Z9rzKcSSRIGx8kDuP1
 YZYBStB8T7fnkow/ET6wkg==
X-Google-Smtp-Source: APXvYqx+LIHYOqhOeHGYYTJWv4RVEy0aq3Lc+2gCsX7tadvpjU/gR9g+Z64Jn7VX8cIew+VZHzINfQ==
X-Received: by 2002:a9d:4a9c:: with SMTP id i28mr13723432otf.169.1572280390819; 
 Mon, 28 Oct 2019 09:33:10 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e186sm354991oia.47.2019.10.28.09.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 09:33:08 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v3 05/25] PCI: dwc: Use pci_parse_request_of_pci_ranges()
Date: Mon, 28 Oct 2019 11:32:36 -0500
Message-Id: <20191028163256.8004-6-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028163256.8004-1-robh@kernel.org>
References: <20191028163256.8004-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_093312_457020_8D9242F7 
X-CRM114-Status: GOOD (  12.56  )
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

Convert the Designware host bridge to use the common
pci_parse_request_of_pci_ranges().

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Andrew Murray <andrew.murray@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../pci/controller/dwc/pcie-designware-host.c | 28 ++++++-------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 0f36a926059a..aeec8b65eb97 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -319,7 +319,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	struct device *dev = pci->dev;
 	struct device_node *np = dev->of_node;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct resource_entry *win, *tmp;
+	struct resource_entry *win;
 	struct pci_bus *child;
 	struct pci_host_bridge *bridge;
 	struct resource *cfg_res;
@@ -342,31 +342,19 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	if (!bridge)
 		return -ENOMEM;
 
-	ret = devm_of_pci_get_host_bridge_resources(dev, 0, 0xff,
-					&bridge->windows, &pp->io_base);
-	if (ret)
-		return ret;
-
-	ret = devm_request_pci_bus_resources(dev, &bridge->windows);
+	ret = pci_parse_request_of_pci_ranges(dev, &bridge->windows, NULL);
 	if (ret)
 		return ret;
 
 	/* Get the I/O and memory ranges from DT */
-	resource_list_for_each_entry_safe(win, tmp, &bridge->windows) {
+	resource_list_for_each_entry(win, &bridge->windows) {
 		switch (resource_type(win->res)) {
 		case IORESOURCE_IO:
-			ret = devm_pci_remap_iospace(dev, win->res,
-						     pp->io_base);
-			if (ret) {
-				dev_warn(dev, "Error %d: failed to map resource %pR\n",
-					 ret, win->res);
-				resource_list_destroy_entry(win);
-			} else {
-				pp->io = win->res;
-				pp->io->name = "I/O";
-				pp->io_size = resource_size(pp->io);
-				pp->io_bus_addr = pp->io->start - win->offset;
-			}
+			pp->io = win->res;
+			pp->io->name = "I/O";
+			pp->io_size = resource_size(pp->io);
+			pp->io_bus_addr = pp->io->start - win->offset;
+			pp->io_base = pci_pio_to_address(pp->io->start);
 			break;
 		case IORESOURCE_MEM:
 			pp->mem = win->res;
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
