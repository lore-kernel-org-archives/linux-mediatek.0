Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8964C982DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 13:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qDV/Zz9q7433cXeBFk2dk/vooaqEVgx7zKvutK7uX8=; b=vU6ZMuonHKEXuPoVKUQJIpVSp9
	AWEKFEPazkPzYw06hpVCiD5mFNTJ6raAYs4xlvTRrtO34ym1xrr9heRFzfGp29rk8gTyg0Tt/3GwP
	rKLvOBb5039kbTGognykeHjqNx+E+2aN9e6VQ3an1VcYXcT2Mmc8EMWndlCyB8b60IIEeLFhaF5kq
	KGV5ltDD6fLXHiVLcJMe9uLgZsYFZHW7NRjXcUyjQNOpi+FxX6mJOFv8euQ0v01JbCagLgzVPVLPy
	sG+utmMrzBso4+AvDdMVXGVO3hkf+/XsrSQ63vYmuqr5c63m7qyknkPYkQGGFTRcVNjV/hWxGf5Ft
	L55Vj80Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yoj-0000000EaMx-0PIK;
	Fri, 18 Sep 2026 13:39:53 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yoe-0000000EaKP-0Dl2
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 13:39:51 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso553128a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 06:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738787; x=1790343587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qDV/Zz9q7433cXeBFk2dk/vooaqEVgx7zKvutK7uX8=;
        b=KFBseEGcfJuIbuQnm5sBLJvJSj/YSzwtwiBzfbUGcpuEmyZpiXhvd1d5CEYp2+JDS6
         j8RtWrnBIaIu7pBN8zZXFm01Emy+TkkMzstTr0n3rjlwoWfTG3miHTAEE1RG4BzULgIg
         CvD72o2ItLlvAHCGG/3CD2GNhUxVAnrpoFYd2wQ52FldZjxudpGrYyl1P+RvaAC7PKxo
         JJxT2vULQcfs1dnsNBD5gccGM6PfXkMnUUDfQj/UrupN4VcUmzC7fVErE55S93Sbw8YO
         +xFjAZgaO34kqVaLTlkicq4ZKslF6fCib0NJkUmP5x0FLwOZmgRt33Cm0C48kWoX4+IN
         Q0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738787; x=1790343587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/qDV/Zz9q7433cXeBFk2dk/vooaqEVgx7zKvutK7uX8=;
        b=dszSm3PbtUd+BTkGz3Zb7VBQ93HHUscgaFBjrc9FZJuWgga6lVMfyVE4qE+tEVOXw6
         jociEoUwikTzrf0P33hPl+SqX07OZSFxerb8BdW90CaEq56OiCXpRZeH48SlVmOxo3Ny
         TkgzqyYDa1+/1kp2p6OHLRuM5tHdlMn5xPQNTINdzmjihOWD4+a+jSlNd176lyAy5uWT
         W/hfOqPqAzMKT3ea56DJcRUgKREhQGTHdMRfzTb9P//G2dd8Lk/qeDW4Sue4xNhD4JCS
         K5Omd/ZC9IkZxigjv2tsP+MxEPYWFhkcrto1bebqkPllh3v9aGFLYddfib351MoK1Eoi
         /Ofw==
X-Forwarded-Encrypted: i=1; AKwUvBxOO3yPwgQn/kjvFGz7rU8iUZUA0Bo1KuUV0Kl/wZZ5z83j9mqbWHcFXGBA5vF0wshE2pIu12SknESKlI2jPg==@lists.infradead.org
X-Gm-Message-State: AFuF++l6nPmOsR3D3/YUnxdT0luwgP2Po0jfXewZhCDzFhi1E8qwLTOz
	Q5LGEZRUQbFzFI7ug4NoPDIehRx4KGrjkneG25CJh6y+8DEcTChwEB6N
