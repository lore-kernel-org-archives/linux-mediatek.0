Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CB6C636D3
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 06:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gfOqWGWbqteN5psBJELTgrd0wVgMuYJEk7v1sLB2r3c=; b=hUYNUuVm5I9FuO7LFuxuH/Hyuf
	S9xI7qdE0rUlbXmyghnRt9W/H00nFuZjiycqYtFdKbxPM9zuZNMPCpbbgO5Q+ey26qffro0sRnWUC
	TZeCkIgTrtfvIEIgiSlesA+97vCk3BmdsnbMmOEQDyYZsHlntdOJbhhcoIH5z+lyRDfDDGGPB8D6p
	onbIsGjDMdLbY4P7wZN/CCBtOkw3znJIw60WhUy+b8JWOjNDfUKi0cj7CpoQx6zzk4pBU8P6Z086p
	KehDm3TWLmtUiLzzooCt2Uie7bao2xQPQbm3hofyUnp/oT3Umhs1U4X5jJczrTaAfdvLURpMPpZgc
	yS0FEQcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMkCC-006Sw3-AM; Tue, 31 Jan 2023 06:32:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMkCA-006SvR-31; Tue, 31 Jan 2023 06:32:43 +0000
X-UUID: 0cbbdc1ca13111edbbe3f76fe852e059-20230130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gfOqWGWbqteN5psBJELTgrd0wVgMuYJEk7v1sLB2r3c=;
	b=EmeyFqQEGvSyO1agWudyGOX39L6kPSMbVCy5GwksUJM9hOr9TMAkvG5dud3bwDQ5hUS3ffNwmhHOnGxhb6jcaPRtELtOp/tuVgxUG43cvJuI29VFMZkCdb6v71hF7P8UFYBxDjGKjRgKWvh6o+C2/l6z5jijjHv1JlnlA1V1ELw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:cfcfd129-8e40-4381-aa7d-4da2bc68448c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:e9a6d455-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 0cbbdc1ca13111edbbe3f76fe852e059-20230130
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1895450219; Mon, 30 Jan 2023 23:32:35 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 31 Jan 2023 14:32:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 31 Jan 2023 14:32:15 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Alistair Popple <apopple@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>
CC: <chinwen.chang@mediatek.com>, <andrew.yang@mediatek.com>, Kuan-Ying Lee
	<Kuan-Ying.Lee@mediatek.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] mm/gup: Add folio to list when folio_isolate_lru() succeed
Date: Tue, 31 Jan 2023 14:32:06 +0800
Message-ID: <20230131063206.28820-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_223242_155889_EBE153A2 
X-CRM114-Status: GOOD (  12.64  )
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

If we call folio_isolate_lru() successfully, we will get
return value 0. We need to add this folio to the
movable_pages_list.

Fixes: 67e139b02d99 ("mm/gup.c: refactor check_and_migrate_movable_pages()")
Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
 mm/gup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index f3d2cccb89f8..918c364d01ac 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1914,7 +1914,7 @@ static unsigned long collect_longterm_unpinnable_pages(
 			drain_allow = false;
 		}
 
-		if (!folio_isolate_lru(folio))
+		if (folio_isolate_lru(folio))
 			continue;
 
 		list_add_tail(&folio->lru, movable_page_list);
-- 
2.18.0


