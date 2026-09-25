Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EBEC9830D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 04:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=; b=vMP4B1L4nemO3OvTnEsruTuz92
	wUpZajiX19lo6Gpw3kywOhAawc7T/g9j0sKgYiLepO6XOTX83hXrGwglrXL0aNsTSjcX+QWoGcIRR
	2emvC2x1hlJYhit65Wvm/sx1b3tyMie+y3R6XDSNefxhZYM5wbOchwumNjkuPPgDqmXc2Q+n/WZmj
	1D3h1f8qtFo3P+QAARaBlZ3TT6E93dtR4EJy05j6buaoBVu3GxO84Dxtyqng1iXGaU9vvtg6ifDvT
	OAj53SWhEoXmiJhqfIDNcozqBlonQhioKR7dT3BuK7DDI0wJ/l0R/dsDkaZukXETcdwrN0a8Gk7Ls
	vRv9lB3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xu0-0000000CeEZ-0N0O;
	Fri, 25 Sep 2026 04:51:16 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtY-0000000CdrN-2CfK
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:49 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2d93ff61046so2346525ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 21:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311848; x=1790916648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=r45m2IFF3CT622db7E/cD1zvb3Xh8xG640sZT+4OBHS8cjgGi6Q5f+0O2p6KiwWAFX
         J0Ymz/eK+cpf62B8molZsmg0pKfySl/1vrBsanE1dDcsLmEillxHXf5oHdMAbGSkAiDN
         OoKYfNTDPlA/Y4/ZZEs4ioWnIBv1FWjBW93dG+Zu/gXfMGCwyypwKUnyh/1bMXiKqhY1
         mW6TLONqr/weL9E+0qDK96477+MoznLXKqqjDlkJjwdGe5Q8VlzdobzyoNQ7yA/dyeTt
         dsPpIbIY6JQ6FAC9rZU65aDvOhjZ0NkeZGSEvBeaoZG2GMYYg3Wp2MgH4Y1EWk09Mybk
         fBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311848; x=1790916648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=AgaZD8wajvxDLmAFTY5zTdd/CTCQyP3ZWoTOTFtrRThsmKnhSEoskHzZI6IiqBBJ4a
         T75ifYLb7kY1L6ojcp3LJPFKkIqqFYdR/c7BRZo8O/bt2LLv4XC1HiZLUq1wtXX7IfWM
         3yTJT2FxpfkpBNaLWgDfdPcjxNE/UzYvynXmgHCXpyG6yzhxv/Eyu6k9jAtQq8aT8hP2
         QFXgJUfB5eyrIcta+6TbHC+Z8foayyiowIJUEg1h+wf2r7Y2q5/Mi2dabu/GTmdjkqSB
         WhHwv7ZsKSziy5WMWBKrq6FBfJ59kFFfhEmV7KSx5ZMGHRIIQLZ9iqYeXoacS7tx7yBP
         2Nvg==
X-Forwarded-Encrypted: i=1; AKwUvBxrk+Y2rCzWxJpEQKpf59LQUHzOEoImEVi1RUhYEUytT0ZHV/3da66DBcEulcAqCWV/iqhAvXb/UaEEsethJA==@lists.infradead.org
X-Gm-Message-State: AFuF++mIEUpmxYYKLEpwk2PonLPA3OUwXJC4vCvvOYUIC4FtUGy7+LZb
	+vEUQVvPLxvo6+CCo76a9MoFBuJNF5icQs1Ldv7YiMy76FfXg9zTzOeD
X-Gm-Gg: AYBFou35ImImlK/ZteYiA1he/xPgVPrM1AzXFgUrB78Y8LyYk/2BJftXDuPFEzSK3p6
	UL3q7nia1yIvZrBUimEc6PQww37Dhn5FndIU3tsF6xsCHttLBvvse6h7PRuo9Q6wYzjf3B1Uftq
	dNEgNdudswsf97I75VXodu4OQkk4latvRVrSiXeJ7Ik87YWnwyRxs2XOt/mgzSmBGKHQExVbHM6
	sy16dI1sEbi4Eg7L53jbMghswbJSe9DbJYpjr73sQwCMm12hRPlXJftzkJT0fJ0h3qJVl7vVY6k
	hCc1e50sWWmEDAGe4UevGt+kcJLlsGe9BX2eyMAo0fSOI8rv/QU3DmQZLGFSPw4KjaIR9GuMor/
	puddTFdkPUYoCE7S/VAD6/8IlRb1numN27xEGKM0k/zN+vuZ3FDYDQ5aCEg7McZggt+fizsTZWM
	jyghgf9DJBDGFGDGu2mxtClXtYdAc7MgKAfPI5iCaPvlsgv6cp8jNAR5q8mimDcXQl71L2MTrJ1
	4EWdriF7sgaGvD23Y2WxrYhv3/tBVmLLa5rI+fFfaoRARSYyq17Pjt51NQB1Z02x7/bDTVKy9Bg
	kvKVZP5TAjs6Zg==
X-Received: by 2002:a17:90b:3dc6:b0:39e:24ab:9fb0 with SMTP id 98e67ed59e1d1-3a098d43b17mr4135466a91.6.1790311847757;
        Thu, 24 Sep 2026 21:50:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:47 -0700 (PDT)
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
Subject: [PATCH 12/14] ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
Date: Fri, 25 Sep 2026 11:49:06 +0700
Message-ID: <20260925044908.450775-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215048_570371_F2459336 
X-CRM114-Status: GOOD (  12.24  )
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


