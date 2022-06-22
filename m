Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF519C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 06:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DbDW3NKIS/svB4zK5rnoOgsdzKXQdVOuB0tsrikfYI0=; b=cAlHslpa5J9Z7Z3+9nTl6up/xn
	hFbVK64K0HpKfwG4e5IxXwStJuz9k/jFN7oHX5OSoww8o7ZsJmaL0DGd+5no75gImjzuWX8krPjKC
	lNoE2VeCnH5liywgDyseOe1Vx7/ACrrcLXedT7FFl80hprnwM8Vw2eNlM/ihW8EV5WhYFWgrk4yJp
	0MGZAPa/lOSTDrE5xMSVbv8bvq0IBK3zxMY2/4VnpfsSeGeINpcxzQOLKsz9YN3I5JfVghY1bvCFR
	abF4jEkC4ilDSjSzZxKT6oFOLtJxY0qtX9Eg+mANl+mMdP1pd23N5TohbEb2Wm/BxnfFfKFZxxpvj
	1IdQ4zhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3tuK-008omm-S5; Wed, 22 Jun 2022 06:32:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3tlQ-008lsV-Rq; Wed, 22 Jun 2022 06:23:00 +0000
X-UUID: fbdf15f18b3449efa9f8c5e09005e508-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:ed13db38-40e1-4d0e-ac03-61d5fecb0370,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:b94bb82d-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: fbdf15f18b3449efa9f8c5e09005e508-20220621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1075101948; Tue, 21 Jun 2022 23:22:50 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 23:22:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 14:22:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 22 Jun 2022 14:22:46 +0800
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
	<yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>,
	"Allen-KH Cheng" <allen-kh.cheng@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 0/4] Add MT8186 ADSP dt-binding
Date: Wed, 22 Jun 2022 14:22:41 +0800
Message-ID: <20220622062245.21021-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_232257_035036_ECFFD546 
X-CRM114-Status: UNSURE (   9.48  )
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

v3 -> v4:
1. Update commit message of patch 1/4
2. Add review tag to path 3/4

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


