Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91E0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 04:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=26KcWNAkr/GYqtNeS8rL/0uTm+OaPnAVMRPr5s3f+80=; b=trQobWdCwAeIvsbtUTjYLJrmFz
	OlKAEIgSPPV9ZNTwxA+tJV58oHVp9I+Vmg2aZuZhhOOC3CjgDWpWkJjlIZ40yeav0slAzd01SlO0A
	F0oLjUIzMGgEUZBdV/H6dLVG6EOSIcOJHPyHT8T0v2mY1Xh4SbkMjHu3lFWoM6c4LKNW151XrAKyK
	cWFDTkw/nwOKh+uR56e2WOlOmbEwkOyUbXsrVDwDHe9ioDWfWLBfKomszSA2QCtqxGaRPtJZmFhrj
	JkawBNK605WdvbyhPk9j+BG3MN3lhoNKmgq7Uwl4N6ArUADpis+NkYUHCD7N73fkv5Vv62mxe5qcH
	F/cpGnzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6P0L-009P7X-1a; Wed, 29 Jun 2022 04:08:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6P0A-009P5R-9X; Wed, 29 Jun 2022 04:08:31 +0000
X-UUID: 259a6e3f1e56455589d83fc7534a5063-20220628
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:47974753-8c1d-4a82-8ec2-2de6b14349ce,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:8c31ea62-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 259a6e3f1e56455589d83fc7534a5063-20220628
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1295352381; Tue, 28 Jun 2022 21:08:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 29 Jun 2022 11:17:50 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 29 Jun 2022 11:17:48 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Fabien
 Parent <fparent@baylibre.com>
CC: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
	<sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Biao Huang <biao.huang@mediatek.com>, Yinghua Pan
	<ot_yinghua.pan@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [PATCH net-next v5 00/10] add more features for mtk-star-emac
Date: Wed, 29 Jun 2022 11:17:33 +0800
Message-ID: <20220629031743.22115-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_210830_596249_545FA83B 
X-CRM114-Status: GOOD (  10.27  )
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

Changes in v5:
1. correct spin_lock usage which are missed in v4.

Changes in v4:
1. correct the usage of spin_lock/__napi_schedule.
2. fix coding style issue as Jakub's comments.

Changes in v3:
1. refractor driver as Jakub's comments in patch
   "net: ethernet: mtk-star-emac: separate tx/rx handling with two NAPIs".
2. add acked-by as Rob's comments.
3. add a new patch for halp-duplex support in driver.

Changes in v2:
1. fix coding style as Bartosz's comments.
2. add reviewed-by as Bartosz's comments.

This series add more features for mtk-star-emac:
1. add reference clock pad selection for RMII;
2. add simple timing adjustment for RMII;
3. add support for MII;
4. add support for new IC MT8365;
5. separate tx/rx interrupt handling.

Biao Huang (10):
  net: ethernet: mtk-star-emac: store bit_clk_div in compat structure
  net: ethernet: mtk-star-emac: modify IRQ trigger flags
  net: ethernet: mtk-star-emac: add support for MT8365 SoC
  dt-bindings: net: mtk-star-emac: add support for MT8365
  net: ethernet: mtk-star-emac: add clock pad selection for RMII
  net: ethernet: mtk-star-emac: add timing adjustment support
  dt-bindings: net: mtk-star-emac: add description for new properties
  net: ethernet: mtk-star-emac: add support for MII interface
  net: ethernet: mtk-star-emac: separate tx/rx handling with two NAPIs
  net: ethernet: mtk-star-emac: enable half duplex hardware support

 .../bindings/net/mediatek,star-emac.yaml      |  17 +
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 530 ++++++++++++------
 2 files changed, 371 insertions(+), 176 deletions(-)

-- 
2.18.0



