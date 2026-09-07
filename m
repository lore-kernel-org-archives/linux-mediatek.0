Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F77FC79F89
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2026 12:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ea6lVpnhWbYQ3wI5UpSM25XcXKci0dt7/GlZ6PuirvE=; b=wWcmr7gecq3V0rFQ053jwu0BIG
	OEpAK2/92mvDA9y23o9tXSebqFy0KqulDSfznZs377wMA06zeeMN9WeHX/BV4Ky+zs5w6kOhX5cQC
	kOEsugCGIUakBPh2cWTrcqD1Y9h7gXZ49MbK2J/R0sQTHSFawdVaJqP+b0BA+Yy+i2KTU+QWcOA+W
	/lWSiMuRSIWACEWThSfUFMx08KBlVsBDRWtcuuDrlJ081LHnre1uvwiplAAyp0ZSzaC0ElQ8/r+Ks
	FzBxMEBZYHr6meFJ7GIrjV2NK71gznH+hZEPQnm7deJiLEHHOxS1ssd3U96ADzRqqzLdE4dWq6I00
	mSN/xH3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4m-00000006kLM-09JB;
	Mon, 07 Sep 2026 12:03:52 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4j-00000006kJJ-3k0j
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Sep 2026 12:03:51 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cc891373e0so36471735ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2026 05:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782629; x=1789387429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ea6lVpnhWbYQ3wI5UpSM25XcXKci0dt7/GlZ6PuirvE=;
        b=a1+OMETWJDnpmrubOnHwY8w6g//5YF7568H+4a1QSK/HFt7q4LIvsIxilQUH0rlIKG
         /0p3RvnPwFSZAmjBSMenA0eyGxhQ3pJNcwsm5gnRLJh5zJrdLJcj1nYX1HlnKFFxFD3W
         SdvzblpWUm3Hff6t2ZbKlncyawU3aAu13M9cC8sUlDAsq9L7bUgDDu+s+hTMsMN1OMgN
         DmYIehoKoBqmIrDFRDNPPvlZyfr9yxQfKMqtacCc98r+CbtmS61QegkNHMtzw6v83m3+
         cfhOdEsJdYX5jjLxiIKtrZtn9hmFxb1869q6fRq1HIV1IxQ1+wKcVC2ICb96P4PFkj23
         7p+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782629; x=1789387429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ea6lVpnhWbYQ3wI5UpSM25XcXKci0dt7/GlZ6PuirvE=;
        b=S4Wgc0gqXL7w16Q0urOjP9CmOr2xPTroufGAG+OErTFu8GonozYlQeDHPlnB/Oc8Km
         hyHe8KCs+T5YF3bnYesW7axVwldRt7A+vMtshkuSNEd5lqRM8irehLLtSQ0cYGTo1Bh9
         xe9vjBYyW0yXRfKNvHOzf2oC6yO40G0bTBtpPDkGXj/6TT5CzUyu1jB3lyuLbN2s63YT
         r7WvCst39Kn7fzuf2X3tePEF9c4nlnKBMYAfPemgRUFc/EInJCxGTDfdOB2m0wS385xB
         pUGkFSCT/egZIAhlGMT15WtUazhaCRshjl5vp3jroCfaKM5gQW1Txs22lalUT/8mt1Vb
         1j1g==
X-Forwarded-Encrypted: i=1; AKwUvBwylwsssvG6ybG+B7jkPU3jpcTvkLTdx4GN2uPCaxCOBZokAynIVEVRq7jndwzrn3v3OgIRq3mtPuEvIhOGRQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nz9NSB399ZPqzhDIbx0OM+F/nPAPPIlK0+o9Xx4/Bnw3CxnAqf
	rh6vA0gr8YX5u3JeS0p7WuqUgavuU+FYVs0wmhSIkA2MJktM7LUX1fZD
X-Gm-Gg: AYBFou3CwdvuQ8qDlE1kcale1PHGPB9CjnQN0i5jceivem14Rs4hEqBFTxddZmzEVCP
	GUyNbgkmTV7q3F5nXOFMqI894mZzAfMwsOJsflQEpGnqvkMIgHINiRmProPX3cT/PqQlW2S1S0P
	9lNxidoHx13qwDiCZFQkuLZV5EpLUk7+GgvqIaLfIor+IaLK7Q/IuGxvB/0B+YiefKVPtiYAauJ
	XN4WKezP4wSp+MStq2/ahG6ZYhK6XGja9KsjOXqqmgHTwNOntWBH1PAF4UpCwLCVuVKlJYIvZS7
	TJTiqLzL/fe6iWgrtx+VtvOHlkQPLDEx/dcG6mV13VX9Heue6jiRG6XLGWdhp7vvu/N3rkGlSAO
	56zfc1UU/fJwcVV5FyEjQ0KJKLCLs8jX3pjOnQavTQBZBOA7i1tAj8afPSdIhixOUmv4zpd6oyo
	UsUubxvoMQtnn+mAbPTuF/NV3Ii9/1XQDWTNpIGKXfWRHYtUQ50he0sIkQUA63Gy8BX0pe+oPC9
	VFUR1Ql2h2WV0RS5TMKs31iIUC7P1Bw5plCVGA+DzHZTPjQeuYqfMhJAkvaOLiMTkymRhcFjW3p
	BNJpr4thNfQhsGM=
X-Received: by 2002:a17:903:40c9:b0:2d6:f6ba:263d with SMTP id d9443c01a7336-2db124b451cmr310785685ad.7.1788782628815;
        Mon, 07 Sep 2026 05:03:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Handle tuner clock enable errors
Date: Mon,  7 Sep 2026 19:03:05 +0700
Message-ID: <20260907120310.135693-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050349_931228_15D2BC91 
X-CRM114-Status: GOOD (  11.34  )
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

Clock enable errors are currently ignored when enabling the APLL
and tuner clocks.
Check the return values and roll back the APLL clock if the tuner
clock fails to enable.

Fixes: f6b026479b13 ("ASoC: mediatek: mt8188: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index 42878c8a6529..ecba13eda440 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -260,15 +260,28 @@ static int mt8188_afe_enable_tuner_clk(struct mtk_base_afe *afe,
 				       unsigned int id)
 {
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	switch (id) {
 	case MT8188_AUD_PLL1:
-		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL]);
-		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL1_TUNER]);
+		ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL]);
+		if (ret)
+			return ret;
+		ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL1_TUNER]);
+		if (ret) {
+			mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL]);
+			return ret;
+		}
 		break;
 	case MT8188_AUD_PLL2:
-		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2]);
-		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2_TUNER]);
+		ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2]);
+		if (ret)
+			return ret;
+		ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2_TUNER]);
+		if (ret) {
+			mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2]);
+			return ret;
+		}
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0


