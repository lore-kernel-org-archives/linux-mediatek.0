Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9251CC04A94
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Jul 2023 18:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o5kGfhLmlrtKS7cC4Khfr9xNCiQ6ZJrY8LYyZM/NxME=; b=oDy1jiK7zrvhTlWQqXyqGhToTF
	QWTscrotOh1Ti+P/UJvwReu/ydfBLu77//y7061noHqW5057kTUqxqNy71uLvfHn99hGr/xDD57/b
	xLH8fnebvP8nA6TCmDwhzi/KkfpUUhlqGugg1WnLJ/8ewwrHwrwOXrS6uJvwRObQUV5Qd8OOZ1HAE
	0xbmorZ4ON6EgUEZu1/GTDDGzwxYOVbIDAp794WmiUqtLJHz4EMXCN9NNys0Q1MgOdWGQp5tU7N2L
	inWU5ByS0d4JSDxuDnnkTPRikpfdAm95oLqE4xa00UirLDRvid0mAN1vFe3aou3g+HkhK9EgN4OcC
	qRg8fUFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQAq7-00CMQ9-0Q;
	Sun, 30 Jul 2023 18:08:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQAq3-00CMNs-2N;
	Sun, 30 Jul 2023 18:08:21 +0000
X-UUID: 09f98dd82f0411ee83ed1395ce914268-20230730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=o5kGfhLmlrtKS7cC4Khfr9xNCiQ6ZJrY8LYyZM/NxME=;
	b=K4DX7c3mv/zN85/j2lmKCTmbQiNPK5J1slwfzBJC3+zmS4/fSQGuMxw9WdX+JWhARXv5sbgB0RN37Mj0Ah0NvEfson/5EoHjlbO57vH4MpvT6Z21bCZfGrK9v/ESD1f9qeib0xGwm2E2JfekDbj0LSvoUJadmGDSH9DlkJjL2Zw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:90bc55e8-cd81-49e3-ba10-96465dd34beb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.30,REQID:90bc55e8-cd81-49e3-ba10-96465dd34beb,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:1fcc6f8,CLOUDID:6171b0a0-0933-4333-8d4f-6c3c53ebd55b,B
	ulkID:2307310208108Y0D2I8S,BulkQuantity:0,Recheck:0,SF:48|38|29|28|17|19,T
	C:nil,Content:1,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,
	TF_CID_SPAM_ASC
X-UUID: 09f98dd82f0411ee83ed1395ce914268-20230730
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jiaxin.yu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 560532007; Sun, 30 Jul 2023 11:08:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 31 Jul 2023 02:08:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 31 Jul 2023 02:08:05 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <andrzej.hajda@intel.com>,
	<neil.armstrong@linaro.org>, <robert.foss@linaro.org>,
	<Laurent.pinchart@ideasonboard.com>, <kuninori.morimoto.gx@renesas.com>,
	<angelogioacchino.delregno@collabora.com>, <nfraprado@collabora.com>
CC: <chunxu.li@mediatek.com>, <ajye_huang@compal.corp-partner.google.com>,
	<allen-kh.cheng@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
	<jiaxin.yu@mediatek.com>
Subject: [v3 0/3] ASoC: mediatek:mt8186: fix both the speaker and hdmi
Date: Mon, 31 Jul 2023 02:08:00 +0800
Message-ID: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_110819_796003_335EA8C2 
X-CRM114-Status: UNSURE (   8.92  )
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

The speaker and hdmi of mt8186 platform are shared the same port of I2S,
when connect the external display, use build-in speakers to play audio,
they both playback at the same time. So we want to manage the playback
device through DAPM events.

Jiaxin Yu (3):
  ASoC: hdmi-codec: Add event handler for hdmi TX
  ASoC: mediatek: mt8186: correct the HDMI widgets
  drm/bridge: it6505: Add audio support

 drivers/gpu/drm/bridge/ite-it6505.c           | 81 +++++++++++++++++--
 include/sound/hdmi-codec.h                    |  6 ++
 sound/soc/codecs/hdmi-codec.c                 | 32 +++++++-
 .../mt8186/mt8186-mt6366-da7219-max98357.c    |  2 +-
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     |  2 +-
 5 files changed, 113 insertions(+), 10 deletions(-)

-- 
2.25.1


