Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B429DC43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 08:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lQDSPBkQ0PCd4dOF0byz5gemV9cShm3BFfdChAKgIjw=; b=4Vc1+MmKQ9tpvY
	TJYwFG21SYz1/O9f4m08jKuJ4wCYob1tBoZ+9cha1KCCffLF4vBH/yrWnhCKPN+bmeEMC5v99IXIG
	CIzlVE5N+7VYXqhOHnyjFIx+r8PFqJuPKm0pKX/6Shd6jtQ2hpAeZ3xLMxmkyndAUI0069CG/rV9o
	jW1MpkLWIq3eQItmKAGBeU5glQXpoHveBBm4/TQyvtUQgSETMCFGGJpeQnqTBwEPuUrBfM6ykmcxD
	L2eCBUXmSv9aF21b+24WmwxfNKxeFXC11bPETzzsWUhx/eV3v4P0aBO+to3xRc6fwpITkMXDypZOk
	M71iVFEs6dkxwpOX29Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyr0n-00Bx2e-1L; Wed, 08 Jun 2022 08:25:57 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqye-00Bw2w-6Q; Wed, 08 Jun 2022 08:23:46 +0000
Received: by mail-ed1-x52f.google.com with SMTP id fd25so26054437edb.3;
        Wed, 08 Jun 2022 01:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gfVSp3scFj4P4guPC4wruDfDMf9c2cvAElZfIMx3LEY=;
        b=OJ/tH0klk5aBgBXi38k8hIN16orCQvOAI0upfkhUCVxdcz26LvKxPv3BvzUAKAf2oX
         2LL+TozngPMHrT0yJt7T6njY2izvfu6/wjXSnPiagbggsgq6MQyDlr6xYS+HrkXybkZr
         CH8zUUg4VSKdy1rWsZgCFIMxtFqpH6cFJnR17zLdgT1EYI0Ybg9qtyBG8qFWhqEixAhb
         RxhrsH5V26q+WxfV+z8ido1iu9i/dwnB6T/0oYU635S5uLIr4jbqmicDGG2Tscrq4Fzh
         VpjrJM5ugTBF092XAD/UX+J7X3pvzlmSLaapqMrliD7sIYyO7accRXtbR+3VO1ouLPxz
         N8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gfVSp3scFj4P4guPC4wruDfDMf9c2cvAElZfIMx3LEY=;
        b=b/YQqPFhIzelWtN93mjStJktjnWCFiaziAVXqiBACXVMcyEdcIO/T3mQQJ5zIwXxt3
         CS11Vx/qhjW1+9d4dhfxK0gte9aTUZ66UIn+j9mMxjr9JnEkHLy9dCfKMT5QPCPmW4fe
         F6c8pM4P5e73SoMe4UQ0L5s45na+5H/RP9nvrG6r1YNzXpSNXEw9rVE2sINs9x7hpaOU
         1ydJMRDFefwQdR6uhTVyaYOX3WVFNKMWrrOB/tH1zrqFl1Tms5AA8YeAChcBiV+ChggG
         kcIqU9sNG3mftwY5tqIXqe6TjVPtI7vdlJkFFMjKK5P8ypHs+A43PtRPxvcU1qeYrImg
         A8JQ==
X-Gm-Message-State: AOAM533T9qbbUxmMptJVs3XITiPnVFzidnZ4OEbPXcqkc+XyW/o/JY56
	iFwLZtBE4kHmVuNpRKbTnNY=
X-Google-Smtp-Source: ABdhPJxjJ1Ux3SAC4HGYqyivoD6H+CP/FNb5tKHoOonTD8XxJzdvFsTeNrf7nmvzlFISsKOZAnSCUg==
X-Received: by 2002:a05:6402:3899:b0:42d:d79e:acef with SMTP id fd25-20020a056402389900b0042dd79eacefmr37664268edb.12.1654676619754;
        Wed, 08 Jun 2022 01:23:39 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id o5-20020aa7c7c5000000b0042ad421574esm11965179eds.33.2022.06.08.01.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 01:23:39 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: mediatek: mt8186: Fix a handful of spelling mistakes
Date: Wed,  8 Jun 2022 09:23:38 +0100
Message-Id: <20220608082338.2083456-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_012344_275833_D77A948E 
X-CRM114-Status: GOOD (  11.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There are several spelling mistakes in dev_err messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 8 ++++----
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index 5ba28095b7da..255ffba637d3 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -137,25 +137,25 @@ static int mt8186_afe_gpio_adda_dl(struct device *dev, bool enable)
 	if (enable) {
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_ON);
 		if (ret) {
-			dev_err(dev, "%s(), MOSI CLK ON slect fail!\n", __func__);
+			dev_err(dev, "%s(), MOSI CLK ON select fail!\n", __func__);
 			return ret;
 		}
 
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_ON);
 		if (ret) {
-			dev_err(dev, "%s(), MOSI DAT ON slect fail!\n", __func__);
+			dev_err(dev, "%s(), MOSI DAT ON select fail!\n", __func__);
 			return ret;
 		}
 	} else {
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_OFF);
 		if (ret) {
-			dev_err(dev, "%s(), MOSI DAT OFF slect fail!\n", __func__);
+			dev_err(dev, "%s(), MOSI DAT OFF select fail!\n", __func__);
 			return ret;
 		}
 
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_OFF);
 		if (ret) {
-			dev_err(dev, "%s(), MOSI CLK ON slect fail!\n", __func__);
+			dev_err(dev, "%s(), MOSI CLK ON select fail!\n", __func__);
 			return ret;
 		}
 	}
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
index c66861fd197d..db71b032770d 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
@@ -341,7 +341,7 @@ static int mtk_adda_mtkaif_cfg_event(struct snd_soc_dapm_widget *w,
 				if (afe_priv->mtkaif_chosen_phase[0] < 0 ||
 				    afe_priv->mtkaif_chosen_phase[1] < 0) {
 					dev_err(afe->dev,
-						"%s(), skip dealy setting mtkaif_chosen_phase[0/1]:%d/%d\n",
+						"%s(), skip delay setting mtkaif_chosen_phase[0/1]:%d/%d\n",
 						__func__,
 						afe_priv->mtkaif_chosen_phase[0],
 						afe_priv->mtkaif_chosen_phase[1]);
-- 
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
