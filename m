Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D259C67871
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 03:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QsXVaBlLyZgLe3Omky45vD7Ia8dAb9dNk+EXoNiFXQE=; b=O8FPqH9hgU1tPU3IGDD/9DWj6m
	v6x4q+mWDAae2V3MzKMQXj8dR/+F4/tXQB/FuaZ/DzyXk9CCELki6ZcrmnJFv4Cr3Aq7J1Qmq//gG
	8xrmXgHF2pQqO2ZdMOviCLB/cjaZzC7TdhBfP54ynH34Ww5X7IYC5iv/G7NSPdOsdP8ukjM6tDFoG
	BrUnXDvz6aCtr3VMZ1SAvNnAFLB8NCAcE5KyAItvcCO/cD27JUX8MJDYL4TMWbY5vdu/WNElPots6
	WjZP0K2nS5DLkR6Gn9/oDVXeXI2TSagJfBNIipzyo4n0tKVnlqHX80wElyE0OV9tNezva6XlwHKCp
	GbOJRdPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHGPV-008WaB-0D; Mon, 16 Jan 2023 03:43:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHGNz-008Vz4-SP; Mon, 16 Jan 2023 03:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QsXVaBlLyZgLe3Omky45vD7Ia8dAb9dNk+EXoNiFXQE=; b=SGsEMdkxrlCihDT0pkeTospovc
	DS0pnRtN2xoRd7NbbB9+laYUM/+tCR6YqgXj/LT9NaveAnSki6AsLoVnpTgxuF0egykyegdazaSa8
	EwXxkgcaRBmb7dMCgqKrG5Fauwno1sny1c9wKKb6DayHk9XVUNF2hrzW8yo2fWNDaBwtqZtfoLUr0
	+2RgkoZWWXnRPbRbqlAvI5+oVjIOpLDv9CxaenBHWoTosFU5fp1TCovVtcQgm1jT/d5qQiNTGVLdT
	+A3Iej0jgYJqZP3ySLOfG+d44eozY5qOb3jDf3sLS4Kk/t2OoeBZ3xnOjMaCesvG2OHSugxwt3pmD
	fhmsJYww==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHGNh-005Syu-2m;
	Mon, 16 Jan 2023 03:42:02 +0000
X-UUID: b04de6ba954f11edbbe3f76fe852e059-20230115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QsXVaBlLyZgLe3Omky45vD7Ia8dAb9dNk+EXoNiFXQE=;
	b=RuGMsMymFkAVicw6LOsqDlpLkRl2osnjAjZE7QvLcOEenn2NoBYw+A15t5LmeWa6/ZPrhWISStgu1oeI0E5XfE7G/Kp02FBePvJhB8JoMAXS/kqs/wnsHphNxbC1IjLeKjXqiPp9b76cQy7x9xjAqpOrj+6byDkTbIUBvVbXW+k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:0df45d72-6043-4bf6-a32b-3fc06f17cebe,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:f0f1bb54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: b04de6ba954f11edbbe3f76fe852e059-20230115
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 894337834; Sun, 15 Jan 2023 20:41:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 16 Jan 2023 11:41:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 16 Jan 2023 11:41:37 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
CC: <trevor.wu@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [RESEND,v5 11/13] ASoC: mediatek: common: add soundcard driver common code
Date: Mon, 16 Jan 2023 11:41:29 +0800
Message-ID: <20230116034131.23943-12-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230116034131.23943-1-trevor.wu@mediatek.com>
References: <20230116034131.23943-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_034158_734429_ABCE2FCE 
X-CRM114-Status: GOOD (  16.82  )
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

Add common code to support of_node of codec parsing, so codec phandle
can be assigned by sound-dai in dts.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/common/Makefile            |  2 +-
 .../mediatek/common/mtk-soundcard-driver.c    | 79 +++++++++++++++++++
 .../mediatek/common/mtk-soundcard-driver.h    | 14 ++++
 3 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/mediatek/common/mtk-soundcard-driver.c
 create mode 100644 sound/soc/mediatek/common/mtk-soundcard-driver.h

diff --git a/sound/soc/mediatek/common/Makefile b/sound/soc/mediatek/common/Makefile
index 576deb7f8cce..42e636c10c1e 100644
--- a/sound/soc/mediatek/common/Makefile
+++ b/sound/soc/mediatek/common/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # platform driver
-snd-soc-mtk-common-objs := mtk-afe-platform-driver.o mtk-afe-fe-dai.o mtk-dsp-sof-common.o
+snd-soc-mtk-common-objs := mtk-afe-platform-driver.o mtk-afe-fe-dai.o mtk-dsp-sof-common.o mtk-soundcard-driver.o
 obj-$(CONFIG_SND_SOC_MEDIATEK) += snd-soc-mtk-common.o
 
 obj-$(CONFIG_SND_SOC_MTK_BTCVSD) += mtk-btcvsd.o
diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
new file mode 100644
index 000000000000..7c55c2cb1f21
--- /dev/null
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mtk-soundcard-driver.c  --  MediaTek soundcard driver common
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <sound/soc.h>
+
+#include "mtk-soundcard-driver.h"
+
+static int set_card_codec_info(struct snd_soc_card *card,
+			       struct device_node *sub_node,
+			       struct snd_soc_dai_link *dai_link)
+{
+	struct device *dev = card->dev;
+	struct device_node *codec_node;
+	int ret;
+
+	codec_node = of_get_child_by_name(sub_node, "codec");
+	if (!codec_node)
+		return -EINVAL;
+
+	/* set card codec info */
+	ret = snd_soc_of_get_dai_link_codecs(dev, codec_node, dai_link);
+
+	of_node_put(codec_node);
+
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "%s: codec dai not found\n",
+				     dai_link->name);
+
+	return 0;
+}
+
+int parse_dai_link_info(struct snd_soc_card *card)
+{
+	struct device *dev = card->dev;
+	struct device_node *sub_node;
+	struct snd_soc_dai_link *dai_link;
+	const char *dai_link_name;
+	int ret, i;
+
+	/* Loop over all the dai link sub nodes */
+	for_each_available_child_of_node(dev->of_node, sub_node) {
+		if (of_property_read_string(sub_node, "link-name",
+					    &dai_link_name))
+			return -EINVAL;
+
+		for_each_card_prelinks(card, i, dai_link) {
+			if (!strcmp(dai_link_name, dai_link->name))
+				break;
+		}
+
+		if (i >= card->num_links)
+			return -EINVAL;
+
+		ret = set_card_codec_info(card, sub_node, dai_link);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(parse_dai_link_info);
+
+void clean_card_reference(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *dai_link;
+	int i;
+
+	/* release codec reference gotten by set_card_codec_info */
+	for_each_card_prelinks(card, i, dai_link)
+		snd_soc_of_put_dai_link_codecs(dai_link);
+}
+EXPORT_SYMBOL_GPL(clean_card_reference);
diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.h b/sound/soc/mediatek/common/mtk-soundcard-driver.h
new file mode 100644
index 000000000000..d92cac1d7b72
--- /dev/null
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mtk-soundcard-driver.h  --  MediaTek soundcard driver common definition
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#ifndef _MTK_SOUNDCARD_DRIVER_H_
+#define _MTK_SOUNDCARD_DRIVER_H_
+
+int parse_dai_link_info(struct snd_soc_card *card);
+void clean_card_reference(struct snd_soc_card *card);
+#endif
-- 
2.18.0


