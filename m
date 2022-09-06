Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FCFC38145
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 09:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxPJNmG21p1gXv0GZjFyhUcLypkkAiQmx9BXfnoODlQ=; b=BTOiH/sZKpRLyrV6FmyCYHx5Rz
	fBwZVaQaEsZ/Xbz6FVQZ/QXNhkf2R8hWoB0QX82GzumCa7F5kvBpMBW8GHQbyILujfxPjITppznZG
	dJz3cSIfTrr/euONEuRK6a7NR3oW37rdU9BV8Fqb2kV4oq6VzL1rOZgjITLc2GEtj1BimnRQj237b
	VlSX+rCSJWnB4fMpUEanu7PZ0c1iv8/uS+dnngR9uWJTGjsgKGFAQxpKaUCT/yjK3Qpwv9FJUHoMh
	YZ/E5zkvyeCBcxEtCTBZHnGFqafwncSLV2gzsDZmzd+zOuy02jNbgGj6M292+R1je1TDEbpP05myV
	Y+D1UmdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUsP-00Bo78-4m; Tue, 06 Sep 2022 09:28:13 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUru-00BnuB-3j; Tue, 06 Sep 2022 09:27:43 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 363D46601EB2;
	Tue,  6 Sep 2022 10:27:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662456459;
	bh=WyVYZj+c9maI28dTmRLQ5XLV8nr4NB4/PmV9sY12Gmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YvL7hcmYNk/2CwJ3pZ9ZoLT98cjdp69vFL19MlIdv+b7lziyVountzzH4vlXnc+OW
	 ZTh6WDE0KOWl2orEeVlPnAn/FoTp89rCJcgn2Vpe/cDljqQ1xRznKoc7ZYK8cniwN0
	 oJHCPQFf/HvsWwA8hz7UHDIyTlINe1FLJIbh3GOKC5BODT2+k0UE27D5qFz2nsXsBb
	 HjWhFFGg4O4ItFmN6/wKmHnXBw10ndrFevUobUu9h7fUP4TFpVz2mWYvfXa6e/ey2g
	 J7Ef/JeNGkzLlWg2byJkSY0xCD5IQRHpbQPRs7/ogKE7A7NCgHzZASY5PMPtOxELof
	 zDGl05rTg4iwQ==
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
Subject: [PATCH 2/5] ASoC: SOF: mediatek: mt8195: Import namespace SND_SOC_SOF_MTK_COMMON
Date: Tue,  6 Sep 2022 11:27:24 +0200
Message-Id: <20220906092727.37324-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
References: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_022742_317904_0ADDC09F 
X-CRM114-Status: UNSURE (   8.08  )
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

Here we're using function mtk_adsp_dump() from mtk-adsp-common:
explicitly import its namespace.

Fixes: 3a054f90e955 ("ASoC: SOF: mediatek: Add mt8195 debug dump")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 9c146015cd1b..ff575de7e46a 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -652,4 +652,5 @@ static struct platform_driver snd_sof_of_mt8195_driver = {
 module_platform_driver(snd_sof_of_mt8195_driver);
 
 MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
+MODULE_IMPORT_NS(SND_SOC_SOF_MTK_COMMON);
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.37.2


