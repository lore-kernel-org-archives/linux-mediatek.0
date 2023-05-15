Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AA5C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 05:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Ksvdp8PTKxSr2UBQg5vm1z3nVvtS8V+ddsrIGxDdTY=; b=KOx6LJyxwIrtYGkbiWqt5dW2Bo
	CVmJBF7jkfpSFi2PC3scsZ6PsxCypiasV26lPmEmzHxRX6B2pbO9lr8Wq04FjYElWG2FIBqLR6d/z
	uOWvS9VGrAzcVe6oYPUM3SyydYWbwa/3U5TM4kwsh3p0V2SGIjB/p5x2HpcLR7oKndxcOw+NX8jEK
	b105xSt9PzAC0+cXzPG371z2q6T+7LoP7mvjrSwT/PIjMHfNSuidK8AlqVIzhe1zJe0KFgqF9ofQC
	imFGJc9ZBqvWPKSC0/1SMq/Nidl+Bo631fsn4HkOeZygjoR/zPg5v21sj2GcPJArXBfoHZjwYorTo
	Wk0np20w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyQj3-000x0x-2E;
	Mon, 15 May 2023 05:26:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyQj0-000x02-0C;
	Mon, 15 May 2023 05:26:23 +0000
X-UUID: 0508f1c4f2e111ed83ed1395ce914268-20230514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0Ksvdp8PTKxSr2UBQg5vm1z3nVvtS8V+ddsrIGxDdTY=;
	b=IQSM/pSre75BeSvmRdXPb1PiucCb/9DwfARAC2wb2PcUBUyH/Ln33fH3P+6+hsviFPbn83u/CUh+WdDkFq5tkZ9ZZsT4cLfS+4wXrO5fslXLDT0aaw9dS9HJWGIxtVeJfiU5NgdvTqolwa8NUL1HrSnUSf3x6w/8GCTegLGhAsA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:7b310417-b520-438b-a26e-298aeffef973,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:178d4d4,CLOUDID:d7c5cf6b-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 0508f1c4f2e111ed83ed1395ce914268-20230514
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1450497710; Sun, 14 May 2023 22:26:18 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 15 May 2023 13:25:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 15 May 2023 13:25:42 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <daniel.baluta@nxp.com>,
	<broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <yc.hung@mediatek.com>,
	<tinghan.shen@mediatek.com>, <sound-open-firmware@alsa-project.org>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: SOF: mediatek: add adsp debug dump
Date: Mon, 15 May 2023 13:25:40 +0800
Message-ID: <20230515052540.9037-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230515052540.9037-1-trevor.wu@mediatek.com>
References: <20230515052540.9037-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_222622_105105_E0327DA7 
X-CRM114-Status: GOOD (  10.61  )
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

Add mt8188 and mt8186 .dbg_dump callback to print some information when
DSP panic occurs.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 22 ++++++++++++++++++++++
 sound/soc/sof/mediatek/mt8186/mt8186.h |  5 +++++
 2 files changed, 27 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 3a9c81418c1f..bb59952885f6 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -24,6 +24,7 @@
 #include "../../sof-of-dev.h"
 #include "../../sof-audio.h"
 #include "../adsp_helper.h"
+#include "../mtk-adsp-common.h"
 #include "mt8186.h"
 #include "mt8186-clk.h"
 
@@ -473,6 +474,26 @@ static snd_pcm_uframes_t mt8186_pcm_pointer(struct snd_sof_dev *sdev,
 	return pos;
 }
 
+static void mt8186_adsp_dump(struct snd_sof_dev *sdev, u32 flags)
+{
+	u32 dbg_pc, dbg_data, dbg_inst, dbg_ls0stat, dbg_status, faultinfo;
+
+	/* dump debug registers */
+	dbg_pc = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUGPC);
+	dbg_data = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUGDATA);
+	dbg_inst = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUGINST);
+	dbg_ls0stat = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUGLS0STAT);
+	dbg_status = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUGSTATUS);
+	faultinfo = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PFAULTINFO);
+
+	dev_info(sdev->dev, "adsp dump : pc %#x, data %#x, dbg_inst %#x,",
+		 dbg_pc, dbg_data, dbg_inst);
+	dev_info(sdev->dev, "ls0stat %#x, status %#x, faultinfo %#x",
+		 dbg_ls0stat, dbg_status, faultinfo);
+
+	mtk_adsp_dump(sdev, flags);
+}
+
 static struct snd_soc_dai_driver mt8186_dai[] = {
 {
 	.name = "SOF_DL1",
@@ -555,6 +576,7 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	.num_drv	= ARRAY_SIZE(mt8186_dai),
 
 	/* Debug information */
+	.dbg_dump = mt8186_adsp_dump,
 	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
 	/* PM */
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.h b/sound/soc/sof/mediatek/mt8186/mt8186.h
index 5b521c60b4e3..91323f492a1e 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.h
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.h
@@ -38,6 +38,11 @@ struct snd_sof_dev;
 #define DSP_MBOX3_IRQ_EN		BIT(3)
 #define DSP_MBOX4_IRQ_EN		BIT(4)
 #define DSP_PDEBUGPC			0x013C
+#define DSP_PDEBUGDATA			0x0140
+#define DSP_PDEBUGINST			0x0144
+#define DSP_PDEBUGLS0STAT		0x0148
+#define DSP_PDEBUGSTATUS		0x014C
+#define DSP_PFAULTINFO			0x0150
 #define ADSP_CK_EN			0x1000
 #define CORE_CLK_EN			BIT(0)
 #define COREDBG_EN			BIT(1)
-- 
2.18.0


