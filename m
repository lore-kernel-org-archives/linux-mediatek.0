Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9445DC5DF89
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 12:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EdEJgY9D5VmAtVYQAvmQy6QO5FD2ftLDiJehs4hR10=; b=lacCtD3+yr4lk4fc+5qy6MABLG
	q8vYis1aJONL6NzUGMcFIJiE90iG6HUk56qittc+XJXz3P60XXWkTB/zJva0MvIwHEa8CKSU3QeoB
	oDXi/vemTeD+TkB+hMH/CD1P6/I6JBo353g4I8AMk+ans//JLGnRh4f2mJcy9fQcJh7rH797D+iSJ
	2ywCfWA91ibKO18fho+pxULegF+++b8+a58EgmYm8UojwFoCm2pJZXwKPNyTUbHOvuBOMJGvA7i0v
	m/SasOEF3tvK9SBHkrxgzfXNVuskDhDrQjOwtTBm43odIngY34P9Vq9SwN86tnVEzJGicarEE5UfO
	sMA0F5Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOMo-0000000DIy2-30Ob;
	Fri, 21 Aug 2026 12:29:02 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOMl-0000000DIv9-2TfF
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 12:29:01 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2caced6038eso8647145ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315338; x=1787920138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EdEJgY9D5VmAtVYQAvmQy6QO5FD2ftLDiJehs4hR10=;
        b=s4vN0j7go171nqRrIieJkxmrcIO5tLHOEdbGeG7YyaDr3QY+j+hEw3CXwZ/4t0VjPW
         paCV9YGfSHwL+D977FrL7v8uBpcDZB6eX+xjKujCHgTOwmytj+5tmsV9VCd4cJPbdR9w
         07MJ+4KkoQ1HTMujiuu259h+TfEfGy8Cp+py45q5IJsUJwbxHLGv8xRvZZ4/aZi1fDZN
         UBoAf/XuaEU+uL4TZ3dul8MjjrHI6zbWQWs4sUip3h73OnEfHRfwu2Oyiei+2/5H696M
         8NsUbzPIUwptwfVLV1T9we2PYG4HjyJq+8+c/MuvZ/TiYWuwLG52l2W7znaTtR1+JKoI
         +AEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315338; x=1787920138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7EdEJgY9D5VmAtVYQAvmQy6QO5FD2ftLDiJehs4hR10=;
        b=M7mqvYLh2cwHMV7FInQ3Ll2eDBfa8ypbMnNK9ZNcqZdKGzZKKha0Oc9OBKeAl8L1pI
         H6UpkJ+peS8/91Ji4ygJzmerAOdhTQxXNmy4E138Iog89i912LminpuDi9HhLDBcogI9
         EriY04/AWw8MQ0zge9qBrlA799TZ5acw7rdT8v2Y5tjiKYVqapLmNMr81gwRTRlrxFy3
         K4c1QufMFifI/fX75KGBExZqYeRvsj3NelwT4Vac9T7Dj2uv6fvF4ElICtRcJpKACCbj
         ZELpzUI47/ii+Jk5piwsjxdVGrwJjP3iBvwqiuLzcsep1eyY4VbqaSCN6wioVN5g8/Gs
         fUhQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro9NXo9IqNg9xJrI/PdkBJRFDUqB5jgsDLXGoeAa9Ovh9fLQRqM3cRM51DvJXbSpA5+jb9iWSlkA0vm2cdSbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPn+doddGDoktE9p8ML3u/z4lioUb40LfzanwYH0vUxyz21zEl
	bH76mWNL1I7zAABTxibvKuld0n/mTOiAtyLjucAMRfG6KJrgvPP40GgA
