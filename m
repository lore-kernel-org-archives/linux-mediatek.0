Return-Path: <SRS0=ZThz=44=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970E1C2BAEE
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 19:21:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A51720578
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 19:21:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TYHtYb1j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZXdYYUO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A51720578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3DD+EWnmBZC/k7cTn9myU86CqG9UXq10LZiYJ1go5Q=; b=TYHtYb1jSjtPNF
	/1c7sYVEmhjPtxOZwiWecO1uwm6/GFg0zLTW1nHcaJvIn/q3SMm0wrRM/phZkViSR5WB1tUXnycjR
	p8tNSCs3aEhsE7xf6UbpNJPJhYVhzt11XGqy+zGyKyIlpTmc42UmGNVsz2iGCN9IJWdxgch+oVw/8
	PCrYZlWjP4Ic7g+viG9WEoM4N77v3+M8QJykwj3P7+qxLWm8/PgK/P4/qAnr8ivSwqTLqn15j3989
	ybtoZhFzM5wp9zMhL6AGDJkeeyz3UWZiV5vu1BHF7cszIZacke+rXNATZlzSQkmWB9/UHwrKpWcj/
	TS/bZG7TUki7S/qZhwjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC6uU-00004r-DU; Wed, 11 Mar 2020 19:20:54 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC6tF-0006GI-JC; Wed, 11 Mar 2020 19:19:39 +0000
Received: by mail-pl1-x644.google.com with SMTP id w12so1524282pll.13;
 Wed, 11 Mar 2020 12:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pOjQrnVayTgdrET4gCgzOMQ7+VznZ1NPyMucBXzQRTg=;
 b=eZXdYYUO9MJk8vDBz2ohUHhTlFQ6OUvKe5NJC3wwMup1+78yjzPuD0a1yqr7kKDAzn
 R6bakE9D6+2lnyfG457Nwws4+THsXyHBMV88kQa77cHLpoisL/FI1o5FbYjjD+Cho972
 a/pSRcvr7B/YCgFV1J8wk+jRpXIpqHPrPXkUbPz86UioJj5qwacgDmZn15UmH5MpjSIm
 NvmTKUXeA4shooBgG2EMsAcLL3Sm7nQ72CXnpIBnlTEibmiT3TrxdnaIeopIbHLfMDA9
 iCdUKJsTETkc/0yFfjDjJIJEzpVlInD/58X/THAjQ3ciF01RAOk751kpX86fuzJRi0o3
 d2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pOjQrnVayTgdrET4gCgzOMQ7+VznZ1NPyMucBXzQRTg=;
 b=Opmn/W2hzzQ+5ZNi+BUApGZ5tpdzLGzq1ng5WBskTdTCYgPGRu/xpOOwI4Y0I+n697
 HwT4XTeFAGAuS8LxsTZX3/Pm662jqcxD9tYWDslz5zEIORpI2czzuS2U9fuO7UE7YFyY
 wFSs4b+WTTuqafmSaXQ/fY092OxUCVuRpmKZ3F0g5BaZVBawA60JGRsI9vqJtmkDNxCp
 F6Kuvtqa8nCzpIGJeYIpncYuip7uPzBJ+rxSt79vs/B79OQ84hzg6PeGsjx/bXhNMKC0
 OKo2c6BLhSdQpYHR2/VlnyLFxR42JohpnqekVejz6UAp/zYZXacu/QC2jdLEepBFzezH
 cC8A==
X-Gm-Message-State: ANhLgQ1jhFYPxlw5Ir00MZPdGnivFQD0C7yxT6RwB3HB88PCSPLs59A8
 qFJKH6YJlhgLth5f56PApnw=
X-Google-Smtp-Source: ADFU+vsSzPj8KundN3q85Ksdo5biFKHHfX+UdUbQyTZOldP1FMJEG8vyFDHt7yRgWjL+jYyHW5T0Zg==
X-Received: by 2002:a17:90b:1a8b:: with SMTP id
 ng11mr201893pjb.173.1583954376003; 
 Wed, 11 Mar 2020 12:19:36 -0700 (PDT)
Received: from localhost.localdomain ([103.46.201.94])
 by smtp.gmail.com with ESMTPSA id z17sm3792673pff.12.2020.03.11.12.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 12:19:35 -0700 (PDT)
From: Aman Sharma <amanharitsh123@gmail.com>
To: 
Subject: [PATCH 4/5] pci: handled return value of platform_get_irq correctly
Date: Thu, 12 Mar 2020 00:49:05 +0530
Message-Id: <b773b3b1ed25a0e6d5d826b6c43293473cbd24e7.1583952276.git.amanharitsh123@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1583952275.git.amanharitsh123@gmail.com>
References: <cover.1583952275.git.amanharitsh123@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_121937_770634_732A3E14 
X-CRM114-Status: GOOD (  10.73  )
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, amanharitsh123@gmail.com,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Mans Rullgard <mans@mansr.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Andrew Murray <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Signed-off-by: Aman Sharma <amanharitsh123@gmail.com>
---
 drivers/pci/controller/pcie-tango.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-tango.c b/drivers/pci/controller/pcie-tango.c
index 21a208da3f59..18c2c4313eb5 100644
--- a/drivers/pci/controller/pcie-tango.c
+++ b/drivers/pci/controller/pcie-tango.c
@@ -273,9 +273,9 @@ static int tango_pcie_probe(struct platform_device *pdev)
 		writel_relaxed(0, pcie->base + SMP8759_ENABLE + offset);
 
 	virq = platform_get_irq(pdev, 1);
-	if (virq <= 0) {
+	if (virq < 0) {
 		dev_err(dev, "Failed to map IRQ\n");
-		return -ENXIO;
+		return virq;
 	}
 
 	irq_dom = irq_domain_create_linear(fwnode, MSI_MAX, &dom_ops, pcie);
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
