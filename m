Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BBCC001E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 09:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K+YQS5xB64fTK5bVKPhratt+D7Px34VsbDsFGcssVnk=; b=tP23oZBOMSNQuYllQbz3RSWhpl
	v9XC875kgWmXsB5w8i7o5vGzdir8be+hh83xPxOw97Te0LhHoQnbVURzfNrp2RIrhDWXYBZZZ54cI
	uuNSrzJIirogDOQ3TNqgSXgobu1Y/rk4K4eGRwjnju3v8Ac+dEbHIH2MH6h5sgOUT2yYP9SG8qsbW
	D++tDZZolYnkcmy+3Nmd+se4/Yr4PohMzg4FollC/juQ9kGC2hoywFOyzxftsaGNYaHRTWD27CecW
	HFhvHc/ffkwLPWTWMbq0qSLtbSsm6P9tcyvH88jLMpOrSVrGY1qFMU7c4tv9StPH0Sq0JLGl3Xaa+
	fmhk2cDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJml-002dYQ-2s;
	Fri, 28 Jul 2023 09:29:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJmj-002dXu-1W;
	Fri, 28 Jul 2023 09:29:22 +0000
X-UUID: 370a76fc2d2911ee83ed1395ce914268-20230728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=K+YQS5xB64fTK5bVKPhratt+D7Px34VsbDsFGcssVnk=;
	b=loNnC/mcM3I80rhceDYdyGg1XG24SOh2UU85V1bUaHRW9mvNADi5LWo6+cWZft7cN/fSAvLdHs9j+bJAlHcir2m0S3WYfHkP1XR3HrG2ODWTVUgo9JhHj1ZFFbUXRHYpA6IoUBi03Auyse8tqriXHs9cfM3wxuPabzun+GksHc0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:c1b9f061-20d6-415a-aa59-c28b0b8f61f3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:1fcc6f8,CLOUDID:1595e4b3-a467-4aa9-9e04-f584452e3794,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 370a76fc2d2911ee83ed1395ce914268-20230728
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 43554650; Fri, 28 Jul 2023 02:29:13 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 28 Jul 2023 17:08:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 28 Jul 2023 17:08:37 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>, Arnd
 Bergmann <arnd@arndb.de>, Mars Chen
	<chenxiangrui@huaqin.corp-partner.google.com>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH v3 0/6] ASoC: mediatek: Add support for MT7986 SoC
Date: Fri, 28 Jul 2023 17:08:13 +0800
Message-ID: <20230728090819.18038-1-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_022921_520832_2096B4D0 
X-CRM114-Status: GOOD (  12.72  )
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

Changes in v3:
 - merge clk api to mt7986-afe-pcm.c, remove [2/7] in v2
 - refine based on reviewer's suggestions [1/6] [2/6]
 - fix the comment format, move in clk api, and simplify based on reviewer's suggestions [3/6] 
 - remove redundant prefix in dt-binding [6/6]

Changes in v2:
 - v1 title: [PATCH 0/7] ASoC: mediatek: Add support for MT79xx SoC
 - add missing maintainers
 - rename mt79xx to mt7986 in all files
 - use clk bulk api in mt7986-afe-clk.c [2/7]
 - refine mt79xx-afe-pcm.c based on reviewer's suggestions [4/7]
 - refine dt-binding files based on reviewer's suggestions [6/7] [7/7]
 - transpose [3/7] and [4/7] in v1 to fix test build errors

Maso Huang (6):
  ASoC: mediatek: mt7986: add common header
  ASoC: mediatek: mt7986: support etdm in platform driver
  ASoC: mediatek: mt7986: add platform driver
  ASoC: mediatek: mt7986: add machine driver with wm8960
  ASoC: dt-bindings: mediatek,mt7986-wm8960: add mt7986-wm8960 document
  ASoC: dt-bindings: mediatek,mt7986-afe: add audio afe document

 .../bindings/sound/mediatek,mt7986-afe.yaml   |  89 +++
 .../sound/mediatek,mt7986-wm8960.yaml         |  53 ++
 sound/soc/mediatek/Kconfig                    |  20 +
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/mt7986/Makefile            |   9 +
 sound/soc/mediatek/mt7986/mt7986-afe-common.h |  49 ++
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c    | 622 ++++++++++++++++++
 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c   | 420 ++++++++++++
 sound/soc/mediatek/mt7986/mt7986-reg.h        | 206 ++++++
 sound/soc/mediatek/mt7986/mt7986-wm8960.c     | 184 ++++++
 10 files changed, 1653 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
 create mode 100644 sound/soc/mediatek/mt7986/Makefile
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-common.h
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-reg.h
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-wm8960.c

-- 
2.18.0


