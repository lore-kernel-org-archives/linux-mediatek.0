Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BB9EDE990
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 08:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mlOEeXuSL3Jd9KWoAGMasqY7uUX1ru96a24IVEsPgXk=; b=d6aJPx8X3ZhPtTy15K98qM9TeW
	bqDkhkQDIQtezM3g6qFx0VA59F9n7gws6nDc7Lp2n6RzE5JLueKtAWGsEpYnkEEk1Q70WZJDZkRBL
	CMHmuB8ntI3fg6wGMOHlsKq2vHf5+xcOvoo10KKW0IT5nOVGa2IQvstvpE1MmJ21B1PRltz8k3RGP
	U4k/g/ao72ilTRnHJC9Gi9UdCexcoM52qn6q4V50xu5YDkcFKQe0/U+Glp/8C8jIzDoc6g1YToadY
	pGAwBLfln0fEdc/pwWV1mARufLJOHmIaP1xbaRDV4cH+buvmgKOqBuEjPFJiMA9HHUDNZ0ZEdRZLa
	yd2PIpNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghPN-007f5a-0w;
	Thu, 14 Sep 2023 08:09:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghPK-007f2K-10;
	Thu, 14 Sep 2023 08:09:03 +0000
X-UUID: f1efcb1c52d511ee86758d4a7c00f3a0-20230914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=mlOEeXuSL3Jd9KWoAGMasqY7uUX1ru96a24IVEsPgXk=;
	b=nbN5kH2ZHeBSmRDbusxGl/9eZ7H7OM8VxEjN4Ceca7hkyiE0CFGeQkeuunWg5eIxbwkPkmeufwzTexRgUinXlwQ7jnxFzPWvyYuJLwqC/Lu3A8Lec/y8ZBCSLi0HkNR5XSRzUt5nmpMC2GJwBAABc2a32vq8tNsraXzIPxgHiVg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:d9c1bb89-a0b9-41d5-abb9-5a5aca5353d4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:ab31ee13-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f1efcb1c52d511ee86758d4a7c00f3a0-20230914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 805472291; Thu, 14 Sep 2023 01:08:53 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Sep 2023 16:08:35 +0800
Received: from mszsdtlt101.gcn.mediatek.inc (10.16.4.141) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Sep 2023 16:08:34 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <xiaoming.yu@mediatek.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>, Andrey Konovalov
	<andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <kasan-dev@googlegroups.com>,
	<linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Haibo Li <haibo.li@mediatek.com>
Subject: [PATCH] kasan:fix access invalid shadow address when input is illegal
Date: Thu, 14 Sep 2023 16:08:33 +0800
Message-ID: <20230914080833.50026-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_010902_373086_54F3D7B6 
X-CRM114-Status: GOOD (  14.03  )
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

when the input address is illegal,the corresponding shadow address
from kasan_mem_to_shadow may have no mapping in mmu table.
Access such shadow address causes kernel oops.
Here is a sample about oops on arm64(VA 39bit) with KASAN_SW_TAGS on:

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

To fix it,check shadow address by reading it with no fault.

After this patch,KASAN is able to report invalid memory access
for this case.

Signed-off-by: Haibo Li <haibo.li@mediatek.com>
---
 mm/kasan/kasan.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index f70e3d7a602e..bd30f35e18b2 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -304,8 +304,17 @@ static __always_inline bool addr_has_metadata(const void *addr)
 #ifdef __HAVE_ARCH_SHADOW_MAP
 	return (kasan_mem_to_shadow((void *)addr) != NULL);
 #else
-	return (kasan_reset_tag(addr) >=
-		kasan_shadow_to_mem((void *)KASAN_SHADOW_START));
+	u8 *shadow, shadow_val;
+
+	if (kasan_reset_tag(addr) <
+		kasan_shadow_to_mem((void *)KASAN_SHADOW_START))
+		return false;
+	/* use read with nofault to check whether the shadow is accessible */
+	shadow = kasan_mem_to_shadow((void *)addr);
+	__get_kernel_nofault(&shadow_val, shadow, u8, fault);
+	return true;
+fault:
+	return false;
 #endif
 }
 
-- 
2.25.1


