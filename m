Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28499C61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 01:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xfJdDHYM1kIjZH2oKMPB4Dv9VCfW1IAMgum+diCywO0=; b=PFcBPGs+2RCk2sC6GUQ7HXbbLb
	RhFkbmmLKDkP2+qgH+/AvEKjIuxJHc0sTrTW0wlOJlm9pS+2PUOFz2F9trn7nh5TOapvqHrz/ie95
	jl1YTqfE6Z6kJcP/qu6UDhkpRX7TPkZ1MgJbCrlLhzxmGZE9qmw/71QR5noQUiI6U2h0Qry7nCvwc
	JxmSZhsJ1cpK9Cjs6BUMkp+hTTA4OBgrsL9bBp5Mp2aRi5gPQt7WDPotw5vMNlkdupChD+6ndrCFy
	CKCerUbGmXu+cHYPoAXmtL7tQPyQdDnc4QWvYkuWNHAg2UL6tn2dM8rFWY74/gz1gykrSGig97On3
	CVV4DYlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPD6K-00APZN-Lt; Tue, 07 Feb 2023 01:48:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPD6F-00APYa-WD; Tue, 07 Feb 2023 01:48:49 +0000
X-UUID: 8b0ff8c0a68911eda08d4d6090ec5a5c-20230206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xfJdDHYM1kIjZH2oKMPB4Dv9VCfW1IAMgum+diCywO0=;
	b=JlsUz3jqlcpktPVP7ZsYLFi9uhriH2E7uV+sCeJNtEWWDPBLWwY0tr5M1L0hvh61+Oyzowjtk5uvFKXYbE/nQEBgwBMn/3qA+Y3muEpRx/D2gDh/rOq5S3lknV4oLqsMEhFeyK9bbTir8Fhi8PQ9Uqrlk99Q8Y3yTK5GDgD0vRk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:e7402d7c-e672-426a-9a67-a841ce01c8cf,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.19,REQID:e7402d7c-e672-426a-9a67-a841ce01c8cf,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:885ddb2,CLOUDID:02fca8f7-ff42-4fb0-b929-626456a83c14,B
	ulkID:2302070948248JL1IL6H,BulkQuantity:2,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 8b0ff8c0a68911eda08d4d6090ec5a5c-20230206
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 182089732; Mon, 06 Feb 2023 18:48:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 7 Feb 2023 09:48:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 7 Feb 2023 09:48:01 +0800
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
Subject: [PATCH v7 0/1] Migrate MT8195 VPPSYS 0/1 to mtk-mmsys drive
Date: Tue, 7 Feb 2023 09:47:59 +0800
Message-ID: <20230207014800.7619-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_174848_061692_F4D34558 
X-CRM114-Status: GOOD (  10.11  )
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

Change since v6:
- Rebase on linux-next.
- Drop applied patches [1/4], [2/4] and [4/4].
- In response to the API changes of "mtk_clk_register_gates" and
  "mtk_alloc_clk_data", the patch [3/4] has been modified accordingly.

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

Moudy Ho (1):
  clk: mediatek: remove MT8195 vppsys/0/1 simple_probe

 drivers/clk/mediatek/clk-mt8195-vpp0.c | 58 +++++++++++++++++++-------
 drivers/clk/mediatek/clk-mt8195-vpp1.c | 58 +++++++++++++++++++-------
 2 files changed, 86 insertions(+), 30 deletions(-)

-- 
2.18.0


