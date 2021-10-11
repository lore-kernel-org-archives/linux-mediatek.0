Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C81C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 17:38:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02BC60EB6
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 17:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C02BC60EB6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTrFHwqPxCYlSlRadxGEApibDNCQu8pnDGkKjbIyvno=; b=f6dq1GbvLz4p20
	QbjnjDTNPCqNt1C4mEyPkG8dtJcuAVh1VewZJ8CXnHzoiMX8JHeK8rlSZwg9BniQaMmG4FNdKrHUn
	P2//GbpI6U6KNop14cKFB2bAKWtuuGjvXffQAeiTY2/t9k2jeoeQcp2x/scbz1MDtnU+HHSnPD4MF
	OLXSjUl+oxhvCJSVv6obPNixcp+esKFY9TIwfoAXco4VnFaiqKVwmkP1Tf3MYYKsDMw+PLOsKcVsN
	jn+jQA8AATYIJoyDJIgHNVZZH3rtl+T5HQr1/OznDh/GMj+g9EPjgQYn+vlt7AO7hfzyBGIeBw72m
	312Ah4SErKFG4wYWMtIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZzFm-00AFkS-Lv; Mon, 11 Oct 2021 17:38:22 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZzFZ-00AFhf-Cx; Mon, 11 Oct 2021 17:38:10 +0000
Received: by mail-pl1-x630.google.com with SMTP id t11so11775429plq.11;
 Mon, 11 Oct 2021 10:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WTDymu/kK4gMRJAHOJpsOJeHyCsZ/lww9DjrtPbDpJ4=;
 b=HwHRRV+S/RE+GIDbxexsfa91uds8RaTJQMPwbLhyAkzd491qats0xSsaC4mhiRl6Jq
 gXXjtWMCRFCl24UDsqtfCnqLD1Cbtd/93S7HO5AgB4ueGG4bEHV+hcSl1HJMqS26/8sA
 AKDOYmV4WnzsAqwxPmP3185eWqTzwnWRl2QPIf3ODwukpfqNg79k8CXYXbmjBmwmlM7H
 JLjBNNDOGJ+Mxf3ToELn+xPiqYpbj9hM9X5kn0apcvp1wMCYCAV20W1pQqigoIPr8oqY
 TGxAUPwne4Rec2JXIdYu17BaZHyNtS6uIqjuojEWOKeCG+TbAaPT/AAhWcUg9ysN4hhq
 wH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WTDymu/kK4gMRJAHOJpsOJeHyCsZ/lww9DjrtPbDpJ4=;
 b=B9LXwt4SCXbZSKnAg+wfLfdcPdfEZE62g548SrBJMD73s9pKtz8nRldsEjc5rkBD6D
 6dOFI4R1QYcl9ov9aGI9Te2gvC9g+xkx6rnZ5jMDIxtaoEB64Op35ute+mgTlaS8QraY
 dxiRcJFSRJOPM+nCUp455UTI66iPfMlkgqGmuGLTzKwBJhKvkTLrSm+Nq/7oyuVlnDgW
 95wdESixN0UfA+HRWMARyb/oQUjDODTCLA1xvGvePi2fJLzJBo8b4DrIoeklzYQ+JD5Z
 YNJUQabyfo3Qxv9qdz82DB7MKr4xOYXHDMo9Okv7u/w3sdE5Q/FkYRRa+nYKjuoFWAz0
 lURQ==
X-Gm-Message-State: AOAM5313ux2AQ1LLT3xqI+mN+4yXYqR5ejBOt3g2CdUw5RwjhAtj4r5y
 pV6frOJlKDIGJNK8LNoQHtGI5mqbVdrdAW8n
X-Google-Smtp-Source: ABdhPJxEBdoXamrVCKeesJUkEsfNWnP0PDrt34jLeyC7FqCvn2xqaY1LwruNHL9Qwq4e9o9alifRPA==
X-Received: by 2002:a17:90a:67c1:: with SMTP id
 g1mr335114pjm.177.1633973888608; 
 Mon, 11 Oct 2021 10:38:08 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:9f95:848b:7cc8:d852:ad42])
 by smtp.gmail.com with ESMTPSA id
 c12sm8456919pfc.161.2021.10.11.10.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 10:38:08 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Cc: Naveen Naidu <naveennaidu479@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/22] PCI: Add PCI_ERROR_RESPONSE and it's related defintions
Date: Mon, 11 Oct 2021 23:07:53 +0530
Message-Id: <5b4ba38fa56c7625d391383a3aed47dea6726946.1633972263.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633972263.git.naveennaidu479@gmail.com>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_103809_459937_2B94E123 
X-CRM114-Status: GOOD (  12.75  )
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

Add a PCI_ERROR_RESPONSE definition for that and use it where
appropriate to make these checks consistent and easier to find.

Also add helper definitions SET_PCI_ERROR_RESPONSE and
RESPONSE_IS_PCI_ERROR to make the code more readable.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 include/linux/pci.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index cd8aa6fce204..928c589bb5c4 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -154,6 +154,15 @@ enum pci_interrupt_pin {
 /* The number of legacy PCI INTx interrupts */
 #define PCI_NUM_INTX	4
 
+/*
+ * Reading from a device that doesn't respond typically returns ~0.  A
+ * successful read from a device may also return ~0, so you need additional
+ * information to reliably identify errors.
+ */
+#define PCI_ERROR_RESPONSE			(~0ULL)
+#define SET_PCI_ERROR_RESPONSE(val)	(*val = ((typeof(*val)) PCI_ERROR_RESPONSE))
+#define RESPONSE_IS_PCI_ERROR(val)	(*val == ((typeof(*val)) PCI_ERROR_RESPONSE))
+
 /*
  * pci_power_t values must match the bits in the Capabilities PME_Support
  * and Control/Status PowerState fields in the Power Management capability.
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
