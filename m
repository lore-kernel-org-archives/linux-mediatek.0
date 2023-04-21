Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E742CC77B7E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 10:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ggnad62p6Gudc5OFGlOZvU0TYyKqyqL4O7G2gKLarMk=; b=TWCCAHTc+hfK9murolExGrk9mJ
	u5Ex2SUsqhIH/zM7PZ/WNAUlf2dz1EcuphcAs4TPAYUDSXO5NI//1GVT5G8Vx3SRndhhw3lEUozZY
	Su7tKbLO5jIQjDQCKMpV0Ysc5vYnLlS28T9pMdOZgIl4bcflYYiv1r7Ow6rbAXJvh7MboB2flWasF
	VmV/5QQcJ4DZnhnMmBNH6LQiFaBj+0k3PZrBtx1k+lCeXnoOl3UWBCgHgb4y7v6EPBG+WYZOntzzt
	bfMcZFAhbOVu7jMyVgxfGXUGxAXzmXk6GLj66H3BLDXVYVLAujq1yG+3SC3pNzYQnm5smZ6ft7h6x
	JsKmiF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppnrU-00AT5u-1L;
	Fri, 21 Apr 2023 10:19:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppnrI-00ASzW-2L;
	Fri, 21 Apr 2023 10:19:17 +0000
X-UUID: f4e0bc20e02d11edb7d8d11f642b8e78-20230421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ggnad62p6Gudc5OFGlOZvU0TYyKqyqL4O7G2gKLarMk=;
	b=oeOMhvPmu0Q+3HhO32lIrekEn6kEyh5/oZZWZUp3TEpcBQUG+YmDFZFr7BtgR2R38SdjORP+ofNh6eq00vCWOiL0AozZuBh6pRanE6964Jy/UAaprD9kCOpejSlQb1gTuxyWbSDmkDz/6YsXt8ECwxEI7o626xy4hcsZqYQ8Dwk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:56215e4f-fd50-4331-88ab-705d39bc9cfc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:c314b9eb-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: f4e0bc20e02d11edb7d8d11f642b8e78-20230421
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1916456595; Fri, 21 Apr 2023 03:19:10 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 21 Apr 2023 18:09:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 21 Apr 2023 18:09:07 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 0/7] ASoC: mediatek: mt8188: revise AFE driver
Date: Fri, 21 Apr 2023 18:08:58 +0800
Message-ID: <20230421100905.28045-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_031916_784799_0A211276 
X-CRM114-Status: UNSURE (   9.50  )
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

The series of patches consists of three major changes.
First, remove redundant supply for ADDA DAI dirver. Second, revise ETDM
control including APLL dynamic switch via DAPM, so APLL can be enabled
when it is really required. Finally, AFE probe function is updated. Bus
protection change was dropped at the previous patch because the dependent
change was not accepted.

Changes since v1:
  - replace unnecessary dev_info with dev_dbg
  - fix dt-binging ABI breaking behavior

Trevor Wu (7):
  ASoC: mediatek: mt8188: remove supply AUDIO_HIRES
  ASoC: mediatek: mt8188: complete set_tdm_slot function
  ASoC: mediatek: mt8188: revise ETDM control flow
  ASoC: mediatek: mt8188: refine APLL control
  ASoC: mediatek: mt8188: combine afe component registration
  ASoC: mediatek: mt8188: add bus protection
  ASoC: dt-bindings: mediatek,mt8188-afe: add audio properties

 .../bindings/sound/mediatek,mt8188-afe.yaml   |  16 +-
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c    | 138 ++-
 sound/soc/mediatek/mt8188/mt8188-afe-clk.h    |  11 +
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    | 113 ++-
 sound/soc/mediatek/mt8188/mt8188-dai-adda.c   |  37 -
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c   | 922 ++++++++++--------
 sound/soc/mediatek/mt8188/mt8188-reg.h        |   2 +
 7 files changed, 755 insertions(+), 484 deletions(-)

-- 
2.18.0


