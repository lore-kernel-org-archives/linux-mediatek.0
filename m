Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C17C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P05PzWbQ4hBl2fNZN6KJaeVrZFnQ7VS3APzpcXPmWmM=; b=35cFuubdybzF+HwU/cs1yUxB5M
	aowgqt54o/R3511nwarpZVHN/oYyLfQDSqXiN1Mrg7slhnCfmv4vDhQ3Gfp3TJGNKwdWzr7wBPbxr
	71HZxBAx8lJ58fs0UGZEs66UjLJHY1bycyL9V3MhoOnAzNniclICV5kg0MFzhQkIr7UF4U3mPyPTo
	OSnjyvkLB5nr38a7vcnU0nT6LSMb+11BJjuWWCRYttyj0+o02WKKL2XoypMo4azDDKLQTOKgcfXC5
	6K8fI8OIJiDuSnE2BnwSZ0iKI5bpT5WncNkdyqtHwVF5v/iH8sUur9sV05DUwrTwWB6SCQ2pyZ76s
	HAVI+0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qure5-006wGo-1d;
	Mon, 23 Oct 2023 09:54:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qurdw-006wAj-2Y
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:54:42 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-32ddfb38c02so2225582f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054879; x=1698659679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P05PzWbQ4hBl2fNZN6KJaeVrZFnQ7VS3APzpcXPmWmM=;
        b=sgpFwwebDEu2Lm8AsQi98ThQG0Bj9KBB5K/ccpOxUaa/1RGJ2wsLDdbSQkHupCdgJ5
         YgNoD72/gZ2f0ZWQWco8+jlzfrB4SSqqceRdtRsNEewV5/5vyqMDdZQNDxskmI0xsTwa
         FAI1rznYpa876SfvtTv7OOJUT52OsOqg29XPpuKs/p7scNx8RAoi3wlyoWboZkpjc/0q
         Xm3Co/huLc2W6mL0CfhijDWPCy7PVpSJOnEZgkgiGrPpyLu3X6JYAH82zui8Wm1HPQjW
         foN5WwofVKQgfusjjVuKBnkN3ID1vmEIPPXP6IRCbrgCsyyBSCnAAw7smJmspOvB4kJN
         65/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054879; x=1698659679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P05PzWbQ4hBl2fNZN6KJaeVrZFnQ7VS3APzpcXPmWmM=;
        b=itjaDbLuhg9dYTNHw8M3CtnUWtwJkOhklSZlCK05C9Lig9gx7ChA5qm9HOJqRwUKEy
         5NUaaU+QKFBVz5RfUNj2Dv+qzkCrwMQzzXWSOxK1uRCo+UuQm0510AlvofRWOVBLxBG6
         ymr6gtCXce7x0jfNxyg6lkFvCN5KCtqnZeWA6ynQB0Bm57cr9H1naLVxocAd0Mpz4eQn
         GrJI8TJ9K8djS6WvG2sfZ0/MfYaSOw5geOFALjcG3O9EbxIERIBqIuKf5Qxe104kyuXR
         a7cJDtSmt/1B1YsQaHNjpmB0JxyZxtrI71dwjdd3iI7QlgyjFmohfOSI4J1zL2+lWUDd
         er3Q==
X-Gm-Message-State: AOJu0Yxa6rVFMZoySyB2aNu8cQF1InispDa6YufvpPW9fIQN6VvDMONI
	d/8WeJWJwo7olYD2umn73OtOpQ==
X-Google-Smtp-Source: AGHT+IE7M5wXmUXIEeObjapurzse0V6MkE8fsf1gV1jhgG074/79sH+mXQ9giKjm7AVwWA1w8KdepA==
X-Received: by 2002:a5d:67c5:0:b0:32d:b7d4:b90 with SMTP id n5-20020a5d67c5000000b0032db7d40b90mr4943276wrw.39.1698054879636;
        Mon, 23 Oct 2023 02:54:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 03/17] ASoC: codecs: adav80x: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:14 +0200
Message-Id: <20231023095428.166563-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025440_872685_3BD690CD 
X-CRM114-Status: GOOD (  10.92  )
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

Use snd_soc_dapm_widget_name_cmp() helper when comparing widget names,
to include also the component's name prefix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/adav80x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/adav80x.c b/sound/soc/codecs/adav80x.c
index bb08969c5917..c8c0fc928211 100644
--- a/sound/soc/codecs/adav80x.c
+++ b/sound/soc/codecs/adav80x.c
@@ -229,7 +229,7 @@ static int adav80x_dapm_sysclk_check(struct snd_soc_dapm_widget *source,
 		return 0;
 	}
 
-	return strcmp(source->name, clk) == 0;
+	return snd_soc_dapm_widget_name_cmp(source, clk) == 0;
 }
 
 static int adav80x_dapm_pll_check(struct snd_soc_dapm_widget *source,
-- 
2.34.1


