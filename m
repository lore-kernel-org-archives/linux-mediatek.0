Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05059ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5OOEavJtBEdFOqg8D6i8GqslHFVjSAfhBqPtr4c504=; b=HfZOUqr6goY4KogZl4WwIPE0hx
	anMCHfVciWz/oB1u3bjgWJl9YyCvMWTjZ4qukO3KNmqZ6ktm+grqhmNVhOtVYFWvSWP08LJhGmYmm
	49h8EsrtyqGRp8Stcx+SvoSqSzAyptWpYuGXuN7z5eXs0IZC9ZBDZFOTsPp3Ahk70pPK8uIl+642S
	1Kl3D8w3GpQHUOlA0L9FCOTXjXNFBpbEisk1HK+tsMf8ONpRlZg6VjFjEUkVUoLQJZyFk43Qaqgmb
	P+dMbj+p4m68VJvI4MYnwf/g/soH/Ix+Ba4Zzthk5i+v815ZNmMXnbZX9ULwLtaW1/BFRaf/mRg9y
	AhpjZL8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUtY-00BolH-87; Tue, 06 Sep 2022 09:29:24 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUru-00BntB-Pp; Tue, 06 Sep 2022 09:27:44 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 68B55660037F;
	Tue,  6 Sep 2022 10:27:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662456458;
	bh=vXQl6sWYH3s9nZcdEQtm9bzb3mf6vHvob18mX522u5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gaP7CzHIWz3oofHqZpF1nJ/2SBzJ0tEF/o0JbZuWbZzz0jtYTgk1OjQ9MhHoPbYte
	 +InfDwR1jByO1iziZY8SbfOS2imRGasoF9EQVvm5lxVaaVdciPurOQ9vV7njksGjgZ
	 Ms628sECmg3Lk39rxRRyEMz98uT8B/xAtkNukUqWKmCOhFn6HaqVmmlfIfOr6zmUBa
	 y9BZ6HipY9RZyh1ADzEmgq5bFBl0Q/ZD1EwwkufgDQV0JtHsAGDu3OfBVC1/0PkChw
	 VjXWrMQauz4mC7iw6B+VCQUvq9nSWNNrJz5SGheCGz0if30q5Fj6NrbRTWIf28rLmK
	 Jhcg30Re66o5g==
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
Subject: [PATCH 1/5] ASoC: mediatek: mt8195-mt6359: Properly register sound card for SOF
Date: Tue,  6 Sep 2022 11:27:23 +0200
Message-Id: <20220906092727.37324-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
References: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_022743_009167_048197E7 
X-CRM114-Status: UNSURE (   9.88  )
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

Adding a probe callback on this snd_soc_card is required when
Sound Open Firmware support is desired, as we need to appropriately
populate the stream_name for SOF to be able to bind widgets.
Failing to do so will produce errors when applying the SOF topology
leading to card registration failure (so, no sound).
While at it, also make sure to fill the topology_shortname as required.

Fixes: 0caf1120c583 ("ASoC: mediatek: mt8195: extract SOF common code")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index c530e3fc27e4..961e769602d6 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -1383,7 +1383,13 @@ static int mt8195_mt6359_dev_probe(struct platform_device *pdev)
 		sof_priv->num_streams = ARRAY_SIZE(g_sof_conn_streams);
 		sof_priv->sof_dai_link_fixup = mt8195_dai_link_fixup;
 		soc_card_data->sof_priv = sof_priv;
+		card->probe = mtk_sof_card_probe;
 		card->late_probe = mtk_sof_card_late_probe;
+		if (!card->topology_shortname_created) {
+			snprintf(card->topology_shortname, 32, "sof-%s", card->name);
+			card->topology_shortname_created = true;
+		}
+		card->name = card->topology_shortname;
 		sof_on = 1;
 	}
 
-- 
2.37.2


