Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33991CC6B1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 11:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVD+Izt35MN8c9Vj4EEt2lHnLwzvzVH8w94QaOy/wEc=; b=MJ89cLaqYf0wBHhgLSg/1iMvJK
	ZlrXOp0pCtwqmvElRzcMP94Kg1pHv5Fcf/yLrryS2ESI5pSnlSsmuRMNodoMZqjageUbrzH0TzcrT
	rXvp+uPZccqtEYBsBPLJilKbnsyG2eJs/GO2rRLfX71l5QPdqU2jJWXMjw8zcUDXiLx6DKlTyTI4f
	lhFzzD7+3XOG9DwzVi/1M93IaihMwTi5VQhwC9Hskmh2DDENg1Ak0JuDjGWEoHbJ0gDdxrY4l3MEa
	y/0Zr/zv5AJVqyiqAQnIqA+BArLth1UnuH1oNFbA3HSxx+iKstRYae8w0GqJLyQSwMahdkxUphV+c
	B29BgAuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxA0-0000000FJi0-2yz7;
	Wed, 14 Oct 2026 11:28:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGx9x-0000000FJeG-16vW
	for linux-mediatek@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RVD+Izt35MN8c9Vj4EEt2lHnLwzvzVH8w94QaOy/wEc=; b=Gm0Fc/U5/Se5ZlRab0XSzgPnmX
	2RKsTXo3I63dZbE42wGyF7aOGjhQKOJvzDOgmWuP8ktPHOn/kEG/96z6pavcfGMnyeWoLJC1BLgVU
	+sJ2wHCX4KCAZMfgLZPTPy/OwKdj0r9Vy5IynEBvVHkluw73eDqW89bfycPIB8ht9kJKQzB3IG6JA
	cfbHy+F+INQ/kHU83Z4jvW4g8cY+48z+2bK+bcznXQXdQLG8U6+6eSDToS4YW4CbcEEOhmQs4wwyk
	sSZ2j3yuQo2brAQmfVdTN4qA5psu+rFOl0lHCkTr6RRoaV4ubhj4mHQkw8ExM4fJgZvgR2IffDBmm
	TZD+yOXQ==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGx9t-0000000GgZP-1Qj2
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 11:28:36 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cd60d155070so367754a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 04:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977311; x=1792582111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVD+Izt35MN8c9Vj4EEt2lHnLwzvzVH8w94QaOy/wEc=;
        b=Gwx8Oh9t8oyMHI63bpDTrYlC4MFhQ1mjsBLVFH+Pv2FG3XkJ/95/bkfK9B3uynVvw9
         cwG5XOT6sHEsETV7wekrASWiJ7sKEheHweIK2RZjK/1NIy2V9wfHPDGMKzwLspaeoiKf
         gC6MpGbL8Wm4JQ5j7qh92vPWwsRHVtCUoxAaNKt4C4IiWsCuYFhL1UeQuDID5stVII5s
         OpZm4K5CEYXg6G6qhRmALkRT9Et0PSKCUYT0iBj51u3LwWBn80aoV6mK2/aeEb0yW1b3
         E2Eyg+H4/d9iZ6TX+NrDafeCDeCynRqRyyw/yi8mUjm6eL551r0U69Zc0UQliCZvlxxQ
         EoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977311; x=1792582111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVD+Izt35MN8c9Vj4EEt2lHnLwzvzVH8w94QaOy/wEc=;
        b=kZ4Vl87707SwnARQLo/oI79rv1mAFqGXisfZyRoojx+8ng5dQUH6qfrjYuFLdK8L1p
         /YegZ7D+DTwp0UFw71A/MIXL3dOyJbE0Zw3ykK3JhM/7JGtgPZ5RMkr5z/FO2KTP9zol
         9vUOtj2zmsbcbBk7UKVZptd41t6Zy7/4sck5Uc8aRQzOi0MpVs+rAAFR55FiVSgyWQuz
         C24/zdgSTLF8jDW5V9cR7ve/qTaieW7cKtTMrWVBzUboGP5/YAMHC8YLcvXl2Kgkb3nA
         T6ilAW+YKG9oMfftZ2fZNHZS9V/CWUBL+AvEYJ/Q+b2kA6ugmy9+VpHdW43TlnA862im
         n1Yw==
X-Forwarded-Encrypted: i=1; AKwUvByxvrPX/R/5D7urSfVa1KYi1ycZftd+KGhzNlggG5pHy4Jw+Vt6gn5A7jZOUwW74jZfcUMaHQTXT0wNNNlDzQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLDLU9UY+DZMQH12hYfx66T7VSCi8gi6K9zb89QfnV9JupvvO5i
	Wd7sDqhh1hitNSdRK4c6Bx3Zt9lGveL4k+cc3qiZNWjZBnqD6px3uqjq
X-Gm-Gg: AYBFou0rS3iJKt4MXyyRmSxfcE7ktA0454OJvnJmif7l+C+Akq1qsaYIU/5rQLf80j2
	4Y59X1RZQ/v0wOh9Z3ybi9LUvvo65lc4apKc9bnwspFZeEMLtY0F0VQ7OJ72g2WB9v39FeZ+/X9
	ZYqGXSKhQMOag6SmSzaEcPKG4R0xqp2kFheX6UL9hptx8l9nNY6LFNdvPzzSTVm7iw+wsbHFYyr
	/iDGjk5LD0rr5fhuMxUat0KqfoFwFkGDUjn5HjEjR8f9Mvae+EhES37klodRGqUO3lZiyOD6mfW
	eghlzQ7+smy7z2JJhsZmCgcn+SGq16JCEQrMfZSVayW7LSZWBmCiVho6Ks4nNgts+GnDNu2owlC
	M0/hYMxHJOO0SQPJUZBw2Di0nMzMDkZfZPdrObPbWJJ63Jv1I5aGUQPo9qYndtvIPc94yWzAWsR
	T9PA2UVNpC09/rxcOdT8/VHQhvkPo8XbZj0U4PIXurr4J7W8hgm7CfIOXd3Kbdo2ZWG6GHkpJO4
	IzHgf7MoxI5KGMgoPlqgN6zhYXLmvRf5otZiTSF7FrMt1DoUSjV7mCBHwPDM2f7lzwuvNw6Ufca
	HD5C6mANKrHatlY=
X-Received: by 2002:a17:90b:528d:b0:3ac:6e91:3f14 with SMTP id 98e67ed59e1d1-3ac6e9140e4mr1552762a91.22.1791977310692;
        Wed, 14 Oct 2026 04:28:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:30 -0700 (PDT)
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
Subject: [PATCH v3 03/16] ASoC: mediatek: mt8195: Fix register access clock error handling
Date: Wed, 14 Oct 2026 18:27:38 +0700
Message-ID: <20261014112752.683032-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122833_523454_18109E4C 
X-CRM114-Status: GOOD (  14.93  )
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

Check the return value of mt8195_afe_enable_clk() when enabling the
register access clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 12d8159338be..34c828fdea29 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -599,7 +599,7 @@ static int mt8195_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
 int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_SCP_ADSP_AUDIODSP, /* bus clock for infra */
 		MT8195_CLK_TOP_AUDIO_H_SEL, /* clock for ADSP bus */
@@ -611,10 +611,19 @@ int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 		MT8195_CLK_AUD_A1SYS, /* AFE HW clock */
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0


