Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAE9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 07:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zwmygsJBDkNl63lhvRY4iZh6dawpeoSuGaW0ODzHaww=; b=PY9ycmSu7S1FicS3Nw8NeN76aC
	bgjoQMxlxPrAyp5cd536hZAfTA5X8X9LTf6DzA1JQcO2y39SUje/awSwfWJ7lQtT3nSlPvtCfebIg
	xjD5ACbRCViGjKfSSYe4vWmsWzCI6aAP6TDnPErZiDKfZCmLxpTHhJznSKI0mQIPh8tgfqRkKUND2
	3qTO/meyBSX8hN/oVDrYBrRqqkK6XTBTwoJrgvQgn4M+7o1Q06PE9EUt2If5dYvt2IxOgxMyPEb5Q
	uehaS0wLy662jQlCf0qJU1RnvJX1qzGbNHBSgoylmOZu1Rk8VEyl7vCvLXeNhZZsJldZTDR++UK5J
	BlVc3hpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1kC5-0018r0-Ic; Thu, 16 Jun 2022 07:45:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1k7T-0016pv-KW; Thu, 16 Jun 2022 07:40:52 +0000
X-UUID: 42ae6f51e7a54b7ebc2fb932d9203faa-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:4fa16af9-4037-4809-a978-b69cac4d3f70,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:4001b848-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 42ae6f51e7a54b7ebc2fb932d9203faa-20220616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 233219767; Thu, 16 Jun 2022 00:40:41 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 00:30:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Jun 2022 15:30:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jun 2022 15:30:45 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, "Mark
 Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Tinghan Shen <tinghan.shen@mediatek.com>, YC Hung
	<yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>, Allen-KH
 Cheng <allen-kh.cheng@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 0/4] Add MT8186 ADSP dt-binding
Date: Thu, 16 Jun 2022 15:30:38 +0800
Message-ID: <20220616073042.13229-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_004047_804208_268669B0 
X-CRM114-Status: UNSURE (   9.39  )
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

v2 -> v3:
1. Change mbox-names to rx/tx for both mt8186 and mt8195.
2. Update description of mbox-names
3. Use static string array instead of kasprintf
4. Align clock names in dsp driver with dt-bindings

v1 -> v2:
1. Change mbox-names from mbox0/mbox1 to rep/req for both mt8186 and mt8195.
2. rename clock-names and remove unused headers

Tinghan Shen (4):
  dt-bindings: dsp: mediatek: Use meaningful names for mbox
  firmware: mediatek: Use meaningful names for mbox
  dt-bindings: dsp: mediatek: Add mt8186 dsp document
  ASoC: SOF: mediatek: Align mt8186 clock names with dt-bindings

 .../bindings/dsp/mediatek,mt8186-dsp.yaml     | 91 +++++++++++++++++++
 .../bindings/dsp/mediatek,mt8195-dsp.yaml     | 10 +-
 drivers/firmware/mtk-adsp-ipc.c               | 36 +++-----
 sound/soc/sof/mediatek/mt8186/mt8186-clk.c    |  4 +-
 4 files changed, 110 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml

-- 
2.18.0


