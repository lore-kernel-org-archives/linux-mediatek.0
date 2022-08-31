Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F24ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 17:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tyL8cPvebaCtbUtbRJCGD1Ux/d2Hi5szlibwPANQZ1E=; b=L3pMn3bSac67rcD5cc3L8++mdX
	zSawu7mzxptEa0qtsGF+HExm4PtyrjQ3XlsQKFwGJee+GPKLBmuZFUqzRHDOVytzAPSrVRfv/YPDq
	DFbH/pqvtuAv30f9jkitpbq1J/eDaVg5GusGz9M7DDJLGA9ADciWTR1x5G19pFBKu0CWnjUQHCbdy
	qqd6WCbmHrMJNi0zyZSOBKvCP5ahjlYEbfy2PvDsHMAT8fi30Q6Rk4bBLc0KJyshc6E1iz2eTWKyj
	8B2jS7yh1Il7JYWj8HpcGKq6g5uxfvHk4wdvPsNjocuPeBvvRqRtntd572riLC5ts6SS4Eq4OLHo8
	c1W88QuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTRtL-007SUM-Fu; Wed, 31 Aug 2022 17:52:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTRtJ-007SRT-1D; Wed, 31 Aug 2022 17:52:42 +0000
X-UUID: 23020a6dbea944b684f9314dbeeeb65f-20220831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tyL8cPvebaCtbUtbRJCGD1Ux/d2Hi5szlibwPANQZ1E=;
	b=Zz77KI36j49AOdps07TRvLAao4aItIEb7BmMKh3x5MZs3/ksimttw/QyXTA+1Vk0SbUnPckPC1TALnonYxlKvcIRirD8n5m1wyb+w4r4G8oR06b4519AtguWzBEtHTbJzSsvh9F1aZsAZa7F0u9QfIOYNnkQJDnSbV9QSYZhjwg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:39a0a916-67da-4640-85d5-34b35ea43594,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:acad36d0-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 23020a6dbea944b684f9314dbeeeb65f-20220831
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 850415018; Wed, 31 Aug 2022 10:52:29 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 1 Sep 2022 01:21:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Sep 2022 01:21:53 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 0/2] Add mt8186 mutex support for mdp3
Date: Thu, 1 Sep 2022 01:21:49 +0800
Message-ID: <20220831172151.10215-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_105241_107235_AFEEA446 
X-CRM114-Status: UNSURE (   9.52  )
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

changes since v2:
 - rebase to matthias.bgg/linux.git
 - add C-d-b, R-b and A-b tags

changes since v1:
 - add mt8186_mdp_mutex_table_mod
 - add mt8186_mdp_mutex_driver_data for mt8186-mdp3-mutex

Allen-KH Cheng (2):
  dt-bindings: soc: mediatek: Add mdp3 mutex support for mt8186
  soc: mediatek: mutex: Add mt8186 mutex mod settings for mdp3

 .../bindings/soc/mediatek/mediatek,mutex.yaml |  1 +
 drivers/soc/mediatek/mtk-mutex.c              | 28 +++++++++++++++++++
 include/linux/soc/mediatek/mtk-mutex.h        |  2 ++
 3 files changed, 31 insertions(+)

-- 
2.18.0


