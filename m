Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279E7C004C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PvbddIvQlG0l/ZDn5njSVhrq4RgzTBlbX25/MYIgFc=; b=WB7Knl68Czz4qJUeZRHD7fKyfn
	3Syl88pey237VCu5V14d6Dop8ZxCZ599x/ueboXuq/XSAP26Ki/KjnsrbtoXlirHdDp6XgsOPCtLQ
	5SXFURtkehFoYhXm066H7bd7lGSGQaoP9Uh7SZp7arlwlomP1O1ek0Y7d3ECtOtlMTs5TB9B8fRGt
	4iCNzBsoKVXhcbeNPQy7myjXmhLoNskU5dJmtcp70hV6vfMkAaTeHeeckNAWKaayMYj7zvqE7CW4y
	BsQge7wKT0IVaitJOGj6P9UfMwWJoIt4RElRKcBHDPQknTtPcgWofLOtjE01kw8eHrnGCcNghLe2E
	qTGnPNMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qureP-006wc0-2b;
	Mon, 23 Oct 2023 09:55:09 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qure8-006wIq-27
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:54:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40859c466efso13243295e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054891; x=1698659691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PvbddIvQlG0l/ZDn5njSVhrq4RgzTBlbX25/MYIgFc=;
        b=ayhr7NKY8UA/kGthj+b/Aw8JpdbUaUcfXQRVrcQ8aGfCjn/mBEhkl4T5F1cKVDhA/Y
         HBbOqJU3/Spn6lY45ThZE3OrX1kjWh1EvN+NnFE6d6VX7JUVs32InLbsCmaYAKk2Iw85
         FJFeShV5y3CffnwgW3jTlGzcmEz2tduTU6+bcGu7e0XorzrbLWlXXlnKLNwqh9826Q6b
         oWtgb7958LAtwQS02xtR79atzXG04MyXaKj9jHE9lU+MS4Z/VaWHIrygGZhKDNG7iCOW
         o6RysZzYQqenHoDtzyQQEis7kHqA22iKNsZUdXkAj99VB+bCrO2iHMIdvDzEq4ddWND+
         IbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054891; x=1698659691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PvbddIvQlG0l/ZDn5njSVhrq4RgzTBlbX25/MYIgFc=;
        b=hcRl0PTayYt7LFm2tccmie4eThl/BKwYG/Pcz3uH8/wkCsO5QhAUO6TOede40LurkX
         PSCfdRBIb0BxIw5OaJLk1xkMe139UtEJNp/jo7QD6NyWdj+oTLPSyCtzdwOxOCpRyGLZ
         RgQcdu2/CuNvTr5Q2SgWM8cn1HALltTV+1+s921iM4ChlpDjHZTGV2pIKcAl4SMxgl6V
         5A3Z0WQX36ebYE8Z+Mx++O5B8ke+uu883tEtcfC2vTpJvaI76hjl48mqHGLFRn5/mG+q
         B1A3WsBWxFJCU8v3B8yvyIIuiOGOcmPUuth6wwlraT/yvZn2rBPhceKuQ7KhPCi4EhMo
         LC3Q==
X-Gm-Message-State: AOJu0YwNVvoynSISM3GED3ZQUrlkb9Px/dDr3urjTUYGUYwezPeDQ8Dn
	/3gGjChd6Tq9wX/Kl5pVB+tBrQ==
X-Google-Smtp-Source: AGHT+IEmmCcXMvV2AiWhQpKHX0IqP6/STlrOm+onc5uiN24/C1EAIXqoQxx+Ad9L+iK6N0Yq3GEInA==
X-Received: by 2002:a5d:5709:0:b0:32d:9fd1:91f9 with SMTP id a9-20020a5d5709000000b0032d9fd191f9mr5739165wrv.60.1698054890848;
        Mon, 23 Oct 2023 02:54:50 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:50 -0700 (PDT)
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
Subject: [RFT PATCH 08/17] ASoC: codecs: wcd9335: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:19 +0200
Message-Id: <20231023095428.166563-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025452_715334_5E870084 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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
 sound/soc/codecs/wcd9335.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index a05b553e6472..43c648efd0d9 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -3296,31 +3296,31 @@ static int wcd9335_codec_enable_interpolator(struct snd_soc_dapm_widget *w,
 	int val;
 	int offset_val = 0;
 
-	if (!(strcmp(w->name, "RX INT0 INTERP"))) {
+	if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT0 INTERP"))) {
 		reg = WCD9335_CDC_RX0_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX0_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT1 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT1 INTERP"))) {
 		reg = WCD9335_CDC_RX1_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX1_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT2 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT2 INTERP"))) {
 		reg = WCD9335_CDC_RX2_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX2_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT3 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT3 INTERP"))) {
 		reg = WCD9335_CDC_RX3_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX3_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT4 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT4 INTERP"))) {
 		reg = WCD9335_CDC_RX4_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX4_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT5 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT5 INTERP"))) {
 		reg = WCD9335_CDC_RX5_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX5_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT6 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT6 INTERP"))) {
 		reg = WCD9335_CDC_RX6_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX6_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT7 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT7 INTERP"))) {
 		reg = WCD9335_CDC_RX7_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX7_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT8 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT8 INTERP"))) {
 		reg = WCD9335_CDC_RX8_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX8_RX_VOL_CTL;
 	} else {
-- 
2.34.1


