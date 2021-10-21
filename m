Return-Path: <SRS0=9f7n=PJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B899C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 15:11:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21C9F60F57
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 15:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21C9F60F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wX5/2kglMgjkTKXecNGaWIGBQI2nlSI5Mh1UTkl1TF0=; b=OaUpSObsg0Unv1
	9thtF4Ggy7tz/16NvB6oChFqnLf3PWA4gv2zDjn9SPlh+XpX/ucbC8Ef4ijb1ZcOkFretDnA7afYU
	xa3UJ2naCggUJ+gju0dG0GHXdcIOvZ5a2zjUO7v8ZuFbUgWsIlL0cPC0H66tmk7pQJWubQOGJbNv8
	OeVxFMPL5jXaSeiAhox/P+UE9zr20u6Tpclhw/PCiGA3gQDxV54EsnVpbZxucHiGWpFcGV7EnqYjo
	AfxiOiSEV/Y0VniF3cyvGnmTho9K6jNHu01q47afHHsapnkYCyu8DW3049aGFiJrMJBUVl8N3NoR7
	WOzz7pYYc3JZtOHYabnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdZj3-007zzE-9F; Thu, 21 Oct 2021 15:11:25 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdZil-007zsY-MB; Thu, 21 Oct 2021 15:11:09 +0000
Received: by mail-pg1-x52f.google.com with SMTP id h193so617646pgc.1;
 Thu, 21 Oct 2021 08:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E2kMW7De0WUTFR8R6pbmw+v+DfoEFjJfFZEPmx6TpIo=;
 b=bzWdSeZQujO32b5BMXmzC0hhRwPksEaiJE/YCATPkO92U0l+nmR4WGg3cVxc0hTdyz
 FEiwDhNx3vFODZnaOwNJgeNx0e8s9VBE4HACA2WQtqadySltUFMRd4kiTbex9lmpKjce
 4OU4FX1VyEsIA2rp6LEjNuvr7zj4dR/48s7cnxdC1nFzwHVkbFVZFqn+L/n6KvocLObi
 /Xro4uDDTsrKtYwU2fe5EgmulOTv0YFTQt/SrAZ4iN2CbapeYV6/AF9/iayp6Gix1gdW
 QIyfLJ+azZ1EVH0YzaszjJDw32Rygn46IcE9+H14XdELtLHoCGDulU6jFktpuLeWb6z4
 Z1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E2kMW7De0WUTFR8R6pbmw+v+DfoEFjJfFZEPmx6TpIo=;
 b=g1Bsj377q4U4CrW5loc0fVabyiJPXS374haEoTmbO4BuxUFAoagmX6fGOwPfBKvU1t
 5+vOMJK/V8/mHmQK2+YOzFpmLSYVh5n7v+kCSa4mBL+RfFa/Z3QLERdNiAUZUWh9qrbq
 YJJoE8fgfv+RHHYtuWsXkmqdLxEBHLy3MZe1lWKFM1Ihe0G+BhPKoCCNfYap9yR1Cv+c
 TQXPAABsmnj/5LkiO7vw/nO+JjOVsJQf5v5EhRIQGP+AwP+49V0oCLt+REHV1btrRczZ
 6MYnrdUwmpUhJXmkBoYNt/fz7BMqZe8immQnwvounNt3bPreL3/IP1Q5aQecdcu5CM7l
 qifQ==
X-Gm-Message-State: AOAM533T33lkmA6af8kg+Sf1fu0AjIidyUoRFWdhFkg2yD8j9c6j1j5Q
 j14ddx6a0/AQ8Ny1OPznsS4=
X-Google-Smtp-Source: ABdhPJxg0pcHZ6TPn2MFYXLLISmkE9s8HA75KNL2gwUrIwqR1ZdHdF+RKfas5XSIW73ZAHG7QCE0Lw==
X-Received: by 2002:a05:6a00:b45:b0:44d:c4c4:409b with SMTP id
 p5-20020a056a000b4500b0044dc4c4409bmr6124670pfo.3.1634829067053; 
 Thu, 21 Oct 2021 08:11:07 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:11:06 -0700 (PDT)
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
Subject: [PATCH v3 07/25] PCI: mediatek: Remove redundant error fabrication
 when device read fails
Date: Thu, 21 Oct 2021 20:37:32 +0530
Message-Id: <bbd3536dedffb092c82da7cfbbfa7abbe3f3f379.1634825082.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634825082.git.naveennaidu479@gmail.com>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_081107_781721_171F5A59 
X-CRM114-Status: GOOD (  13.92  )
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
