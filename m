Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579E0C00A8F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YC/W8702n/IhtK2/nRJYRFXj5SA3+z6eWXwAmZT4eY=; b=GlgC+jGJQDRSyiQ/m5JF7NATKn
	um9UEu3tKHtpPQ3NxeJd+npjrW/wTqQ/uET6DHsX+bagnycg/8UtlT6yRvQIsREL0otykb9VmpUtP
	p6VAr06obSYAPzTOQOy0TsPXXbKin+tyeDJ5FNd11P8ErJ903cDgxf90izPPEkGpgh7e8z1XxlhTO
	rRkXVqSytiKop1w0CM1q8vXIuIFlEbX8zWFVmx3rNRFVayyrijcQYjMrtWdibvYfeHIgftWcUmUT+
	SgO+vkrvIoNdd2JU0nbeOpwa3Kt1C1TDBDrgwycgYo4h9HPkrOkLdyGQREl+mFBopKT3g+BW/tp/h
	esF0GcEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qure3-006wEV-0B;
	Mon, 23 Oct 2023 09:54:47 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qurdt-006w8T-1C
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:54:38 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32d834ec222so2098495f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054875; x=1698659675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YC/W8702n/IhtK2/nRJYRFXj5SA3+z6eWXwAmZT4eY=;
        b=Jnj28O4spZ76L5XvfFtGi+0dJF7PXoeJnlHXjR54uhpThr4UqXIwKQg7WTqLtV3OYE
         0lOkritIIMYkgjQs5z6B60lq3plqKZI8Y51JRwHFPT2j9epr3P9B8plD92N+nt+r1N8E
         pSeEAxjsWLHGH+wkjGoWAKj2G85A75NtAsdNF2HyLbIn1OE2wbiAaqqxEaVdcpvhEYuH
         NyMiz/fkc0piM51YBJg+cMPcNXG7l7Ihk/WfYhAfOxWT1+ldsFniYDziyvEzLp/cbxUx
         Bz9fsM4qe3WAYUwo76ta4AhZZWbyp5V/sAnSOhjcaaw1g6GD82p1p1hv0ZmX4ayzweC2
         UyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054875; x=1698659675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4YC/W8702n/IhtK2/nRJYRFXj5SA3+z6eWXwAmZT4eY=;
        b=oywcVm+7I2LojWoxHDt5nEYL4BH5AGKVlKXTTaAzK4OjwISfpe6qrs30pG9WYSRIDT
         xXszpP7uwXNXhE52f2tsXV9QOlfJdm62FCPiWBsIdvoxg5RS6eOCFPAuNSN3kThox+Mg
         o0vwRqzcuwnBeuhfTllaG1ZlbXz7G8Bge/1Uld9TPJ3lBlfG1Rjw9CueW1oDT0X87BD0
         ryAvLz+06UHI/BnFcnjHcAZJuBL1OMWdEgINOq7BiHo7EAnoHfJN/o04Fj6Pe1z0bCpW
         OlaaFMQt24FygT5Dkf/hexUiH1KrD/4qXnuHGTQsSQqGN/XkRCxvR99IKLrolaJpFGZT
         Phng==
X-Gm-Message-State: AOJu0YyB3TQ3XpDYn37AfP6FExB2XROQLWvFTXnyZb0va/OhRUC8oYqD
	GMj2WAFH4SFxD3D2Wre04CkgOg==
X-Google-Smtp-Source: AGHT+IEHt7MU0pVVH3QtAU35Dth6+VQAGLU4qZyA/p6jZNdd35Imw6TEqgJZWhxMs2mnHadLP+Eb6A==
X-Received: by 2002:adf:fc09:0:b0:323:10b8:543e with SMTP id i9-20020adffc09000000b0032310b8543emr5848249wrr.49.1698054875438;
        Mon, 23 Oct 2023 02:54:35 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:35 -0700 (PDT)
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
Subject: [RFT PATCH 01/17] ASoC: codecs: 88pm860x: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:12 +0200
Message-Id: <20231023095428.166563-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025437_406050_8D066BCC 
X-CRM114-Status: GOOD (  11.22  )
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
 sound/soc/codecs/88pm860x-codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/88pm860x-codec.c b/sound/soc/codecs/88pm860x-codec.c
index d99b674d574b..be01f0928393 100644
--- a/sound/soc/codecs/88pm860x-codec.c
+++ b/sound/soc/codecs/88pm860x-codec.c
@@ -400,9 +400,9 @@ static int pm860x_dac_event(struct snd_soc_dapm_widget *w,
 	unsigned int dac = 0;
 	int data;
 
-	if (!strcmp(w->name, "Left DAC"))
+	if (!snd_soc_dapm_widget_name_cmp(w, "Left DAC"))
 		dac = DAC_LEFT;
-	if (!strcmp(w->name, "Right DAC"))
+	if (!snd_soc_dapm_widget_name_cmp(w, "Right DAC"))
 		dac = DAC_RIGHT;
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-- 
2.34.1


