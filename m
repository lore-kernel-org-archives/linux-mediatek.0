Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBCEE92FE4
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 06:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G6RcZSK2ZXZNwpAYwk74iwfftVFpwiXwgGnN1wemDVw=; b=bX9Y23sIqz230OkoLbzLzUbJWq
	YmzgGeBv6xn1SJYnvf2hw6UucuoiV+WfyZvGlRP+s60H945l/Olpg1nvqe+DBXtkrKpEvkdv3gpaW
	ecSWqYW7HeRxza3ku9e/JiqkMNs/fuB6Gicq9s/PZz1GdCPgb8m8h/X30zmuieyKEMz8Nr2TRBiwt
	IJLDQ2VSTi0xstMijKOOxFf9zvULmnDZgcexm+3eZxDAyNql1U1ypREhkFfKLM9uYTruPrrFmqJL8
	V7cJUNU+bVV1+TXEqjZ9bKEYumtV9UTphPHmfGZybSGRyKxjU/GO1fUxBa410472f6Zvbvybug/q6
	hPhULmRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qodw6-0052kk-2j;
	Fri, 06 Oct 2023 06:03:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qodw3-0052jZ-0L;
	Fri, 06 Oct 2023 06:03:41 +0000
X-UUID: 116b3dfc640e11ee9b7791016c24628a-20231005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=G6RcZSK2ZXZNwpAYwk74iwfftVFpwiXwgGnN1wemDVw=;
	b=syw1zc431l5KIJZODYIQi5CbSTVuN9t949ZwOquQStJcrQxqfM4dyAyBTlMRx4DHMvK6x1g01oGFVwgYGgkSLRBgQ6jhIsEPNoJ5NFDqVBL2Sggb2CZ+a39x2PZh5SddFk0zTLVqWHwWgBgKZjpdLcu9/UL6yVYa5/aANyBpjvE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:5c83cd7c-ca47-4d36-9858-c1f682660451,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:a39bbf14-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 116b3dfc640e11ee9b7791016c24628a-20231005
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 227494627; Thu, 05 Oct 2023 23:03:27 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Oct 2023 14:02:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Oct 2023 14:02:50 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky
	<senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <yj.chiang@mediatek.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] zsmalloc: use copy_page for full page copy
Date: Fri, 6 Oct 2023 14:02:40 +0800
Message-ID: <20231006060245.7411-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_230339_148984_10295597 
X-CRM114-Status: GOOD (  11.50  )
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

Some architectures have implemented optimized
copy_page for full page copying, such as arm.

On my arm platform, use the copy_page helper
for single page copying is about 10 percent faster
than memcpy.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 mm/zsmalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index c743ce7a5f49..b1c0dad7f4cf 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1839,7 +1839,7 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	 * Here, any user cannot access all objects in the zspage so let's move.
 	 */
 	d_addr = kmap_atomic(newpage);
-	memcpy(d_addr, s_addr, PAGE_SIZE);
+	copy_page(d_addr, s_addr);
 	kunmap_atomic(d_addr);
 
 	for (addr = s_addr + offset; addr < s_addr + PAGE_SIZE;
-- 
2.18.0


