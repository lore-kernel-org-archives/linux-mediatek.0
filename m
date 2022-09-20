Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8C3C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 10:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xz74ODjKzLI1kd5AQq6NQuh8A0wWpa/ATv1pXW7SzHE=; b=izNca3HmwgpoJgd8JN/TFj4oef
	VIbYk60HgzXbzh9qtK/1pV7pnjlGrfjzgwcTNTsIMvxFenrwxit25Xe6qveJnFhGOBYo376Jy+D6l
	TPU1A9QUHgZI5Z27wMA/r1w0FRSWTHoNNTStDcadZ0MSbuqhFjy6xAz692dAmZkrG1nX9/xNbkdzb
	dKLKUKii+78bWsMaQzglfD5ZXKOPsUf+xAxHVlL2tMnrgILYJHBhL06kNr8m7uOs/uDKEr4it+BY9
	J0AbCiTyNL8xL2VwjGR8C2HRIFE/f4Hd+I4lPwwa7mv4JIKfJTJ/BVcc2k8FIf6hr0HwboE3zBjjg
	urHua8YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaa4J-002hno-B7; Tue, 20 Sep 2022 10:01:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaa47-002hd2-G9; Tue, 20 Sep 2022 10:01:20 +0000
X-UUID: dd18122254004a2b847b2ec3403b1504-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xz74ODjKzLI1kd5AQq6NQuh8A0wWpa/ATv1pXW7SzHE=;
	b=Gt2+gBF4epAPeHAoaGbP+IrpEeIcSy4WiAc3SRxP+srcYXIGvednipnlT0VWj/hXHUU4jqVcuBh8s7qBUD4IsBS9L3a09tY3qHS5zTGZr0o8yjtomGpfN33UxKSZVHdr7MijZxWpeVv1GRmDU0VevH39Ch1dGGdsMAVswF5fV+Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:2b52df96-1963-4df1-ad87-e760648014c5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:629c06f7-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: dd18122254004a2b847b2ec3403b1504-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 510962581; Tue, 20 Sep 2022 03:01:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:40 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:39 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Stanley
 Chu <stanley.chu@mediatek.com>
Subject: [PATCH 00/18] unify register access and macros
Date: Tue, 20 Sep 2022 17:00:20 +0800
Message-ID: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_030119_567760_DEDCFE3D 
X-CRM114-Status: UNSURE (   6.45  )
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

No need to define new macros to generate bits, mask and bitfield, use
common ones instead, e.g. BIT, GENMASK and FIELD_PREP etc.
Due to common register access helpers are defined for MediaTek's phy
drivers, the similar helpers defined by ufs, hdmi and mipi phy drivers
can be removed.

Chunfeng Yun (18):
  phy: mediatek: add a new helper to update bitfield
  phy: mediatek: tphy: remove macros to prepare bitfield value
  phy: mediatek: xsphy: remove macros used to prepare bitfield value
  phy: mediatek: ufs: use common register access helpers
  phy: mediatek: pcie: use new helper to update register bits
  phy: mediatek: hdmi: mt2701: use GENMASK and BIT to generate mask and
    bits
  phy: mediatek: hdmi: mt2701: use FIELD_PREP to prepare bits field
  phy: mediatek: hdmi: mt2701: use common helper to access registers
  phy: mediatek: hdmi: mt8173: use GENMASK to generate bits mask
  phy: mediatek: hdmi: mt8173: use FIELD_PREP to prepare bits field
  phy: mediatek: hdmi: mt8173: use common helper to access registers
  phy: mediatek: hdmi: remove register access helpers
  phy: mediatek: mipi: mt8173: use GENMASK to generate bits mask
  phy: mediatek: mipi: mt8173: use FIELD_PREP to prepare bits field
  phy: mediatek: mipi: mt8173: use common helper to access registers
  phy: mediatek: mipi: mt8183: use GENMASK to generate bits mask
  phy: mediatek: mipi: mt8183: use common helper to access registers
  phy: mediatek: mipi: remove register access helpers

 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c    | 238 ++++++++---------
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c    | 246 ++++++++----------
 drivers/phy/mediatek/phy-mtk-hdmi.c           |  33 ---
 drivers/phy/mediatek/phy-mtk-hdmi.h           |   7 -
 drivers/phy/mediatek/phy-mtk-io.h             |   7 +
 .../phy/mediatek/phy-mtk-mipi-dsi-mt8173.c    | 164 ++++++------
 .../phy/mediatek/phy-mtk-mipi-dsi-mt8183.c    |  74 +++---
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c       |  24 --
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h       |   5 -
 drivers/phy/mediatek/phy-mtk-pcie.c           |  17 +-
 drivers/phy/mediatek/phy-mtk-tphy.c           | 193 +++++---------
 drivers/phy/mediatek/phy-mtk-ufs.c            |  78 ++----
 drivers/phy/mediatek/phy-mtk-xsphy.c          |  46 ++--
 13 files changed, 465 insertions(+), 667 deletions(-)

-- 
2.18.0


