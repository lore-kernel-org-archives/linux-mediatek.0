Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B397CC6B1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 11:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZOtjHH9GCgeZqSt19reIaRDRSJJcHtWmcvSjabXJDU=; b=NZOaEcyGY/KW4IRLez73gpPvYD
	nnfwYrUjF2YyVXCOspJlSyf4LvNWf09sf97KgGRp2JJURO6i3RO3lOZxmOmtEFkQvML6xbgtkX9XD
	yjyu+nJRD5wxsuEs9Ki+YlauE+N6JDkSwz22BrBHmg6eN7YG/6nq1D4Qx39Zkgxmkm2di/m/rXsti
	e3W8r7H8zmejVwfDiZViloZdReQIZ7Phg4TKS1YPH95/RAHzokKGZpZ1d3osoeYoBISA5LJd6IcPF
	PXcZz3u3i4qgCwEIaO027/04quletYPymV8f78qDqbM4nqjqA+aWLKwlU9NakbPNbJO391E4s0p8d
	QzXfrz9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAg-0000000FKFa-3Rl9;
	Wed, 14 Oct 2026 11:29:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAd-0000000FKBS-2GS7
	for linux-mediatek@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IZOtjHH9GCgeZqSt19reIaRDRSJJcHtWmcvSjabXJDU=; b=V4Fd0j5+yg/flG5h1Bs3R2JV+R
	ETXnQVP/6gHl/jnYNI0JRFTVJkP1M56q0iMi36amZ1yQFYYXnMheVThtFbyJYY9br8tyficCmOX5/
	t3Dtd6N24OGtSxHDndzBSguMKCaDYT3anmTH2jlkNiHP5tXxrajpaUmF+5HFZnLdH6Be5lzhbu5oZ
	CyTv/JWeb22YIyaQMas+R8RU4Hf/2sCBjHKKtGqSsjvHSW294sKhh6DGVASvYJ9hdQ7L2qrybIJ2K
	/NkC60XXLn7M9L15ansMx+gqiMEVwwFaM36HA/vrb0Go4HnIoW9d+LWLRRCpEiHiAlRqa/Bxrzdsh
	diV5NLyg==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxAY-0000000GgiV-2d0T
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 11:29:18 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-398a5aad413so190014a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 04:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977352; x=1792582152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZOtjHH9GCgeZqSt19reIaRDRSJJcHtWmcvSjabXJDU=;
        b=Lg+cwDhQg0xwsiZaarFkGZQCx9azucAJRloqTuwE+AiaY5haUrbtZsM/e5HcYNUJ+X
         U1KLATapPDFt/cwSN/tu9+gBmBiSL/oF57NikC3QLUxOR7PJ+z5myM645XRZpb8RnNbm
         IR2oROGdQJJODfEENt7VN/gNuBqCBnBFQ7gBizFk1pmvI7nkobqfuL/ter+kVbWfSEcn
         Hs5SOS65coZGrprS9MhZqss6BtfqM1RGXz4AMSbKs5IAoOOwO480Rh+97TuyToTrd8yt
         aYwHqmbLjI9m3d2yBj6sV56u2kxW7eRKNn3JldDEND/XpnskuA9NQ1/2Wp858xwFZgp0
         DArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977352; x=1792582152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IZOtjHH9GCgeZqSt19reIaRDRSJJcHtWmcvSjabXJDU=;
        b=jJOPrIBaExO+J/+Hp6Pk5BlD71Qwps3S/f5VywIJsFIws/zQ6ILRQy5ITVOcz7VZYm
         eXY7IOIP8BQI8uSmWBYF4Z/Gqn+awUzl7/kbIOeqw17vflCCQ7c3wcoFhQrZ+8FNKTBs
         tNubt/OxUYRMazEGPtM3eL4vxlwLAoDoFYbXyV4OFTlQkISzeX6YmvHuPE4UDcfg6ybY
         jr1WjtcQ6UBQN+9686nR/fayRwZG2TxcknCojZVlMugWipUFOW+rkWQtGHWiavGYKTmL
         LS9nensU6x8zCoqkUVYlvwo/kExA9gW7/v4ubvgZk7CpRvQZzHithI0RTtys7SYCZbXh
         NgAg==
X-Forwarded-Encrypted: i=1; AKwUvByD6g2p47o7yZSewdfV0GbJJokvpSoZja+Q4ojjURGOIXLOqfAyaHb9F5LJKd/hC1JQ8bxk+anIPxClPQRO9g==@lists.infradead.org
X-Gm-Message-State: AFq9FYL8YcD0T/zqJm4ZY8C2tprm2JzQck7n8yc+VNCns9NkXXlQ4W7k
	V+n7CZRZRmcPv9aqLpUfXqqJ/ubjNAwV2Fa9g6KydL0suCGXehnM1YYE
X-Gm-Gg: AYBFou2jcKZiUs/WlH/iNURIZX578jHc/NwPd/Qa+6kd3bwJki7F1jQFkq675xWVPVJ
	Api8/OMceSiLIkCSkHJCYwmtPeT1exLMeuENF9H7dLyM9dEKNutbHKC7rFMZ6fDPhhoqVdQ0hRt
	4f6HTU3tYWYBlic9N4Nuq9By2G4Xoz/nDSiD4ip6bgpGN0tYOOWViB9bSpvqB/ADsgxZTPzWk01
	WeYZqjw3dzrZ7TFbRk15jGYBo/Z7rWvwxH0pnxCHsYhJnTR7b0JgUGD5bvmKcEWIVaB6uqrCR+V
	jj4IhKa+xBHAJ9CzgxuqSMb0ZptmSCfxKuVEerNP0f1EH/Y9GWW4q2fwacOdkGDvH6kBwbU0E3/
	OhsVNJrT18MoG9YHzzv5XM4mXKnYLvMoAXcMA8RAkqjCVBz9WCR5wbHTJMvvXYX7N2bQVtdGeyz
	nCfDR8FiFtFGZ8nhScauur4NbpveIxyLLwTxt9CWnCZyJR9BKZRbMwgdOVc23szhYM377DuLbbp
	9xAr6rcoIdutyXcMofP+fXIOWFL/frodTWDYWRQUGYn6aNT1Y+vrkezRzgUCa0A3zHZhonxzEA9
	gsQ8iLFQWoJdJQ==
X-Received: by 2002:a17:90b:4ace:b0:3a8:59d3:530f with SMTP id 98e67ed59e1d1-3ab3a97a06bmr15237233a91.57.1791977352463;
        Wed, 14 Oct 2026 04:29:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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
Subject: [PATCH v3 10/16] ASoC: mediatek: mt8195: Remove redundant error message
Date: Wed, 14 Oct 2026 18:27:45 +0700
Message-ID: <20261014112752.683032-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122914_780220_228E0244 
X-CRM114-Status: GOOD (  13.05  )
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

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_warn() and dev_err_probe() call is redundant and can be removed.

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 19047887ee21..75d4d0578bcc 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3090,7 +3090,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* initial audio related clock */
 	ret = mt8195_afe_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error\n");
+		return ret;
 
 	/* reset controller to reset audio regs before regmap cache */
 	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
@@ -3137,7 +3137,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for asys-isr\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -3195,10 +3195,9 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
-	if (ret) {
-		dev_warn(dev, "err_platform\n");
+	if (ret)
 		goto err_pm_put;
-	}
+
 
 	ret = regmap_multi_reg_write(afe->regmap, mt8195_afe_reg_defaults,
 				     ARRAY_SIZE(mt8195_afe_reg_defaults));
-- 
2.43.0


