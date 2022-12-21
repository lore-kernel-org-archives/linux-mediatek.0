Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C012C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 04:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UZa93UET80bJSwOG9nn9/Z7Z/jlBWTvj0iQxh9MxR+w=; b=OOQtuE4Nrg6QrFzCqA7MUZMuKk
	KAVjVszKfjOP2Yvqhct3B6XpJ3b/3b9OL3EKsaCb02FoTdTseMRpjyFcxs/8+Xi859jp2XASyVgn0
	v1b9Q8FcmTLWWeUMlCVv+/0Omz8VUEiMcA9t9OzSJezNZ9OVyo87Lkw2tmm0/AodCcDQ92Y7iOFbZ
	TiDIuDlGQv3T0aiawuvcjFj6HEKUzof4dHr869GRDf1gTmGKdYnBFXRmu8o1AIm/UDs8A9ESq02ld
	KpFnb2XIfdsMSaeAcPpgwjKd0mdqN8eV89HpqoQ7HZ+osgA7o3G3c9T65kFFFhR/9Xkv51meoJSDR
	ej4fKToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7qf4-009OSj-QA; Wed, 21 Dec 2022 04:24:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7qf0-009OP7-Vp; Wed, 21 Dec 2022 04:24:56 +0000
X-UUID: 3f105b6a6aa24cec92a65d7a219a9619-20221220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=UZa93UET80bJSwOG9nn9/Z7Z/jlBWTvj0iQxh9MxR+w=;
	b=tzAVQlVn0Aam263ZlhvRJdZLuyGYeBtVPBiws7HaP4sCT1Xl3xKz3Tkuu6+AdF9auwptLQgZTZI70/5VQzLiMOgUtqwOoRvg2PE95lur6OUTVqBz+jpC6a9rjDn5ZJrTGdNHlPJDGAn3Q7focVXoX0U/Rd+3KOKnCn5niQaOs2A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:99ab5da4-bdf7-41b4-9597-9852e2b2e31b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:5b5e84f3-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3f105b6a6aa24cec92a65d7a219a9619-20221220
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1418043225; Tue, 20 Dec 2022 21:24:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 21 Dec 2022 11:44:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 21 Dec 2022 11:44:09 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen
 Boyd <sboyd@kernel.org>, Ikjoon Jang <ikjn@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 0/6] Add ADSP power domains controller support for MT8192
Date: Wed, 21 Dec 2022 11:44:01 +0800
Message-ID: <20221221034407.19605-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_202455_078252_0B12CA1A 
X-CRM114-Status: GOOD (  10.08  )
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

This series is based on matthias github, v6.1-next.
The previous discussion: 
https://patchwork.kernel.org/project/linux-mediatek/patch/20221201073328.1559-1-allen-kh.cheng@mediatek.com/

Change from v1:
 - move allOf before additionalProperties
 - add buck isolation setting patches into series

Allen-KH Cheng (6):
  soc: mediatek: pm-domains: Add buck isolation offset and mask to power
    domain data
  soc: mediatek: pm-domains: Add buck isolation setting in power domain
  dt-bindings: power: Add MT8192 ADSP power domain
  soc: mediatek: pm-domains: Add ADSP power domain data for MT8192
  dt-bindings: arm: mediatek: Add missing power-domains property
  arm64: dts: mediatek: Add the missing ADSP power domains controller
    for MT8192

 .../arm/mediatek/mediatek,mt8192-clock.yaml     | 17 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi        |  9 +++++++++
 drivers/soc/mediatek/mt8192-pm-domains.h        | 16 ++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c           |  8 ++++++++
 drivers/soc/mediatek/mtk-pm-domains.h           |  5 +++++
 include/dt-bindings/power/mt8192-power.h        |  1 +
 6 files changed, 56 insertions(+)

-- 
2.18.0


