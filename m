Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C41C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 12:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=275g4iCrwNAnPe+ykqTp15sa0MzzfQc59VGbYtzm85A=; b=GczT8upWVSPc2lkDfcrzcXRzuo
	ouMjRCvmaVZEbPrQ5KHQpPqInTObHE6aM4l+MDxjHtR/yFMBGoo5Nf+mK0HMbI0zHekeWu0HzBNQi
	H0xmoNn4+Skx97ZIxD+FSlBAT5mFQErjDR60qgTeogP4VqaLnLkpPxnkueGG8kQbcxB0hMFtIEDYf
	AEZ/GmMjB1+hNpuSVO09W4vexp0+xgPGrttjvOlYNAXMMYjusM4G5ccywE13U7U7TFEgbkYgjTzIm
	2GJdqK1x7XVbX0jV9EFnZEEa5jScnOQKifrUAI83BJUCTDVR//DQlXI3EO1UytqeHfYY/LEGLvCRN
	milGGMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAsca-001Tar-Vq; Mon, 11 Jul 2022 12:34:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAsbV-001SyO-WD; Mon, 11 Jul 2022 12:33:36 +0000
X-UUID: 7dd5a3f1b1814abe89543359e802120b-20220711
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:2c53b74f-ffa9-4f90-9067-72f4eb802884,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:418df863-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 7dd5a3f1b1814abe89543359e802120b-20220711
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1747439466; Mon, 11 Jul 2022 05:33:26 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 11 Jul 2022 20:32:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 11 Jul 2022 20:32:49 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@canonical.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 0/2] Add mt8186 mutex support for mdp3
Date: Mon, 11 Jul 2022 20:32:45 +0800
Message-ID: <20220711123247.15807-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_053334_104585_C009FC1F 
X-CRM114-Status: UNSURE (   9.13  )
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

This series are based on matthias.bgg/linux.git, for-next and provide
mt8186 mutex support for Media Data Path 3 (MDP3).

As discussed, we add data field (mt8186_mdp_mutex_driver_data) for 
mt8186 mdp3 mutex support instead of adding mutex_table_mod into mt8186
disp mutex data.

changes since v1:
 - add mt8186_mdp_mutex_table_mod
 - add mt8186_mdp_mutex_driver_data for mt8186-mdp3-mutex

Allen-KH Cheng (2):
  dt-bindings: soc: mediatek: add mdp3 mutex support for mt8186
  soc: mediatek: mutex: add mt8186 mutex mod settings for mdp3

 .../bindings/soc/mediatek/mediatek,mutex.yaml |  1 +
 drivers/soc/mediatek/mtk-mutex.c              | 28 +++++++++++++++++++
 include/linux/soc/mediatek/mtk-mutex.h        |  2 ++
 3 files changed, 31 insertions(+)

-- 
2.18.0


