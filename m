Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2738FC001B2
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 07:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FJPFukDF7AUerp0CNeHyC/hh1h36pU7tNlEmG6GXReU=; b=jszIMlRBfpufKFxbsVM1qSwxfh
	8L5XdcDi1c5Q/rOWQalkPtB03lXPL/wBr/HFgQFpcU82rjOuo9J2+UyP9eKKG9LrF1ziC3/w4auPi
	0IO2AJ7P7jt/5dVgzxhRFCGd+MGfDYUaMYUztZZ/bcRPlEt4GLzItk0GzhX8yNLmCPcQUe7bAqg1E
	zEoBe07Y6aOhIbgqCDtyTb7Idv4inKWNSC7ecFNL4ja6wfSxa724w6agj5rYMoJnyg6xrig9qI21i
	qLVHcb4vdEX+A76qzAVtfE7f+3GBdpelGpn9XH5O4jSIntTz0ubMU9i9O/NGtiJUaj5kniWTXhHPF
	Ri3Hdqnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8FwE-008Una-GO; Thu, 22 Dec 2022 07:24:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Fvi-008UcH-To; Thu, 22 Dec 2022 07:23:54 +0000
X-UUID: 204aebd214984a15a398d341440b274f-20221222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=FJPFukDF7AUerp0CNeHyC/hh1h36pU7tNlEmG6GXReU=;
	b=AVEou5HEpvGtfEtbCaeIUOzPsqLMj3CSnf9ZBWskMPXXtQx7pHnODckF9o4lzxzzcGR2GraEQUgGtgGXDEPffwpMmjsSObLKpDDu/PBA2AUiIylIgrTjYr5gEssTw7IuJdJC+tQKH8dXPS+4Q0Q+n4CDHZKXBRf/C+aL6+PO2JQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:b599b0de-2d15-4dde-9baf-7235bb42c488,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:ae10a6f3-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 204aebd214984a15a398d341440b274f-20221222
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 297150977; Thu, 22 Dec 2022 00:23:41 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 22 Dec 2022 15:23:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 22 Dec 2022 15:23:05 +0800
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
	<tiwai@suse.com>, Tinghan Shen <tinghan.shen@mediatek.com>, Chunxu Li
	<chunxu.li@mediatek.com>, Dan Carpenter <error27@gmail.com>, YC Hung
	<yc.hung@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Allen-KH Cheng
	<Allen-KH.Cheng@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1 0/3] Add support of MediaTek mt8188 to SOF
Date: Thu, 22 Dec 2022 15:21:47 +0800
Message-ID: <20221222072150.10627-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_232351_094304_12188BE2 
X-CRM114-Status: UNSURE (   9.05  )
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

Add support of MediaTek mt8188 SoC DSP to SOF.
The sof driver patches in this series are taken from
thesofproject/linux/tree/topic/sof-dev-rebase.

Tinghan Shen (3):
  dt-bindings: dsp: mediatek: Add mt8188 dsp compatible
  ASoC: SOF: mediatek: Support mt8188 platform
  ASoC: SOF: mediatek: Provide debugfs_add_region_item ops for core

 .../bindings/dsp/mediatek,mt8186-dsp.yaml     |  4 +++-
 sound/soc/sof/mediatek/mt8186/mt8186.c        | 20 +++++++++++++++++++
 sound/soc/sof/mediatek/mt8186/mt8186.h        |  3 ++-
 sound/soc/sof/mediatek/mt8195/mt8195.c        |  1 +
 4 files changed, 26 insertions(+), 2 deletions(-)

-- 
2.18.0


