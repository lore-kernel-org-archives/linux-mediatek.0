Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FFFC54EBE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 08:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WFDK6HF3F9x/8+wn/8Ji4fbDarvgIgMr9kjOz7e90ro=; b=doX1o7rfK771EDZdEZzdiLHZjl
	F1NMQQoToogglvJe7TQgVwR/HounpNfjHrD9vSvPP++zSHP8dlS/wZVSfL9dihKCo26rl5NvkYPp9
	R1r/V1vXE4NCRZU2nmWBW8jHIlKHYpCny2nLDUj1vfP4BduUWnSQ7fkoVEXjI/uM6OFH0/MxUZBI6
	S2WNuQenkbVbhZv7HbJmePVNOQi++xRX5du1JHDjub/dQrrtzzKOAMOOSyZU0UX5WOVSzZIUD33v6
	q88pBjlPgO5WQfxWWG+VOV8RLCvshicTnlP7ANCz4aDkPwxRmUdSns4BY0N4cEV+Imt/Nl+jrFLFV
	qbCOq1LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAFO-005sVN-4P; Tue, 10 Jan 2023 08:44:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAEm-005sEr-4J; Tue, 10 Jan 2023 08:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=WFDK6HF3F9x/8+wn/8Ji4fbDarvgIgMr9kjOz7e90ro=; b=bRlU6jNIWUZsiyBmeG+AvzIXxe
	B/FmXiiGUlFkLT1jhDtCQNq8GKCugCAZBwAvslSpt9UkSQZfuJO+Bsf6w7axskhw0h9o/6J6AG5va
	yVOGSBDEJ7GCRkb6iwfh3yfe/QiUasghP5vDkKAtARe1Vi8JhU6dNCi5gR+jig6YmH1FlVG+vhkHJ
	MTxzdRzc+FNLQLgV+c8XNDwMyn2VXO4TsJgYEftxvIe+MS5aG1yWyfTGS1nei3hODyZJ+BfpUnMu/
	5buUFZA+lU5DeIdxL1rhqHKXE4lW3P8/SN1SoB4RChyMhLLZ3EYHn+N8qAzYJXMDaZbN9cr0RtKUX
	XH0RSrBg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pFAEX-0033Zh-20;
	Tue, 10 Jan 2023 08:43:54 +0000
X-UUID: e713c36890c211eda08d4d6090ec5a5c-20230110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=WFDK6HF3F9x/8+wn/8Ji4fbDarvgIgMr9kjOz7e90ro=;
	b=rwJLPa6ZuK4j5a9JlKsomShktI2MV6zozaCJNl0BWcQrmYdSLNR1cSI0/ObkuZSIScwAv8qSLD4MXgn6WwVHASJxCdsJgYCLnItXhC8J446yA7CysIgk9SUoOSQxncD1+q4w123FSFzoZuUWWVVXRAAPlO2iekg/ct+JK8S/jIs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:e13ee938-a95a-4e2f-9170-b893224602ac,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:a0683754-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: e713c36890c211eda08d4d6090ec5a5c-20230110
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1858416146; Tue, 10 Jan 2023 01:43:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 16:43:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 16:43:13 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Tinghan Shen <tinghan.shen@mediatek.com>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, Chunxu Li
	<chunxu.li@mediatek.com>, Dan Carpenter <error27@gmail.com>, YC Hung
	<yc.hung@mediatek.com>, Wan Jiabing <wanjiabing@vivo.com>, Allen-KH Cheng
	<Allen-KH.Cheng@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 0/3] Add support of MediaTek mt8188 to SOF
Date: Tue, 10 Jan 2023 16:43:09 +0800
Message-ID: <20230110084312.12953-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_084350_872239_8431EEE6 
X-CRM114-Status: GOOD (  10.63  )
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
 sound/soc/sof/mediatek/mt8186/mt8186.h        | 10 +++++++++-
 sound/soc/sof/mediatek/mt8195/mt8195.c        |  1 +
 4 files changed, 33 insertions(+), 2 deletions(-)

-- 
2.18.0


