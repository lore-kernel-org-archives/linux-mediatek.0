Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B15C88E5C
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 02:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9i6s6p8vgsMvcWKdXghGsBuJ/Y2ADIePCQPvKyAxig=; b=VEMQjaK/gjq4INPoWeosMvZWPY
	QtfpbGnqJhWHEGCqXVrCnx8w60hUQQ7yxWB1fZhlW2k7/pnwY3vX7oetgXBB8Aox/YfS/+c5X98RK
	KdNKpqOOEulk8iMJg1mYM5fmqI9Qb6ajjGATf7Ko/pVTy3QUUbOwDY+L1tWXDPtu8+FeutVEdG40T
	ukqtx/CwQ2m6z4RXvQCnuBVvacrX5v12NJCSrljLsKL4M6WXS0nEMlHX6Xt+v6PjBCnDMlhPj3ZbE
	7/ME/m3zfoZp5iR0yhfK1SVtAkfSud2MmetfAjdh9iqNXu2bu655SzKcJ/HvZ7nKtLtmrP7VEDnJA
	9/7E2XgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wIB-00000002AZ5-3Apt;
	Mon, 14 Sep 2026 02:19:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wI9-00000002AY8-1pqL
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 02:19:34 +0000
X-UUID: b51cedbaafe211f1acbe4559397dec65-20260913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=O9i6s6p8vgsMvcWKdXghGsBuJ/Y2ADIePCQPvKyAxig=;
	b=tBCny/7huf132D8HkR5BP6wKWDgJfzIwz1gbnKQ4XxVGZP1P+EhLF2TBuMjnXnCVR5ws3/xuc4mJ2exmczbmBkttFi6Csff1qxgkRdMXixVhSFFxSq7AjEF3H+YIQa4T4cX5p7jFmBGgpA7LU5wFOB/JnUeCGGaxkK++V1cYzV4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:622cea7b-3808-4519-865b-480b8bf1d777,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:11401fee-a58e-4e45-a0f3-0cb132acc863,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b51cedbaafe211f1acbe4559397dec65-20260913
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 500583059; Sun, 13 Sep 2026 19:19:26 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 14 Sep 2026 10:19:23 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 14 Sep 2026 10:19:23 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>,
	<lucid_duck@justthetip.ca>, <eason.lai@mediatek.com>,
	<stable@vger.kernel.org>
Subject: [PATCH v5 0/2] wifi: mt76: refine USB/SDIO TX path error handling
Date: Mon, 14 Sep 2026 10:19:18 +0800
Message-ID: <20260914021920.32246-1-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260827083526.1621600-1-eason.lai@mediatek.com>
References: <20260827083526.1621600-1-eason.lai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_191933_492726_BD51AB68 
X-CRM114-Status: UNSURE (   7.88  )
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

This series fixes a UAF in the SDIO TX path when out of memory and
a memory leak in the USB TX path.

Eason Lai (2):
  wifi: mt76: mt792x: fix UAF in SDIO TX path when out of memory
  wifi: mt76: fix memory leak in USB TX path

 drivers/net/wireless/mediatek/mt76/tx.c  |  2 +-
 drivers/net/wireless/mediatek/mt76/usb.c | 31 ++++++++++++++++++++----
 2 files changed, 27 insertions(+), 6 deletions(-)

-- 
2.45.2


