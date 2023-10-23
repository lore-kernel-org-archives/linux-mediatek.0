Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB193C25B44
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SkUvzAZAFAxBUpUecaFOI7DumC3gwDv4zZE7XoEdjuk=; b=Wc+BB5lsyhjn7+C8VQYFmLXZZI
	gKj8wkFCYNBgHJr9KZBCtzQIlBr3a8zlWTDA+M3CdWjbV/8Rh6EE/rlWflE9Msk5pd71X5dWijV99
	Yz9YsMobkRP6TUiykNzLF1jr2ezQ5bYiWtjT3hUdacs6cKtuNblo24QOJpjkz2ASvm4itD/DltfkX
	zMT8UrnubnkQUJE4VUusMSbiE3h3qbLv7Ojr3RNHUA4qdlFz8xPlFRvxHfM7aiFibyyi7WudNNMJ3
	fpPEPg7n+24mOW1KCOzEbGiAdnvhWKoAKQTcUol0LsTuwVa1asl1XTXlfDHYKb8FJelf7VR3C4pyq
	0AylBgZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qurev-006x1U-1T;
	Mon, 23 Oct 2023 09:55:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qureD-006wNC-0B
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:55:00 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32d9b507b00so2282582f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054896; x=1698659696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkUvzAZAFAxBUpUecaFOI7DumC3gwDv4zZE7XoEdjuk=;
        b=nm+fpqL/t7EqKI2+EdexkyHTlbNIRBH9IsG+DUcF9h1fqZzSGuY4VziXWTbPjH1o3Q
         OLtZW6H1a/vcLQ78Qd9biBqJe/Z898GovBv7R+wbI0YsSxcNSTRlZrUQxllbdR0oJoAp
         78ekObYlAjE0LJmysHFi7RunW4tqIHUNLth5PG0OYmnCxSH2aI5smq2NCjEWsUcLOHzS
         /xooR+351gIbDcmRZOZ/QFC2RasUbqxuzCjUCthePzbAYjWxMpLN+c1iLUARrTgLKCeB
         867umneb8+JbOKQ2ODb8oDbCkHy9ZceNe9z8LnlDVspDgUqkAhcSrNLg2i8RzFYn/F3V
         XVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054896; x=1698659696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkUvzAZAFAxBUpUecaFOI7DumC3gwDv4zZE7XoEdjuk=;
        b=Z+abHMzdUxklFpOBmEcUxftF0X1vuJzO51l9rzbNM4PywDzzkVbdrEQwl8GkkKAjAf
         wMBwct3w9xVpTWo7Mu+B1P513ayB9c9KQfCjEjxcr8CtlCw/gsp4kbo+WDc1B8Z+usEO
         DAo9TzCVNQY3UIJy/yACR2xETUv5TndPVY7QoT6Xywccjv1Jfe8vjAy+xCZFyqp5qAdG
         49c3HEh4Fd/kZ8843MBqV+DgULaLb1yEbDt5fYwBT2Ta1g6A03AkxnHJN6lbPwk1PEUX
         o91XqPNk5HPb+Tbn7zsy8MRZ9te8AzlVcI0dpJnPKTuYJiIFuJhaQggB0gueytJp87Qp
         VqdQ==
X-Gm-Message-State: AOJu0YwoltM5P5xkK8W+C8f63aStt4KQ1CT5TDNikJ8yaguGl9BRCgbG
	gGuF/jRGn3C0WOT5gf3qZNQ2wg==
X-Google-Smtp-Source: AGHT+IHWg8SLe3xjPrj28tLTDiymcbd03RUAChA7SD3rg/2FeMGUhVv6IRTOZLXoX6FA5TVWxviBfw==
X-Received: by 2002:a5d:6804:0:b0:32d:8907:4528 with SMTP id w4-20020a5d6804000000b0032d89074528mr5681524wru.28.1698054895793;
        Mon, 23 Oct 2023 02:54:55 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:55 -0700 (PDT)
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
Subject: [RFT PATCH 10/17] ASoC: codecs: wm8994: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:21 +0200
Message-Id: <20231023095428.166563-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025457_218069_F164F392 
X-CRM114-Status: GOOD (  11.08  )
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
 sound/soc/codecs/wm8994.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index a48e904a9740..fc9894975a1d 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -262,7 +262,7 @@ static int check_clk_sys(struct snd_soc_dapm_widget *source,
 	else
 		clk = "AIF1CLK";
 
-	return strcmp(source->name, clk) == 0;
+	return snd_soc_dapm_widget_name_cmp(source, clk) == 0;
 }
 
 static const char *sidetone_hpf_text[] = {
-- 
2.34.1


