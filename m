Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C73CDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohG7h5MVOd61zy+5ypL65RpxKjVv+oL8L5RUWwJJdI0=; b=we5Xs+0N8T4lAU1+gJAVqwxg0K
	cWOrlt72FsLAnT1k1yRJlYloVFfmjKETCME01wR02CVQKZo1m6NFEeuCo8OsgL2UqH7PUPH8zfaAi
	NOgMxT1pr6TtMMwA+pBt1uMqyzqRg2ErbwcQze1druw0Dawcm46a0SVxdPvtH1RlcWwCLrNu7wFLt
	7r4T4+LVYzXf3ax3jt5cUgSS7CI5Eqcniw/Ap2Z3hUvZf4gwPt7upuaZOcD35X1khLYDXemyowFp0
	0WyHZiFf32nFmA3p/YlTtxr1IB3CVhqm0plAYDsaWgcsO1MbmNUuPS2p5dGEcrs++vFekFJrTy4t0
	o+5fKp+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qureN-006wZf-2v;
	Mon, 23 Oct 2023 09:55:07 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qure6-006wGb-1n
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:54:52 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31f71b25a99so2082999f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054888; x=1698659688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohG7h5MVOd61zy+5ypL65RpxKjVv+oL8L5RUWwJJdI0=;
        b=pZ6dVjrLD0/0b+J1jWetRrBLFtsr3r/6cBxI/ExsmzTsEHRLPVY5hgeVPH84qFYTho
         S2GcY5x7DshQI17Hat/0XOnKu8BtmZtD36nF9VOapaaXeSxhpe7YsoNRCt47ZZzz67Vo
         OwIiifIfZaEzMPUIWzlOSv1wHhGNT/F2cJIvnoJwBPUcK9Zl3sHlSB2LMZpIzrGAVrZ+
         1HIfZc9CoeUtA56iMuAw0lx2LZnSlyCelhDRiIkPgrU+O/zlg2KGpyMdWHWKB1p86S1p
         4WfZIhcSQGqvbGYpFnAY7GuYe+HVKvZTqI3CWpbmeZzyRBGNX8/fCwpzGKZS/xsGmSaY
         9ijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054888; x=1698659688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohG7h5MVOd61zy+5ypL65RpxKjVv+oL8L5RUWwJJdI0=;
        b=CwWhI2EW7NURD6W025cxXw6ip+9L5GkcnIfJ+yARoQMzESbJK0cMYKb4L2UyDv2+OP
         Lxg2EgE/hRYs/iA9LhfSHx8Zyd25FjoaHeVYpi4E31dFbIqWTE/9HrGN1VaX0ycHa4zt
         N2kMbwqw0xQ2AIH929VYIH0nz4vywJ364Hcf1gDim24MiYLPl6GF7N3K05a+I+MgiA43
         xHggQkBCFsajgAOqci4HVEy78Ixq0CNuqkLR/LZoy3cjf0Nnr8YvsG4Rvp652Gf5dn6V
         pBp3MBF3TC8zKbQOIJCWdpPwBRL9/ktQWWYqYXef4uXSoPpjB8PmeVvJGXkhpSdWk3HH
         NwHQ==
X-Gm-Message-State: AOJu0Yy6qvmHrg3UnanmOjOrF7MSW0nt2AvD6goETXB2YGweS8kr7WYo
	hltBq4UwiZ0rjaptIevzLRM8yA==
X-Google-Smtp-Source: AGHT+IF2XQ2NytyZKfSuKXcxhn8MgqaftjUTA3vcBEY0OG7GzuniO27qe9jeb7abDdumrFZMKzYUnQ==
X-Received: by 2002:adf:fd90:0:b0:32d:8a32:3b2f with SMTP id d16-20020adffd90000000b0032d8a323b2fmr5871452wrr.16.1698054888606;
        Mon, 23 Oct 2023 02:54:48 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:48 -0700 (PDT)
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
Subject: [RFT PATCH 07/17] ASoC: codecs: rtq9128: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:18 +0200
Message-Id: <20231023095428.166563-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025450_616124_69C14173 
X-CRM114-Status: GOOD (  10.70  )
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
 sound/soc/codecs/rtq9128.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
index 371d622c6214..c22b047115cc 100644
--- a/sound/soc/codecs/rtq9128.c
+++ b/sound/soc/codecs/rtq9128.c
@@ -291,11 +291,11 @@ static int rtq9128_dac_power_event(struct snd_soc_dapm_widget *w, struct snd_kco
 
 	dev_dbg(comp->dev, "%s: %s event %d\n", __func__, w->name, event);
 
-	if (strcmp(w->name, "DAC1") == 0)
+	if (snd_soc_dapm_widget_name_cmp(w, "DAC1") == 0)
 		shift = 6;
-	else if (strcmp(w->name, "DAC2") == 0)
+	else if (snd_soc_dapm_widget_name_cmp(w, "DAC2") == 0)
 		shift = 4;
-	else if (strcmp(w->name, "DAC3") == 0)
+	else if (snd_soc_dapm_widget_name_cmp(w, "DAC3") == 0)
 		shift = 2;
 	else
 		shift = 0;
-- 
2.34.1


