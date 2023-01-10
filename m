Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6498C61DB3
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nv45cAPgQZFnMe/GJQzPYM+/k0dB/WqWToW8fm1qrmg=; b=h2TtgAxXkETFq+/bbK2vkuL6Zr
	XGGdlXJ+RoSsoDUG4NfZt1AZeQoG7q582LGDqPPUAQYjQZZXq42u4lhLdG40O/ZNJGAWHSqoJJsXB
	+v5v3Eq7Em0EhGHD3X7ITJQG+pTQoe5SMdhsCgbr5E36XqSfWjtukLvp5eA8bhpZv+W8HSh7CAnVb
	k+sbT/QH3Z8yWQQEwiZU2+++DigA3qjsfgrtBP5wE6RD1Ay1cZML4JtorPzhh4mCkhuN32LJlnJWI
	9vOIC/MdrlDi9esCF0GfZPfq/EaAqhimIfeGLSyr6l5TPUrvr2ikX+Syyt1mg1gkf5C/xBtEzVEpD
	sSDj+3Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAEy-005sHw-Jo; Tue, 10 Jan 2023 08:44:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAEi-005sC4-30; Tue, 10 Jan 2023 08:44:02 +0000
X-UUID: e86de27a90c211edbbe3f76fe852e059-20230110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nv45cAPgQZFnMe/GJQzPYM+/k0dB/WqWToW8fm1qrmg=;
	b=L6ykO31RoJPwHg8HT55Q4wR9cys68S1ti85fr7zfIpa+mbvDbxqJwQVpiX0dHPo+MZbBGMAw14TFk9EpEQ8TS/0tq3k+pLV7MmDfIVGOhZYOKowgvqpzdT7j0KC4rGxy7hFUF872h3aBxUKvA+kE3M15yFKmb3ZdINgx1fV01lU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:1e1256f9-3044-444a-bbec-0fbf508429dc,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:543e81c,CLOUDID:5252d28b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: e86de27a90c211edbbe3f76fe852e059-20230110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2054589260; Tue, 10 Jan 2023 01:43:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 16:43:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 16:43:14 +0800
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
Subject: [PATCH v2 3/3] ASoC: SOF: mediatek: Provide debugfs_add_region_item ops for core
Date: Tue, 10 Jan 2023 16:43:12 +0800
Message-ID: <20230110084312.12953-4-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230110084312.12953-1-tinghan.shen@mediatek.com>
References: <20230110084312.12953-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_004400_189068_8DBA129D 
X-CRM114-Status: GOOD (  11.95  )
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

Set the generic iomem callback for debugfs_add_region_item to support
sof-logger.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 3 +++
 sound/soc/sof/mediatek/mt8195/mt8195.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index af0dfc2fc4cc..dbea604ebc04 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -588,6 +588,9 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	.drv		= mt8186_dai,
 	.num_drv	= ARRAY_SIZE(mt8186_dai),
 
+	/* Debug information */
+	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
+
 	/* PM */
 	.suspend	= mt8186_dsp_suspend,
 	.resume		= mt8186_dsp_resume,
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 7c831e18483c..5b04fec9c9c9 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -637,6 +637,7 @@ static struct snd_sof_dsp_ops sof_mt8195_ops = {
 
 	/* Debug information */
 	.dbg_dump = mt8195_adsp_dump,
+	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
 	/* DAI drivers */
 	.drv = mt8195_dai,
-- 
2.18.0


