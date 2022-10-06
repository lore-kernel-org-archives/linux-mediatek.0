Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06704C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 04:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WN5HrWAsPKulMaT697T87yfqxj6TGX8DCcsBqqWfiB4=; b=OO8GZjlnW16ToIOVzLRPVWGmxT
	LrTazLmk+I9y1QGx3w9UrWCfNlXe9K5W5jjDcYRNudbRQ0eIRajfZHbbp60GA/N7iICPNhPNEYrLZ
	YKWOMS750ZX7DXYyFzETBtJRXUxeYclr/+iLndQQ/rIAbNNPUwLU2Cdn7RTdFerP4q4vOAxJqjtQQ
	isDV9+OZZXiPfEtRLfqLVEtvlk/exldgq/lIlgwSR7wsePAOM0/wxllxWSyhqOLQe+Xt8K+7mQqm6
	YKQS4tyl0AFafv3xuiRkIIZVyBidbXZyhTpuToxKv4h95gdHtGdjDl+73VrzXbIGCMFWt4bdfYvDO
	qEXatPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogIlU-00HRxy-2o; Thu, 06 Oct 2022 04:45:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogIlR-00HRwM-WF; Thu, 06 Oct 2022 04:45:43 +0000
X-UUID: 7d5eb0e3e9b04f528db0460cbfe2b0fd-20221005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=WN5HrWAsPKulMaT697T87yfqxj6TGX8DCcsBqqWfiB4=;
	b=kfEBBN0y9n0bag4NmYhn2kiU09LX2vH+tjT2wjgS4qEj5VIQI6oIGbIOh6iSXKFNkreDf0bm5u7X5+RRXiPlSO/vyl9ZW74LKbwB58Upc5VnJXXl2Z0vuHJGt3fQnl5TKbnicUy8PV7azS8Ue0AygHAL5Jy1pNy6nWMLFkNYWSM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:7b141df4-e1d4-4f67-ba21-3ed0690e7785,IP:0,U
	RL:0,TC:0,Content:51,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:51
X-CID-META: VersionHash:39a5ff1,CLOUDID:c96bacb8-daef-48a8-8c50-40026d6a74c2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7d5eb0e3e9b04f528db0460cbfe2b0fd-20221005
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 870730362; Wed, 05 Oct 2022 21:45:34 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 6 Oct 2022 12:34:58 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 6 Oct 2022 12:34:58 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [PATCH v9, 0/4] mailbox: mtk-cmdq: add MT8186 support
Date: Thu, 6 Oct 2022 12:34:52 +0800
Message-ID: <20221006043456.8754-1-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_214542_061124_A77A137C 
X-CRM114-Status: UNSURE (   7.66  )
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

base linux-next/master

change since v8:
1. move GCE_CTRL_BY_SW modification to the 1st patch
2. add commit message for patch 2 and patch 3

Yongqiang Niu (4):
  mailbox: mtk-cmdq: Use GCE_CTRL_BY_SW definition instead of number
  mailbox: mtk-cmdq: add gce software ddr enable private data
  mailbox: mtk-cmdq: add gce ddr enable support flow
  mailbox: mtk-cmdq: add MT8186 support

 drivers/mailbox/mtk-cmdq-mailbox.c | 42 +++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

-- 
2.25.1


