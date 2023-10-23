Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213B7C004C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuBgkJ0BPVMUW15lL794m55ZCdp9DH+A+t98MliJqVQ=; b=xYRYN7Gb0ti4ANGnWS/Ygtguo5
	w6bFdwwqfigMBLheLSWrG4y2OpP2WIK2FbImZ2rTr9wDZn10uvUXuLSHMeTcf0hbZTnlWpZJd/+Xx
	Qi3fOnWWqtBW7pCtjyIPsrA6L0wlaE6RaVRd9yl6XLVWJ6FfkOkpVx5fb6f7NFjLe8469VbGOKau2
	p0jSl5O/N0GWWNUZCmJGmefnwsMryo6QK7nlrwSAq+KL7SxJF7FU0aKodlYPevLH95GiE0qKjPbjb
	v65nMMZG/rEVqb2Q/6Kd26thiSPZe4FsbUhi4uAyMf+NWHKf2FMJw6ib2aPvgdhJy7mZYk9hiwMBx
	1YNvoCkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qure6-006wIB-2j;
	Mon, 23 Oct 2023 09:54:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qurdz-006wC7-2t
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:54:45 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-407da05f05aso22556655e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054882; x=1698659682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuBgkJ0BPVMUW15lL794m55ZCdp9DH+A+t98MliJqVQ=;
        b=rAgArMzZIBs02/qey3c6XBtL6BH8LyXC7Gn3FVZKfQ+ImuDMZAq0Td63oTxRSWV22o
         A1umIYQAfvz9NqUHKUj4VACNkORy8IqUpgPDS++Dlxn7RVyow9myHKErqoAn5rdQnkxm
         +czFp5IhzT5floPul/dAk017ZBff9GFRCGPhZ+jKjDabD1zmGNqN5BdDtfkbOCzE3XR9
         0txaPNSJUE/7K2GXYXV9olzngy8MRkHhiEMyFTI9wWAbYzlRXjMtdceFUvzDZ5qPioTv
         och08vJveAA2c5H934wGFfiG+CFeuDIhWNHzFSMS/67nXnFg21qG3jyuni/81MupnrSV
         XK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054882; x=1698659682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuBgkJ0BPVMUW15lL794m55ZCdp9DH+A+t98MliJqVQ=;
        b=E2oajS3sRzX8HcaEDmPa/yHh9wuollbFzJ9/hvyijHWTXbHAHP82TplGFs6gElwEk+
         jDJkJXN7GkQmJx6qfzPNU7oXkwJJBdSCpcbHYIcp5xhc1KOFrdrJQ16SrFT6oWxPyUWb
         B5vUMHCVbKwlfJrFR9Cq6DC+iL8t+fKpQnsEAUqndKvh2BG1c9128cHLzQYW2i9ZzlTy
         ccAPtBDzMgYvD9HjIqmUCj6CEfF0M1GbCLC6t0OSA1bHNXi6HXRGixVIFLy3jzoePeDF
         CHiVUQL+xN92gpWnKWePu+as2eY3XuiLWdk4yEyugp/jzfLY2Oj5hyoZZ2V8mepyBqux
         dLFg==
X-Gm-Message-State: AOJu0YxJOLyhhQkoyRC1SzuBGGtyclpG52nwNECKpBayKEdzixZblReq
	Wk6bfGFk3yQNAxo1pOkGv+piKw==
X-Google-Smtp-Source: AGHT+IG3Sib29NO6K06c5CyIqf4YSqLzbtzzhUEleL/6uhtgyT7dZmxfyYTlGNAw3kPpeYYlW/TKCQ==
X-Received: by 2002:a05:6000:152:b0:31f:8999:c409 with SMTP id r18-20020a056000015200b0031f8999c409mr6421464wrx.66.1698054882090;
        Mon, 23 Oct 2023 02:54:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:41 -0700 (PDT)
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
Subject: [PATCH 04/17] ASoC: codecs: lpass-rx-macro: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:15 +0200
Message-Id: <20231023095428.166563-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025443_938416_4A43FFC8 
X-CRM114-Status: GOOD (  10.68  )
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
 sound/soc/codecs/lpass-rx-macro.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 29197d34ec09..f35187d69cac 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -2906,14 +2906,14 @@ static int rx_macro_enable_echo(struct snd_soc_dapm_widget *w,
 
 	val = snd_soc_component_read(component,
 			CDC_RX_INP_MUX_RX_MIX_CFG4);
-	if (!(strcmp(w->name, "RX MIX TX0 MUX")))
+	if (!(snd_soc_dapm_widget_name_cmp(w, "RX MIX TX0 MUX")))
 		ec_tx = ((val & 0xf0) >> 0x4) - 1;
-	else if (!(strcmp(w->name, "RX MIX TX1 MUX")))
+	else if (!(snd_soc_dapm_widget_name_cmp(w, "RX MIX TX1 MUX")))
 		ec_tx = (val & 0x0f) - 1;
 
 	val = snd_soc_component_read(component,
 			CDC_RX_INP_MUX_RX_MIX_CFG5);
-	if (!(strcmp(w->name, "RX MIX TX2 MUX")))
+	if (!(snd_soc_dapm_widget_name_cmp(w, "RX MIX TX2 MUX")))
 		ec_tx = (val & 0x0f) - 1;
 
 	if (ec_tx < 0 || (ec_tx >= RX_MACRO_EC_MUX_MAX)) {
-- 
2.34.1


