Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28706C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 14:56:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D172C611CE
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 14:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D172C611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wX5/2kglMgjkTKXecNGaWIGBQI2nlSI5Mh1UTkl1TF0=; b=qU0KL2n/ORob1V
	S6IfCOvDoS5CTJsmSk45bAnKmjGvjH6Ik3GTzn57FhfJNESPReyjARNZqqqLSav7GakoQ9UlKxqNR
	oLCAinGXLCIi8Zw60C3OD/q/+TbQ2gUErh27teowpotoPlZguuGb/V2j3AZGu9AR44RQXGo/ZD3Eb
	x/2h9KTqrEpfE0qG1KGRu9Fm9KVbE7gWM3rO/DJG7mbImRg8Q8g+ku/6xONfeWjXGn6GvWloWQuci
	EBk8T/4kFh02Fbwr2NN/iu5tRhlaf59gUZG81A933A3Ze3SEJANRtilO2OwmEH0hS/Pp1qFzH1W+S
	KbH8WDH396zcIfqELvGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbOcw-007kjV-Fj; Fri, 15 Oct 2021 14:56:06 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbOQf-007gPa-3g; Fri, 15 Oct 2021 14:43:26 +0000
Received: by mail-pg1-x534.google.com with SMTP id f5so8788133pgc.12;
 Fri, 15 Oct 2021 07:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E2kMW7De0WUTFR8R6pbmw+v+DfoEFjJfFZEPmx6TpIo=;
 b=eMtI6REOFWix9KtW5tFZKnYJASMZfWRLSZnk5Z3YHrAZfJHAzvFnr8ylXwPFqc2a/a
 sSZ8UvQq1tqytMA7xvcnnsiLWefZHtOIvyR4w48y0+/FL2UKgIHln+v2qE2m/w+JTFM1
 5/mXXW1NrvfbNEM0Kxme6uJJEBTs38ZYlbTHW6Re7rHSajvVurS8Uq1V2v4NCeWCfPhp
 0AMJSPYYm2sBLxJatPIFmiVJT/Oh5NHr53JmOewoMKlOnjkfBC7TBlY4MypeOeGa17pJ
 HGEAOs0d5LPR7Euvw8ZGAQvAt0r8Wbzm43Xw5FKSEaUKTN3vn6bLTxu6DfAsFds4nbK0
 6Xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E2kMW7De0WUTFR8R6pbmw+v+DfoEFjJfFZEPmx6TpIo=;
 b=aMHVyXcZRtznhkXw3vE9VKgBBRCsdXjg4wMB2zkw01xGoWPKLOF2debyydGquGR8uJ
 3RUNyDZjG0VRMcO8ECkplBmenpoPkC9mYfSM6ci9PmPbu5fUgKVtax21AthqwzJl/60x
 rmQIUkkNavI4BpOEuraV/JBbQT7AZ8UbVQsSgEJAx34VBK80dJLv/f2EKnqAfCl8f7/w
 KzZ8BZR/rhKy73PV38M3Y5ejX45PbHUxfDUdy6I0Gt902E3XbSj5wCMayzONnu9R/yQM
 Gh2GXVw5Hl/TTFbxIA8/dNaCDeixWV/tc7aG1Dvjf4IdZzyAE8AA/L2kLcWpim3SCTpO
 xD0A==
X-Gm-Message-State: AOAM533T+je5MNqFcwflTvn1IF7RqQoouRSgw0LXuJ780X2FMfvgZRWE
 6E9neQgTV3Kug5nik1gkn0k=
X-Google-Smtp-Source: ABdhPJznv5Me0M33f8HkD/iBEPi7jNhXlMeZY3pyG0z8AuGV93euaOSAW3r29nVl5vtoWE0qzOFOmg==
X-Received: by 2002:a62:2f81:0:b0:44b:b390:956b with SMTP id
 v123-20020a622f81000000b0044bb390956bmr12110659pfv.30.1634309004189; 
 Fri, 15 Oct 2021 07:43:24 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 f18sm5293491pfa.60.2021.10.15.07.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:43:23 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Cc: Naveen Naidu <naveennaidu479@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org (open list:PCIE DRIVER FOR MEDIATEK),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v2 07/24] PCI: mediatek: Remove redundant error fabrication
 when device read fails
Date: Fri, 15 Oct 2021 20:08:48 +0530
Message-Id: <4aa74ccd31c42b108b61f2ad274bae59a1d25114.1634306198.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634306198.git.naveennaidu479@gmail.com>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_074325_195906_622691C0 
X-CRM114-Status: GOOD (  13.55  )
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
