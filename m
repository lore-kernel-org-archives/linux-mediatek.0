Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EA5E95A91
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 07:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pvei1ks/khlX8BXIzq4Y8G7n7B36rJvutKNZiv35fU8=; b=Ef39c0cKfCkiNLTK9SiPOsgPAY
	rGPd+fHG1KaC77Wduct1eeOBekBiCyB8+1gOVUxQUU6qT18MYpDpTzd8BbQxrfa1EQzB3Zy6VqXYj
	1+zMest1+qcdKJe+RKSigIEM2bmfjH0wkfRnd1vyW2sFuRZYI9+HaAxwpmEPp6MQSXf1OCoyqVv0u
	thPadGqk9s+6ySydD8G66NmzRmsfh+Lq5sbtD9+p5B1asweQYsLp1IVaBhykFkz2RIl4aXpGrxlsU
	/Bvn1yvf+lU//0HjxbzpoGff1cqySoRzba9T6zN1GG9ma5906+ar20OsK2/hrg7EwVZoI/HezDfQD
	Ad8MxRQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpkq4-009uVm-1w;
	Mon, 09 Oct 2023 07:38:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpkq1-009uV1-2I;
	Mon, 09 Oct 2023 07:38:03 +0000
X-UUID: c1ae73e0667611ee86758d4a7c00f3a0-20231009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Pvei1ks/khlX8BXIzq4Y8G7n7B36rJvutKNZiv35fU8=;
	b=CVKhhfHi9bd2XgA/z1z17yMtTqoLB6cjoeywu+9/JD29PMECgRRlB4HErEP+jZ2bV0czL9NJCGAHOEJGzqjNO/9/H0mqDOu55IIYHxpBkUhL887FlnFFdk49ys4AGwDP1MQeNzBH2K4qsJCMs2dCVJBZUldOw6WgXdEvs3KaCYQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:da29afdf-0303-4bfd-9743-a167875a0e11,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:b178ebc3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: c1ae73e0667611ee86758d4a7c00f3a0-20231009
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1059083868; Mon, 09 Oct 2023 00:37:53 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 9 Oct 2023 15:37:50 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 9 Oct 2023 15:37:50 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
	<glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov
	<dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <kasan-dev@googlegroups.com>,
	<linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <xiaoming.yu@mediatek.com>, Haibo Li
	<haibo.li@mediatek.com>
Subject: [PATCH v2] kasan:print the original fault addr when access invalid shadow
Date: Mon, 9 Oct 2023 15:37:48 +0800
Message-ID: <20231009073748.159228-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.043300-8.000000
X-TMASE-MatchedRID: vb/S/ihWjLk3hN8xy8q7MnQIOMndeKgEMApqy5cfknVXPwnnY5XL5Mla
	v/so0mjiO51tDCZfaDqmvurnuvPUoT9WWWmKWtUYSHCU59h5KrEBmf/gD11vZI9x3aMQAmDtFTf
	B1yBPlPICwWUI3NaNHbRCpOgpqZeg9BhkkEGgXxGzI1v7J4hECko8jH4wkX2j31GU/N5W5BC4Nj
	3Kc7xHIlgw2yKNObv1gO92fqQQImpcPJ5MOmncJgwfhKwa9GwDfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtviI7BBDiM2KwfWryaaWDXBKZmjqY1lnK7Ipy5jxIfwR5XDkPsW+gWg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.043300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: EE42831E05BD0403DB997D7B3FD28C9A3D60B62DA7DC7C0632785B74A443CFC22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_003801_753413_4472F183 
X-CRM114-Status: GOOD (  15.19  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

when the checked address is illegal,the corresponding shadow address
from kasan_mem_to_shadow may have no mapping in mmu table.
Access such shadow address causes kernel oops.
Here is a sample about oops on arm64(VA 39bit) 
with KASAN_SW_TAGS and KASAN_OUTLINE on:

[ffffffb80aaaaaaa] pgd=000000005d3ce003, p4d=000000005d3ce003,
    pud=000000005d3ce003, pmd=0000000000000000
Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
Modules linked in:
CPU: 3 PID: 100 Comm: sh Not tainted 6.6.0-rc1-dirty #43
Hardware name: linux,dummy-virt (DT)
pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __hwasan_load8_noabort+0x5c/0x90
lr : do_ib_ob+0xf4/0x110
ffffffb80aaaaaaa is the shadow address for efffff80aaaaaaaa.
The problem is reading invalid shadow in kasan_check_range.

The generic kasan also has similar oops.

It only reports the shadow address which causes oops but not
the original address.

Commit 2f004eea0fc8("x86/kasan: Print original address on #GP")
introduce to kasan_non_canonical_hook but limit it to KASAN_INLINE.

This patch extends it to KASAN_OUTLINE mode.

Signed-off-by: Haibo Li <haibo.li@mediatek.com>
---
v2:
- In view of the possible perf impact by checking shadow address,change 
   to use kasan_non_canonical_hook as it works after oops.
---
 include/linux/kasan.h | 6 +++---
 mm/kasan/report.c     | 4 +---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 3df5499f7936..a707ee8b19ce 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -466,10 +466,10 @@ static inline void kasan_free_module_shadow(const struct vm_struct *vm) {}
 
 #endif /* (CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS) && !CONFIG_KASAN_VMALLOC */
 
-#ifdef CONFIG_KASAN_INLINE
+#ifdef CONFIG_KASAN
 void kasan_non_canonical_hook(unsigned long addr);
-#else /* CONFIG_KASAN_INLINE */
+#else /* CONFIG_KASAN */
 static inline void kasan_non_canonical_hook(unsigned long addr) { }
-#endif /* CONFIG_KASAN_INLINE */
+#endif /* CONFIG_KASAN */
 
 #endif /* LINUX_KASAN_H */
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index ca4b6ff080a6..3974e4549c3e 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -621,9 +621,8 @@ void kasan_report_async(void)
 }
 #endif /* CONFIG_KASAN_HW_TAGS */
 
-#ifdef CONFIG_KASAN_INLINE
 /*
- * With CONFIG_KASAN_INLINE, accesses to bogus pointers (outside the high
+ * With CONFIG_KASAN, accesses to bogus pointers (outside the high
  * canonical half of the address space) cause out-of-bounds shadow memory reads
  * before the actual access. For addresses in the low canonical half of the
  * address space, as well as most non-canonical addresses, that out-of-bounds
@@ -659,4 +658,3 @@ void kasan_non_canonical_hook(unsigned long addr)
 	pr_alert("KASAN: %s in range [0x%016lx-0x%016lx]\n", bug_type,
 		 orig_addr, orig_addr + KASAN_GRANULE_SIZE - 1);
 }
-#endif
-- 
2.18.0


