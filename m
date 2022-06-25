Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4E5C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jun 2022 19:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z42awuJWiunEKM5ori+WmskNextOwkyaycfjTK8aqa8=; b=sL/ZwxsN52LaxYNE9F/N4LYY5J
	yNIqf66zAHz1yqaK/jAStJuQVqRwDheB+SEyY7wbXGEVQSgsfzS+sgLmfV5WK6JU0bLey+ch85ZR5
	2KL4yFtu39MGVo964iwTwikFp0oa9fafzBo78dm1FTBLKtAgf11rsc4MT3o+8Afj+r00FZ8NsQii5
	t9xrDapG9Kky/IUjdBn6eTxQbzZIlorxtEm10KBdYCI5c2Cp9ej01hbOpUz9bMw6GImQ2btfqzi04
	4HOCBSPzeaBuW+uuf8XiZ8Mp+dbU8pA3thmMeadMF1sTFo/ottDPY6CbSiGdPWIw7QL97MmFlXdM8
	rj3Sf7gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5BJb-007OdX-IH; Sat, 25 Jun 2022 19:19:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5BJE-007OUM-LG; Sat, 25 Jun 2022 19:19:11 +0000
X-UUID: 3f656324a165453ab86d77f669a149b6-20220625
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:7cbb04c9-b05a-4dac-aa5e-151434a67359,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:f5da8dd8-850a-491d-a127-60d9309b2b3e,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 3f656324a165453ab86d77f669a149b6-20220625
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <jiaxin.yu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 975813165; Sat, 25 Jun 2022 12:19:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 25 Jun 2022 12:08:59 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sun, 26 Jun 2022 03:08:57 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 26 Jun 2022 03:08:56 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
	<angelogioacchino.delregno@collabora.com>
CC: <aaronyu@google.com>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>,
	<tzungbi@google.com>, <julianbraha@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
	<jiaxin.yu@mediatek.com>
Subject: [PATCH v8 3/8] ASoC: mediatek: mt8186: add mt8186-mt6366 common driver
Date: Sun, 26 Jun 2022 03:08:47 +0800
Message-ID: <20220625190852.29130-4-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220625190852.29130-1-jiaxin.yu@mediatek.com>
References: <20220625190852.29130-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_121908_725536_D395B54C 
X-CRM114-Status: GOOD (  15.65  )
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

Add mt8186-mt6366 common driver for mt8186 series machine.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/mt8186/Makefile            |  1 +
 .../mediatek/mt8186/mt8186-mt6366-common.c    | 57 +++++++++++++++++++
 .../mediatek/mt8186/mt8186-mt6366-common.h    | 17 ++++++
 3 files changed, 75 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-common.h

diff --git a/sound/soc/mediatek/mt8186/Makefile b/sound/soc/mediatek/mt8186/Makefile
index 7626bb3499dd..bdca1a3b3ff0 100644
--- a/sound/soc/mediatek/mt8186/Makefile
+++ b/sound/soc/mediatek/mt8186/Makefile
@@ -15,5 +15,6 @@ snd-soc-mt8186-afe-objs := \
 	mt8186-dai-hostless.o \
 	mt8186-dai-tdm.o \
 	mt8186-misc-control.o \
+	mt8186-mt6366-common.o
 
 obj-$(CONFIG_SND_SOC_MT8186) += snd-soc-mt8186-afe.o
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
new file mode 100644
index 000000000000..4e66603d4cdb
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// mt8186-mt6366-common.c
+//	--  MT8186 MT6366 ALSA common driver
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
+//
+#include <sound/soc.h>
+
+#include "../../codecs/mt6358.h"
+#include "../common/mtk-afe-platform-driver.h"
+#include "mt8186-afe-common.h"
+#include "mt8186-mt6366-common.h"
+
+int mt8186_mt6366_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct snd_soc_component *cmpnt_codec =
+		asoc_rtd_to_codec(rtd, 0)->component;
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
+	int ret;
+
+	/* set mtkaif protocol */
+	mt6358_set_mtkaif_protocol(cmpnt_codec,
+				   MT6358_MTKAIF_PROTOCOL_1);
+	afe_priv->mtkaif_protocol = MT6358_MTKAIF_PROTOCOL_1;
+
+	ret = snd_soc_dapm_sync(dapm);
+	if (ret) {
+		dev_err(rtd->dev, "failed to snd_soc_dapm_sync\n");
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt8186_mt6366_init);
+
+int mt8186_mt6366_card_set_be_link(struct snd_soc_card *card,
+				   struct snd_soc_dai_link *link,
+				   struct device_node *node,
+				   char *link_name)
+{
+	int ret;
+
+	if (node && strcmp(link->name, link_name) == 0) {
+		ret = snd_soc_of_get_dai_link_codecs(card->dev, node, link);
+		if (ret < 0)
+			return dev_err_probe(card->dev, ret, "get dai link codecs fail\n");
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt8186_mt6366_card_set_be_link);
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-common.h b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.h
new file mode 100644
index 000000000000..907d8f5e46b1
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8186-mt6366-common.h
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
+ */
+
+#ifndef _MT8186_MT6366_COMMON_H_
+#define _MT8186_MT6366_COMMON_H_
+
+int mt8186_mt6366_init(struct snd_soc_pcm_runtime *rtd);
+int mt8186_mt6366_card_set_be_link(struct snd_soc_card *card,
+				   struct snd_soc_dai_link *link,
+				   struct device_node *node,
+				   char *link_name);
+#endif
-- 
2.18.0


