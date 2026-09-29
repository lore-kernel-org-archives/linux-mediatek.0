Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63ED2CA5FA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2026 06:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCVvBPbKtk3VcJreNW7SRJiAXgmB7FAeWV2dOTbxzuc=; b=ClU1dEoM2WzwRblVQ+2lDxLTAB
	orktuDkIcTbldKFpIGfnjewAv8IrSKZDd8vpe8zczM6dckvIAaZ4xnF1JDR56ng3/gW6AfsOvt/ud
	FLkKfF2KHbS40MIp7SypHn9ijnH1LvqA2LFdBNwZkY2QM56o11VqPCDlpq1QTH1zDtRZzXiENCIuQ
	Zr49QX1gsFNfTB5v8DzM4U90NQPm5yz3FU/Gc/wUAvVelW2Cna1kBub9fVes6Zm1Q9e/Bhs2xNQLW
	VfaoyyS3hne7bTDSmus2UzLARF8Fj2ayaTnfFp4K8hl2FiDyUsdvUAZT/0iR17jjOy/WWyAqcZr37
	Jmu4QbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4K-00000002Pgs-1TmW;
	Tue, 29 Sep 2026 06:12:00 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4H-00000002Pfb-3SeI
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Sep 2026 06:11:58 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so2540710a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 23:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662317; x=1791267117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCVvBPbKtk3VcJreNW7SRJiAXgmB7FAeWV2dOTbxzuc=;
        b=kKKE6dbHpclCjIuW2IzIHBy5+aciCSEJdMnV9Od0WUMRq5S5X485zy6dG6haaXND5N
         uX0ytEFTyf0Wyy/nrqwWJ7uZ0FTbc15rsIddkUxnSoNvZy9IDYOO1yGq8/QiiXZkMUPe
         Zv6flczvV9Iaf4t1sLT68tLI76tIngGgPYj/jKkLthPNblhGMbAumCrnEv8gnXN7eazA
         Ncpvr1KVvw/mxx7hDtQOw6LQVu0exblqqgblN4Z5sXvnja8iXp7sPyCQGYJP/X8wgAsu
         cbWxi//Q0nDd9B9v8fuMEvcFudAvlmNmqtwhCfWqAYJufea1IGWjKNIZQPtG30gfkTl2
         IxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662317; x=1791267117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iCVvBPbKtk3VcJreNW7SRJiAXgmB7FAeWV2dOTbxzuc=;
        b=2qLMR4eNf4Gnp5mW/iOTkju3N6Ck8qNYkv7CPcEM4XaBWV2SEKbk3XGEoPMTSlk4si
         zs29AhLct2JscgbK0i6jbIe8weJvmSEpuJ+lG3aG5IbGUcKjqmOVyfYuYU0IkkJphxk8
         HZCtv8eYK8N/QxAamM8rHYjh+ql6KfHNvKaPJ1ZcXw5fGBKWrjnhqYeoDLf5eRS7ZlMC
         kbbPgmj5xGy7iND1zfS2DJgY3FyGXAO/9/X7kbiCOMPewk7fQ+f9cPhmj/rSlhS0S5Nn
         W2qwbOEugOjTDRbyEaS2QbxEKG3dHNPMijs/8JApZyFOUXHrxzimPyckumothSLl0MJP
         uHrg==
X-Forwarded-Encrypted: i=1; AKwUvByW4KoNdUPUDeS1jDI7i5t1cYpg1s5ovWfCv1wL9PwYe9RxTepkitET6+anWpPLVk4rS/Ci5y6e41AipG+trQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLbc05iGBjFKdaEX4BCgh6SS+ydikHKYzhMQG+y8HNQEfvuSZMa
	Ou0/CMt7A9zInQiB3VYGGdTOnPj5mwB/sRs6CXqTEp6MNhd75xjXW8ml