X-Gm-Gg: AR+sD13CX7QhAc3LbAwW5DTFvfWnE76ro5C9x/Kv1AG4WlcTey8QBbS/OBg0hhlm9mN
	aBKXUslJ7SMCpbIm/QRDGiMk3YWSfws99N18Muix4J1/SMH0aVV9WKRzJXY+zqsRfy6fkzGL+f0
	lmphQA1Vp2AGGUiSh5aoDktrq3WUruCBV+w95brhAQs96IXll5usrfpH4IYwE6NRmAYPHrc+kuu
	ak936JBFJ0CVOR86R3SJw2kdexpjbuFnR2t3ZlJo6Tf5QN3zxwrv5iqywpvzTIX2xTxclmcBrN2
	rPXBjHjE36H1IG51U2nEEad3671CQt2txwSJSs/hyoWZGjQ1jyGjQXh3OIeRMrzDQ1eVY90Wvgo
	SQ1nLkoCsXh4hkGENfXMQtqhhi6krOvBXtD2gtEFKj20AOMIXcV484R70IHQ0u0B/LQNm3LHe3W
	MBhYPqYsoi+zoZpX2rYx6J8LU83l+kjzPYCV4GTzgcHCvtaN2Y8sKZ0RRcHD9p5ompwfDzENScT
	MlPoONYMq0JHWpDJwu+xVJlrPj9ur26FdrwHtyQiyN/ofFsDO2eX5bz4mOGbNnHa6L6oS1NgBQJ
	bfKuwAO37kFd4Sw=
X-Received: by 2002:a17:903:1aac:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d61a15e594mr181843635ad.10.1787315338494;
        Fri, 21 Aug 2026 05:28:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d554450sm18134515ad.2.2026.08.21.05.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:28:58 -0700 (PDT)
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
Subject: [PATCH v3 1/3] ASoC: mediatek: mt6797: fix wrong unwind order and error code in enable_clock
Date: Fri, 21 Aug 2026 19:28:38 +0700
Message-ID: <20260821122840.41266-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122840.41266-1-phucduc.bui@gmail.com>
References: <20260821122840.41266-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_052859_672182_065D19CD 
X-CRM114-Status: GOOD (  11.69  )
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

The error paths in mt6797_afe_enable_clock() use incorrect goto labels,
causing clocks that failed to enable to be disabled during cleanup.

Fix the goto labels to only unwind clocks that were successfully
enabled, and return the actual error code.

Fixes: c5e7fca928d3 ("ASoC: mt6797: add structure define and clock control function for 6797")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
Changes in v2:
 - Update the subject prefix from ASoC: mt6797: to ASoC: mediatek: mt6797:.
Changes in v3:
 - Add Fixes tags.
 - Add Reviewed-by tags.

 sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
index 6f3e6acfcfab..0ac04d73b777 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
@@ -63,21 +63,21 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUD], ret);
-		goto CLK_INFRA_SYS_AUDIO_ERR;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_INFRA_SYS_AUD_26M]);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUD_26M], ret);
-		goto CLK_INFRA_SYS_AUD_26M_ERR;
+		goto CLK_INFRA_SYS_AUDIO_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_TOP_MUX_AUD]);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUD], ret);
-		goto CLK_MUX_AUDIO_ERR;
+		goto CLK_INFRA_SYS_AUD_26M_ERR;
 	}
 
 	ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD],
@@ -93,13 +93,11 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUD_BUS], ret);
-		goto CLK_MUX_AUDIO_INTBUS_ERR;
+		goto CLK_MUX_AUDIO_ERR;
 	}
 
-	return ret;
+	return 0;
 
-CLK_MUX_AUDIO_INTBUS_ERR:
-	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_BUS]);
 CLK_MUX_AUDIO_ERR:
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD]);
 CLK_INFRA_SYS_AUD_26M_ERR:
@@ -107,7 +105,7 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 CLK_INFRA_SYS_AUDIO_ERR:
 	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUD]);
 
-	return 0;
+	return ret;
 }
 
 int mt6797_afe_disable_clock(struct mtk_base_afe *afe)
-- 
2.43.0


