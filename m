Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160EDCA5FCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 11:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=; b=ahHXdXB/7PkC1QIt8yRoyv6Fch
	tyTyu74torpFT4v/1DM3iVpxWcSG07gTNKbUXFoAIdBWCeiqCp4Osrwh+MY876vQwsS4QR7dnZNjN
	NwCGOxFgjRtC69E4I53QqzTSayvd2GugEUzxS1e9oGqffbSUq78TmO+smVUa6yG9GfPPbugtsyIXL
	/5wm27nPVF8E1YfaEljp5ILtqCEUGCZvPjywLaof0djcyb+kNAPjontRcBPOviuZT4KAK8pmtWUqT
	xwlkTfuWtni4H1g37LDQqZaUG3hMzAAVEY3zJ4PdaOFddmqxi5qtKSLPyXhw6JP/zljGNNHJJBgU+
	CP9pM9jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUY-0000000GHuK-3g14;
	Mon, 05 Oct 2026 11:04:22 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUP-0000000GHkR-2cNG
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 11:04:21 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc4c3304784so526133a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 04:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198253; x=1791803053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=KLSXtBh6SqHanNi+9glUuI851GC1Ll530c+0B8kCyY7K4XsADeOC3jgjADEB21yuLr
         q4roy7IZHJMovU2tZ9J0qe8yRQD/FxotPcCFp/ROf9A/+w3pEC3aLWoTrRhgE5JQBknz
         zfDqtmAO2GjgGJ+FzEoUgjVY0JMsbyrD3vh8saydCq+LIX3oAodoV9aBwfNPotiqiIP1
         xY7lfUNrY55KjrxNHeOSIw0kwv4QR3sd1z9bVPUg/DodScRFf3KUmUOOymDhcVinOlBZ
         19RWjQ5BwRmFkSJ+AN27W9PTdzpILxPWyICsWsNPM6E6QnGg+7h8pkprwnNeTNUG8ha9
         I14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198253; x=1791803053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=JquXjbQnH9Lj+McTkvY+KruaWQ9R6jGLomL8HhQLGdnbgylXPJv4poRR/O+COFPe/4
         +kw2eVw/XLQom8NT2Wx5hl8wekdIJlx8Vg5daUL9UbmeCPjhLATuPFt0qzgFJgnqIs8d
         9d3EUYKdi7Tbz99WQrUnLurubD364WO4rtqkHtnqnRCyw5Ui8hBgOaZyinpLAEmmm7ed
         Uhy73qrSGXpILXVF6UotINs29eqhPom+1G4XQTuHvofZ+/5vNcRsHTUTyhbEFnBcMoI9
         QuYNuPt9a3bkIg4EFyYYmOn6Q4e51aryT/ilkdh3EesgKcVf5MSkXMvbxDGa/1GoCYBj
         ZrXA==
X-Forwarded-Encrypted: i=1; AKwUvBwVKU8IzTZEZL4NtxKQebBYM9oCcBmGaY9UmpqVKrhxvyJyAYZHG+jlM3H5+xN3tXfItbNaU2MJnoACtIGV+w==@lists.infradead.org
X-Gm-Message-State: AFuF++l0lwPaFgqTFzNwFaNmB/RbnNFxELjz3sVk4MS4dBE8zW2QucE3
	uz5ocvIDLLtAJgmw49r0I9b5XCPAMwWsaT+WfjRiyGUyd7XDuqvySQjL
X-Gm-Gg: AYBFou3BxMp34JTNoJdF6oSD10vXnaN+cnYekFx7L8WI++Bzq16047ZqZ6Wn4hDvQ6T
	oouXdcDrPKAFk5Hk3Y3BzmVxYu9T6TI+e9YvKk86GQx7dDpgVIX0jlbV1XwpS6WHVaUfVVkjzXm
	yCHWKecbf6qBns0CkyDFjoE5Oh2BiBnzyA/V4MGUJxDnSvzRlXP21xkU/HG1opHr9ioNIZ6FsYC
	cyFXTvWeq3QzInr5RWgtP17+Yg+QoqPTxpAZT8lX/BT4Fr6+VlGokNm+UNlIlqAUhQONhelYvWr
	5E8+kFGuoTr/5/lEnv1Cw8h7HPM10hMyNWW+OPXPRAj4QyN2unYtO3Uvyl/myXP6CAZo/DmvyAn
	ZvpOVPAQ/kPFGsE9KM308QDxhnZVg30EPKxM3zTWA9JXTYq+ECXZ64g1wXTVV3w/W4g46IpU5wR
	olfOP0u4WJrSx6l6mZF2/TQtufUJbDaQImdXYw9ryCrnIEj9OAhFmD1dWHkcN5WRjy0U+wmcPVg
	gM0JwH6ejuqtYNDNLYr4luH7LGe1za6XtY4n6+f7NAjWdZKcCvhXtTKZ6uBdz0temysYc02l4Tf
	TPtx+V9GfEa/7A==
X-Received: by 2002:a05:6a21:b82:b0:3de:52c4:50bd with SMTP id adf61e73a8af0-3e0bc6a0f48mr10138880637.0.1791198252738;
        Mon, 05 Oct 2026 04:04:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:04:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 12/14] ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
Date: Mon,  5 Oct 2026 18:02:55 +0700
Message-ID: <20261005110257.50145-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040413_703030_FA5BAE32 
X-CRM114-Status: GOOD (  11.99  )
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

Check and propagate errors when enabling the clock gate and MCLK
during HDMI TX/DP TX startup.

If MCLK enabling fails, disable the clock gate that was already
enabled before returning the error.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 1270fcac6b3f..11317cdd14ab 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2321,13 +2321,25 @@ static int mtk_dai_hdmitx_dptx_startup(struct snd_pcm_substream *substream,
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
+	int ret;
 
-	if (cg_id >= 0)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+	if (cg_id >= 0) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (ret)
+			return ret;
+	}
 
-	mtk_dai_etdm_enable_mclk(afe, dai->id);
+	ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+	if (ret)
+		goto err_disable_cg_clk;
 
 	return 0;
+
+err_disable_cg_clk:
+	if (cg_id >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+
+	return ret;
 }
 
 static void mtk_dai_hdmitx_dptx_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0


