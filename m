Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7082C61DB9
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 05:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wX5Pjxydk72W6dlHzm6vBpUneCYTnp+fBCLKSyxEezc=; b=BqC1OCS8Z/ibMr7w9sjjIfKblt
	Zhg2eh4eZ5oAt1Y22nsfQE2QzFeGtJgwo9ajOhaS6s4anSNRX6XS/fGK+Iob0tTt+cmmzsBiPbkwa
	BwPALiubyPTNgo4cGlECEFOHOzKQqw8p2hY6+sFZFceC4KiWJADMD8EWuQJRIUDc7dTrHt9+VeKob
	kK1KMqeYaL1ZWWNj7uSu4Hl23BH+Opf68Ib/j8C8+k62Gnu1A8QBX7YnjSNVUHN90X6n+CkHa2Tvp
	Mf4TdWvqScOs0ZbmT+hhJJXzmJGV8131A1ziyrR05Q2OW74az0LFwnyz7t2oX82HxUsgiN2k17W6c
	DYaUKt4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzomz-000000057u3-22sr;
	Fri, 28 Aug 2026 05:06:05 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzomu-000000057qH-14gL
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 05:06:01 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cc1ceadbd16so503682a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 22:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893559; x=1788498359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wX5Pjxydk72W6dlHzm6vBpUneCYTnp+fBCLKSyxEezc=;
        b=IA76ggDnizB97leZ5x2uVLzxOdlVMRFhSl/4I7y1YJhYeysZA1HQlPJ4aHRXnDAFAB
         CWBPWAJ4NnNpzEBY86j5fcThaionugYHduS6eKJltZZXhVJ64UebMjy30fYazmwemj/e
         40SXYAvrZN0f4bJasVOVCrlEaIyOK2Xsb9dAJNMt9WhAkDwDlW7qEO2jBPLMVLAx151W
         avWZsKHZQ7tbiD3IiIf9r12/Vd18vDMGxLNW6+NA0EIpk/M217bj0NR3zvhX2yXI5Q0F
         DGOYvmjxh4GmBrgTT8XPEsd+PUnTxdJjUD5DbQ5ApXZO/kY0KXnYkN4cc9LZATHkEKcz
         0ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893559; x=1788498359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wX5Pjxydk72W6dlHzm6vBpUneCYTnp+fBCLKSyxEezc=;
        b=Gfk0CBFJybc8GjL0R2qnuGxkO/k39vAuJdYvYZ1de9kqrD/BDWBuw9Rf5StA1zAGhm
         4axAYRvPjuTPmd/Zy5D4I14CcoYpi20kWFHWUhfyYRGL91eXGluh6tCyiraa87h6f5lj
         hYpW9ypSuS8bxpQ8YfsZeS8N6q5suEpwCXSTvc9nDGnsuJEWiQfIUYDh9UQEqcs7b21M
         +LAzxMGgJQpMcQi7m9rboOlOoUNcBTvb29o2DF1bytHhqlGk+YhgQ9xcyL9DFXrf04dw
         nCGIkTtwfV17IcN2PaqoX4nm2m+y8rbjZZeO0KFJLDExi8zf5ewygvmJvDrJfq5EmvKX
         d5TA==
X-Forwarded-Encrypted: i=1; AHgh+RoCz6oAuqk+BVHJzSiX2o9kXkby0gkLcSsy1o7ZxIeWg6uAcWzVuHduTSnQfBaMIZh4LCsWtgRolRcTLmq8Fw==@lists.infradead.org
X-Gm-Message-State: AFuF++kaWyspF0igtNF3XPuDOD+1kQ+1ElxWcK6n0i8QvOjxC/rA/A4L
	gU01EfPsupd7pEFJDkNClDVZ0oQnB3+Yb7Vyp8/VJx+tot0o1e7t2pG2
X-Gm-Gg: AR+sD10+Ya5B6QiTzOeNwpqCIOW2SwL0VwxmOZcthYlA2hHoC4MCVtd7i6smVya/FRj
	0JrFdKO7bBSZt66uN2ezX3HNARzqmlf/260olC59xUxfvlWo6jPDOvHB6tjfCQ4M67EGXmQi2I9
	I/XpM3x4NffO3364kZJ7EgOjn4/68G5FbtOcprrSRhNjuS86EccnZ8djjvHGLv2tynpVhSUkggp
	GjiL7DcMAR2ZDOF06SN+bC5bPxnNiPpCx5U61Nq2NySPHOWZz+XRnPs12RlKKQg6iNX0R2KTlxG
	7+ohXvgB+O1/gHZiHaAJDBIpQ4UgAsiowCUrpI+gpseXTRJlL/d5Dg7ghINbJmD9u+Y+V4d/trl
	BtgfsdYG2RD3mKBSGlprtZJjS1iR7XiA8LHF2LYtX/mEogOpbSfTcXzJaSVs5cCzifysUygJJhb
	a4Vrda8vtaJoWFBbfi0L0qonCbQYYGwA98+l/D32c/Kg2ZffPpU+KbsV51gHmT5YztxkZdqOwIp
	cNn0NRHFDXUh6fVaThIsz+dKT5m8WxQkl4XZ/9LcRgNcLf3zLk8znww9t9y3Hc4MJnPIaXN1HxQ
	4qiU
X-Received: by 2002:a17:90a:da87:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-396d0d4c42fmr9359769a91.2.1787893559221;
        Thu, 27 Aug 2026 22:05:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:05:58 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 2/5] ASoC: mediatek: mt8183: Fix clock handling in mux disable path
Date: Fri, 28 Aug 2026 12:05:23 +0700
Message-ID: <20260828050526.590761-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828050526.590761-1-phucduc.bui@gmail.com>
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_220600_312396_6DF201CE 
X-CRM114-Status: GOOD (  12.06  )
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

In the disable path of the appl*_mux_setting() functions,
clk_disable_unprepare() is called after clk_set_parent().
If clk_set_parent() fails, clk_disable_unprepare() is skipped,
potentially leaving one of the clocks enabled.

Move the clk_disable_unprepare() calls before clk_set_parent()
so that the clocks are always disabled and unprepared in the
disable path.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Suggested-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 70 +++++++++++-----------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 6ab0734ad136..2dbe0b7f8bad 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -265,25 +265,26 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			goto ERR_SELECT_CLK_TOP_MUX_AUD_ENG1;
 		}
 	} else {
-		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
-				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
-			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
-				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
-				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
-
-		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
-				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
-			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
-				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
-				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
+
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
+
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
 	}
 
 	return 0;
@@ -339,25 +340,26 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			goto ERR_SELECT_CLK_TOP_MUX_AUD_ENG2;
 		}
 	} else {
-		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
-				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
-			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
-				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
-				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
-
-		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
-				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
-			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
-				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
-				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
+
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
+
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
 	}
 
 	return 0;
-- 
2.43.0


