Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0418DCA5FFD
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuT5sR3QJJEpUFIiZqumIPgjPq3lYxiQww7DYh2KWes=; b=LdTR0WK3wjp8K9QamKRbMTnbjb
	fRmA79NSXqHy0zJQfTUpEN5tlCNaaV/tC4ZE3PNIPLZwjBtu3yxkKyel7KwMuE7r/fRDJHLD3kb55
	kaIiJwjdJ2rLFsDkOJx5gZOqwQFhzqQ3KyoS00S39Y6/i5E8cyr7sylYDE88ps8/1gr1zSE3spVQ6
	EdH1WeSNYGmQ4Do9YcTJf1o6pE0tLrAJ7fu05F7bHREehEor9FFzf7qve94K8vf+cqqv3iPSGQWNI
	FzWBGbd49diaePe3U1K3LkDK/4S3QfdCTX7iZT/8tN8PEZGsz1flOZs/fd86GKw8aFdAa5PBRxTjI
	c7zhAvPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTl-0000000GGwf-2PjN;
	Mon, 05 Oct 2026 11:03:33 +0000
Received: from mail-pz2-x28.google.com ([2607:f8b0:4864:3b::28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTi-0000000GGsO-06R0
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 11:03:31 +0000
Received: by mail-pz2-x28.google.com with SMTP id d2e1a72fcca58-88a0f29ce98so692838b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 04:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198209; x=1791803009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuT5sR3QJJEpUFIiZqumIPgjPq3lYxiQww7DYh2KWes=;
        b=Sxv33fvb0PfDoJrBYcA4/XTXJUAiTkQX3KCyjTrV2ZhbciXPoVt+qhfG7Y8JLVoQLa
         lG1VC8SQEwiMg1hS1hAg+4l1klU/tmJqjVGyO4QhrENu3poMq3sRqmnQBpSdW0N4Y01Q
         S4yQxyWiKYhkuAo76CYq3qDpxE4MkO6SQO8lJ9XNnTZCiJ3jSGZDXNX8dTOVbxJP2M4D
         85cPfh6OLT8uLK5XdoOkDS/WVpnRGsd1O6yBrhMwp2DhesexXJO5SKkPfMx3mzEGJOsE
         EnFFHFFjzMPGQT3MXC66EJSgBipu4aTgVZq2HQGcYNX9vF6uxeYZaBIosA3m99GxPsja
         SM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198209; x=1791803009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EuT5sR3QJJEpUFIiZqumIPgjPq3lYxiQww7DYh2KWes=;
        b=qnuLdQ6p0GH7mMtFyDhVy/lQXJJrVpVxdPkR/9xM630lIUNt7nmHkAhRbq8aBb16X/
         ire+k+iKrzgBiCxAnPArfHiBwuVbDHDbBrdd6usWFv7UlHSPSS7Ar9cE+j1/5vgIeGhN
         7bGvnS/u7Eo4gAvNeLCcptXyrUYhBL1oMNCyQe+tNQRG5N9L4e2giX1k0zP8rniDfaCv
         ZyY5aYvQTPT3VKc3xQn5d9pBrewecClHxiL6YsmityjHKAiODOGIo7rr/60VeGwEf8hy
         ebRxCBoZVljf+E52Gr/Wjnu5NoU0myLPelRtICHT6Aoz0yLrd4YcSw5Ylz/d0wEwp4Ns
         OrwA==
X-Forwarded-Encrypted: i=1; AKwUvBy1qK4O15WUaJywZMDoTC4tDtCE4kGLqzQANgbbicMdGkACLA6ZzM3dL1ypU1Q5IAq9PYoAz2Qy6VfSFkZ9JQ==@lists.infradead.org
X-Gm-Message-State: AFuF++m9S+OW9pbj8HSXG9noKzhKACikip7BbkL6KnUjFElBcz8TIhD0
	PsNKeh4FODl+pDMc4h+jUr+0M5lz9ri8Oqzr3EPATzOFZ6l81zWrvJyD
X-Gm-Gg: AYBFou3yDS6i4KojL0zeOiAScBo3PUMIC5vfsIZkaY0QO+fzoSPbIBKOToWfqZDe/wN
	aYB9GGUVVRFupPKfZPXD4DM54DG7xH0EYzRW+p26GpvfMYB2KsfItSFctMzW1k0JzWT8jeeBmXV
	dUF9ZPG1KhgXIU3dxAa/rL76q71pk+RG1c5TqfwuyxZSrcZH8bjGuWPRpCozrZfH/FzeqPKvrWC
	uHV2tjdbbwKsliQ42zhQRLxESiO2gISQVYwyYqix/62LuWaOtkOx5lzEvHF5P5gJYWGTtNvuUJP
	KS+zINlQdg2IH+JOQYYcIFvlnw97QKob2EORC3/95bRP5Bpg2V2f7OFZIZwZj7Zw2GVqswTdWlE
	2bII7D7m1u1p0PsyikXQhy/HkvTbNpk5W1cqQSv1IFzEjtLD9tltY16PqgTD3SbfxxltVs7NFw0
	u4ARI0COZo56/g2C4Q+7jg+uQbyp8bS9TOLv3zI4jYTTeO6vYiMfOFrskPUbdMfqYN4yzqM9LLu
	IsOyDI49KLSN7t50J5pwL1w0VAmWIOQeSm68/zaTKOSyRATa06OXWFj9BmZFLgb9epmkg0EnMC0
	5BAnlPPGu2WGnkoOrz23Am7W
X-Received: by 2002:a05:6a21:ed0e:b0:3dd:a196:3091 with SMTP id adf61e73a8af0-3e0bd42d56amr9814841637.65.1791198209069;
        Mon, 05 Oct 2026 04:03:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:28 -0700 (PDT)
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
Subject: [PATCH v2 03/14] ASoC: mediatek: mt8195: Fix register access clock error handling
Date: Mon,  5 Oct 2026 18:02:46 +0700
Message-ID: <20261005110257.50145-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040330_572806_817E5D70 
X-CRM114-Status: GOOD (  13.86  )
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

Check the return value of mt8195_afe_enable_clk() when enabling the
register access clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 12d8159338be..34c828fdea29 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -599,7 +599,7 @@ static int mt8195_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
 int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_SCP_ADSP_AUDIODSP, /* bus clock for infra */
 		MT8195_CLK_TOP_AUDIO_H_SEL, /* clock for ADSP bus */
@@ -611,10 +611,19 @@ int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 		MT8195_CLK_AUD_A1SYS, /* AFE HW clock */
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0


