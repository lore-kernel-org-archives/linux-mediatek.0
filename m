Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71BCC982C5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 05:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jypTF/RLwAzXcjo5Lv+S1qv5niAwH9zwffT+/LnOWho=; b=HU3UyGWQc4RQKj9wl8nMrdVf6T
	+ENGNVOJcv3ztuqY8Vlp38qwGhK/bB+0Sr/wF/NGRJrhQyrxRHSUQskmj2V64wR5skpre71bRIWei
	yU4bhXf2cPCgHhMIMCnZolC5w/GeNsxOSvYxxCcE3IhEFGzn5FydYITAc0QAhQB+DACv9MR6bCJ93
	bVKkKsQX1iTqGPHiU0byLd4FZOJxotgUma5yBzmLjpT1LLzV1M8ud8mppuQp4MA2BfB0e0v7PKSmQ
	z4p0seJHvVNo3gJ6XbCHoQi5pvt7Bje1OamLPAptb7nWKwxVDOgdKUrkqa0iHwv/dloZBqZTHxq5F
	9RwdIRkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlr-00000008LUg-32Xk;
	Wed, 16 Sep 2026 05:01:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlk-00000008LLO-1HuD
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Sep 2026 05:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jypTF/RLwAzXcjo5Lv+S1qv5niAwH9zwffT+/LnOWho=; b=ks991j01SY12zgohe3iTPZ1uiK
	56ceSNXGsBCgURhS7vg45+/zyZiO08QPqJalbKR8/tJgYNTWb09xlOiitGiYNDQjU4wGr7s1indiZ
	/7jOvQK1Ebh0RIMQRGCeEsKY3L4dTffO2VMvrgPaHnQTQqaDcHgQXRAUTQTdsl8PszPUFvLGTvdi4
	+vUpEA029DskJc7iRf9/nh5nZ6vdruvPB5oHFn6Q1j8OeWSaFUk7/yQTOswcxY2OtzMm0fM1z04kB
	QU0ZzBUkJlwiSZkiWQuT+x245G9mFZXVyDVXd/vURwQOl79x9j38P+aZC6uImJMH5Bm0ZZT+l8npb
	X+MnbEoA==;
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6hlh-00000007UKv-0x3i
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:15 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-8631d0023daso304391b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 22:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534871; x=1790139671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jypTF/RLwAzXcjo5Lv+S1qv5niAwH9zwffT+/LnOWho=;
        b=NI3ou/ap4qRQH+RDYKaoq1DjGFaHYXRn9oeSu4x6U/9l8Y3iOBE5ErOR5wPFuUaqfs
         KP3E6m/FhqyUFMsOf16D076CHHS24wnvTq1Oq46ZT2kPhvPyOgx2cWH8hj5B97VbA3b7
         fkD1zvK4I4xLQ3ZpfAxj8fReCIaaBAeGqxviflEobCjIiUeYQeyFjgbt/tsy76L3dAWr
         R3gYzUKFtgPPCLXm3co9zH/xa1AGuVqCcVcGULO8nn9QkYDQrWn7erTtrGBtoPxJSaT/
         7jR45DIgFyHdUGUX/fEbR55/w+wdi18c3gqbxQ1Ji1Tw/AyigLTmBE0kJEnpQgtyRar9
         1lZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534871; x=1790139671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jypTF/RLwAzXcjo5Lv+S1qv5niAwH9zwffT+/LnOWho=;
        b=RVx7YVItFLhjwhoMYYH6nkXJ5t14y5CXmUYOguiKc1oc7eB/6+QJISBWeH60S0V60S
         li9PLNkVG94S7vgLTlI5GnaTKI2qaMzACG5KZgpLqIJi6WuBRUQbzGMaQF3Q0jKMF1Xx
         K/1QRvxCpXXlBkT6g38GRgADqQsojeHZJiCEkac8UCK6qew/V3+DYTzifznb+sSsq/cK
         ukcdMCaBEHI2pTZk3Z+18d6xJrY8/VSDmi0NX+mR5RTpqpxwMlUxi+lcrloncbHOpQ4J
         9bdGSjXI9PZFeQnmTsGM/D81IGfGg/ayb5eADrsBndABbQhO5KKAQ1D0Ey7HBE11257C
         nxWQ==
