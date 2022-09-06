Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA70C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 09:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RncZDdUKiA3NINExsuAQh5VaSvV96pKv97+r++P5z0s=; b=zedaxlBXp6dgyohHIM28WNKvbv
	mxCnIxWk0Iu79Ucahi2bNk5v1rL1w3tMXTI9yZsI/OyzeyMZfb3W6YYKJLYXfuWbAqK4DUTw8hWlF
	OxOpHoTEZXpn/q5OUtrPo2b2D0IV1pgPrxlI2Y0ND1zGFh6TCntrsmozhf6pi1WB2D42QGF+SKCqS
	DBT/Nvd9Vyu8XgsM8NXDFMD2PM8alMKk5rAr8hevPnZCuPuE2HlpT6fhALAIcAMTYe9RSSavBlFhU
	7cCsSYbxAKW2sO16O33l/g+J8WQdLzQf4rBLmsysFnZ9/skkWvRtejl7V6aX7nk5w3h7QZxxurV2R
	EMO7i0tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUsO-00Bo6L-8W; Tue, 06 Sep 2022 09:28:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUru-00Bns9-1f; Tue, 06 Sep 2022 09:27:43 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C837F6600375;
	Tue,  6 Sep 2022 10:27:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662456456;
	bh=JpEcgC6jYLZbY4tQDi6ZRqCoL5pekVUoZKTqmNe+EIo=;
	h=From:To:Cc:Subject:Date:From;
	b=eSkU6oLC56uV4TWJxoKjhECXppBMxt0BdBBkgQ5zPLRbdSSZo3vtrLPa0E+5f4Hed
	 h8UMA/dJWZKbG8i1AwbGlDjDaTJc4wXYzjUBr5QCQjWDYkXi5gZZ3kSLlIeTq0TauB
	 B+B4jNe1q4H8DCM4nK56nWCmrK2t7g+qNA3hfwzBR756VMBk8dNZKT/xOPX6CMWMmB
	 nDf2vPe8G0rJxqEnYdn5zAtY8asnCPFW2ylM/IVp2pf8WveyBYswJ7kstc33M0UY4R
	 2+gYIQMZat6aTSqdWCRRz+uppT8w6LRZ+oj82ui2SvXa740I1d0Kod6PSmE9bt6Iri
	 pfJlsrGoOASZQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	wenst@chromium.org,
	pierre-louis.bossart@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com,
	trevor.wu@mediatek.com,
	tzungbi@google.com,
	angelogioacchino.delregno@collabora.com,
	yc.hung@mediatek.com,
	Allen-KH.Cheng@mediatek.com,
	geert@linux-m68k.org,
	chunxu.li@mediatek.com,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	kernel@collabora.com
Subject: [PATCH 0/5] ASoC: Fixes for MT8195 SOF support
Date: Tue,  6 Sep 2022 11:27:22 +0200
Message-Id: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_022742_262048_EFA2C6BE 
X-CRM114-Status: UNSURE (   7.39  )
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

This series fixes Sound Open Firmware support for MT8195 by making
sure that the sound card driver is actually able to probe and IPC
can finally happen.
It is now possible to get DSP support for audio.

Tested on MT8195 Tomato - Acer Chromebook Spin 513 CP513-2H (Pipewire).

AngeloGioacchino Del Regno (5):
  ASoC: mediatek: mt8195-mt6359: Properly register sound card for SOF
  ASoC: SOF: mediatek: mt8195: Import namespace SND_SOC_SOF_MTK_COMMON
  ASoC: SOF: mediatek: mt8195: Add mailbox generic callbacks for IPC
  ASoC: SOF: mediatek: mt8195: Add generic pcm_{open,close} callbacks
  ASoC: SOF: mediatek: mt8195: Add devicetree support to select
    topologies

 sound/soc/mediatek/mt8195/mt8195-mt6359.c |  6 +++++
 sound/soc/sof/mediatek/mt8195/mt8195.c    | 32 ++++++++++++++++-------
 2 files changed, 29 insertions(+), 9 deletions(-)

-- 
2.37.2


