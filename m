Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAD0C7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 11:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y1HnJqsO/WkMHXAXN/S1iWJu5d9vaTn7O2ZE737u36k=; b=nJ6w3ct0ST8jKGeYa7fFVAlhiv
	E0woDaWQuk6RmeylNH4zrc5Oh4X8C+xakpsZ/3Qx1Y+CY0DQwbMPYGgKh8Iik8efadx3NwIMUIpNY
	tN8+U+OQ54DmO1uOGthWCzB2ni5MfaNoWqZTxTCzBOFzHsyCbk72lapHNlvu614BrNnN642mFwqMs
	c9XDYFGy76GOhQl4CdLHVuO2Z/Mezr13nYLfdedVRf79AyoDrrPjzMQQFxyDvEEWjH7VwNHyVS3qU
	UmfDWQygSc1MqtxeMK0+OWop/1ynhPIFYVeueVee1w3YKurt9i10KZ0QrCcCH5Rgw7/FuvP04COUj
	bvrFrMww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFhn-009gIG-0N;
	Wed, 17 May 2023 11:52:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFhj-009gGp-38;
	Wed, 17 May 2023 11:52:29 +0000
X-UUID: 48ea1e6cf4a911ed912e1518a6540028-20230517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Y1HnJqsO/WkMHXAXN/S1iWJu5d9vaTn7O2ZE737u36k=;
	b=BzM1EjTJ2H5qet2sxuV2LbU6KnAkVA9vbFkAstrQRDT0y3+pl/RVm8ls2/pavwX2aAMofoWTq6yhSx3LaC5GEfk8mftkJ5Cg6yOmDcYQkN9vGVK4puwd/adbFs/k8p9Frgv9hxWozJOm+zp2HJ6is19LzfWwgMLd1ctcI27kA5o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:3263a8e8-44ca-4a03-a6d8-0822914f92d2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:ba1c26c1-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 48ea1e6cf4a911ed912e1518a6540028-20230517
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 436762288; Wed, 17 May 2023 04:52:22 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 19:52:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 19:52:20 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <bicycle.tsai@mediatek.com>,
	<ting-fang.hou@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RESEND 0/4] ASoC: mt6359: kselftest fix and driver extension
Date: Wed, 17 May 2023 19:52:15 +0800
Message-ID: <20230517115219.532-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_045228_019714_9E482E7D 
X-CRM114-Status: UNSURE (   7.39  )
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

The patch series includes a kselftest fix and changes for extending
driver capability to support more use cases.

Trevor Wu (4):
  ASoC: mediatek: mt6359: add supply for MTKAIF
  ASoC: mediatek: mt6359: fix kselftest error of playback gain
  ASoC: mediatek: mt6359: add mtkaif gpio setting
  ASoC: mediatek: mt6359: update route for lineout mux

 sound/soc/codecs/mt6359.c | 152 ++++++++++++++++++++++++++++++++++----
 1 file changed, 137 insertions(+), 15 deletions(-)

-- 
2.18.0


