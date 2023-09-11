Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFC3C71153
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 01:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XdWqhKYkevuD4gHDxGKnGlxf5l7bvx+XEvKm3C2ZXss=; b=VcfZVL+kv0oojZBcGg4g72EIKo
	hLdBR482VqOJFh8xoiRXxiAaa+Z+BZUoWJUIH7guihMlrNWHmD0o+/0pWFQhsbdv0c/7RXOvaMooX
	oAb3l8uzBh93ovTV75xBiVppUpg3iNQhKeEh2fRP0AbFi7lhwUU638c/AURtxN6u6+G/7xEGZcML7
	K6WCvJHVpAN6C87cp68SDTvbd8lR3t8F6ss7+0afsN1Ky8C9o90UUEpL2g9ljYLEZeOHeoKhm7ubI
	9q/5p3AeZm073qYWD3XCnI6fhXs1XEa0lYgrgUBBd1ophlp04oG8wuat1t+R8PsSrGHXM0Lp/sccz
	DLcCm3tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfVZ5-00H2vq-1X;
	Mon, 11 Sep 2023 01:18:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfVZ2-00H2vQ-0E;
	Mon, 11 Sep 2023 01:18:09 +0000
X-UUID: 0bdc90ba504111ee86758d4a7c00f3a0-20230910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XdWqhKYkevuD4gHDxGKnGlxf5l7bvx+XEvKm3C2ZXss=;
	b=tT8f8dxfcFHVsJbfsbuWhcJpq9mxHkopa2377Kp0EmFgDylbHy4PbESxzOQ2PG1SnbQ0pCnBlksc8R2jkCojfppz7089TkC2aKafJYQf/nNh3cbpGdCpEqrH4IQ5I1iT8sXNviDj4YMPjKCAzFFRz44s7hpZG2f9I6NFPQL3UrA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:9f677da7-af12-4940-b352-5223e07440f7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:ffb688ef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0bdc90ba504111ee86758d4a7c00f3a0-20230910
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 16573676; Sun, 10 Sep 2023 18:17:59 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 09:17:56 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 09:17:56 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Yong Wu <yong.wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<anan.sun@mediatek.com>, <yf.wang@mediatek.com>, <mingyuan.ma@mediatek.com>,
	"T . J . Mercier" <tjmercier@google.com>
Subject: iommu/mediatek: Add SVP support for mt8188
Date: Mon, 11 Sep 2023 09:17:47 +0800
Message-ID: <20230911011751.29906-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_181808_120939_490AA3D0 
X-CRM114-Status: UNSURE (   7.61  )
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

This patchset adds support for SVP(Secure video play). We always use the
last bank(id:4) to map secure memory. But the detail mapping and control
information are in the TEE. In kernel, We just register the IRQ to report
specific information when secure translation fault occurs.

Base on v6.6-rc1.

Yong Wu (4):
  iommu/mediatek: Initialise the secure bank
  iommu/mediatek: Add irq handle for secure bank
  iommu/mediatek: Avoid access secure bank register in runtime_suspend
  iommu/mediatek: mt8188: Enable secure bank for MM IOMMU

 drivers/iommu/mtk_iommu.c  | 94 +++++++++++++++++++++++++++-----------
 include/soc/mediatek/smi.h |  1 +
 2 files changed, 69 insertions(+), 26 deletions(-)

-- 
2.18.0



