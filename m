Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6742CCF9E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 07:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u2VyllAmx1eNrj4fBWbMCyugVwolephg65owyjKq1Jk=; b=uDqxN7yioe8uFILoYQDOcC2KFc
	StwJGUC5ydZEArVaG939K152GgXzXeSRrwpCMOu3Tbn2GoojL1k8RxFjhzJlo+jrjUC4lOXXjSTvp
	miuOqDQZP5MOuRnrau0awk/aH6q0+A8gXB/By7X7DwrZnHEIA1LZZSWjq77yyLnJ4faguuy3PPSCr
	0tVbLOi5g7z830OIEUPJfVsctBeLhufRzJ6rBfafghiVySKuJBtTWeHXIEL9xy/4U5sQsAXshaEBX
	dxa6YR9DjyNpZ2v15z9yF9SWwL6CESWkRvNxYNQJkixXhJZ2yJRs20fV1wCLmgP+MbBxMvQPPKNHj
	66DuEQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stinX-00000007UCE-2su0;
	Thu, 26 Sep 2024 07:20:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stiYF-00000007R8N-1kL8;
	Thu, 26 Sep 2024 07:04:37 +0000
X-UUID: 9277b6167bd511efba0aef63c0775dbf-20240926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=u2VyllAmx1eNrj4fBWbMCyugVwolephg65owyjKq1Jk=;
	b=ZBl8siqXvwMQ0KYfY5y0untMcqNsed9PH0PtmapdYDVaaXbXNH3ZeIbV3aN5hwux6ZFAaWKBwfVefAUpZgefFc5RCXF6PV3iQlzxn/EcwfQtBfDLNpDCb8Wqs71b8NuDsh3uxP//BTPeNuUQiQUSHMzr+WdAMbwduSlpmoKrBVI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:7560dacb-0cd5-4268-be04-ce99f71048cd,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:42fa4718-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9277b6167bd511efba0aef63c0775dbf-20240926
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <andy-ld.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 421140770; Thu, 26 Sep 2024 00:04:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Sep 2024 15:04:26 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Sep 2024 15:04:25 +0800
From: Andy-ld Lu <andy-ld.lu@mediatek.com>
To: <ulf.hansson@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: [PATCH 0/2] Add mtk-sd support for MT8196
Date: Thu, 26 Sep 2024 15:03:16 +0800
Message-ID: <20240926070405.20212-1-andy-ld.lu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_000435_494177_ECA3D1CF 
X-CRM114-Status: UNSURE (   9.23  )
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

There are some new features for Mediatek SoC MT8196, which include new
command/data transmitting and receiving path (abbreviated as tx/rx), and
a new bus design that prevents the CPU from accessing the IP registers
unless the source clock control gate is enabled. Furthermore, some register
settings are also modified.

The driver code has to be adapted to implement the above changes, and the
compatible 'mediatek,msdc-v2' is added to driver and devicetree bindings,
for MT8196 and future compatible SoCs that support new tx/rx.

Andy-ld Lu (2):
  mmc: mtk-sd: Add support for MT8196
  dt-bindings: mmc: mtk-sd: Add support for MT8196

 .../devicetree/bindings/mmc/mtk-sd.yaml       |  26 +++
 drivers/mmc/host/mtk-sd.c                     | 179 +++++++++++++++---
 2 files changed, 182 insertions(+), 23 deletions(-)

-- 
2.46.0


