Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C06C88E6B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=; b=hEF5HZucxZgmlgvIdNdLBk6ovb
	HaD4TgPH64o7h61mvB+8lYmISlEpGm5dg3xhVAgKinqUIr/6nqZO76HU9PilM+LkwvSoAK/cFlzbD
	Dc/3Kna0agvRimY8QOhHkHRoJGYEaZxq595Uxc6NDKGCC41MVvnONh+C+/QlFBLVFbjHF2PIRT0JJ
	CS1P0sHoCjLSJe+Zrf5ZZo3M42fFyw0ds2fTx0a1CxdgqSdnNfGCV6cJN4XqAsJGG570ZvFi4qccc
	ZjeoNiID9y5S4VEFSdvdwl+C2ekK972Y9IL/UZkdxtLm9v8eYM3vdelDDDxaqXdzGLeJg7zN1THcd
	JMZl8W+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618L-00000002Ymh-3OOb;
	Mon, 14 Sep 2026 07:29:45 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618H-00000002Yfb-389H
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:44 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc4d64bcea5so1561627a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 00:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370981; x=1789975781; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=;
        b=Bx9NvAEWaW9CtqHQ1CjGb7rEDpAKPAfnvNAjwipw3WTBO2xVoXcRsUhuJtxtrHC53k
         9KjcZiQ7ytvcIA7K02jfDZuZysZXicj1LbJ8PhBK5kLMOd9V+onC0r554FYv0nNXW/+E
         zqkVO3Q+2zvW1dCyv3RSE8K0OQOcm4OZmiePUisTy40wnB5oICqOSaEOTsY1h8AeITD0
         X5DPSg8hJ8AzcPEvv+/TVZVGRy347v75wQosSAq8utWv8HxzI6SiamBHal1wuPDpigqh
         2JmCdgEeXb4ZUhPEqoWky/xy3mP3dfuC9v8vi/0Bwxm9nJg7tjH6DnT/8R8tnQpnyvOT
         niKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370981; x=1789975781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=;
        b=O37FxPU+X9OZ0xkNbolaoi0Mxqs0UYmHYwcLeib5VIzZN1PbcP83lZNMG96nWypJ61
         sd9AJiSdzdqPf8fy+Q5X9/ppVabPX5Q0+fZZdLIeMedt2/gSKp0YSsvK2wQkFI/If6TU
         +GHO96kWhDSPDpc0SGdmctqkQfwDlx/ZdpUuLhPHkDwubhKiObRjs0qRDv8vJ8F26Ibv
         nIcqQ/r2D5elv0AjzcAW+XmvN3kQf+qeWHcuaKv2pwNDKcNz928eFFWuhc+8g/k7Vgpb
         RkjaoRWMvjH0boNh7YmDMHMdeMSIpjzuMu47TD+PaU9ZmHswvoLSKi+ryW0ps1l4fypx
         6x9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxVc4fZc7gBfEzvDSoAVDSEsRDPCpW55X3IQM1s4cYPOMJSwEC0/Y78e/9yFjOkXEX5Qw/g8rom6+jfKGAOMQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nJAmU7rD/LtwUGqylAJoLOCOWvUUufeKUUOvM8FaVQYJSpb02w
	Info4qk5xS4jYeLj1Kzaxgs0o9Nk6QvVNe/eV/+v2gBAINsYlo61SLDQ
X-Gm-Gg: AYBFou3/WQf4mwLdqcPLbCNsHoBfoFnjRtoqa6NarhvQr3Q0krSuwUffNlqKIKMTh0Q
	P8rdmzSyrcNcvC6ThDzEp3Sz9zmromm85kb1nUZSeqonbSrNAAFu6P/zbbWjZ188KBTq7VJGrLX
	yKbLZdDbdVu6od7mzNRouwY2DtYTgfyMfrGcm06jsx6GgQu0pJOlxfJHbTX6aAovvju7Ehy99Hc
	Jumk1Q8AWAyQ1hALHxleiPMUb+G6EEtxErgg4mjKYTLPilt7llSSYLrcN5r7p7BjdLHc5Q2GaKb
	YvK3JTv5KCmCunLiI7LYNoJ1qhtIMPNVAptmIsFVH6P3MYZvA/GhkhPDjf+wx+0qWozGX9CUWFB
	Lh+V+Hm4HZ3c6g3W9TElnYD3ToqQ6Dt601iaFc5jUej2uC0JS0pIPH7YhwLNegyJRABT48j/4Vr
	3PP1FV/VRX2vvcSjNFXjVauIkDXFwKK4rdDSpZ+8HHMAI7mAE3lXegaMGwNr1RfUzrYWwPTlcF9
	3km5zJvvdeUpp6INcVY/mQqrTm1mHctkPzYZ95Ezi1ses0pwnVWptKpqAUU6MsTvvTG+wco4aqq
	O6roaHmcP3R3z9U6
X-Received: by 2002:a17:90b:164f:b0:39d:b1bd:b384 with SMTP id 98e67ed59e1d1-39dec0b6344mr3180432a91.17.1789370980816;
        Mon, 14 Sep 2026 00:29:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 10/13] ASoC: mediatek: mt8189: Propagate MCLK errors
Date: Mon, 14 Sep 2026 14:28:39 +0700
Message-ID: <20260914072842.24420-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002941_798580_259BA5CA 
X-CRM114-Status: GOOD (  10.76  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_mclk_en_event() currently ignores errors returned by the MCK
enable and disable functions.

Propagate these errors.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 4826ee250d70..f20dbb410223 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -519,6 +519,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret = 0;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -529,17 +530,17 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		ret = mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		i2s_priv->mclk_rate = 0;
-		mt8189_mck_disable(afe, i2s_priv->mclk_id);
+		ret = mt8189_mck_disable(afe, i2s_priv->mclk_id);
 		break;
 	default:
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] = {
-- 
2.43.0


