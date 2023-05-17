Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB87C77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 11:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jF5GZyRGb/IcLuhzuqGakVFZy8gHEbuq61zX8J4vkh4=; b=A2Q+zMFabEPNDU1PwjS409zJh4
	kLNO5zQCobmmadAkE9B7ham8GWIb2MWKbr+TtEm6w2QTYh402Y2eFQ70cy0g0ft/YEyeZ3uC6vLyW
	9D4WCRhmnEMeY14dTgDgxIwHWHD2QJpEPsAbSRu7psX2Ekuze0cNrP5P6AKoawZ2fN71hJiByCuFA
	EgWpmnPRnpBTPXxHRBw2lNrcTG+KxkTlyW3Ac14s4wSVxl2QhWJaUoKs3IedAcpk0SCa30xWaRmzZ
	dFk3Zr7n4Q5L0/wnW2w/JQgxKO2Sy4kQn0ttI3dMxgGn5VqFw0RsU+kzEQLwHLDPFihOa8F8DnQ7n
	SgIIR/OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzF8k-009ZY1-0O;
	Wed, 17 May 2023 11:16:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzF8h-009ZWd-2P;
	Wed, 17 May 2023 11:16:16 +0000
X-UUID: 3a567508f4a411ed83ed1395ce914268-20230517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jF5GZyRGb/IcLuhzuqGakVFZy8gHEbuq61zX8J4vkh4=;
	b=eW2hEbUjarZg20ZE9XYymgsHfi/Rv4/bwBcqG0LtyezuJZQtqClJSSB0xIdl8vJwy3yUvMm//vr3YBpKaN/RhdUEI/9u1JY6WUHkogixkcdpcwYhQapzlS42MLjlfAmtP2WQ4oWRn+jV9quH/0imHYc9jABACIe2wIeJG8TNgek=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:74da0695-0b78-46b1-89c3-0930d27d37e5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.25,REQID:74da0695-0b78-46b1-89c3-0930d27d37e5,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:d5b0ae3,CLOUDID:4e7b25c1-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:230517191537PTNBPR4Q,BulkQuantity:1,Recheck:0,SF:19|48|38|29|28|17,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 3a567508f4a411ed83ed1395ce914268-20230517
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 997162354; Wed, 17 May 2023 04:16:10 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 19:15:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 19:15:35 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 0/5] ASoC: mt8188: add new board support
Date: Wed, 17 May 2023 19:15:29 +0800
Message-ID: <20230517111534.32630-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_041615_783409_E1E54BB1 
X-CRM114-Status: UNSURE (   9.86  )
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

In the series, we extend the capability of mt8188-mt6359 driver.

The following changes are included.
1. Divide ADDA BE dai into two dais for SOF.
2. Register hdmi/dp jack pins.
3. dai_fmt can be configured from device tree.
4. Add some I2S codecs support.

In addition, new compatible string "mediatek,mt8188-nau8825" is
included for a new board support.

Trevor Wu (5):
  ASoC: mediatek: mt8188: separate ADDA playback dai from capture dai
  ASoC: mediatek: mt8188-mt6359: register hdmi/dp jack pins
  ASoC: mediatek: common: soundcard driver add dai_fmt support
  ASoC: mediatek: mt8188-mt6359: support new board with nau88255
  ASoC: dt-bindings: mediatek,mt8188-mt6359: update properties

 .../sound/mediatek,mt8188-mt6359.yaml         |  27 +-
 sound/soc/mediatek/Kconfig                    |   4 +
 .../mediatek/common/mtk-soundcard-driver.c    |  49 ++-
 sound/soc/mediatek/mt8188/mt8188-afe-common.h |   3 +-
 sound/soc/mediatek/mt8188/mt8188-dai-adda.c   |  76 ++--
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 326 +++++++++++++++++-
 6 files changed, 431 insertions(+), 54 deletions(-)

-- 
2.18.0