X-Gm-Gg: AYBFou0xt+QPZgCvvdANGdHcq+zXPW1CudHC/cywEU6KdcG8YknCIa+QlJBmqonFpSo
	WYPNTaBmk2UGdYIJnRpXGxJq88yrhIk7Ymbdrqv+J8F4X7kSU8O/W6Q6CBDo2AQfO2toiYGpY2D
	oUjuy2Bx5BRjU+2GFgnhQa5dZeLoPmV0so+Nf37kVBUg4rTmixXRUbFlyP9xbEUGNstMo14Ziyn
	PhSGOlJavxa/aF/oFkSi1M92eD2whRQhQKa5IDqD/9jVsm9wl70WG3CFxxCzk2T1GUnE9yHmB/u
	SF7X0rOtCxbCrALHSbc5yACDXzxg2A+VrNq4ikS/PPugqOuV2BRkLpLmda3S0O9x/MioBdG+9yL
	zfUshrfw1KWEQTefe63g1qFvUrYzBa/S698RRWerZt5KTOLABHugbL1t6Ohr/XFeXRdJqkn+ox/
	L4Ht2hHll+XOv8v3g86qy+3WI0UajmfxqQpoq1senSDGo5fNldTLrrzglQmEbuYPDQ1aIv4PZ0Q
	Dz/zzm1tMiIuX44/vKvaN7Dr5Knj1rrrYdFTteIteESMphch7EFTvWL228MMMoePelTg3cLKNJj
	YMWLK2ZLCOdJAg0oQS1G5Aeq
X-Received: by 2002:a17:90b:3a4d:b0:3a4:9ba1:94fb with SMTP id 98e67ed59e1d1-3a49ba1ad2emr1589587a91.52.1790662316829;
        Mon, 28 Sep 2026 23:11:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:11:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/10] ASoC: mediatek: mt8196: fix APLL mux error handling
Date: Tue, 29 Sep 2026 13:11:12 +0700
Message-ID: <20260929061121.124001-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_231157_861252_3721FA7E 
X-CRM114-Status: GOOD (  10.19  )
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

Propagate errors from clock operations in the enable path and clean up
previously enabled clocks when a later operation fails.

For the disable path, continue disabling all clocks even if a clock
operation fails. Do not propagate the errors so that the disable path
can perform as much cleanup as possible.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 56 +++++++++++++---------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 286e39f53ae0..91ae44024949 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -220,33 +220,39 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
 					      MT8196_AUD_ENG1_CLK);
 		if (ret)
-			return ret;
+			goto err_disable_eng1;
 
 		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
 		if (ret)
-			return ret;
+			goto err_restore_eng1;
 
 		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
 					      apll_rate);
 		if (ret)
-			return ret;
+			goto err_disable_audio_h;
 	} else {
-		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
-					      MT8196_AFE_26M);
-		if (ret)
-			return ret;
+		mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
+					MT8196_AFE_26M);
 
 		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1]);
 
-		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
-					      MT8196_AFE_26M);
-		if (ret)
-			return ret;
+		mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+					MT8196_AFE_26M);
 
 		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
 	}
 
 	return 0;
+
+err_disable_audio_h:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+err_restore_eng1:
+	mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
+				MT8196_AFE_26M);
+err_disable_eng1:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1]);
+
+	return ret;
 }
 
 static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
@@ -268,33 +274,39 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
 					      MT8196_AUD_ENG2_CLK);
 		if (ret)
-			return ret;
+			goto err_disable_eng2;
 
 		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
 		if (ret)
-			return ret;
+			goto err_restore_eng2;
 
 		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
 					      apll_rate);
 		if (ret)
-			return ret;
+			goto err_disable_audio_h;
 	} else {
-		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
-					      MT8196_AFE_26M);
-		if (ret)
-			return ret;
+		mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
+					MT8196_AFE_26M);
 
 		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2]);
 
-		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
-					      MT8196_AFE_26M);
-		if (ret)
-			return ret;
+		mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+					MT8196_AFE_26M);
 
 		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
 	}
 
 	return 0;
+
+err_disable_audio_h:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+err_restore_eng2:
+	mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
+				MT8196_AFE_26M);
+err_disable_eng2:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2]);
+
+	return ret;
 }
 
 int mt8196_apll1_enable(struct mtk_base_afe *afe)
-- 
2.43.0


