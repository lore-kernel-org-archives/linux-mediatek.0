Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D70C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 08:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S8Q7Mv3mUGNGzzvuC/1WOIYCEeIgNGLe2Uxin8KDTig=; b=QUFi7e5nR5cb235raRo6Ya/5DM
	HibXRb5B+FymY7lU22+o3TgJsnCEi+hL98/SHramJDNR18YwTciiOJjWeZI+P4/cIyJF3LP+BAMYR
	+4ws9/ryLi5ehLYW8grRplpfLEGue01DWT86VElgMijVml2la7ZMOYCNITse/vT7jtriXcvjjrAcS
	2G6MA/qEpmFPyMNGsITdc2haC47Lzm/w6pOVeRD0I4B9bhHe/XAWqsq2PFrZBg6V9xb5UWHrWPTXV
	Dw0u3KgoffVo+yACztPkJbTwuknvvXNBjEXrWMnzJBxEIt5042mSu9fjTa+vz7NSOu7IcKUB3GFFq
	/vFDczwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCc2u-004OCu-00;
	Mon, 11 Dec 2023 08:53:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCc2s-004OBw-0V;
	Mon, 11 Dec 2023 08:53:47 +0000
X-UUID: c7635b12980211ee9b09ad09c76753c8-20231211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=S8Q7Mv3mUGNGzzvuC/1WOIYCEeIgNGLe2Uxin8KDTig=;
	b=JHJTPgOuYIt1ikFYTXlsJD4WRlmRJZZ5/+qQKKGqY8Meolo+fJ+J+dW0fkwmGMwFoRBMYEfibULHW5dECRMCT/swoCPUJL7HT8fZHDmT9E/x51eh5REZhVuogb4/pawnf6HPiVNOaA+IxaRvUvjw1Dlk2LHBPpQjj0U4yzUGST8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:4ece2399-5887-49b4-bae7-712f90e5ba88,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:0ae2a573-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c7635b12980211ee9b09ad09c76753c8-20231211
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 789160420; Mon, 11 Dec 2023 01:53:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Dec 2023 16:53:06 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Dec 2023 16:53:05 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring
	<robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Marc Zyngier <maz@kernel.org>
CC: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
	<jianjun.wang@mediatek.com>, <linux-pci@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jieyy.yang@mediatek.com>,
	<chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
	<jian.yang@mediatek.com>, <jianguo.zhang@mediatek.com>
Subject: [PATCH v2 0/3] PCI: mediatek: Allocate MSI address with dmam_alloc_coherent()
Date: Mon, 11 Dec 2023 16:52:53 +0800
Message-ID: <20231211085256.31292-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_005346_203605_0DB2D58B 
X-CRM114-Status: UNSURE (   8.66  )
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

These series of patches change the allocation of MSI address on MediaTek
platform, which uses dmam_alloc_coherent() to allocate the MSI address.

Changes in v2:
1. Add a separate patch for pcie-mediatek-gen3.c to prevent break the
   probe flow when MSI init fails.
2. Change the location of allocate the MSI address to prevent break the
   probe flow.

Jianjun Wang (3):
  PCI: mediatek: Allocate MSI address with dmam_alloc_coherent()
  PCI: mediatek-gen3: Do not break probe flow when MSI init fails
  PCI: mediatek-gen3: Allocate MSI address with dmam_alloc_coherent()

 drivers/pci/controller/pcie-mediatek-gen3.c | 126 +++++++++++---------
 drivers/pci/controller/pcie-mediatek.c      |  24 ++--
 2 files changed, 83 insertions(+), 67 deletions(-)

-- 
2.18.0


