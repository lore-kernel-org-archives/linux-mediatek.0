Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EE7C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 03:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eh4Cs4ZcRBlSDIsPuhVfHQleWBG2pqk8rqGH33Owp/w=; b=hbuBbirRaA5QJ3M12PnyqvTq6C
	sQO7EqS/JcFXyqB5KUAWITi8C81qh0duvUVkO+QRDB2F8IwgOAqEeZeztGmcDzQKa9fqZilx/PUs+
	OtF3xVjYG3OyMQNnGrfutBrStWdOn1MtMGp8G5KiPk3L1D+AMgvFdprvsuNgzl6Y5Yhv3X5zj7bxy
	Rov3PK2fLz/0lsATWLulyxcr9d1Jsx4Zu+1KRHX4mnSjeGqUH2b9D9SXZyoPNbKdb3s2lZMXzCmL4
	2aPS/OTlgDcuEh70dBT1Frs1zpFTgd2stbltPB81j9fW16kK5Cby/Y3dtdNdJOWGH/aWKWtFKFM/d
	CnRe3tSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHGPW-008Waw-LF; Mon, 16 Jan 2023 03:43:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHGNz-008Vz3-Sx; Mon, 16 Jan 2023 03:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=eh4Cs4ZcRBlSDIsPuhVfHQleWBG2pqk8rqGH33Owp/w=; b=hSS518xCZ26deo5ks7chksa4GX
	eM7SeigWK4xaA66CIw2P8ShLiRMcGzayjC5gfJ2nZ2jz8QS/eXr4Nrs2Sg5LUqE9o66kBOadsA68y
	jPsZFugRsYtzPjd1AIK99qOjAud6b+wU6O1jCTsKsdZGxfise9410igrBQtIabdjcraVYQHIGo3nW
	FoHv8oZJQxB6s8HU7H2nYautNKAY1Hp9ajLRs7liVOlW3xD91yEh0hE1+doeK7qvQxAdBmunN/Yyb
	fNGhWReV6tjWORK9M44pJkcCsa8YGDWlBRBQo8m2U9u4vL+YjFGSb6zBm+3r0O07tAj7uMeFzBvbQ
	784URBbA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHGNh-005Syr-2f;
	Mon, 16 Jan 2023 03:42:02 +0000
X-UUID: adf9620e954f11edbbe3f76fe852e059-20230115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=eh4Cs4ZcRBlSDIsPuhVfHQleWBG2pqk8rqGH33Owp/w=;
	b=EYFaxBmf/G+uRzF1ZmS0XZfqZQk8CWOO5MERh4O4ZG8bJ3wjfqZy2UGwr4UIoOrkK3YwDMXZ6itRkNEjnyu39sLmp6xGBMg9cUsE9b8CTKJkr5DUHeOHMavs6vSZkYq1PKr48dNYK+7oxnlo3g+k6HWBo9yCTz4cVapNMaotJlA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:58cca210-a0c4-41c5-a692-44c88d7e27af,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.17,REQID:58cca210-a0c4-41c5-a692-44c88d7e27af,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:543e81c,CLOUDID:6cf1bb54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:230116114137D3YUGBJE,BulkQuantity:1,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:0,Malicious:0
X-CID-BVR: 0
X-UUID: adf9620e954f11edbbe3f76fe852e059-20230115
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 290596098; Sun, 15 Jan 2023 20:41:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 16 Jan 2023 11:41:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 16 Jan 2023 11:41:34 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
CC: <trevor.wu@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [RESEND,v5 00/13] ASoC: mediatek: Add support for MT8188 SoC
Date: Mon, 16 Jan 2023 11:41:18 +0800
Message-ID: <20230116034131.23943-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_034158_729071_4324404E 
X-CRM114-Status: GOOD (  13.29  )
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

This series of patches adds support for Mediatek AFE of MT8188 SoC.
Patches are based on broonie tree "for-next" branch.

Changes since v4:
  - refine etdm dai driver based on reviewer's suggestions
  - refine dt-binding files based on reviewer's suggestions

Changes since v3:
  - replace apll_ck with apll to sync with the relationship in CCF
  - add mtk-soundcard-driver.c to support codec parsing
  - drop mclk-always-on-rates support in mt8188-dai-etdm.c
  - refine dt-binding files based on reviewer's suggestions

Changes since v2:
  - drop CLK_IGNORE_UNUSED flag
  - include bitfield.h to reslove the issue reported by kernel test robot
  - rename mt8188-afe-pcm.yaml to mt8188-afe.yaml
  - refine dt-binding files based on reviewer's suggestions

Changes since v1:
  - remove bus protection functions in case of unmerged dependency problem
  - replace some bit operation macro with FIELD_PREP
  - simplify register control by regmap_set_bits and regmap_clear_bits
  - fix dt-binding errors
  - rename compatible string for recognition

Trevor Wu (13):
  ASoC: mediatek: common: add SMC ops and SMC CMD
  ASoC: mediatek: mt8188: add common header
  ASoC: mediatek: mt8188: support audsys clock
  ASoC: mediatek: mt8188: support adda in platform driver
  ASoC: mediatek: mt8188: support etdm in platform driver
  ASoC: mediatek: mt8188: support pcmif in platform driver
  ASoC: mediatek: mt8188: support audio clock control
  ASoC: mediatek: mt8188: add platform driver
  ASoC: mediatek: mt8188: add control for timing select
  ASoC: dt-bindings: mediatek,mt8188-afe: add audio afe document
  ASoC: mediatek: common: add soundcard driver common code
  ASoC: mediatek: mt8188: add machine driver with mt6359
  ASoC: dt-bindings: mediatek,mt8188-mt6359: add mt8188-mt6359 document

 .../bindings/sound/mediatek,mt8188-afe.yaml   |  208 +
 .../sound/mediatek,mt8188-mt6359.yaml         |   97 +
 sound/soc/mediatek/Kconfig                    |   23 +
 sound/soc/mediatek/Makefile                   |    1 +
 sound/soc/mediatek/common/Makefile            |    2 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   19 +
 .../mediatek/common/mtk-soundcard-driver.c    |   79 +
 .../mediatek/common/mtk-soundcard-driver.h    |   14 +
 sound/soc/mediatek/mt8188/Makefile            |   15 +
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c    |  658 ++++
 sound/soc/mediatek/mt8188/mt8188-afe-clk.h    |  115 +
 sound/soc/mediatek/mt8188/mt8188-afe-common.h |  151 +
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    | 3359 +++++++++++++++++
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c |  205 +
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.h |   15 +
 .../soc/mediatek/mt8188/mt8188-audsys-clkid.h |   83 +
 sound/soc/mediatek/mt8188/mt8188-dai-adda.c   |  632 ++++
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c   | 2588 +++++++++++++
 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c    |  367 ++
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     |  785 ++++
 sound/soc/mediatek/mt8188/mt8188-reg.h        | 3180 ++++++++++++++++
 21 files changed, 12595 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
 create mode 100644 sound/soc/mediatek/common/mtk-soundcard-driver.c
 create mode 100644 sound/soc/mediatek/common/mtk-soundcard-driver.h
 create mode 100644 sound/soc/mediatek/mt8188/Makefile
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-audsys-clk.h
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-mt6359.c
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-reg.h

-- 
2.18.0


