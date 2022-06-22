Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF1CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 06:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TXAO9Lizzcw8zeAF6AuXRMdYOuxWCxKilknYqrF/ns=; b=eEmzmu8Oby7KQQUaDUFeloXaYd
	VREzFEAfjZdTYhXIEcWIj8D9NQQYmJ7urkABmwfFKcdYEHBjxh2WQVI8qb1oP6KoG/Q/DEauFcTrv
	F13YyePYaQFgdYnBL5yibdqh+gPCfircCqWiukReHW/RSodvXGr2r5zcfSTKQNgcRXvGW0q5IK7TU
	l/v/MoPP8AWle7cYh0XWiNItYO5uqQwYclStfQjbWdPuna0h0aYLtc8qLKv41IMFdEOpYVIGcaIAm
	FWIxk/n3h5l1ka0wztkwFZTja1yyBHiAqFYp4MJgrb+9LEs/2q5x1F732BX2arIM7fVATe+TuTexS
	fiAuxdUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3tuF-008okm-OC; Wed, 22 Jun 2022 06:32:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3tlQ-008lry-RQ; Wed, 22 Jun 2022 06:22:59 +0000
X-UUID: ded044d859ce490a989d46d6a0e26125-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:b0cae070-b7e8-4fbf-ac31-20e89465db23,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:4ad22438-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ded044d859ce490a989d46d6a0e26125-20220621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1712167171; Tue, 21 Jun 2022 23:22:50 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 23:22:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 14:22:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 22 Jun 2022 14:22:47 +0800
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
Subject: [PATCH v4 2/4] firmware: mediatek: Use meaningful names for mbox
Date: Wed, 22 Jun 2022 14:22:43 +0800
Message-ID: <20220622062245.21021-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220622062245.21021-1-tinghan.shen@mediatek.com>
References: <20220622062245.21021-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_232256_989776_4A5DFEB5 
X-CRM114-Status: GOOD (  14.34  )
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

Rename mbox according to actions instead of 'mbox0' and 'mbox1'

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/firmware/mtk-adsp-ipc.c | 36 +++++++++++----------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/firmware/mtk-adsp-ipc.c b/drivers/firmware/mtk-adsp-ipc.c
index cb255a99170c..3c071f814455 100644
--- a/drivers/firmware/mtk-adsp-ipc.c
+++ b/drivers/firmware/mtk-adsp-ipc.c
@@ -12,6 +12,8 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
+static const char * const adsp_mbox_ch_names[MTK_ADSP_MBOX_NUM] = { "rx", "tx" };
+
 /*
  * mtk_adsp_ipc_send - send ipc cmd to MTK ADSP
  *
@@ -72,7 +74,6 @@ static int mtk_adsp_ipc_probe(struct platform_device *pdev)
 	struct mtk_adsp_ipc *adsp_ipc;
 	struct mtk_adsp_chan *adsp_chan;
 	struct mbox_client *cl;
-	char *chan_name;
 	int ret;
 	int i, j;
 
@@ -83,12 +84,6 @@ static int mtk_adsp_ipc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
-		chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
-		if (!chan_name) {
-			ret = -ENOMEM;
-			goto out;
-		}
-
 		adsp_chan = &adsp_ipc->chans[i];
 		cl = &adsp_chan->cl;
 		cl->dev = dev->parent;
@@ -99,17 +94,20 @@ static int mtk_adsp_ipc_probe(struct platform_device *pdev)
 
 		adsp_chan->ipc = adsp_ipc;
 		adsp_chan->idx = i;
-		adsp_chan->ch = mbox_request_channel_byname(cl, chan_name);
+		adsp_chan->ch = mbox_request_channel_byname(cl, adsp_mbox_ch_names[i]);
 		if (IS_ERR(adsp_chan->ch)) {
 			ret = PTR_ERR(adsp_chan->ch);
 			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "Failed to request mbox chan %d ret %d\n",
-					i, ret);
-			goto out_free;
-		}
+				dev_err(dev, "Failed to request mbox chan %s ret %d\n",
+					adsp_mbox_ch_names[i], ret);
+
+			for (j = 0; j < i; j++) {
+				adsp_chan = &adsp_ipc->chans[j];
+				mbox_free_channel(adsp_chan->ch);
+			}
 
-		dev_dbg(dev, "request mbox chan %s\n", chan_name);
-		kfree(chan_name);
+			return ret;
+		}
 	}
 
 	adsp_ipc->dev = dev;
@@ -117,16 +115,6 @@ static int mtk_adsp_ipc_probe(struct platform_device *pdev)
 	dev_dbg(dev, "MTK ADSP IPC initialized\n");
 
 	return 0;
-
-out_free:
-	kfree(chan_name);
-out:
-	for (j = 0; j < i; j++) {
-		adsp_chan = &adsp_ipc->chans[j];
-		mbox_free_channel(adsp_chan->ch);
-	}
-
-	return ret;
 }
 
 static int mtk_adsp_ipc_remove(struct platform_device *pdev)
-- 
2.18.0


