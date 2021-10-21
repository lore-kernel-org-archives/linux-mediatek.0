Return-Path: <SRS0=9f7n=PJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CB8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 15:09:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE1EE611C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 15:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE1EE611C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1CvTlVTUK9i3U0KZ63ApbhExEuOp+fPwVhJP4Vanac=; b=LzaSLIwXHqWYBf
	f97PDoJhbEkKzFR6FNUTOPrRMRpRbXnIadnyqoxmew2uJajBHloVqSG9I6uFzU9oE/zukGceK8dIQ
	eqHWZJHceUuetbdR5Ptn/UnBIhNevlTqIJ5u54uZWq40vOXBzIlf6Dz+U8O0mhA2ULqigjFM87/ky
	OlhKzcKg+z+PEsyoMg+q5EDPHPmeD7y9HynNRP+TOvF/nHNQDVZsGf6hSN0N040PruLn30VBIt8C+
	cdylTY35sZzeAJjIhZZX0U3lZI6BaFlJlIB+KevmZwoHI9ijUznx+ZrGFc9JrqfpjGcrk/euTVkdy
	jGRqL+Pjm9fBJV3u+Fyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdZgx-007yyL-Qp; Thu, 21 Oct 2021 15:09:15 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdZgt-007yvJ-Bs; Thu, 21 Oct 2021 15:09:12 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so3371213pjl.2; 
 Thu, 21 Oct 2021 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CCqTrKqg8AEEY1fy94bWXb9atpHsOzrSvfmsYcP1Hi4=;
 b=Me2ms/bTDiHgSLBr6tSZnSGK57Xq0PodMkigjQOxBqKFSTP+S6Ys0c1z1cgwhGRzMq
 dD61uaB62U1bO0yyIAfAlye2MhW4Xb6U3f1ifwy1tiGQ5Li+LQFTluq4WPm1SzJAA/Co
 i6USRU558XPIJjQTcsE+KgIJOgcbw+05/L7J2UmMshSYeUp0D7qGGyY19TKpkvepf99M
 qKvLJ/8dCZsuaslmM7TpJXRdRFEfgA57CfrtFR+iToFz5FQ8Br1TUIR43iayrks4OUUh
 WctytAcN5Y8WaMGzxbsbtr5gt6lzr1z6E+AuwgB/M+xYSeNi2uzA3U+TvUDD8R6lKBJR
 lYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CCqTrKqg8AEEY1fy94bWXb9atpHsOzrSvfmsYcP1Hi4=;
 b=d/pQALCfAY16xUojVVKfHjhgIcyVCZjGBYIOgU+r+l/GW4bkEyWQUVpMUwr1mBvUlf
 q1n1BSEnTqRpxezJ9DcewLruVMNweVns59ycU3DyT6xPA4BVfzIsrFulwkiz0Z7SnUjl
 RjB38LdNb7V4aBcMuQt5WpaAMLFJuLrgC7RvqJFZK4XAXsEeDhvDmKOXSQuC/xCFPKU2
 Cp1B/zm/OyrQm22BFlmFyAs7zzJKcWqWY54gtb9HSp/n/43l7bAyK1LzgIVzKjaXHuGf
 4NzmjZIkvI1ICpvaBZ2BAlfx3SN+heesC8XbAqpHm+rw2TNhjDk+lK+mXlX0+WS3BBN3
 l5pA==
X-Gm-Message-State: AOAM532wL/jl1ELkYvoBv3qKiu6JebccuUEZZbSaNwSwmzwuGqNRB/cM
 Z4io6FajetVhwu0mBr2IYIg=
X-Google-Smtp-Source: ABdhPJxnxqjsJSTu0VewveiQokmLiOhsbRmw+PWUQcLpIM+kXijEvkWeAPZfgzTDW/T9CfexzBf24w==
X-Received: by 2002:a17:90b:4d88:: with SMTP id
 oj8mr5111859pjb.175.1634828949353; 
 Thu, 21 Oct 2021 08:09:09 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:09:08 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Cc: Naveen Naidu <naveennaidu479@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, skhan@linuxfoundation.org,
 Robert Richter <rric@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM IPROC ARM
 ARCHITECTURE), Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Shawn Guo <shawn.guo@linaro.org>, Xiaowei Song <songxiaowei@hisilicon.com>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Joyce Ooi <joyce.ooi@intel.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>, Amey Narkhede <ameynarkhede03@gmail.com>,
 Russell Currey <ruscur@russell.cc>, "Oliver O'Halloran" <oohall@gmail.com>,
 Sean V Kelley <sean.v.kelley@intel.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
 Marc Zyngier <maz@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Toan Le <toan@os.amperecomputing.com>
Subject: [PATCH v3 01/25] PCI: Add PCI_ERROR_RESPONSE and it's related
 definitions
Date: Thu, 21 Oct 2021 20:37:26 +0530
Message-Id: <f7960a4dee0e417eedd7d2e031d04ac9016c6686.1634825082.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634825082.git.naveennaidu479@gmail.com>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_080911_431942_E0D1BB17 
X-CRM114-Status: GOOD (  14.47  )
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

Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 include/linux/pci.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index cd8aa6fce204..689c8277c584 100644
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
+#define PCI_ERROR_RESPONSE     (~0ULL)
+#define SET_PCI_ERROR_RESPONSE(val)    (*(val) = ((typeof(*(val))) PCI_ERROR_RESPONSE))
+#define RESPONSE_IS_PCI_ERROR(val) ((val) == ((typeof(val)) PCI_ERROR_RESPONSE))
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
