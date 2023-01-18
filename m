Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AABC38142
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 03:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VYyGa98n/lDxtXIVrq/pkqd0oUm89Hudm4lrrG5jFYc=; b=Mt5l7NOIZOXGvybFfGj1Ylhc5f
	Eby/83KUJhYKHWSORE9TPZSkTycg2MjOnAeXLKS790TjmxrYKYtHFJ/4ExtDPWcKx5PkAahUPy+hX
	g30t02vPdfE3PS8DSEf2KmAQ1Urz0r42bIZUhLTdliJU0uP6l8fB0wlz7x2Sqcnc+SboiOeqZNyv7
	ejiYdc+9GWacTv0hABo/gdzfeAsYfNW4FAtEybpACJL0htp2HkAbP1IIt/9cWYE+xnR/2HNEfq4/T
	gyj2VJPO72899UkamYxFtlepWwnVO/gAxwsreXxS3Bi3051wYiNk9MKHMWeHifs7daep8kkhklRR3
	jT4vJR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHyvg-00GgbV-Q5; Wed, 18 Jan 2023 03:16:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHyve-00GgaK-KN; Wed, 18 Jan 2023 03:15:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=VYyGa98n/lDxtXIVrq/pkqd0oUm89Hudm4lrrG5jFYc=; b=gcUeS2KZlxiVGMPUlT/7v1RYeE
	A2jbcYwo1rBKPd+H0mgtzD8KoGVjPrkIJdpsxrpvn5Q0mgK1x0bJcGpVBdn96ln5aRv/BtQCTN4zQ
	HjPnppZ0AwZCzymB1GPou20G3GRsMbduYSOcEiQqbhZrvfQ+yZ65FWoTJSavVYrKOdklgYeUTV+VG
	egl4AzzgJ6YLpIS5X88J8NOAsE8HyT7L7Ik5SwKxbIoyh5h27FXcxd+/xu0CEOYg8Aks3dmxDwPhN
	hJL2F1mWWIApP7fWYZdlGPL4KMjaKe+mNNqvBpJM+DLbeD+5DPKEk7fgIolJ/BT3yV1VFwa/EZOHZ
	yQsJOGnQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHyvN-0068eF-0W;
	Wed, 18 Jan 2023 03:15:45 +0000
X-UUID: 653940e496de11eda08d4d6090ec5a5c-20230117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VYyGa98n/lDxtXIVrq/pkqd0oUm89Hudm4lrrG5jFYc=;
	b=tpekYALEOL5rkAc8cDUde3O3hZm5be/DqVQV5BceKbkgopGlSWNbG1PbvYzQmVCQeGG8TnaPDd3dkP7lGFGS4jZCjcEpb88dxoGCLBkP9DbTQiqEF5xX6fjJ0o0HpRo/dVAZCAo4ewPkeLgm4SZhAE68o+SJ0zGSuMod0t+Cyro=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:9f96917a-991e-4059-9fab-42ef48fa2fa3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:3ca2d6b,CLOUDID:6221f654-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 653940e496de11eda08d4d6090ec5a5c-20230117
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1598644278; Tue, 17 Jan 2023 20:15:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 11:15:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 11:15:10 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v6 0/4] Migrate MT8195 VPPSYS 0/1 to mtk-mmsys driver
Date: Wed, 18 Jan 2023 11:15:05 +0800
Message-ID: <20230118031509.29834-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_031542_308811_1B13E539 
X-CRM114-Status: GOOD (  12.16  )
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

Change since v5:
- Rebase on linux-next.
- Correct the compatible enumeration order in "mediatek,mmsys.yaml".

Hi,

This series splits patches from the original mailing list below:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=711592

Refer to the comments of 0/8 and 1/8 in the following series:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=702518
All about the MT8195 VPPSYS 0/1 should be probed from the "mtk-mmsys"
driver, which then starts its own clock driver as the platform driver.

Moudy Ho (3):
  dt-bindings: arm: mediatek: migrate MT8195 vppsys0/1 to mtk-mmsys
    driver
  dt-bindings: arm: mediatek: mmsys: Add support for MT8195 VPPSYS
  clk: mediatek: remove MT8195 vppsys/0/1 simple_probe

Roy-CW.Yeh (1):
  soc: mediatek: mmsys: add support for MT8195 VPPSYS

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |  2 +
 .../arm/mediatek/mediatek,mt8195-clock.yaml   | 16 -----
 drivers/clk/mediatek/clk-mt8195-vpp0.c        | 58 ++++++++++++++-----
 drivers/clk/mediatek/clk-mt8195-vpp1.c        | 58 ++++++++++++++-----
 drivers/soc/mediatek/mtk-mmsys.c              | 22 +++++++
 drivers/soc/mediatek/mtk-mmsys.h              |  1 +
 6 files changed, 111 insertions(+), 46 deletions(-)

-- 
2.18.0


