Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B50FC28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 06:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7hetefnG4im2lve6kba7kczHC23lp5y+Zw1ri01n2o=; b=pBPmIMgoE0cjKloOG+wS2p0p3m
	SFKxC+MCAJWmrHcf3kGhYklco67Ln83/PLhcrLqdc5wYZShhYzS5Lar6ooSKd28FEXM2NZv9zj3eu
	rGssxeflnMW2Urg5XPEf+PJtIA/Bk6O61gaWEDg+ICEtjeh9xjvKx2SxvKH/y1rnh+5ZElpGi6TNo
	ZKkZTPDAc8G5OjFNsa0Eep4CDfudYDEtU3C+K0bkOVR9PlZ+NDd5I8aeObKKY+oi26tzNvsdFFy8R
	mb0UtaeOhZsMRjxq0U53BggP0aYvfV9Z5urKU5kr62/tWCaOO9YJ3NihISLMnsTPKxiNjwf4pAfxl
	knCJjFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR6lH-0085FQ-6R; Thu, 25 Aug 2022 06:54:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR6lF-00859P-2l; Thu, 25 Aug 2022 06:54:42 +0000
X-UUID: 7b5de2550efd4509826597b9dc943142-20220824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=J7hetefnG4im2lve6kba7kczHC23lp5y+Zw1ri01n2o=;
	b=pEqo/Wh0on7rEb+MuZSk5G5n6sl7DIpB3tE5pm1W6+NS9zhFRMSHjJO/yu5MEzXNX9YfXfl8PPSnqLVetk4Ogp3D9eDR6IpOyFrAfxZfv7fa0xI0TqrcaGaHMAW1+QlapWOWV1EEDW7R3ejvApm6K0lDIu8rboXQDPtjfsk+4IU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:b84f6947-0805-40ce-ae27-759175bce54e,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:72c30f20-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7b5de2550efd4509826597b9dc943142-20220824
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 842356814; Wed, 24 Aug 2022 23:54:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 25 Aug 2022 14:54:16 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 25 Aug 2022 14:54:15 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
	<peter.ujfalusi@linux.intel.com>, <lgirdwood@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <daniel.baluta@nxp.com>
CC: <matthias.bgg@gmail.com>, <yc.hung@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<sound-open-firmware@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<project_global_chrome_upstream_group@mediatek.com>, Chunxu Li
	<chunxu.li@mediatek.com>
Subject: [PATCH 1/3] ASoC: SOF: mediatek: Add dai driver for mt8186
Date: Thu, 25 Aug 2022 14:54:09 +0800
Message-ID: <20220825065411.31279-2-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825065411.31279-1-chunxu.li@mediatek.com>
References: <20220825065411.31279-1-chunxu.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_235441_164971_A58D2C7A 
X-CRM114-Status: GOOD (  10.37  )
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

Add dsp ops callback to register AFE DL1/DL2/UL1/UL2 SOF dai's with ALSA

Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 014afe33b3d9..b47bb7a6ba70 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -468,6 +468,37 @@ static int mt8186_ipc_msg_data(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+static struct snd_soc_dai_driver mt8186_dai[] = {
+{
+	.name = "SOF_DL1",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+{
+	.name = "SOF_DL2",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+{
+	.name = "SOF_UL1",
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+{
+	.name = "SOF_UL2",
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+},
+};
+
 /* mt8186 ops */
 static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	/* probe and remove */
@@ -503,6 +534,10 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	/* Firmware ops */
 	.dsp_arch_ops = &sof_xtensa_arch_ops,
 
+	/* DAI drivers */
+	.drv		= mt8186_dai,
+	.num_drv	= ARRAY_SIZE(mt8186_dai),
+
 	/* PM */
 	.suspend	= mt8186_dsp_suspend,
 	.resume		= mt8186_dsp_resume,
-- 
2.25.1