X-Gm-Gg: AYBFou3IzrwytMZ1ORH3900O25S56oaLk/QtCCvwgc6xR6tMxUX1yiQIJ5NuR7YC7Mt
	F7tJm0rjL3ekf1QCf4iW5t9yiTz5L8WmXI04LrpJMwLZgRLBJzWgiRMFK7ZTZJ7IIQSzWNn3piM
	P80+mui36Y0AB0Z4+yXrAdoYvJy4TL3EiIBojG7fHNj8zRSQbJCLnHbKbL3AjQjvbPoUj/nvOth
	A3NOC4QiXGUrfS2rKFJ2Uux8HrnRlrNaa9YOswg15lm8li427xNCHeeENtsxoLhXfQulimYyjZt
	yD3iKan9AKbHYWj+cJH2oAETvP7Z9PXCqs0MFBYKmq8ew4RsCRJqizRGfVvCn8c/qeMxEqFnq0f
	+FW2LvhDpoHpKDXTCh3nWl9fVTiY+RyzP0IaCoo1W25cwGMS1BQFjDbiKV4bpXgTHHd2VDR6lia
	l0lJY271ZRWIBUawbyjqMFSyiq0+uXLcoCbeL719EoRq2WmslSQN22/YF6jAxnyV34Rta9ht4SO
	4mctx+szECT0+DMULQZIji5eqE7hQR/T9Y7fcKKEOUX3Ti7bg+O12qw19apb1FSpLhjkhvN7WMi
	fQWn8gqCnowxGg==
X-Received: by 2002:a17:90b:3d8e:b0:39e:2065:5f60 with SMTP id 98e67ed59e1d1-39e54f9d37bmr6277200a91.18.1789738786842;
        Fri, 18 Sep 2026 06:39:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:39:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/15] ASoC: mediatek: mt8192: fix APLL mux error handling
Date: Fri, 18 Sep 2026 20:38:57 +0700
Message-ID: <20260918133912.133799-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_063950_300161_D998F55F 
X-CRM114-Status: GOOD (  11.07  )
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
operation fails. Log the error without returning it, so the disable path
can perform as much cleanup as possible.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 54 +++++++++++++---------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index 416aff726253..bd778e5663b5 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -87,7 +87,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1], ret);
-			goto EXIT;
+			return ret;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
 				     afe_priv->clk[CLK_TOP_APLL1_CK]);
@@ -95,7 +95,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
 				aud_clks[CLK_TOP_APLL1_CK], ret);
-			goto EXIT;
+			goto err_disable_mux_aud_1;
 		}
 
 		/* 180.6336 / 4 = 45.1584MHz */
@@ -103,7 +103,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1], ret);
-			goto EXIT;
+			goto err_set_parent_mux_aud_1;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
 				     afe_priv->clk[CLK_TOP_APLL1_D4]);
@@ -111,31 +111,36 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
 				aud_clks[CLK_TOP_APLL1_D4], ret);
-			goto EXIT;
+			goto err_disable_mux_aud_eng1;
 		}
 	} else {
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
 				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
+		if (ret)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
 
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
 				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
+		if (ret)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
 	}
 
-EXIT:
+	return 0;
+
+err_disable_mux_aud_eng1:
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
+err_set_parent_mux_aud_1:
+	clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
+		       afe_priv->clk[CLK_CLK26M]);
+err_disable_mux_aud_1:
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
+
 	return ret;
 }
 
@@ -149,7 +154,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2], ret);
-			goto EXIT;
+			return ret;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
 				     afe_priv->clk[CLK_TOP_APLL2_CK]);
@@ -157,7 +162,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
 				aud_clks[CLK_TOP_APLL2_CK], ret);
-			goto EXIT;
+			goto err_disable_mux_aud_2;
 		}
 
 		/* 196.608 / 4 = 49.152MHz */
@@ -165,7 +170,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2], ret);
-			goto EXIT;
+			goto err_set_parent_mux_aud_2;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
 				     afe_priv->clk[CLK_TOP_APLL2_D4]);
@@ -173,31 +178,36 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
 				aud_clks[CLK_TOP_APLL2_D4], ret);
-			goto EXIT;
+			goto err_disable_mux_aud_eng2;
 		}
 	} else {
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
 				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
+		if (ret)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
 
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
 				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
+		if (ret)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
 	}
 
-EXIT:
+	return 0;
+
+err_disable_mux_aud_eng2:
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
+err_set_parent_mux_aud_2:
+	clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
+		       afe_priv->clk[CLK_CLK26M]);
+err_disable_mux_aud_2:
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
+
 	return ret;
 }
 
-- 
2.43.0


