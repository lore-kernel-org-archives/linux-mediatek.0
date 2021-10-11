Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989EDC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 17:51:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6210860F0F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 17:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6210860F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvZu8PHawQCLDsT4AoXJcIBa7cQdxi4RkdX9R3kj37M=; b=bcAtLXpj6GHAFF
	Ysn39j3WKrp7fp5GbuaA3EvUdykdwG4P+wiNFSWyFHljjnnlHFqGYYQU+5/bHwBDLcqtfRs2LdPGD
	vy4DEIKWncgVnqTIRna7Btry+P8gciS83NmlKEjjnzQulLkx5HmnW2/iEe1BC0sKugJEloBrFhFz5
	A3n0+h/Kxb06w/zU919SwLMnTpCpQQ6K6dAJv7RwKK3ZVaZqK59hJByslofq83Srnd0vp8+uWO+tm
	HWoxBEf89sGVjEy+ONS+2FYHjGottnkVHmxG5lBiDt2dW52QAtcCqfivZ2u1nEtxf7E3DK4LgwZtw
	ocAhjBh2CKbAD9idHpyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZzSg-00AIGX-F2; Mon, 11 Oct 2021 17:51:42 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZzSd-00AIFW-LM; Mon, 11 Oct 2021 17:51:40 +0000
Received: by mail-pf1-x42e.google.com with SMTP id x130so6496706pfd.6;
 Mon, 11 Oct 2021 10:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/eCkgBabqgzZMoeU3aBzDcQBc9kpvi2Lrj2FSZUU1HE=;
 b=YHh9+t/+VTBC4s3ntJ//sJ/3/IIr2caH4VqARETHgUCXzk5AJvktpuzm9dE1uaz8JR
 xfjTOD7aZUQWRjbKXiGclanTMy8FIrFMav39XmnhURFykou9MBA41/JZBhSM+7F4oHLA
 SP02gBaRgAi+oh7QRziQfMLDPOty5vvLh/RP3ivWQn6Y2sB6qtOy64EiNbYPGwDrncay
 C+mDaqnykJqY0eIAz2Iz0OW+V+GdMg/ZeNJtD5NKeLGRVzSxqJEP1uOfrPqA3jU0492d
 fW5eUzfXmMfoZsHp372XsnmCWx3xGZMWZOUwL0mzcXIQAAPaFvY1njIycCdWRu30XZ95
 C7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/eCkgBabqgzZMoeU3aBzDcQBc9kpvi2Lrj2FSZUU1HE=;
 b=wVKoDjJdFHUtUwGzk6dj5qehCPx24e7BkHgSM60IT03YkfjRRQP2ub/B18CzYGA72x
 aKqxhV2yGTL2aDycn1T1jZFhkWG3fiqYbdmUxfrJtF3enR+hkEv+FTrV8lRVoppX+VOd
 jp71anSdVCI0RExC0Nlkac531x444TrNMrD88qb/H6BYupSqn24fAHWvGpreG1q9VIL6
 YADai8AyTLQHOjgpn0qK3Mcum2jqWAw25sgwsRgbYC5AWy/nZfGwI1RLUErhnWAuFo7y
 VkvRloCvnvZ8VF4HJzdW06Xxh5FcDqHxtyMqwPlcXhfka6hmPRp33aNZP7dUG3i8V/IR
 3RBw==
X-Gm-Message-State: AOAM531r0CBsem9Oa2sg+d+Jc5nYzU8ts6+QmbEXXVizmz+MW6xxMB+j
 FAyEK8Dkl5I1nFk4C4DKMJ4=
X-Google-Smtp-Source: ABdhPJyoiL1u1vbuIv3pXSKqdKMc5JLSJ9ySrHxMnxgboUVF/xihVga0exmAZwG6n8zy5S27LTM1tA==
X-Received: by 2002:aa7:93ca:0:b0:44c:da51:38ac with SMTP id
 y10-20020aa793ca000000b0044cda5138acmr21437391pff.67.1633974698694; 
 Mon, 11 Oct 2021 10:51:38 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:9f95:848b:7cc8:d852:ad42])
 by smtp.gmail.com with ESMTPSA id y6sm124618pjw.2.2021.10.11.10.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 10:51:38 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Cc: Naveen Naidu <naveennaidu479@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org (open list:PCIE DRIVER FOR MEDIATEK),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 05/22] PCI: mediatek: Use SET_PCI_ERROR_RESPONSE() when device
 not found
Date: Mon, 11 Oct 2021 23:21:22 +0530
Message-Id: <01f0c358e3ea05510e04384c3fb5edc577523430.1633972263.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633972263.git.naveennaidu479@gmail.com>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_105139_733881_8EE71701 
X-CRM114-Status: GOOD (  13.63  )
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
causes a PCI error.  There's no real data to return to satisfy the
CPU read, so most hardware fabricates ~0 data.

Use SET_PCI_ERROR_RESPONSE() to set the error response, when a faulty
read occurs.

This helps unify PCI error response checking and make error check
consistent and easier to find.

Compile tested only.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 2f3f974977a3..aa744ccd1a2a 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -369,13 +369,13 @@ static int mtk_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
 
 	port = mtk_pcie_find_port(bus, devfn);
 	if (!port) {
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
 	ret = mtk_pcie_hw_rd_cfg(port, bn, devfn, where, size, val);
 	if (ret)
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 
 	return ret;
 }
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
