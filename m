Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54F9C61DCD
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 09:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWC/dN9H+/DLHGkzhHQH4QE0IirXC1qcf+ZR9KcEXL0=; b=MCwOS4RvKzxvQSxxy+uY/vLVke
	DOf9UQfXM1dHHdK/4Ch16q5qnMx+jayv4QFC5HEnt5lYqdgm2UQHoM/JB7IcDVJcCta0lRFfPEYhP
	7dFg3XxLEVWB3ANJtFYy7mdN0swv8TCvV973OihER4CgySXJn5q+ipRHoeFRo3Xx5xKQqYXvr71nD
	rFCmJyD9Gj8HLJlt/N3ol+/+VDYLlSX6bSazHodi6LIf3xvv+itoiNX7Hjm8hkyzHLGLp86cTzGhf
	Ob715V5s2CDBJTLFo+xHr6BevA5A3KS1W5vPo9tZSB5/Ax3XI7qVPa8Oq51y/vFGmrFd2odw9f1W6
	xsUwfYJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsh0-00000005QJm-2k4B;
	Fri, 28 Aug 2026 09:16:10 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsgy-00000005QHV-16kv
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 09:16:09 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8558c0b26a8so734220b3a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2026 02:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908568; x=1788513368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IWC/dN9H+/DLHGkzhHQH4QE0IirXC1qcf+ZR9KcEXL0=;
        b=VFCsnD/rPMkupsRN06fNFCx5fr1/tFixo/1MMxJpcyA/Hxl+yt70oeeBb77Q3kWg8K
         GlEvjxII2HY44ZC0/cagGCqZB8yjlcOTm2SK1s++YmfyFrewCpBz7PhFv0T2IHS5xEMp
         KkZkqHRkztWkNFwlEWGkpNxnZliEctIm/6KqykOXeDyr307YXSsHelOYMPr/izXzkb+N
         Dyk973Ms8ZvP3tJdWJwxih8UpKPXyXNoF9k/I22lGDuJ0RJMuolSQbhQrWUxMldlf+XI
         q67th9DBbcPjll3tpZF0VbbDHqlgCrLBeWqqogniwD67+pfSBAdz/74IKBakVPrSR2bL
         R/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908568; x=1788513368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IWC/dN9H+/DLHGkzhHQH4QE0IirXC1qcf+ZR9KcEXL0=;
        b=EJaB2uEJwz60JyEYn0hYBe9fMV0UUwt8zQuILPvFflxzi2o9kFk5GWrLtHsB/Ef5D1
         YKVu64N0lL0eUBwD8kcUX7IWTX1Rz+tEeVchC06JA0n4IvfNoiewiFp8o6KBorZf3AJF
         d8nDItdVAZZxouAjcAbtxEACzafaYvIQCVTh74GEIjpwndzolEV7vxg9MngKwgPBRvCR
         EBi/yCjkj/F2iXaPthd6MTQaG1HfhFQzR01hdiUJ6EoO69+22aCVWYZAYtu2E4GCl/C5
         bQ/TUWYlphKIz8A8fC9jRm9AhpGqn3dA981VWRdry6uPSCSbpGT4t4+z3bR+vVV7R3bO
         t6lg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4WOGaO5LWoL8p4w21tviMKC0WVCc8gNNjsV4IxDxsALwHsFPo15YWPKhfEYGs4yKY51CGtXmZcx18HrC/Bg==@lists.infradead.org
X-Gm-Message-State: AFuF++kN9PF4dx8Y8zjFc/E8lxAe1h0pdKTqVP2U47criAInTh6Exgc+
	UDZaV8fsJd+IAc/fUAvAgNz4MoP0Zk5MDJFJMHZxBV65C2SbgsABdb0E
X-Gm-Gg: AR+sD10oA5UKxCu95NKZ5O7/QxeT3hij9AkpgGc8IAXfAePQSiMGtxQa4ElrkU9ElGs
	TEbX8yzc/V3uW79hg9bWyL0F+FDwROkbH9Bj0lPwuCbvDcpZIPtTPwTYQbka4Asx0+WYNJJRnom
	1C4Glk6Nusesa8p3I9xf974lu02sMs5Baox+nUwofiZo2FWECF1jScbLd93FuF57MIwrlhZVTd/
	d5DNoUXflsgGfBAABMYffVWEPE73zrJk6NH/h0RdRDMnBMABRKs6mOYILSJvc7bhoXUMGkliPLs
	+k5c+oaqGnkngqNIvLQdoMxGoMzRuJvTSFwPLV8ZNSH8HJU6QfHieBc84NFqIzDoVq/K9zY/TIj
	YaxxzstRYH8zlpQYtmEZSFu7k3skK/awFEDujKUpJy/RqoFn3WJ+vPSLQ4kFZVcytwOQ1q23ZA0
	ZVCjKA1sHFZSr6Z0LP6w3Ul1v1/o2OIYWFK251Zrq8T4x4PARM7oi/BewLmq9K2aRBxn055yQOx
	lKFhmQMfMglYFJl9kUMKsQ5dgY12il4aS9m4B+bmKE+E6Fg1mEKtoEr5FsKjHjrSht8ObVHjIe9
	W172RA==
X-Received: by 2002:a05:6a00:2d84:b0:845:e8b5:8c49 with SMTP id d2e1a72fcca58-85629a25879mr10588287b3a.10.1787908567583;
        Fri, 28 Aug 2026 02:16:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:07 -0700 (PDT)
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
Subject: [PATCH v3 2/8] ASoC: mediatek: mt8186: Fix clock handling in mux disable path
Date: Fri, 28 Aug 2026 16:15:26 +0700
Message-ID: <20260828091532.600047-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_021608_310294_65A7AF65 
X-CRM114-Status: GOOD (  12.15  )
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

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 70 +++++++++++-----------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index aa8b2eaf7b95..a517aa67abf6 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -125,25 +125,26 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
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
@@ -199,25 +200,26 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
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


