Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFD7C98306
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 04:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=; b=4EHe30RdFSGFBEX81qLndo4QRY
	wuyaEd7WhVNDosTBi/al7BrJZMQlDzQmOfmuHj/to2CkbU9yquOiixAFInCTOtQgPIpACJD/ulZOt
	/z5d25Mprzl6p81Tw/qrk+LN7SjITF7RES1tuP5DYODYvFAjKGzDYQHSybpH2VYOo/1/cQEXUcOXX
	Us2JPqq6gPn88plwKNy2ejL8SM5CylnCCqVlJ4BpeoYuysnCVcP+HtBgb9qrk9wsOksiICGN5s8If
	IBVMSMf6A1JHM4Y2wGWX1eljbEzgfiSd2xB8dLMmmIAf/ub5BV5CqGiyCXxAUL8afJYDB7tItaXFn
	0vULngOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtB-0000000CdXL-1Xrv;
	Fri, 25 Sep 2026 04:50:25 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xt2-0000000CdR5-37th
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:17 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so281781a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 21:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311816; x=1790916616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=SCdzMrA3hc/gwnChcBtxBenihf2HRpDJ1Vv3pnwiPcTq9EnaDVwnvrLwWer8Amivhl
         BeQnKB7DfdVEXPukMucOq5Dg1e3RorCHRmkKO8qqtwUH4VpqezU6p8kcH4gSmEY1vm5b
         jyBd9TPsm4bLGb9QQIyOBfhrqfgmPGa/UNhF5viD+63HSx2qAyWWWXmOFd/sEqxbFiGL
         KwlSuS7yGMJ9cupbNY3GD+CMxMVJZkCSlnpMCHcYs7QT/uU5bCxA3qQPMSvtaNfXZLPu
         cGY9a0IScwkHhbuIhJ3es1XONRv3RwpJ6q5kbN9TCm90ox8q5ioENnvoZc++Pr1sbNJZ
         bXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311816; x=1790916616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=1MVLpovx6WM4aj+h0YwAGHHKd3p8nZWwyDCUZhybyx8Le0cWcXee0NHuKbVG3f9xuC
         2CRS4zsFQYT3liTnmqO6PYzZ+LbjvWXUn0XAMslrOLYnY37L1M7d0NGIrxATPrdjQs2C
         aREfQAWKrspSQbbyG2cHTfI5dMTz09hx5X0gePZuLnAwsU/qi8ShAYPEtlaAlI8gTGaj
         AMxYX7RWoXeXisuhMzk1GpBD3YfLKM8Pbxidnz/LxgypI+aoAY9+Ug28lpg3H0pKFFpy
         fCis2+X4P/pnRAa+5KZv1QkWy1cF4KxX5d4xJKqj1Z07z2zta0Ekc8Me/8UHXM8zi4FR
         le0A==
X-Forwarded-Encrypted: i=1; AKwUvBwYtHTb17rLDi/+CwgQYz75b4zrf2XlDF/fVfb+mUNRmz8Mh2kpOFPNW5zh5LFmdytVN6wZPQ5fn1PM0E7KNQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mvmDTwxWdqg188bRsU6/F6BNKG8Hx8LbF4CuOWWe3G51w7RSgj
	liDGycMLbuvTNX6ZE83M45HcVPTpn4FR+iVDqn/TnuBSriP13Ivn1T8J
X-Gm-Gg: AYBFou0WbXSwP6g8Nc6Cg0RUJl5e8tu7zc4qmYRQaJftzan1ePtZtDolfbr558ryJL6
	g3//QF0YlMAcJKEJL23P6G3DrGYMpxnEf/Z4MkeD7nqqTdprKPy8R+WHOFICrdKHyDcZtKChPjI
	mBwHeo/tXcNRz892B+LEs7K3cJrqNViWQqF2kdme+4rjAWaRIdvTaE7Wg5e60jk4NUTDYF22GdR
	Qxg5h9ldkuYDpgBccdJrNjEHyjVyzcjKMk4jQpDpR8DKwydlZyBccQYNYF+qxS0U3a4hqx7cGOR
	doMAiI22IWsodkgfO0oWjniy08EHdNfC57PGf6A6EoRBO9njFKyf1IcaieG5MDWNqsgFOeBXhkW
	ozs5WOv8LOuz8UXZhHZFoma6QwS56BWTuEvTLqvX95GyzXdglvWPqiDvj4FqfDI6MiDxBO4mozQ
	PSCbvUG4UFJ2IHb5W8EQ1BGS/cXMdVE6rCE5J7nEqjENWbxRogBRh+ay0izIKNQSqn+Wic3CSre
	sOS3mSFK025K/jUITHvEI7/qtmvSQdHMrxJ/8MXJS4h4Tym2KKxTTeaZnQyXKX3ypRurpZu7fvg
	2eRbsqjT1F7qVg==
X-Received: by 2002:a17:90b:164c:b0:39e:6d82:dca with SMTP id 98e67ed59e1d1-3a098df465emr3862695a91.30.1790311816047;
        Thu, 24 Sep 2026 21:50:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:15 -0700 (PDT)
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
Subject: [PATCH 05/14] ASoC: mediatek: mt8195: Fix paired memif clock error handling
Date: Fri, 25 Sep 2026 11:48:59 +0700
Message-ID: <20260925044908.450775-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215016_800321_F932AC42 
X-CRM114-Status: GOOD (  12.02  )
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

Check and propagate errors when preparing and enabling the paired
DL8/DL10 memif clocks.

If enabling the second clock fails, undo the clock that was already
prepared or enabled to keep the clock state balanced.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 24 ++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 52c3381e6766..1d3e01e2c3e7 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -286,15 +286,23 @@ mt8195_afe_paired_memif_clk_prepare(struct snd_pcm_substream *substream,
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
+	int ret;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
 		return 0;
 
 	if (enable) {
 		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
-		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		if (ret)
+			return ret;
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		if (ret) {
+			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+			mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
+			return ret;
+		}
 	} else {
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
 		mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
@@ -315,6 +323,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
+	int ret;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
 		return 0;
@@ -322,11 +331,18 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	if (enable) {
 		/* DL8_DL10_MEM */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
-		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		if (ret)
+			return ret;
 		udelay(1);
 		/* DL8_DL10_AGENT */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		if (ret) {
+			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+			mt8195_afe_disable_clk_atomic(afe, afe_priv->clk[clk_id]);
+			return ret;
+		}
 	} else {
 		/* DL8_DL10_AGENT */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-- 
2.43.0


