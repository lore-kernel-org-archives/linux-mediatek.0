Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371CFE88D7A
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2026 03:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HNsmfGyP1iea8kDOWPLnSkOow/9yYN9EXDfcCnDocM8=; b=MA6VGepRx7tJbsT+eju4Cj6OqC
	AW2Ft7lwlVVNAV1Tse2yUIffItHVuPYexUca28+hD+X3rOYWgoy1inDhYkjKpQFNtzGpCeaGwhsye
	YFvt+Gi7zMP66NAwrAk6hB6XmLd5c+1/JdX5CWZT1R7t6a3QBOwIBAhJuJJSvl/DGYBzFOJYbhuZh
	s8JLTZZLRHtiYKD+Zwd9W9XUKZZTScsMxD9kSolZSswO4QC46KoBTs3DNmc6KGsbi6r2y/Hhh4fGX
	itpoLWGdu1KHZ58F9exe48puXaRslIP7j3gFLpAjIb3mUUdZ9riA46eTm9TDRTvaCTSa21Zd7+QMP
	XZScFAZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8rwo-000000035as-0coh;
	Sat, 04 Apr 2026 03:45:22 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8rwk-000000035Yd-2LJz
	for linux-mediatek@lists.infradead.org;
	Sat, 04 Apr 2026 03:45:21 +0000
X-UUID: ab100b202fd811f1aa26b74ffac11d73-20260404
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:11f74241-d528-46c2-9775-852b33c553f0,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:1409f8a221cefc52db75bafb357b998a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab100b202fd811f1aa26b74ffac11d73-20260404
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1249234470; Sat, 04 Apr 2026 11:45:05 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: broonie@kernel.org,
	gch981213@gmail.com,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 0/4] cleanups in spi
Date: Sat,  4 Apr 2026 11:44:57 +0800
Message-Id: <cover.1775273351.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_204518_927546_93335142 
X-CRM114-Status: UNSURE (   5.83  )
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

hi Mark,
Some cleanups in spi. Thanks!

1.spi: uniphier: Simplify clock handling with devm_clk_get_enabled()
It might be that the previous unused variable caused it not to be merged.

2.spi: zynq-qspi: Simplify clock handling with devm_clk_get_enabled()
It was not merged. Upon checking, runtime is not used.

3.spi: mtk-snfi: unregister ECC engine on probe failure and remove()
    callback
'copy from' b0dc7e7c56573e7a52080f25f3179a45f3dd7e6f
spi: amlogic: spifc-a4: unregister ECC engine on probe failure and remove() callback

4.ch341
In Chinese, the pronunciation of this manufacturer includes an 'n' sound.
It's a bit strange that the manufacturer's name was wrong, so I still want
to correct it.

Pei Xiao (4):
  spi: mtk-snfi: unregister ECC engine on probe failure and remove()
    callback
  spi: uniphier: Simplify clock handling with devm_clk_get_enabled()
  spi: zynq-qspi: Simplify clock handling with devm_clk_get_enabled()
  spi: ch341: Correct vendor name

 drivers/spi/spi-ch341.c     |  4 ++--
 drivers/spi/spi-mtk-snfi.c  | 14 ++++++++++++++
 drivers/spi/spi-uniphier.c  | 18 ++++--------------
 drivers/spi/spi-zynq-qspi.c | 31 ++++++-------------------------
 4 files changed, 26 insertions(+), 41 deletions(-)

-- 
2.25.1


