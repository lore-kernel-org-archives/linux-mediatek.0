Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4EAC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 09:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OIPMmjppnFUNnchCS+G3oU3JvoXj7RK/eWKev7o99SQ=; b=lNxAJqG0znwl/NSkgPSG/AEvXU
	dfjmRqgKCxicUNkFiZEZkLC7WP+qnLMhdv+l2WiXqhRgVMEJXjpFXOOqtL0bP+KfZk0YKsW6uTXCl
	/poMqT3bBa7eJKM7e9/zMV4y8tRnjWOcQ3raevSyjvu/A5ujLChcHFCtvGZBuv6o4boGrIY8Yy38G
	rfOEKfuNtccf0YAms8wwJNS0gNalB1N7qBRzYUyyZ9TnpXOrD4T/STc5zkkegeEhpawDP43ueMjob
	Vk/CnuH1HB0Av/X2DyU7GTwL1LNSZyg8Bz0RE3qXCzK1EZwdjBaCGofbmPFdc0guHPc4SKPhJHRNt
	0oUjcHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyVPk-00F947-Pd; Fri, 25 Nov 2022 09:54:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyVGX-00F3Tj-Ae; Fri, 25 Nov 2022 09:45:03 +0000
X-UUID: 5fafbab2db984c44b3ae127d0b7e0d2f-20221125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=OIPMmjppnFUNnchCS+G3oU3JvoXj7RK/eWKev7o99SQ=;
	b=bxU1vu7JWbBZ57GEfblKC9dxy/usRBoXhfK65+mEU7icakcz0ODLID0z3+9dLtarTG8Yjdy1A8pm4pD/5U+Sva6hixIwihkmiT30nXkIMA7s+tvVAxicUPNlA3WgO5CV4ZrreUECHyQo17rAHFXtq2f+NMuUFe3ZgJ9TSgM9MEk=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:e2381754-231e-4c01-b65b-df9864a1b6a1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.14,REQID:e2381754-231e-4c01-b65b-df9864a1b6a1,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:dcaaed0,CLOUDID:78883ddc-6ad4-42ff-91f3-18e0272db660,B
	ulkID:221125174437XQESGKIT,BulkQuantity:1,Recheck:0,SF:38|28|16|19|48,TC:n
	il,Content:1,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 5fafbab2db984c44b3ae127d0b7e0d2f-20221125
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jiaxin.yu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1499425547; Fri, 25 Nov 2022 02:44:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 25 Nov 2022 17:44:15 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 25 Nov 2022 17:44:14 +0800
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
Subject: [PATCH v2 0/3] ASoC: mediatek:mt8186: fix both the speaker and hdmi
Date: Fri, 25 Nov 2022 17:44:10 +0800
Message-ID: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_014501_502960_1D0D35F8 
X-CRM114-Status: UNSURE (   9.65  )
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

Change since v1:
    Support audio function for it6505 bridge to hdmi-codec

Jiaxin Yu (3):
  ASoC: hdmi-codec: Add event handler for hdmi TX
  ASoC: mediatek: mt8186: correct the HDMI widgets
  drm/bridge: it6505: Add audio support

 drivers/gpu/drm/bridge/ite-it6505.c           | 81 +++++++++++++++++--
 include/sound/hdmi-codec.h                    |  6 ++
 sound/soc/codecs/hdmi-codec.c                 | 37 ++++++++-
 .../mt8186/mt8186-mt6366-da7219-max98357.c    |  2 +-
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     |  2 +-
 5 files changed, 116 insertions(+), 12 deletions(-)

-- 
2.18.0


