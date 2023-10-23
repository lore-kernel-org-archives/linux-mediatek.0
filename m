Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D8DC001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOdWx51KZzcP4yPFkM05Libt2LPoTXL1hZ7dHc5xIDc=; b=a0ToFwlD/73MFQKjfu0kM6r4kx
	unxAp1dHr0EJHKZo6VMxhbuBF6I97mbrMttpa2U6cof42H0U41GtJ2eaFa3wnfdMoD/z/0/cv3wvQ
	jsK+Fgc1JRfHFvD7mrC1UvbgV9lM+7Saqx+9TfNp2+VNBaAvCE/FuAoow2LYnpgJoM+lpyaoE6A7W
	F3KtdxVYziwk/1UpFslt+WkzYBjf0be3kqJOUg0UZOybpx4jmUiooPQUz5ucd9tQuHyjTf1fL9KxC
	obp6lqg0q355WHkGD3VY7bk/ZEnKG4dLmO9SINVxE97OYIvjfHqXPoVrqFLOa7H/7KKdyZlJ/a6AA
	v8FwACTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qurf0-006x6M-1E;
	Mon, 23 Oct 2023 09:55:46 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qureG-006wQg-1G
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:55:02 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-408382da7f0so25697485e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054898; x=1698659698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOdWx51KZzcP4yPFkM05Libt2LPoTXL1hZ7dHc5xIDc=;
        b=a0DMLFd7orUMMJfF6wYGNSBSZgJ9GszAEY8OFr4uaJJtYpilJpIL0oL3qQqmab8WOY
         IhxpUB/LJAFtBcc34dQjPLwfqrW6LHuUr68JR5Nj17QKkS/W3EJVRjdjMfSFo2TVIBHl
         BcYcCupnUjzTZnVCgMTRPnMsA/fL6DFgPAggP+8G/CotmjL89B8ye42zoyMA7k0FHrOb
         jN4ODSgugxPDCqMCrc6gmz4lqoR2rgGRaPPNu02XTaGoXOzIHjohL2aolL2G192pww/l
         Az1HlvBeghGW11cKcWfSUR5XQuEkBzlrYlTH9UdL1bYXUEb+exjBZkZAQY4N3kLam1eP
         bb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054898; x=1698659698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOdWx51KZzcP4yPFkM05Libt2LPoTXL1hZ7dHc5xIDc=;
        b=DeJbG9hGtI/GXOIwUMaQ5k64lOSLBQ/vWtjsPl0AbmcycjhqaRcE8tkd7e+jzAeVax
         bSAJ56GAb2LwXN29I7SJDeBPZfgSVgLBOFVnTBbTygzur3nzFMBkneK3V2kN2xIHf24i
         8wweehgWr/EZb0VcJ1yQnPLzXXDtH5Ih0HOJDjvudUOeg6o8D3kkK0BIzygK5SIOB38U
         qa9kEPTGANIQpGv7Hsg6s04xRDBJbMPyWM9aPYb8somWLT34I02XyYs4OY0ekqrrXvVU
         Hf0TBlHNd3/y2YV3E2/Loug0eQ0GTIMQnHax1MwcbkJ2GHnAG7Yp5UZk0/rxZKxif6gu
         4AGQ==
X-Gm-Message-State: AOJu0YzPfgj+7mEuxnppS+L4eG+AYRQQlJkPmZ1VQ5rRx5B8kxMLU0GT
	fyf0Hu3Gk9irK4HeXhjBHyXyYA==
X-Google-Smtp-Source: AGHT+IHEVLDPnEUrrX/PY+GOmXCghoQi2Q5x3tEYdDkzUdmjkSVDumB20aWrVD4RN64ThYu9YeLKpg==
X-Received: by 2002:a5d:6941:0:b0:32d:a022:855a with SMTP id r1-20020a5d6941000000b0032da022855amr5924003wrw.20.1698054898321;
        Mon, 23 Oct 2023 02:54:58 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:57 -0700 (PDT)
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
Subject: [RFT PATCH 11/17] ASoC: codecs: wm8995: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:22 +0200
Message-Id: <20231023095428.166563-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025500_474285_050DF869 
X-CRM114-Status: GOOD (  10.62  )
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
 sound/soc/codecs/wm8995.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8995.c b/sound/soc/codecs/wm8995.c
index 4ffa1896faab..59ef2ef8ce00 100644
--- a/sound/soc/codecs/wm8995.c
+++ b/sound/soc/codecs/wm8995.c
@@ -541,7 +541,7 @@ static int check_clk_sys(struct snd_soc_dapm_widget *source,
 		clk = "AIF2CLK";
 	else
 		clk = "AIF1CLK";
-	return !strcmp(source->name, clk);
+	return !snd_soc_dapm_widget_name_cmp(source, clk);
 }
 
 static int wm8995_put_class_w(struct snd_kcontrol *kcontrol,
-- 
2.34.1


