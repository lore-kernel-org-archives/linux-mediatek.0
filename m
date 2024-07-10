Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F01CC3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 08:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=00qi1vCjVrBTnoMM1ymQIUcx+b2b5UPxjpcAqXcyXco=; b=Y4G+QIiDKwIOdt6W9s2CEH8UWP
	kmbTbMoBTmLxAlkqieUjNCELCwo60vDNyLIB7fZb00IhJcqWJGqae4+LLsItoxEXhycp/zyWdXVmZ
	iTweI1ipTIRwm0dAB47m70oe56RyaHAwf/Ma2/EnMeEwxUItLlHXfjyP1mVEtRP7B7aSeDOKXFa0O
	yUf10ngBGB7x29/ShHJK/Cqz9pepav642mPO3tmBR7C5qP5O7zjGqJNZJab/8JSS0sJEGp/4zWKVK
	1c7xIFCZ3HC+D4Gc2ecexlNZIuAjS3ytbdrI5y1sCrXZna6yAmyJ2uAF7EyGIyHWuLnfWhClLyYlb
	Ogagwk2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRSuy-00000009vjX-3Qxv;
	Wed, 10 Jul 2024 08:43:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRSup-00000009vhJ-0UNM;
	Wed, 10 Jul 2024 08:43:08 +0000
X-UUID: 6acbe4b83e9811ef955bff358274dad2-20240710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=00qi1vCjVrBTnoMM1ymQIUcx+b2b5UPxjpcAqXcyXco=;
	b=fctuXaPG4XNC8Fosfr6HyRUpTLneQC6ks+9KSIYTKQFaeHHUw2ZBUvuf1BIwkHcXh8mBdYzrs2yI4FeXbkn41uthyGpoV9+lpGC+Uw7hXCGEeMgMRyh2u8K5EVTGGBt6Lf7C4klTOQhGjHM/OW0I6phTVfl44eIAsm2UA5/xPHY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:562b7351-a365-4061-a0c4-503cc19e1555,IP:0,U
	RL:0,TC:0,Content:35,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:35
X-CID-META: VersionHash:ba885a6,CLOUDID:759d2cd5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 6acbe4b83e9811ef955bff358274dad2-20240710
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <shun-yi.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1414387374; Wed, 10 Jul 2024 01:43:01 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Jul 2024 01:42:24 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Jul 2024 16:42:24 +0800
From: Shun-yi Wang <shun-yi.wang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-ch.chen@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, shun-yi.wang <shun-yi.wang@mediatek.com>
Subject: [PATCH RFC 0/1] Support CMA regions
Date: Wed, 10 Jul 2024 16:41:59 +0800
Message-ID: <20240710084200.6561-1-shun-yi.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_014307_170294_44EDC039 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

From: "shun-yi.wang" <shun-yi.wang@mediatek.com>

In order to reserve specific Contiguous Memory Allocator (CMA) regions 
for hardware use. When the name of the reserved region contains "cma", 
then a corresponding CMA heap is added.

In the DTS (Device Tree Source), we may have several memory regions 
with different names, e.g.,
&scp {
	...
	memory-region = <&mem_reserved_1>, <&mem_reserved_2>;
};

mem_reserved_1: xxx-xxx-region {
	...
};
mem_reserved_2: xxx-xxx-cma-region {
	...
};

When the name of the region contains "cma", a corresponding heap 
allocator is added by cma_heap_add().
However, we are unsure if using the name "cma" as an identifier
is a good practice.
I sincerely hope that you can provide me some suggestions, thanks.
Especially within the segment of '#ifdef CONFIG_DMA_BUF_HEAPS_CMA'

Note: The cma_heap_add() is introduced from this patch:
dma-buf: heaps: Introduce cma_heap_add() for non-default CMA heap

shun-yi.wang (1):
  remoteproc: mediatek: Support reserved CMA regions

 drivers/remoteproc/mtk_scp.c | 38 ++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

-- 
2.18.0


