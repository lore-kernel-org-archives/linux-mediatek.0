Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240E4C6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 09:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m6bacnecUtdM1hbKPv2z66h484gG8YgJGlszjLRLPPU=; b=gQGWqTQlD6Ow7xWEY4eYYX6jpu
	EY9JClMuzpnVJWtyHIDRjsfSB72UkaBHQNL6ARulfXax5wmUREXrssIUZEzuFN8fBcnfloM152UCZ
	auHEOctcqnxMlShPU+5B+txvHDGqLb3W/7Ryp5ngw9KSEHGYi5eaL8ct9psZ5xaJH1J6SJe0LlOni
	Ozx9znxTPT8Kf5CuQs0YYvn0o9vOx9CwHZhvdQCOskI1r1pXzfXWk9Jap2O6uj0d8PtA3ql81N2Se
	2Y7Q6gSH3puwxpT+N8Wnb2DBjYf9nm7C4WRkIQ6Hl/v8YUNY4VZk5eXSVNvF7o8L82V4M91cJ+WsS
	eaRA65aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFB3h-00693h-Bu; Tue, 10 Jan 2023 09:36:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFB3e-00691I-7W; Tue, 10 Jan 2023 09:36:39 +0000
X-UUID: 44cd40e090ca11edbbe3f76fe852e059-20230110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=m6bacnecUtdM1hbKPv2z66h484gG8YgJGlszjLRLPPU=;
	b=eephG9V7j1QXYIeMDFiFR8QE+evi+aKRpWoM3/zWuC++fOjtOjZ/YBTkVWQN4/sFiVY5cmSoYKjAPv9urOqAYaF/42Qr7+uMxqr5pQd7O6vvrtbg7WdKOgLBPDQ9Dv4XpLpLWi6zR6G8t5ivUevI10MfXRVg9zNa8c/887VP3+E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:59ab79d9-0cde-4329-a773-5cff5bdb84cc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:cee862f5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 44cd40e090ca11edbbe3f76fe852e059-20230110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 956786034; Tue, 10 Jan 2023 02:36:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 17:26:29 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 17:26:28 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jiaxin.yu@mediatek.com>
CC: <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<project_global_chrome_upstream_group@mediatek.com>, Chunxu Li
	<chunxu.li@mediatek.com>
Subject: [PATCH] ASoC: mediatek: mt8186: add AFE_DAC_CON0 to volatile register list
Date: Tue, 10 Jan 2023 17:26:23 +0800
Message-ID: <20230110092623.13035-1-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_013638_292044_1D971949 
X-CRM114-Status: UNSURE (   7.97  )
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

Mark AFE_DAC_CON0 as volatile since DSP firmware will access this
register too.

Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index d7e94e6a19c7..41172a82103e 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2395,6 +2395,7 @@ static bool mt8186_is_volatile_reg(struct device *dev, unsigned int reg)
 	case AUDIO_TOP_CON1:	/* reg bit controlled by CCF */
 	case AUDIO_TOP_CON2:
 	case AUDIO_TOP_CON3:
+	case AFE_DAC_CON0:
 	case AFE_DL1_CUR_MSB:
 	case AFE_DL1_CUR:
 	case AFE_DL1_END:
-- 
2.25.1


