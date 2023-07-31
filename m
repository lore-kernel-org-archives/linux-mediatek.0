Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322A1C001DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 12:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C6CrSBdjoAyzVpB6u/w8qzO48wNDLvceWe2rRQBmWzY=; b=aLO4YUTL6Kjtx0MfDajiU2HzIf
	qrkRkjD7LoSztjpvvh+KWQlqmEffqo3ihggRw0f28ijda8V4FcjYmV/8Zyy4Qjy/OA2ZQQDvhxlha
	W+7EKT880YeCoauR7emEcEm3wD3P5U8jMu0sDUNf/qMDBkaEg8j8h2i2Eg0shvBdG8Mw/TxCTgTtK
	oQleeE+XxTEP33ldkSiiPg1eJdYTWa0KUE9XDwnLwibRpAQ8jG3FTiUffass5zH5vGiYsvy1jB/jp
	0ztY6b9p3SDic/KelOIpSs67l2rp3uUtwr4p4D9oLtpPc4B6Up5rtAegt3cRmWMZDaTjZ2Lp6EEys
	0y1qlQlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRfT-00FVKe-0s;
	Mon, 31 Jul 2023 12:06:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRfR-00FVIi-19;
	Mon, 31 Jul 2023 12:06:30 +0000
X-UUID: a962576a2f9a11ee912e1518a6540028-20230731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=C6CrSBdjoAyzVpB6u/w8qzO48wNDLvceWe2rRQBmWzY=;
	b=dkhSndMqGlZ9VYhEzuPygaPnNLY9kuMGzrE1CW1EF5p95rcnNJCh3NNOPBMSAulzKmf6KTd30rHaRdqPE7z9Di4S6NqY9EuQsAue8GtsE+tZI3xErMmWtZWu9awXTNE8rGnAhFU/j7xLogUg32HLadMU65hG/BzHrDtnSVY4PUw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:e8b40d97-946a-475a-afd7-3e42577b9c17,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:75
X-CID-INFO: VERSION:1.1.30,REQID:e8b40d97-946a-475a-afd7-3e42577b9c17,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
	ION:quarantine,TS:75
X-CID-META: VersionHash:1fcc6f8,CLOUDID:be9cfbb3-a467-4aa9-9e04-f584452e3794,B
	ulkID:230731200549UTEE0GFU,BulkQuantity:1,Recheck:0,SF:48|38|29|28|17|19,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,
	TF_CID_SPAM_ASC
X-UUID: a962576a2f9a11ee912e1518a6540028-20230731
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1186772968; Mon, 31 Jul 2023 05:06:20 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 31 Jul 2023 20:05:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 31 Jul 2023 20:05:47 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
	<glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov
	<dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Russell
 King <linux@armlinux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <yj.chiang@mediatek.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	<kasan-dev@googlegroups.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] arm: kasan: Use memblock_alloc_try_nid_raw for shadow page allocation
Date: Mon, 31 Jul 2023 20:05:36 +0800
Message-ID: <20230731120537.13152-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_050629_397363_994AB01E 
X-CRM114-Status: GOOD (  11.78  )
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

kasan_pte_populate fill KASAN_SHADOW_INIT in the newly
allocated shadow page, so it's unnecessary to
use memblock_alloc_try_nid, which always zero the
new allocated memory.

Use memblock_alloc_try_nid_raw instead of
memblock_alloc_try_nid like arm64 does which
can make kasan init faster.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 arch/arm/mm/kasan_init.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/kasan_init.c b/arch/arm/mm/kasan_init.c
index 24d71b5db62d..111d4f703136 100644
--- a/arch/arm/mm/kasan_init.c
+++ b/arch/arm/mm/kasan_init.c
@@ -28,6 +28,12 @@ static pgd_t tmp_pgd_table[PTRS_PER_PGD] __initdata __aligned(PGD_SIZE);
 
 pmd_t tmp_pmd_table[PTRS_PER_PMD] __page_aligned_bss;
 
+static __init void *kasan_alloc_block_raw(size_t size)
+{
+	return memblock_alloc_try_nid_raw(size, size, __pa(MAX_DMA_ADDRESS),
+				      MEMBLOCK_ALLOC_NOLEAKTRACE, NUMA_NO_NODE);
+}
+
 static __init void *kasan_alloc_block(size_t size)
 {
 	return memblock_alloc_try_nid(size, size, __pa(MAX_DMA_ADDRESS),
@@ -50,7 +56,7 @@ static void __init kasan_pte_populate(pmd_t *pmdp, unsigned long addr,
 			if (!pte_none(READ_ONCE(*ptep)))
 				continue;
 
-			p = kasan_alloc_block(PAGE_SIZE);
+			p = kasan_alloc_block_raw(PAGE_SIZE);
 			if (!p) {
 				panic("%s failed to allocate shadow page for address 0x%lx\n",
 				      __func__, addr);
-- 
2.18.0


