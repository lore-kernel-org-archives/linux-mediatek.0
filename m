Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7808AC04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 10:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xA56TSbZash0MJgrqcSMCfTXB1ek1UsvaM8PqDjWVuM=; b=TM8TmElowTJcWfALVRQYUUbSmC
	1at+0jZLE5hX/jiRiMHUANnlP/Qy32DUEg1S+w8C71GkurgodMo/nt6JZR7cTLUIRH2Zv7ayk/TIz
	uKifBnNoR2N4Q1jPcSj+GPutHkeVoPnS/ok4a8vRs4Y6ezWr+VfIEMWQbOW5/Nw9AFsrQReaNbjyn
	37vTi/x1+vIqKMJ+RWNlsPjZib71pv3N7lbLGXpFcttud5NT/GQuRzAgDtzJzOn5DQiFQE8sqQCYq
	DVsmQ9Q+eFMGbPIb+XMvuSJ2n8mHvqAG5fDVTMbx+FWB/lz9PiehtKLefoyE4WjXzSeQvlUp2GuY3
	LwhIlTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGeBT-00CJUt-4M; Wed, 27 Jul 2022 10:22:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGeBQ-00CJSR-OL
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 10:22:30 +0000
X-UUID: 7c9efacadedd4f3692d0838f37434716-20220727
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:2ca0f67b-9ff7-493a-a469-65e39ad01bea,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:d87af3cb-7c9b-4dbc-a9d4-00659d6b7a90,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 7c9efacadedd4f3692d0838f37434716-20220727
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <hui.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1337777605; Wed, 27 Jul 2022 03:22:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 27 Jul 2022 18:21:42 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Jul 2022 18:21:41 +0800
From: Hui Liu <hui.liu@mediatek.com>
To: <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<hui.liu@mediatek.com>, <jianguo.zhang@mediatek.com>,
	<zhiyong.tao@mediatek.com>, <sean.wang@mediatek.com>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] MediaTek pinctrl patch on mt8188
Date: Wed, 27 Jul 2022 18:21:38 +0800
Message-ID: <20220727102140.6676-1-hui.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_032228_815145_C0DD603F 
X-CRM114-Status: UNSURE (   8.27  )
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

This series include 2 patches:
1.Add pinmux definition file and pinctrl binding document for mt8188.
2.Add pinctrl driver for mt8188.

Changes in patch v2:
1.Change pinmux definition file name to mediatek,mt8188-pinfunc.h.
2.Change binding document name to mediatek,mt8188-pinctrl.yaml.
3.Update yaml description.

Changes in patch v1:
1.Add mt8188 pinmux definition file.
2.Add mt8188 binding document.
3.Add mt8188 pinctrl drivers.

*** BLURB HERE ***

Hui.Liu (2):
  dt-bindings: pinctrl: add support for mediatek mt8188
  pinctrl: mediatek: add mt8188 driver

 .../pinctrl/mediatek,mt8188-pinctrl.yaml      |  238 ++
 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8188.c     | 1669 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h | 2260 +++++++++++++++++
 .../pinctrl/mediatek,mt8188-pinfunc.h         | 1280 ++++++++++
 6 files changed, 5460 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8188.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h

--
2.18.0



