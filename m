Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8982C7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 11:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oIx7VuqX2K6wDAtw6rgNEigmBfR+TczNCFzj17fnjdE=; b=koG9aiG7LjeRXt+wsPBSvizKMW
	XfbXqweSDUZCWfa50/n3W5+erfIQh3Q3l32f1PTE69U8fMe9tEynwfAPEnw3fYWvjD9XpKwxYKsvY
	iL7yFKYNJPrQQWpQhY+/SdonGbAaGTOlnzTBTvBjB2NyJv9aAM/Dug5lwVYs8AEKj68IFlNIqAi9i
	8Fq8WdylBaTyH63Iw726hdtVeizA/l0i9S6fOHh/PFVXlQQXCLrVY6NIBXnGc8Er3TKX9BFz6Jcv7
	Y5UhX6mW+IbRf6eG8sHKeeHR9826eDoXsakMIvypeGvfVDKgy0gbuBWLEA/fRXCmOZFxCrinUKYbG
	c3OLt0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puAkf-004OBK-2b;
	Wed, 03 May 2023 11:34:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puAkb-004O8F-0c;
	Wed, 03 May 2023 11:34:26 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2135C660309E;
	Wed,  3 May 2023 12:34:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683113660;
	bh=D4GxHwRdyAouEXBmGeD9y+SB4oSmGvmMfyzdYBUTGVw=;
	h=From:To:Cc:Subject:Date:From;
	b=FO9btotfEblnP/1DE5WqXhomqoU+yNbZ7N8+Nsy8eenwAs4MZzxIWUrXh0Y3w2RPu
	 Vm0llArH4IEy3kOoR5TnPuBeZ2tbWl0qgeN8V2lNfK+Wl4DfkGmR17HAsTYGcrOfzQ
	 8ALiaC5v8FzihTBzNFFK4YvsMoOf78DVujTY/nVRnxwprAUzlRA4nm+uuq2DMPttFu
	 KPsHdcA0fWQkHdMWRFoxlI7eOdz5a0Vcv6cSBRO7oki1cZSscyoo2hDR78s8Pr2BPZ
	 NKs72uI/0J2qEDl22rB4o39wM1rGZxWbj5Xq/fBRCVDOLLw74yO647543yvwaaEpNv
	 KPPMyudnJeUMg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	pierre-louis.bossart@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	chunxu.li@mediatek.com,
	tinghan.shen@mediatek.com,
	error27@gmail.com,
	ribalda@chromium.org,
	yc.hung@mediatek.com,
	Allen-KH.Cheng@mediatek.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	sound-open-firmware@alsa-project.org,
	kernel@collabora.com
Subject: [PATCH 0/5] ASoC: MediaTek MT8195/86 Cleanups
Date: Wed,  3 May 2023 13:34:08 +0200
Message-Id: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_043425_439561_EF4C8E4F 
X-CRM114-Status: UNSURE (   6.48  )
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

This series performs some cleanups for mainly MT8195 and switches
both MT8195 and MT8186's SOF driver to the snd_sof_ipc_process_reply()
helper.

AngeloGioacchino Del Regno (5):
  ASoC: SOF: mediatek: mt8195: Use snd_sof_ipc_process_reply() helper
  ASoC: SOF: mediatek: mt8186: Use snd_sof_ipc_process_reply() helper
  ASoC: mediatek: mt8195-afe-pcm: Simplify runtime PM during probe
  ASoC: mediatek: mt8195-afe-pcm: Simplify with dev_err_probe()
  ASoC: mediatek: mt8195-afe-pcm: Clean up unnecessary functions

 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 99 ++++++++--------------
 sound/soc/sof/mediatek/mt8186/mt8186.c     | 36 +-------
 sound/soc/sof/mediatek/mt8195/mt8195.c     | 36 +-------
 3 files changed, 36 insertions(+), 135 deletions(-)

-- 
2.40.1


