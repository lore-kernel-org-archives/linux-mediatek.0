Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85196C00A8F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TezS6fAbmZRfIE/9gAJPYUtZvuonet12GZ8K7ihJ9/I=; b=1ldt+Ik7rVgqAAOREwgqTHzUAN
	pI2v1YFMZPtdyKkckJWCqaqnudDAVi5wEaQ1/c2pzdiuYzUMTuSqCRqv+bZ4dxhbr0I3NZVKKjSnB
	/5c9FSRjlgw7Hti/GfQmrAvF/g4XKeKeSUMHiMQlsOShUfE9ql3cWUAjodNnxsGzcNLy7SOfOFrgp
	iSooKQHgPeQLsi+jb+U0NsxMIwb2KSe87Bx6UxW0dCMvev0k43lHL4tvX/Gz3veOXbIC1nVJmlu1g
	xTDtrLLERr0P7o1C1MoRc95NmUJmEjwV08Ss3pUKpEh4K1O7pXWpenV8LZ7rhwRmnB9SKPn3dJ5K3
	EkVEHwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qureE-006wQi-2l;
	Mon, 23 Oct 2023 09:54:58 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qure2-006wCu-01
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:54:47 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32dd70c5401so2160278f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054884; x=1698659684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TezS6fAbmZRfIE/9gAJPYUtZvuonet12GZ8K7ihJ9/I=;
        b=WYl97ENvxBFVDw4c7F7jUnBb7vlZh9L/LenPCmTkOVL1vTXQ8QBFN9ofct2YD++rXe
         nLsE3utz1HwX1Aq8IJolIlqtrjnZAb3gYCcgB6Bc/W8sdO2uQXIvghwGbLTNRH6SRIAK
         cETK3F3I9z+4Fz2p8iJZPicAOmixiYe6cPXrtgZtrekZqo6mnZQ5IngYYXTr/xbJfYwM
         Uv05DBsdI25MqnDo1o9uoqwrGe5Mk9hjfW3HrKizekbB80jlsn51Jjh0keAefL1kUGpz
         o27hyg0Stl4wY0g1MSrQ1Lgw+IYgqLhNjAFnpWvq7wbYBeH3C1PG6jAhfg8VYFkjjG05
         s0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054884; x=1698659684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TezS6fAbmZRfIE/9gAJPYUtZvuonet12GZ8K7ihJ9/I=;
        b=DqNRs0kPP7ecCAMlXTq7YZmAXCWoQCtWhD+ekE+hU5bM0gcVMeHERcV1hNSDarQNt6
         pzj+uYcS9uufCTCgqFjY7U+ONcxM6sZw409FaE23NvqiRDiAVE/8FPrUbIn2e7aRZlq6
         8iFm7nDKH7QvWk1atVnIenHIjvVNC3uT6VTUhVJAAUsSVn2pOIE7EelQFR0Urfdau1Qd
         IUcg8L8mn+GFzsBsBgfak1urjHjdWD9O+Q96mQu/fNq5mHpgKq0277QeIhrfDxm4WUnN
         0u17KHBR1oM5LosmsTGMOpcn3esawHFxhgIET1VN/gMpcsOP/eR9tbpr2QXvmkXFjZO2
         D/hQ==
X-Gm-Message-State: AOJu0YzzMUA/omyb0gl5MzXFhB9zjRVQ6MRCjtZlmAUT6VPNxY571h35
	YtikbjmDCBx23r7ScwsGnNZXUA==
X-Google-Smtp-Source: AGHT+IHsx/9dXkgIRE0i/tyQBHSemsOVRBosIhYnxE5jqsYSPyBJogKhqbIAWQxRyZ17AF8k0sON7w==
X-Received: by 2002:adf:f603:0:b0:31a:d450:c513 with SMTP id t3-20020adff603000000b0031ad450c513mr6210328wrp.26.1698054884307;
        Mon, 23 Oct 2023 02:54:44 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:43 -0700 (PDT)
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
Subject: [RFT PATCH 05/17] ASoC: codecs: max9867: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:16 +0200
Message-Id: <20231023095428.166563-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025446_041576_B106720F 
X-CRM114-Status: GOOD (  10.34  )
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
 sound/soc/codecs/max9867.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index b616ad39858c..3b9dd158c34b 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -56,13 +56,13 @@ static int max9867_adc_dac_event(struct snd_soc_dapm_widget *w,
 	struct max9867_priv *max9867 = snd_soc_component_get_drvdata(component);
 	enum max9867_adc_dac adc_dac;
 
-	if (!strcmp(w->name, "ADCL"))
+	if (!snd_soc_dapm_widget_name_cmp(w, "ADCL"))
 		adc_dac = MAX9867_ADC_LEFT;
-	else if (!strcmp(w->name, "ADCR"))
+	else if (!snd_soc_dapm_widget_name_cmp(w, "ADCR"))
 		adc_dac = MAX9867_ADC_RIGHT;
-	else if (!strcmp(w->name, "DACL"))
+	else if (!snd_soc_dapm_widget_name_cmp(w, "DACL"))
 		adc_dac = MAX9867_DAC_LEFT;
-	else if (!strcmp(w->name, "DACR"))
+	else if (!snd_soc_dapm_widget_name_cmp(w, "DACR"))
 		adc_dac = MAX9867_DAC_RIGHT;
 	else
 		return 0;
-- 
2.34.1


