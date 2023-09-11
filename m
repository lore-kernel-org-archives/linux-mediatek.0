Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F85CC71153
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 02:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+87uOL2WQvYvX9g5bStM5h9swQ1laB4yxiMeMo2iqXc=; b=X2TJW2oGpbq+GZbHmdTt9U2rql
	538mzmxLtMrDYL3p6rZDM/iaUyI9orRnQ09rZfagQrT388ObS9JcnxMmt2/ETNS5wfYkgrmOWDXey
	pVQE3U+Y84fO97WhlXQsfJbpqjjPUQKEjzYMqU7snXlL5E4iN6167ltWXQDpXVQtao4fRFJ92oIMf
	1SDsKKLjkDBX3vjJ5M73qQjBO/3aKvSjkHzKZgU55vgWCJgJ4bazFGQti2jI+uY+jwO3T31cYmitY
	dqjFz+bk60/+4w1K7b3whs5m0uy2oXugl3rqXY7x7/pC3n1reeGnOacmsdVeW1na5OrJrp2W4Opgq
	14MDptAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfWhV-00H5oQ-35;
	Mon, 11 Sep 2023 02:30:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfWhS-00H5na-0Q;
	Mon, 11 Sep 2023 02:30:55 +0000
X-UUID: 37908310504b11ee86758d4a7c00f3a0-20230910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+87uOL2WQvYvX9g5bStM5h9swQ1laB4yxiMeMo2iqXc=;
	b=uf2/Wzg+L7T9MTAwoxRWPDfyQUIyCXE0Hxfbpd3z4Ot7lzyqPcWbk4O4xh7hh9E8y45mJKqChOgOFP9EF9naY5Gdk/LEGyxBY3/4r3IOo4Os4WsSemPu36wTXwRLsVKa+x8NEqVQB2TXZtAhjvT8S2sZri8wfjQveu6OzbfAAG8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:4eb1c3de-6fa2-460a-a601-ba8e58ac02c9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:0ad78a4,CLOUDID:9d07dec2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 37908310504b11ee86758d4a7c00f3a0-20230910
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2016634683; Sun, 10 Sep 2023 19:30:48 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 10:30:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 10:30:44 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
	<tjmercier@google.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <jianjiao.zeng@mediatek.com>,
	<kuohong.wang@mediatek.com>
Subject: [PATCH 0/9] dma-buf: heaps: Add MediaTek secure heap
Date: Mon, 11 Sep 2023 10:30:29 +0800
Message-ID: <20230911023038.30649-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_193054_182394_3F6A0A6A 
X-CRM114-Status: GOOD (  11.19  )
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

This patchset consists of two parts, the first is from John and TJ.
It adds some heap interfaces, then our kernel users could allocate buffer
from special heap. The second part is adding MTK secure heap for SVP
(Secure Video Path). A total of two heaps are added, one is mtk_svp and
the other is mtk_svp_cma. The mtk_svp buffer is reserved for the secure
world after bootup and it is used for ES/working buffer, while the
mtk_svp_cma buffer is dynamically reserved for the secure world and will
be get ready when we start playing secure videos, this heap is used for the
frame buffer. Once the security video playing is complete, the CMA will be
released.

For easier viewing, I've split the new heap file into several patches.

The consumers of new heap and new interfaces are our codec and drm which
will send upstream soon, probably this week.

Base on v6.6-rc1.

John Stultz (2):
  dma-heap: Add proper kref handling on dma-buf heaps
  dma-heap: Provide accessors so that in-kernel drivers can allocate
    dmabufs from specific heaps

T.J. Mercier (1):
  dma-buf: heaps: Deduplicate docs and adopt common format

Yong Wu (6):
  dma-buf: heaps: Initialise MediaTek secure heap
  dma-buf: heaps: mtk_sec_heap: Initialise tee session
  dma-buf: heaps: mtk_sec_heap: Add tee service call for buffer
    allocating/freeing
  dma-buf: heaps: mtk_sec_heap: Add dma_ops
  dt-bindings: reserved-memory: MediaTek: Add reserved memory for SVP
  dma_buf: heaps: mtk_sec_heap: Add a new CMA heap

 .../mediatek,secure_cma_chunkmem.yaml         |  42 ++
 drivers/dma-buf/dma-heap.c                    | 127 +++--
 drivers/dma-buf/heaps/Kconfig                 |   8 +
 drivers/dma-buf/heaps/Makefile                |   1 +
 drivers/dma-buf/heaps/mtk_secure_heap.c       | 458 ++++++++++++++++++
 include/linux/dma-heap.h                      |  42 +-
 6 files changed, 630 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,secure_cma_chunkmem.yaml
 create mode 100644 drivers/dma-buf/heaps/mtk_secure_heap.c

-- 
2.18.0



