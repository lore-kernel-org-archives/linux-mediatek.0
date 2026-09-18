Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2709FC982DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 13:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0yFohzMwFY5CpqXlk4lNOz4TrcxA63Dsw69mVQSK8Sk=; b=tzmHmQZnwGZZHK//gVLYezAWWw
	kkI/0PM/ruPpEgktuulNIV/KFoC1f0rQ5rWfiiHGv1Cz2J6IyfkxwnG8sr2Hurar0aEt/vgAWvZbN
	4LHrLWu8IRIr3Msz8fMTYx2J6QvYsPz+hfNDghhTP4AAwM9Apyd07W5tn6Gkb5cylIgMsOG64MEq3
	V92tVsNsf5+m8j5vjWAR8VjOH0BD26CRmMB5boxMpd9d2Z2ExkVgh3znLu+dVEVgdGDF1LVZEIlF8
	RfkIuSMxCBulPZY7FNJf+KjorZpchsG0n2m2pP3LleoVPy+yo4e399kXB/LwDxf5Vlv6uuWDQsk7H
	5G1AyJ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yoy-0000000EadQ-1vSt;
	Fri, 18 Sep 2026 13:40:08 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yos-0000000EaVP-15ou
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:03 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso766144a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 06:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738801; x=1790343601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yFohzMwFY5CpqXlk4lNOz4TrcxA63Dsw69mVQSK8Sk=;
        b=HL4AEHk91KMyhWQJDz5BRIVhZJCFL9+wsJUNJYs+R1DKQv8PRfC/xBH2HwYGvc9cdL
         XXm4sZebtI2qD7mNA3UQINDhF/E8vl6pZjghUprcV4vShtCiROLEnINauowMspT5K6z3
         89jxEomQnPPIVuv5hwxBIVq4UUMaXyQ55AoTZdx0EOdigeSUwyFVGa3nMyKocopLBCX6
         G+rauXiCPO/8Med++J/gDMXEUyw7K9HgiOF+lL131lBZs8ObMYxgs3dgJl5Z0Z/af+yy
         frlkgbyxTX4StNdJ5xdUaDWmGNseXJQzc95cdJXpi2r1ODnBkkZI6VuoYvMsyTR9C31s
         GjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738801; x=1790343601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0yFohzMwFY5CpqXlk4lNOz4TrcxA63Dsw69mVQSK8Sk=;
        b=h/r1c5Pw4uIU8Kwc3iwnCz0hWdvwV+tp74uVPAFDn3dG0ROB6ZW4z9F5sQ6qwkluYs
         5C7EpGEcp+nIXIyDlhuQrs9CeG9WigsLJBeNrdMVGV/PsWfolujT2pZoEqBEpSUP8Qmv
         HOya5SK4dO+FKlI4u517CeaiB8EZzvu1L0RzD/wPfVp30PVv8ZWWQSdvmUv3KXuOra+U
         0d73tyR5AQ73P7oJXdixAogPjJHDw9vhReBarOUIxOHUW8rGY8Lj4HW4AqRE0D0HzIJ0
         WsG0ylTp2M01Tgn6e04fDknNYgtpEid+mea4FXZBVRck+z0ggZA5UvcaL5wZ+ZRTN8bn
         BHOg==
X-Forwarded-Encrypted: i=1; AKwUvByHI3wtQBnQb/zbqfNXrKnbSwPP3Do33YxYkE3SB8fji64dBO8EE69tGLFOPLUpHnMxJHXxIkbjvBoY3Ln2kA==@lists.infradead.org
X-Gm-Message-State: AFuF++moamu7T1TB8IevodUBqcCu8Sh6ZzTfAXPfB8wWPJY2Dtg6wSiQ
	QuMjBcvEo0nDMhFdZayqVmDssETp4Noe54Svu4tUNGbxDZBgHp+ZdPXQ
X-Gm-Gg: AYBFou3wI3E5AxwC6yYYrseF0m5zHCbhakQE9iu/DpgIeho08j89hOFi3Mpb+1sH0i4
	2m5QuO2AwDzhW4fqFiDKDOCx6M/8Zwu3pKVGYxddd3o0y452CR9lgKhhXMEqu4UiRCqMt4LKR19
	3msBZgkeys/NJZObLfgh5/mlS/FpFfzdbYngEe6JfSRiM3fANeCurvnOOzLiudzPmDdDSUd0yMi
	cg1MYyD9Nnl7+JQnAb+r/kzVYKTE7axY71ompZhc/Pd+7Y8q7Kf6Fyr/ZYi8nR+j+l/tuLDARlo
	TDd6xDYC5SN75VmjADXBEBhX4Y2jwsRwk9gF4x1QsOUyC//6w01Em/6VqczrhbK4Rwehilwpa/X
	ngKG1mIBWeVWVSa98YhKXsYJiDFFNR8c46ys6kPJ4c0incJY2/J8vRCT/GocslzoixVqxpzgH/m
	uE3JQ09PydYhXJbrTzYHefFZxgkGSNLMQ7IACk6Q3ppB6pqvPSSfJHbIy315gkHeMWP8xl4xUHn
	o8k/XQ8S6u2doS2Ecb9DjMAXBFXP8lzePICFjp7Vh4ZkXUTqIEA1qg8QWafT/EsqdSTDpyr/lpU
	eVgkPN9LWt4ELg==
X-Received: by 2002:a17:90b:5545:b0:39d:e54c:8643 with SMTP id 98e67ed59e1d1-39e54d13929mr6237236a91.11.1789738801484;
        Fri, 18 Sep 2026 06:40:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:01 -0700 (PDT)
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
Subject: [PATCH 04/15] ASoC: mediatek: mt8192: fix MCK clock error handling
Date: Fri, 18 Sep 2026 20:39:00 +0700
Message-ID: <20260918133912.133799-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064002_327274_FB2EDA98 
X-CRM114-Status: GOOD (  11.77  )
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

If an error occurs after enabling 'm_sel_id' or 'div_clk_id' in
mt8192_mck_enable(), the function returns directly without disabling
the previously enabled clocks, leading to a resource leak.

Fix this by jumping to proper cleanup labels to unwind enabled clocks on
failure paths.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index 118dd4819682..77f596cab92d 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -619,7 +619,7 @@ int mt8192_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 			dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[m_sel_id],
 				aud_clks[apll_clk_id], ret);
-			return ret;
+			goto err_disable_m_sel;
 		}
 	}
 
@@ -628,17 +628,25 @@ int mt8192_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[div_clk_id], ret);
-		return ret;
+		goto err_disable_m_sel;
 	}
 	ret = clk_set_rate(afe_priv->clk[div_clk_id], rate);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_set_rate %s, rate %d, fail %d\n",
 			__func__, aud_clks[div_clk_id],
 			rate, ret);
-		return ret;
+		goto err_disable_div_clk;
 	}
 
 	return 0;
+
+err_disable_div_clk:
+	clk_disable_unprepare(afe_priv->clk[div_clk_id]);
+err_disable_m_sel:
+	if (m_sel_id >= 0)
+		clk_disable_unprepare(afe_priv->clk[m_sel_id]);
+
+	return ret;
 }
 
 void mt8192_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0


