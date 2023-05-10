Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C02C7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 03:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KFl4o2oTEXIuC50VUjceM5T7L1ImEjmdWMIVmJIbIvc=; b=yERBb/q1dsjyv4SDXw39AU9PDc
	Y7YikEERV0plwRpTFKKQmRl1sV7pUij2RVhxHqT/c2TXCSqmasQzIYNdlyt4XhyJtv4FbHQ/ediqD
	7zODBhsjrKOYzW6YOfvg4gf9yRlNJloT0DMjXxVjeTJdeXycPfNMOGUNMRowpMBGoz72VjhzEyvMs
	KbyRZMbsiWILE+mCfHj6LGmyDXNHPzESb1qyPIN4LEVoXzpFewW3KuYdvICJM2iSmQdyWU8V85PYL
	/+I44sRN7nINxTLoKISprdpHbUqtWjgaMa2f1Pp13VHOzHhdb7xEsNNvgmNII6a4s5gFpYRQI75Vf
	a2vAFSFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwavX-004xKH-1e;
	Wed, 10 May 2023 03:55:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwavT-004xHY-03;
	Wed, 10 May 2023 03:55:41 +0000
X-UUID: 81bbf210eee611ed912e1518a6540028-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=KFl4o2oTEXIuC50VUjceM5T7L1ImEjmdWMIVmJIbIvc=;
	b=jKfy59Y1vONy/t1+KS9cKxwxovYtuLkW8OxpvhnFHiNK59mQwo9imP+zy54SUBVGoUaae7KjvJkF5zxjIfnUrtxaDRchR2Zxlnxou07miK+vTzS+AqusVbFiW6yY6d6cUjTMPlkaQhun6f2YtkKcDJZd2UooD8JWrGNNnzaVM10=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:d6032d10-e79e-457f-b3a0-ca4d61cdec2b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:178d4d4,CLOUDID:5a6758c0-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 81bbf210eee611ed912e1518a6540028-20230509
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2103152648; Tue, 09 May 2023 20:55:30 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 May 2023 11:55:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 May 2023 11:55:28 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 0/9] ASoC: mediatek: mt8188: revise AFE driver
Date: Wed, 10 May 2023 11:55:17 +0800
Message-ID: <20230510035526.18137-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_205539_060869_F9031116 
X-CRM114-Status: GOOD (  10.19  )
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

The series of patches consists of four major changes.
First, remove redundant supply for ADDA DAI dirver. Second, revise ETDM
control including APLL dynamic switch via DAPM, so APLL can be enabled
when it is really required. Third, update AFE probe function. Bus
protection change was dropped at the previous patch because the dependent
change was not accepted at that time. Finally, correct some binding errors
and add required clocks.

Changes since v3:
  - correct errors in binding file
  - add required clocks which are possibly used in the future

Changes since v2:
  - remove required properties in dt-binding file

Changes since v1:
  - replace unnecessary dev_info with dev_dbg
  - fix dt-binging ABI breaking behavior

Trevor Wu (9):
  ASoC: mediatek: mt8188: remove supply AUDIO_HIRES
  ASoC: mediatek: mt8188: complete set_tdm_slot function
  ASoC: mediatek: mt8188: revise ETDM control flow
  ASoC: mediatek: mt8188: refine APLL control
  ASoC: mediatek: mt8188: combine afe component registration
  ASoC: mediatek: mt8188: add bus protection
  ASoC: mediatek: mt8188: add required clocks
  ASoC: dt-bindings: mediatek,mt8188-afe: correct clock name
  ASoC: dt-bindings: mediatek,mt8188-afe: add audio properties

 .../bindings/sound/mediatek,mt8188-afe.yaml   |  66 +-
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c    | 142 ++-
 sound/soc/mediatek/mt8188/mt8188-afe-clk.h    |  15 +
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    | 113 ++-
 sound/soc/mediatek/mt8188/mt8188-dai-adda.c   |  37 -
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c   | 922 ++++++++++--------
 sound/soc/mediatek/mt8188/mt8188-reg.h        |   2 +
 7 files changed, 795 insertions(+), 502 deletions(-)

-- 
2.18.0


