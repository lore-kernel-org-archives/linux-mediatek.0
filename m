Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D32AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 00:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hiQNLyp6kDMbDyQnOsgToLbnBeQJVPItqTyxCXWzluM=; b=vPsXd4KM1f0Wkf
	rgoFSIMOb5kpo5ByJ/W9Fk4G6EFOrowNGOlOMYzuxGUHkdcrEHGjHiOLKsamMuWwf2GlRFgTn5uVj
	tI2tdifOcjrCLAywo55GtnIknEEQPyk/HJF1gWydcmJ5btO+MjnrcvlujcZiVUL3/TYCUay0vkem/
	nDEPS19sSlgCXtL6B2CgdQNLF/01r+H7PofKDwRb/gIVKVTbk+it/q5/RdfXH0l5SDfPfwOjlwsjY
	KRiYPjlEPgtK93Dyjas6QKLGyMsLbj261iE6FnNmiegyflPuu6YmpdGXfshlhoxfurhSYaqqP9Kc8
	kMttHDeOMZeAW7dWI5VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIJaA-005I3F-OG; Fri, 11 Feb 2022 00:14:38 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIJZy-005I0q-Oa; Fri, 11 Feb 2022 00:14:28 +0000
Received: by mail-pl1-x633.google.com with SMTP id x3so3288030pll.3;
 Thu, 10 Feb 2022 16:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9fDAF8X8Fc16BM/UGlkxTgN+MKXCULAYOKP8eqzMERk=;
 b=dBIv+vQgH8sLnxQcKrIIiMMmHs2a93SjcNMIG0txbKJAxMwZShzuAIGy+6osS/9eYh
 3quuI2z1PaGEcJ4vJ/Q06qdYJ6nur0HMtKfgZJKgW7Hvgl782TVmTF0uzewIvKL8vlNM
 imw1QH16+a4mH9J63KyEayApZhtzrt6GbDvCtHKMBrA2J2Q/ux5AnLSF6TfJgNw1A4Bn
 0fyIe/EAQfpr0VhavoJFwZoVHexxT6w3vcXBCKWkUE93DunAAHU+mErcEhQaGshSAixx
 Qak7LtHPk2HQdcvG86KTiz1e7e4LhSyo9RH28WOEDI+4wQDtmZ1OmNl83fTo4GknVThk
 RhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9fDAF8X8Fc16BM/UGlkxTgN+MKXCULAYOKP8eqzMERk=;
 b=GdrYluptIsRKbggOK9LmH4Dd/czVWgXppHe8fUJZ7Vln7d9WZ9fp7XS+wSpyIb+0jr
 NzOl9PTAjH2NPTujBWfzTMgjQ3mMiLQ4UzkMB2SYL+lHy6a8PbY1g8unYJCMd6+uCS4T
 isSHHqi5SmeTRdqFdCPFscMTWL9xbGF1k1PsNvmDar1F0lBxt+/lrTMRkJDLDUxAOUVf
 dzkUPyDDHHTvMJnU1/kds33dLv9VUxqs/DfFu8zS60mCyrkYYgEOXGJ3ZIZ0astrskO0
 vKez1Q8CYqVl7N/Vci/VZlaVTKF+jccqZOWQBjO5Wge+rpJNX63nL7kdJk6L2hP64I6N
 eQcw==
X-Gm-Message-State: AOAM533K0ri7SrsINfTGc8hW0S5w1IvR9UhGjeAeGieb67Efji62h5Ts
 +P5sUyq9AqZxrhVH9+WEx2I=
X-Google-Smtp-Source: ABdhPJyTW1FzA/TJ0begPk8qu38cqR9Y8WG85GOzhLikIoWO5rSMey4rPwSgG3ZC8JXPYfcazfkUtQ==
X-Received: by 2002:a17:90b:1d84:: with SMTP id
 pf4mr5403535pjb.106.1644538465112; 
 Thu, 10 Feb 2022 16:14:25 -0800 (PST)
