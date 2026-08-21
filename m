Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D629C5DF8E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 12:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOrddxMe438IsC7xeJkXYhGEPOhIf02MCjyvV84OxAQ=; b=a0uQtZPuqVbIHHsAEffsDGy17S
	2SHG1Cb3ZduxjZVwNAuoZyuzBEu3+h9hDTprpE4tG0tI4HeKPqy2kW0Rkxt+mkdrtK6DWmmE1Ul5H
	OZDltC4BkuYl4FwAPVvB/z5iclG1cKCHiSOzx5888wzqfebZDdojxgIevjsCzNNS3NCV0ar+Def10
	poX5UIaumjIrhA/WnAk+bGdJZgCqc2rzbiKEzGHqDhJBmFAynqElC8KcfpD9CfNjacV/m3a0VIwRT
	9XJk1CsW2ZUajC7fwDRo+ZN/pLM363SBKWFdaLHN7zcO+NWdI4V5MShQGJ6Y1Go6Fpse611klrHST
	ULxCd00Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOOt-0000000DKFx-13ZJ;
	Fri, 21 Aug 2026 12:31:11 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOOd-0000000DK62-0pOK
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 12:30:56 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cf27856f9cso9401615ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 05:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315454; x=1787920254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOrddxMe438IsC7xeJkXYhGEPOhIf02MCjyvV84OxAQ=;
        b=KIxlz8fS/qQmKkwoqlU9LdBlSQLtxhhPs+VuHkiTSluep4NR5llM6LkhJoNt2IqC6Y
         +auTXpaZKDg5wEEBipbiRqlQ8phHmflqGujwVAIaOGBUYP9e4ZrKCyiazkp1Q5MpHETB
         H6MxQ+clFV7QZSFx79OwKE/rJ9SG4pVNj4KyJxTx8msjhdb6TFkSZLhpWIgTxtxeOily
         s777eaeuReN5rCT6wRTTlDwkN70wLdBBMWh/QyvKZ1iYhirPZTIe9HlddJwZP22vj0Kf
         1bS2+2L+5sfsCp1Yfu69KyT9z+oQDlkN1BP2gJcdV1MKmuJSlI0dXvtvT5eZ5HZSPaRT
         kc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315454; x=1787920254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cOrddxMe438IsC7xeJkXYhGEPOhIf02MCjyvV84OxAQ=;
        b=ftzPYPytqgXUM8qVkO8Q5CVLtABSQkzX4tFHAIu02naXVazO6JAq+keho4e+2WBIBZ
         gy4VufJbiXWzO7lEJeEmmYm+5icARlBzKPiaU1a7eF4wNJzZK1Shr8+jt7cb5qadQeeS
         4Pzcx6o+PlfN/0JYXyqyeZWALQEBiPhob3PhzyNTWyp4pAH16I66E0nYInogNRx62mr/
         3RVfKLHXELp1sexLYqBawNj54UXF2mVAy3AqsVodoUjeJpibhYdobGALAM/FNUpO4N8r
         QA1vSIpOofmQrHdJJsmzJ5ojhydZMK7sgDjgdNLmFrQtDUePILmqF+0kVvCXdLHV7pOa
         vavQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVdZWft43mJa5zz7O7rMNfGx1b0ILHcNkFsdiFFFBoRutHQF9atW357+3OLR+zjngm4mAilI7EMT3ewXcCsQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lBVCOcZeK8KYMImXnuMXH5S1gBvydwwhnTl1l1/YRszX5NkIhk
	hYjCfM2NvKoaJ6GM422D2KLlia/g2NS+iybY7s8OTPYniCcjU+h6XEzb
X-Gm-Gg: AR+sD13EnkvcJqVOe1BQmPwBWotUR2vZBu5Chj+Fdb59j28iav1oGTchijI1Mv7sy+Y
	NH2iYpC8gHYPvIBGAKCid2co1WGrrsPNHDSDk2i0F+EiJNTKlxHPdLUlTi4UfFOrzWEsqg+IlPm
	P5qqV6Z5lgJKsCDwwylnAs8J3rkGYINNO7l6KNOhmluuR1qepv7zBdW1HYmGvsgxqPjoxeBGPcx
	MtW0DqLdZtpJDUDEN4nm7oz/PSVXOHu762O9uvDmJHjTPbKGwxFlsLY6WFlX4l8SafxaWOH7i2L
	y9dkRGtCXkkcO5M/yRvvgolxEOg1QMNFmzvrxX8mO+RiTi6sxLCA5lixrwbVL3Dw/FtZr4n3QNm
	oxTLnlVYZaMfNDxanY4OwArIiYwB28zYgAHGB2ufyYH87lCxkQfVPZ7nZPlBDhHnobJWTHbFCSR
	RDispqErsAMouyn7LdZ/pcxRduLVf8KDZ/x9Jrnb8M2KgTlvmWVfLgpEiLEVB6W+4XVKQCOmug/
	+pl5FTQSgz7il/A8ThfL77R/Kmmw/NSTwSZKtWSAJfpe1M+Fy8Bcdut4T9b9nmJt3JtUxh9j/BR
	8XbL
X-Received: by 2002:a17:903:3c6c:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2d64adc5f3emr120518305ad.5.1787315454282;
        Fri, 21 Aug 2026 05:30:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1besm18302235ad.53.2026.08.21.05.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:30:53 -0700 (PDT)
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
Subject: [PATCH v2 4/4] ASoC: mediatek: mt8186: Fix MCK error handling
Date: Fri, 21 Aug 2026 19:30:21 +0700
Message-ID: <20260821123021.41390-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821123021.41390-1-phucduc.bui@gmail.com>
References: <20260821123021.41390-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_053055_524004_F096B754 
X-CRM114-Status: GOOD (  10.04  )
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

The mt8186_mck_enable() function returns immediately when a clock
operation fails, leaving previously enabled clocks active.

Add error paths to disable previously enabled clocks before returning
the error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index d6b0174e2655..8cc8eb8022b5 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -528,7 +528,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		if (ret) {
 			dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[m_sel_id], ret);
-			return ret;
+			goto ERR_ENABLE_MCLK;
 		}
 		ret = clk_set_parent(afe_priv->clk[m_sel_id],
 				     afe_priv->clk[apll_clk_id]);
@@ -536,7 +536,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 			dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[m_sel_id],
 				aud_clks[apll_clk_id], ret);
-			return ret;
+			goto ERR_SELECT_MCLK;
 		}
 	}
 
@@ -545,16 +545,25 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[div_clk_id], ret);
-		return ret;
+		goto ERR_ENABLE_MCLK_DIV;
 	}
 	ret = clk_set_rate(afe_priv->clk[div_clk_id], rate);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_set_rate %s, rate %d, fail %d\n",
 			__func__, aud_clks[div_clk_id], rate, ret);
-		return ret;
+		goto ERR_SET_MCLK_RATE;
 	}
 
 	return 0;
+
+ERR_SET_MCLK_RATE:
+	clk_disable_unprepare(afe_priv->clk[div_clk_id]);
+ERR_ENABLE_MCLK_DIV:
+ERR_SELECT_MCLK:
+	if (m_sel_id >= 0)
+		clk_disable_unprepare(afe_priv->clk[m_sel_id]);
+ERR_ENABLE_MCLK:
+	return ret;
 }
 
 void mt8186_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0


