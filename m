Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F81CD4F3C
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2026 01:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BU1E1ogi+Bq1jhmjqjfCvkZIxNYkDteN8QmCFhzbN+A=; b=CjJ++iHOXFQcCHQRS6tH7uNVrg
	3w2gSdS0rIcnk9LoiBT5IfWKLUDEwcr/uQ2JC2nc4AMdUAkR94dBDlGTwc6VE+Vau+f/SZcIcGj6k
	uepNPl7O2A5hXv8BvYOSh9wltuubnKzhHD6OLB6Im56HlYlmGomiXAD9jPgRweDXpzkE+AIftAyao
	PylTlYpdIELLFvwfnJ9sZi8c5odtOPt+YMP2IcZNDO6mTG/2C/uMFClfIlvieupBW0lixVMhR7jrb
	SCALG6q12lp83/H/XoA0zfmUwgUZOV4QVEDZRJVHoNJRCU47/06DMpcx8s63/PCAzxvFGSjfoLgBC
	1zTrCptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8tJ-0000000HJtX-1K5g;
	Tue, 19 May 2026 01:05:01 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8tH-0000000HJrl-0ggD
	for linux-mediatek@lists.infradead.org;
	Tue, 19 May 2026 01:05:00 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-368f25ff4c4so1392305a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2026 18:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779152698; x=1779757498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BU1E1ogi+Bq1jhmjqjfCvkZIxNYkDteN8QmCFhzbN+A=;
        b=Dye9nu5tqChNRhfWkJRSLrr1D0WF/lMWNKGqw48xYJAzu1qls6cmY7+VbYqmrFW7+z
         I/STWNIOHv6Y8gIxAYlSj5BTjLHlbJAOyLZQtmMwmSkxrSVeinMv4IzBR53psyml3Bxs
         xnnWAXI3HcCq+E+Ez3VmKRM/2xOYl1VwpH+jSC6UYVUs6UhYQLfnQXXTmtyjZfjpIppk
         hHW2Edk+U86EHHp+xTRjK4wYiRnH9SUNZz5b+odVoADsUTtynoT4bTbH7cTDv3qJ2S/m
         w255LbDYGdF+/QA5kBfcwBeVJfgFtteqqhehMOBst50yGs+hlRxYP9CoX0iygdoiANLf
         W87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779152698; x=1779757498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BU1E1ogi+Bq1jhmjqjfCvkZIxNYkDteN8QmCFhzbN+A=;
        b=WiLayeMN0Hu0FrGZ30+hnjoeE6wqVhNCR1BNa/36WIjH8E1DUTRfu53o0q4eEjP1kq
         mLL2zBHzz3qhnfRYhxOnMIM70CTwVecMv/cUUuYfOce7NeKXkaB4ghlTTOZ73SHpmi79
         cx3DmoPMJr8WM4R1dQa68QlFsuHboWRSiuih5PvC4eQ5w1x/1frtOiSZCqAc9RnLcxkz
         hcbD0rK/fmr2eQzt3yeqEXvKsytMCy4Deiv+YyRhQIjTZWb/SZITJDsRNqI2GGW5jsRf
         ICSzPWPqbz47zWnQDb/4YT0T6A5SrK7tsOBkjkEB1+hZaq5CllZoPNaNhtsuR1vdwi2L
         a0kg==
X-Forwarded-Encrypted: i=1; AFNElJ9WRS+mz8NVFwSI7GxuUrjyWRxfJqsZUBdUyXkz88/BAseOkeu1nD184iroYsOpBJ4ns1LzpT4aSMEhAKB2xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkD2p/A1CIHlWxDvdCLnJFuU10TkgMdiLP3y8mZBnPj54emm8i
	JRdGLMWZhVpVOSlLazxh/hf1IWb3KeYb4KnOe6815nHuI30PCK0+lJmg
X-Gm-Gg: Acq92OHvp+CDVrGPnTBSRph0FAshifb5vZdAIUCTsh34YBW9NE5prC4KAFaFr73X3C3
	MeZkBKF07Sl92gxluuG7YYxLxtd/z4QOZp2T4rgIOaWzSjvzkzdCtmI0MXmSf/pZjCO4yXJ5ci1
	Fff7Nqsj2nHwOzs7SmJQ2H2w6vLqfADmyjnkR+pSh2gOIxNVtqOQYSdOnBb7xcXVtghjPiDdYVA
	xY+oLirx271z/LPieirbMXM79rZm7C/z3P0unklV5PDvGpE7RaAsH/GShsk66HjKaRt188NhKbM
	vJhJye6mmsiPHIW+7yldo++6uxDL7e/w67lmtiWV5gNuGxtgFxxKFYTO8uYfdeay0GIalnU8Fv3
	320IWPPfYmVQ+0gEn2eUxjKUGdlH4BWZ614PNeCxehefJWr5YjM3+2A5KLlpaHhjxuTi+tjUD6O
	fxpjrfPVhR5s0BxLWyN/zw4uxbGDBsgXL7AxLDUXBuexYXAA/hJLkLvL1rsVbpT7CvgUTEzSa74
	LvEW+tcv2Yyst1uGo7rM0dOVveFoyx2MmkeNVANlKzriw==
X-Received: by 2002:a17:90b:586f:b0:35f:bb33:d72c with SMTP id 98e67ed59e1d1-369518b00cdmr17164840a91.4.1779152698278;
        Mon, 18 May 2026 18:04:58 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695148d53asm12212912a91.15.2026.05.18.18.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:04:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] ASoC: mediatek: mt2701: fix snprintf bounds
Date: Mon, 18 May 2026 18:04:40 -0700
Message-ID: <20260519010440.629290-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_180459_197343_DC660399 
X-CRM114-Status: GOOD (  13.53  )
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

For whatever reason, GCC is unable to figure out that i2s_num is a
single digit number, with MT2701_BASE_CLK_NUM being the maximum value it
represents. Add a min() call to help it out and fix W=1 errors regarding
snprintf bounds.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
index 5a2bcf027b4f..43157f218409 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
@@ -25,6 +25,7 @@ static const char *const base_clks[] = {
 int mt2701_init_clock(struct mtk_base_afe *afe)
 {
 	struct mt2701_afe_private *afe_priv = afe->platform_priv;
+	int i2s_num;
 	int i;
 
 	for (i = 0; i < MT2701_BASE_CLK_NUM; i++) {
@@ -35,8 +36,9 @@ int mt2701_init_clock(struct mtk_base_afe *afe)
 		}
 	}
 
+	i2s_num = min(MT2701_BASE_CLK_NUM, afe_priv->soc->i2s_num);
 	/* Get I2S related clocks */
-	for (i = 0; i < afe_priv->soc->i2s_num; i++) {
+	for (i = 0; i < i2s_num; i++) {
 		struct mt2701_i2s_path *i2s_path = &afe_priv->i2s_path[i];
 		struct clk *i2s_ck;
 		char name[13];
-- 
2.54.0


