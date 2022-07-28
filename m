Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76D6C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 06:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KkHDoyqiy42D8ReimsMVqIsVF2DamXyMGPAWEguTSc8=; b=m677mcdA7Kjsfz3CL6TpIunv5u
	2o7LS+e3jNJHR04hAMuZXnyK/9CWdy6yhrM6IxWVy1wbj2ikP7Egsry88+Bj69ibL9PnUKg/kcuC+
	QpPN4FeYp/KObPavmam37/kDd/2Y5hu4SmIxP9dC+Pm09/GRNsFYcJY4xQQ4gVOTmeIXOOGd10Gen
	o+f4XmcV7PeK8mIae6eRHFiG26/lMbijjHRo1WnZMT/b4sd4A4LEtwlQucncTaPFmzR6vdhXf7fN5
	7IHovZgNELzLR7DEXH/f4GYwsq/nBMMXsCTlS92in/QW3qdi8rPdn5RILSoyRzcmCDcbsaU6x2F6R
	qJs59lsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGxTh-005G0H-6Y; Thu, 28 Jul 2022 06:58:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGxTe-005Fyq-JW; Thu, 28 Jul 2022 06:58:35 +0000
X-UUID: 9b092b4a21bb462a87b970b7bb226f05-20220727
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:f4c382eb-e2f0-47b6-a51b-b9d12eee485d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:27d39dcf-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 9b092b4a21bb462a87b970b7bb226f05-20220727
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <zhiyong.tao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1747250848; Wed, 27 Jul 2022 23:58:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 28 Jul 2022 14:27:53 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 28 Jul 2022 14:27:52 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <eddie.huang@mediatek.com>,
	<a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>, <fshao@chromium.org>
CC: <sen.chu@mediatek.com>, <hui.liu@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <zhiyong.tao@mediatek.com>,
	<hsin-hsiung.wang@mediatek.com>, <sean.wang@mediatek.com>,
	<macpaul.lin@mediatek.com>, <wen.su@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 0/1] Mediatek MT6366 Regulator patch 
Date: Thu, 28 Jul 2022 14:27:48 +0800
Message-ID: <20220728062749.18701-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_235834_665385_B54A212B 
X-CRM114-Status: UNSURE (   6.61  )
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

Add mt6366 binding documentation

Changes in patch v2:
1)fix patch title description.
2)fix patch maintainer description.
3)won't cc to srv_heupstream@mediatek.com
4)fix patch commit message description.
5)add properties node and compatible
6)put "unevaluatedProperties: false" after $ref
7)remove underscores in node names.
8)change Filename to "mediatek,mt6366-regulator.yaml"

zhiyong tao (1):
  pmic: add mt6366 regulator document

 .../regulator/mediatek,mt6366-regulator.yaml  | 375 ++++++++++++++++++
 1 file changed, 375 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml

--
2.18.0



