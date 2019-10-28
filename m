Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECBBCA9EC2
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:34:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4B7D21744
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:34:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rIPYI5fw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4B7D21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4enfAz7FQYDifEMieDZEAvBCSMlCDKzUIYoXoZ7LMG4=; b=rIPYI5fwTYwrZc
	MBiGNoaFjWy2w0ksglFGnJ1uOAVesNhYt/bttgbPTqmELlfNn09zCext4KYNK9ouVAPzJIDFbWtkJ
	4ep3CPAepOqWmjvAt/n0ViwugauQxEzf6oJOlHwu5muvk3O8nBFOvUzW9CAFI3n6xr4B/QyBRAmno
	7UljlowNlV6Kz8zedMkwjAkM/vFRV6hi5uqyQ5MHixDw6kSczSywN2lPUGDeC6ROgYSpHpH9fqhH4
	Pf589x1IKyv3rH5NgiNr/XNTBnNvTLLKujjBYw5IKGWkm6sA8VsEKloXcAvlZc1TzDafaiLn+bP9a
	eyABg6dba9F/PmZrrlJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP7yl-0008Pu-Qk; Mon, 28 Oct 2019 16:34:51 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP7x2-0006gA-Ef; Mon, 28 Oct 2019 16:33:05 +0000
Received: by mail-oi1-f194.google.com with SMTP id j7so6414492oib.3;
 Mon, 28 Oct 2019 09:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j3Ah2aSYwS6QKWxODjjePSbvkaLsSgyNAd22qZoET50=;
 b=L4p5lXeedhCfOqwmFYwPiDMgsYlyBZzLMCNeehwtuoALt2UPWBgxo9OW7o/tLI91Xc
 BdUOEQ1zixy6lcTP46cL/lcGeZDojRe7BNI5fPRjz3Epn2pB/vhVhhPugtViWdt0K3Rz
 k3iUEyydF/nFRnvvoXPwco6MTSKU8W+i+x/QA9cudhuWNe14ggGxWZtkONbiVJNUWu+1
 CSmjdgJ3E5I7kBGKY/R5SPR4HCszZtAcoxuZX4Ax5xRkxXFlxa/lYLyMElCNBWrcBaHl
 DmGi/aaI5emTMwP67iR9PK/gJ88ED54NGDHAuyb+ny8F9FklNTq7X+ls3n1wQZ4OaWLL
 +msg==
X-Gm-Message-State: APjAAAWMlkhdDqVFfLRm3rL+GoqZlL/HHHIf6zxw5WBgrS/jKEpU1rSb
 KZcj/v+CIuK3wkVVv+H+Lw==
X-Google-Smtp-Source: APXvYqwuOiD/nmPOHXYnO+kSRC+y2SQfGQt3XIG25A6vcuKK0nySh6ol8d3kQ/rCmlmUWRTvYzgC5g==
X-Received: by 2002:a54:4601:: with SMTP id p1mr106186oip.113.1572280383192;
 Mon, 28 Oct 2019 09:33:03 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e186sm354991oia.47.2019.10.28.09.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 09:33:02 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v3 02/25] PCI: Export pci_parse_request_of_pci_ranges()
Date: Mon, 28 Oct 2019 11:32:33 -0500
Message-Id: <20191028163256.8004-3-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028163256.8004-1-robh@kernel.org>
References: <20191028163256.8004-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_093304_573481_F3E501BC 
X-CRM114-Status: GOOD (  10.78  )
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

pci_parse_request_of_pci_ranges() is missing a module export, so add it.

Cc: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Andrew Murray <andrew.murray@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/of.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 36891e7deee3..f3da49a31db4 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -530,6 +530,7 @@ int pci_parse_request_of_pci_ranges(struct device *dev,
 	pci_free_resource_list(resources);
 	return err;
 }
+EXPORT_SYMBOL_GPL(pci_parse_request_of_pci_ranges);
 
 #endif /* CONFIG_PCI */
 
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