Received: from guoguo-omen.lan ([240e:379:96b:fc59:8af:1020:18bc:afc2])
 by smtp.gmail.com with ESMTPSA id h6sm25553351pfc.96.2022.02.10.16.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 16:14:24 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
 Rui Salvaterra <rsalvaterra@gmail.com>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: ralink: mt7621: do memory detection on KSEG1
Date: Fri, 11 Feb 2022 08:13:44 +0800
Message-Id: <20220211001345.3429572-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_161426_835533_1708082D 
X-CRM114-Status: GOOD (  13.35  )
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

It's reported that current memory detection code occasionally detects
larger memory under some bootloaders.
Current memory detection code tests whether address space wraps around
on KSEG0, which is unreliable because it's cached.

Rewrite memory size detection to perform the same test on KSEG1 instead.
While at it, this patch also does the following two things:
1. use a fixed pattern instead of a random function pointer as the magic
   value.
2. add an additional memory write and a second comparison as part of the
   test to prevent possible smaller memory detection result due to
   leftover values in memory.

Fixes: 139c949f7f0a MIPS: ("ralink: mt7621: add memory detection support")
Reported-by: Rui Salvaterra <rsalvaterra@gmail.com>
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 arch/mips/ralink/mt7621.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index d6efffd4dd20..12c8808e0dea 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -22,7 +22,9 @@
 
 #include "common.h"
 
-static void *detect_magic __initdata = detect_memory_region;
+#define MT7621_MEM_TEST_PATTERN         0xaa5555aa
+
+static u32 detect_magic __initdata;
 
 int pcibios_root_bridge_prepare(struct pci_host_bridge *bridge)
 {
@@ -58,24 +60,32 @@ phys_addr_t mips_cpc_default_phys_base(void)
 	panic("Cannot detect cpc address");
 }
 
+static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
+{
+	void *dm = (void *)KSEG1ADDR(&detect_magic);
+
+	if (CPHYSADDR(dm + size) >= MT7621_LOWMEM_MAX_SIZE)
+		return true;
+	__raw_writel(MT7621_MEM_TEST_PATTERN, dm);
+	if (__raw_readl(dm) != __raw_readl(dm + size))
+		return false;
+	__raw_writel(!MT7621_MEM_TEST_PATTERN, dm);
+	return __raw_readl(dm) == __raw_readl(dm + size);
+}
+
 static void __init mt7621_memory_detect(void)
 {
-	void *dm = &detect_magic;
 	phys_addr_t size;
 
-	for (size = 32 * SZ_1M; size < 256 * SZ_1M; size <<= 1) {
-		if (!__builtin_memcmp(dm, dm + size, sizeof(detect_magic)))
-			break;
+	for (size = 32 * SZ_1M; size <= 256 * SZ_1M; size <<= 1) {
+		if (mt7621_addr_wraparound_test(size)) {
+			memblock_add(MT7621_LOWMEM_BASE, size);
+			return;
+		}
 	}
 
-	if ((size == 256 * SZ_1M) &&
-	    (CPHYSADDR(dm + size) < MT7621_LOWMEM_MAX_SIZE) &&
-	    __builtin_memcmp(dm, dm + size, sizeof(detect_magic))) {
-		memblock_add(MT7621_LOWMEM_BASE, MT7621_LOWMEM_MAX_SIZE);
-		memblock_add(MT7621_HIGHMEM_BASE, MT7621_HIGHMEM_SIZE);
-	} else {
-		memblock_add(MT7621_LOWMEM_BASE, size);
-	}
+	memblock_add(MT7621_LOWMEM_BASE, MT7621_LOWMEM_MAX_SIZE);
+	memblock_add(MT7621_HIGHMEM_BASE, MT7621_HIGHMEM_SIZE);
 }
 
 void __init ralink_of_remap(void)
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
