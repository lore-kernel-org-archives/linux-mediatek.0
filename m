Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F111C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 14:06:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B6E961AE2
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 14:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B6E961AE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wX5/2kglMgjkTKXecNGaWIGBQI2nlSI5Mh1UTkl1TF0=; b=dbsQatyKV9u9k3
	uGsS6HqJjEcc6gkKaNNfmMBnqccMWOngLZ7o3kKA1VdoRj77f8lmGqOmeaO8pzhvrrAzfyEf3WNH7
	SI8kFu0iPMb05ygo7YeDPnbWuN1e4zGd7/b7qhfhhtSW1T7jZ83ruiFiUmog1twwwWUHZwSghK1UW
	7uq2ikkWYcM7KVQd/NqQqtXa27C/J/UG+E7PTMnBLVyxjCahc2yWyh3JWUNVTlM+TiCMIzFB7Asao
	iI+/KvG1fC0T+0aaC56b5RrrihUjKAgHhnGo7cmBJTIKRWrx9rKtdIIWHhy9yh54DSJrDLd2lFRRg
	bvMWam6L/YnoOOn/B3vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mni3C-0080ar-1s; Thu, 18 Nov 2021 14:06:06 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mni2z-0080W4-6t; Thu, 18 Nov 2021 14:05:55 +0000
Received: by mail-pg1-x531.google.com with SMTP id q12so5415853pgh.5;
 Thu, 18 Nov 2021 06:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E2kMW7De0WUTFR8R6pbmw+v+DfoEFjJfFZEPmx6TpIo=;
 b=jmYMhdUPtwXlk7YxNRrEY39ARKEZzJckayE37oIVTUa4nPyIslNcR6XMOv+FjMg22s
 S/2TjPlBw5NarH79TxwrLYnoAVvWIZ0ppI9goUKtPGdcd0slD6cnqVcnAcmR2QXi6HrW
 8+7CI+lO7fFXcHknuE0JmXhZ9a5KqyZcFnX4cBMhbOQxCVWJJNIZaMOHFOcmYvr6vB1w
 pltr2d5RvAkg0R5l+YmyEilG8etz39ddfm+YhEh18pVpohNq8By50UkP5pvHXKBFDxd3
 9HBmaDizaekYvA2ywKzrnX+8OKZJm2K/jRoIj7A8oOVDYNxiGAyi68IMrf7PY9dIX6YG
 g3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E2kMW7De0WUTFR8R6pbmw+v+DfoEFjJfFZEPmx6TpIo=;
 b=VQL84gFGeirsrQ7qVT1gi2NZxDf29mF+gIoDWyHi49bNIkfPA2aHKKS1C/P1TxZL1C
 jFUH0Bqof8fbY6k0/8Ims0UxNvZlLYr8Zd2DmJNBcmYYOyI/bIzzmnY+BCEi1Njws43a
 1M+FeF5lp74Q5avdHexjjT5VSqZKmijBWQoCyPX4KC5wmee/oGqjGmUgjvFSx0TJMBjH
 QR0vS/0Uevqj328SzPLSrNk2sg5sp+j29JFAs9Yfp2iD0jLReA0GCmr4bo/CY1WQxwkR
 huVZcZrYkJfFdSGQGS4/7Xf9SSRfz9TRy2vkIlFW3J8YodbTtKmS1QUJ2hPzJ+n8G8gw
 SyVw==
X-Gm-Message-State: AOAM531hoFV8rOY2qmTk+yNHZpTD7tDeG53ogMsvohKuDUYvD4Ixwy0N
 p2BalS7Odjgu8JMheHFHo2SBboS6QmI5pBgK
X-Google-Smtp-Source: ABdhPJyV+0mLAR5xy7BosKaOERagEd3ZKVQwr7/RwK2rniXrlnNRhEmZz+hP+50EUyrGGs3nj1a7sw==
X-Received: by 2002:a63:b0d:: with SMTP id 13mr11503398pgl.190.1637244351963; 
 Thu, 18 Nov 2021 06:05:51 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:63:2c47:5ffe:fc34:61f0:f1ea])
 by smtp.gmail.com with ESMTPSA id
 x14sm2822878pjl.27.2021.11.18.06.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:05:51 -0800 (PST)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Cc: Naveen Naidu <naveennaidu479@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org (open list:PCIE DRIVER FOR MEDIATEK),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v4 07/25] PCI: mediatek: Remove redundant error fabrication
 when device read fails
Date: Thu, 18 Nov 2021 19:33:17 +0530
Message-Id: <666127469482f9ca177805ff52aeb7bccb26e4c9.1637243717.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1637243717.git.naveennaidu479@gmail.com>
References: <cover.1637243717.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_060553_284146_EF181005 
X-CRM114-Status: GOOD (  13.46  )
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

An MMIO read from a PCI device that doesn't exist or doesn't respond
causes a PCI error. There's no real data to return to satisfy the
CPU read, so most hardware fabricates ~0 data.

The host controller drivers sets the error response values (~0) and
returns an error when faulty hardware read occurs. But the error
response value (~0) is already being set in PCI_OP_READ and
PCI_USER_READ_CONFIG whenever a read by host controller driver fails.

Thus, it's no longer necessary for the host controller drivers to
fabricate any error response.

This helps unify PCI error response checking and make error check
consistent and easier to find.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 2f3f974977a3..a19f8ec5d392 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -365,19 +365,12 @@ static int mtk_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
 {
 	struct mtk_pcie_port *port;
 	u32 bn = bus->number;
-	int ret;
 
 	port = mtk_pcie_find_port(bus, devfn);
-	if (!port) {
-		*val = ~0;
+	if (!port)
 		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
-
-	ret = mtk_pcie_hw_rd_cfg(port, bn, devfn, where, size, val);
-	if (ret)
-		*val = ~0;
 
-	return ret;
+	return mtk_pcie_hw_rd_cfg(port, bn, devfn, where, size, val);
 }
 
 static int mtk_pcie_config_write(struct pci_bus *bus, unsigned int devfn,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
