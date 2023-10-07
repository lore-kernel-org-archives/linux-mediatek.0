Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37762E936FB
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Oct 2023 07:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Le2uEJkChO2HUGa5K2hUsEoIn2/h+RuIAwUyZABd/Fg=; b=xdcGFyN7685Jqsma+Blyb0atUv
	PZCRaI/cRRg5S+WCzTbTjxrH4rIgc9UFBRKNufsKDsDoAj/Sht2VIEEsn4BVY0VilIUVMWuVNrARh
	26lUovLseuCrAxtzE2yxlgyHZzkDhiYESrVwxgSfiT1NFI3dpn1jk1jCnkptfVzjIzX2J89jwEx+4
	mnPchb/7vN5KVF7oO/AxLcq+CXa5wXuGKt3iD6oVhglhi704qZ3yWWcntXCk4hkfZIS0NXB1kj9UV
	unsi1ihGCLtxu5HGjrRijmrfNPJvfn4OjwkFpUo/w+fHUCtOjGX7451UfIHtIDBjYTTN1VjplTd9h
	f0ZXZp6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp1OZ-0076IT-2o;
	Sat, 07 Oct 2023 07:06:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp1OW-0076I3-26;
	Sat, 07 Oct 2023 07:06:38 +0000
X-UUID: 0a60b74e64e011ee86758d4a7c00f3a0-20231007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Le2uEJkChO2HUGa5K2hUsEoIn2/h+RuIAwUyZABd/Fg=;
	b=WVvFhP66Bn09GC4ehoj3v7McO/7dAlm7FQtEoYyJGpz57+kyy9HntBI3tFKbr9fnXXhC1UXvcRpauw3fk464H9v2p/QJFmM8Dxl/x0bxWCdg0ITbuKVXbJHJePBNUML7jWG5UHG4IdQFhdcrph3qE7k7wvireaH3EL6hWmeQ4uE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:6542c364-79ae-4dac-9d79-a960d84fcfba,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:c452dfc3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0a60b74e64e011ee86758d4a7c00f3a0-20231007
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 183819882; Sat, 07 Oct 2023 00:06:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 7 Oct 2023 15:05:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 7 Oct 2023 15:05:56 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky
	<senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <yj.chiang@mediatek.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-block@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] zram: use copy_page for full page copy
Date: Sat, 7 Oct 2023 15:05:53 +0800
Message-ID: <20231007070554.8657-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.565200-8.000000
X-TMASE-MatchedRID: 7599MfAx46VCTeJ8Ii+TOrhzZI/dfrdOQl/FdRYkUZLfUZT83lbkECpJ
	3T68EJKPEwte8QHPZve6/wFvLeWXhqYpNU5HIIOKngIgpj8eDcBpkajQR5gb3savT21DsLD/UEh
	Wy9W70AEgBwKKRHe+r7RUJtZc0bvVaYlP96BGyA9Gf+arKp5f1G0XrKRZbupyMWoRxFL7SRo=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.565200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C9F30F95FEA5B0A71375788D323ADC74DC144382AC8BD65FBB276596CD102A452000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_000636_699767_00E3DDE4 
X-CRM114-Status: GOOD (  11.89  )
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

Some architectures, such as arm, have implemented
optimized copy_page for full page copying.

Replace the full page memcpy with copy_page to
take advantage of the optimization.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 drivers/block/zram/zram_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index d77d3664ca08..58700dd73d1d 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1338,7 +1338,7 @@ static int zram_read_from_zspool(struct zram *zram, struct page *page,
 	src = zs_map_object(zram->mem_pool, handle, ZS_MM_RO);
 	if (size == PAGE_SIZE) {
 		dst = kmap_atomic(page);
-		memcpy(dst, src, PAGE_SIZE);
+		copy_page(dst, src);
 		kunmap_atomic(dst);
 		ret = 0;
 	} else {
-- 
2.18.0


