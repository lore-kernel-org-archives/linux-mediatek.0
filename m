Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A42C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Dec 2022 06:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mzkH0/QhnNUKthB0EOesphpVmgsLNcxmI7NqMZkJnhE=; b=emgbBMnbeDqYf+a9tiDSt7BODM
	vH1EsIcQYOyZzDoO58IjMC+M1/Vn3yJEonoU6pqollfSZJl2koN/5HYC65W3MVejFaBvHSPJDoDBT
	G8gsxF9U4yYFXBDy6A8GBBpi0UisPe2vSlAaH6lTjVA68jzaWf4MplYJIEeZUvpY5FKw18Heu5/nH
	pmqeUMzT6/LiNZScVbu8D1aqcoHR8K0nT2cnUQzi3+FzEWFkFaQ3UmnQV6jku0f8mvnWeeKCpsc1K
	flxjSFcFPWrc7Z/9Uuy2oOF6MEWxTRlwp6FW4eQzQlnO5pkkApWhMPwCKRlhm8nkfMTdJpVYPG8tn
	uovErIig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5hw7-006tQd-U4; Thu, 15 Dec 2022 06:41:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5hvw-006tLx-K2; Thu, 15 Dec 2022 06:41:34 +0000
X-UUID: 1ce5f31beba24b9795b609af62f1eb25-20221214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=mzkH0/QhnNUKthB0EOesphpVmgsLNcxmI7NqMZkJnhE=;
	b=pzWs8r94mRD5UUOhx3C5NTXdpT+8Y1Q6/+HZvyMYcObi0HfOmjL9uPlsho4yrFmpA47fJBKpwWZqxTYUhC/R2AYjoRfT+iUicpj7cX3ndsdMRIF3X6jt3x9EPCsucmA0RTpd31Vb/a3fTNPUUyiDkRheuRy8LxDQvUYhdGmZV8M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:320b2146-fe1b-440c-8af7-625fb59699ba,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:8d22b3af-9f02-4d44-9c44-6e4bb4e4f412,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1ce5f31beba24b9795b609af62f1eb25-20221214
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yc.hung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 457410653; Wed, 14 Dec 2022 23:41:27 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Dec 2022 14:10:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Dec 2022 14:10:48 +0800
From: YC Hung <yc.hung@mediatek.com>
To: 
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard
 Liao <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, YC Hung
	<yc.hung@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chunxu Li
	<chunxu.li@mediatek.com>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
	<sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Curtis Malainey <cujomalainey@chromium.org>
Subject: [PATCH] ASoC: SOF: mediatek: mt8195: remove a redundant comparison of sram
Date: Thu, 15 Dec 2022 14:10:46 +0800
Message-ID: <20221215061046.16934-1-yc.hung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_224132_724005_6B3C2C00 
X-CRM114-Status: UNSURE (   9.75  )
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

DSP SRAM is not used for audio shared buffer between host and DSP so
TOTAL_SIZE_SHARED_SRAM_FROM_TAIL is zero. Remove the definition and
redundant comparison to fix coverity "unsigned compared against 0".

Signed-off-by: YC Hung <yc.hung@mediatek.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 5 -----
 sound/soc/sof/mediatek/mt8195/mt8195.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 3c81e84fcecf..7c831e18483c 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -215,11 +215,6 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 
 	adsp->pa_sram = (phys_addr_t)mmio->start;
 	adsp->sramsize = resource_size(mmio);
-	if (adsp->sramsize < TOTAL_SIZE_SHARED_SRAM_FROM_TAIL) {
-		dev_err(dev, "adsp SRAM(%#x) is not enough for share\n",
-			adsp->sramsize);
-		return -EINVAL;
-	}
 
 	dev_dbg(dev, "sram pbase=%pa,%#x\n", &adsp->pa_sram, adsp->sramsize);
 
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.h b/sound/soc/sof/mediatek/mt8195/mt8195.h
index 7ffd523f936c..b4229170049f 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.h
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.h
@@ -139,8 +139,6 @@ struct snd_sof_dev;
 #define DSP_MBOX1_BAR	6
 #define DSP_MBOX2_BAR	7
 
-#define TOTAL_SIZE_SHARED_SRAM_FROM_TAIL  0x0
-
 #define SIZE_SHARED_DRAM_DL 0x40000 /*Shared buffer for Downlink*/
 #define SIZE_SHARED_DRAM_UL 0x40000 /*Shared buffer for Uplink*/
 
-- 
2.18.0