X-Forwarded-Encrypted: i=1; AKwUvBz39mQMzZCSbsAJBpS/5BtPr15J55Hh/ds99MrwRzTUka0lZKB862XPZQIcc/0wbrxANt+C+vLB/TEMhMKvnQ==@lists.infradead.org
X-Gm-Message-State: AFuF++m8569Um00IBheYu/NfQ9JxHLv5FH0HRH4QEk99EGifpIbO3b78
	+xCi+eDcPVLbTC5Vo924588VMpS6Z+4tgDApF60ldvwvNj8eDNQriJ2c
X-Gm-Gg: AYBFou1Gqq2iZKWE74imqpoO+AxAKoHwNHuhZsLBgV7ld44A/fKiBZbLSxTsVxmnnR+
	HPxjWeij4qpomOK8K/WXIxw9C5hmSRzs9zFxxSFN1GTOdqKNMZHbvpvV9vAkqIG9QL20C+KtYbV
	il7TOLJ7UTJuqUY0Qukqj5c/cI72vXUygnYxmxZtaJEWzrJ4onmXTD0AufhpIERxnTod2K4COxB
	pZwkfWrB7NeuUDFboart8+8+Nfu4B6XzIFVNrZgKiXftoVEqbfFNSpbN9mvVx0bMXrSM3T1CG1B
	zxbkBOFxX2OtQoX80swC4qDDsOHF7ME19S4+LT2lUYlBJDZ7vdjg2IBwDHv0zMZqDrxxfqk/QiP
	7RGDnU4tSow5PerC0T1ZG3GGvv5IP6ux6X6osJYTHTKyCoQQUlAk2XPxr/uqAMBx+vRKrpIF0l9
	/5izP4zz6lBmDANlZiTjwppT1cJ/avdN9I/1zM8fqd0T3WVY1ArldJnGkSeFRvx0r7YlmQIDRP1
	ReNDt8hDPsCwxThMTOYyZHJ/TUeg9cT1vR3+Edx2ZLaZ53UEElVHbVfHNFSSEWqIVEE+wnYFOYp
	7XbIKJuNBu7VCkY=
X-Received: by 2002:a05:6a20:4307:b0:3dd:5844:c95e with SMTP id adf61e73a8af0-3dd5f7b07ebmr2753489637.27.1789534870897;
        Tue, 15 Sep 2026 22:01:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 06/12] ASoC: mediatek: mt8189: Propagate runtime resume errors
Date: Wed, 16 Sep 2026 12:00:13 +0700
Message-ID: <20260916050020.14575-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_060113_549106_EBC61DBF 
X-CRM114-Status: GOOD (  12.03  )
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

mt8189_afe_runtime_resume() currently ignores errors from regmap
operations and mt8189_afe_enable_main_clock().

Propagate these errors and clean up the state before returning the
error.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.
Changes in v3:
 - Add Angelo's Reviewed-by tag.
 - Restore the existing afe->regmap checks.

 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 32 ++++++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 77cf2b604f6c..39cc2804ad4c 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2332,20 +2332,40 @@ static int mt8189_afe_runtime_resume(struct device *dev)
 	}
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_set_cache_only;
 
 	/* set audio 26M request */
-	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
-	regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+	ret = regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
+	if (ret)
+		goto err_set_cache_only;
+
+	ret = regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+	if (ret)
+		goto err_clear_26m_req;
 
 	/* force cpu use 8_24 format when writing 32bit data */
-	regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
-			   CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
+				 CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+	if (ret)
+		goto err_clear_26m_req;
 
 	/* enable AFE */
-	mt8189_afe_enable_main_clock(afe);
+	ret = mt8189_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_clear_26m_req;
 
 	return 0;
+
+err_clear_26m_req:
+	regmap_update_bits(afe->regmap,
+			   AFE_SPM_CONTROL_REQ, 0x1, 0x0);
+err_set_cache_only:
+	regcache_cache_only(afe->regmap, true);
+	mt8189_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int mt8189_afe_component_probe(struct snd_soc_component *component)
-- 
2.43.0


