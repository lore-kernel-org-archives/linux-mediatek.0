Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0381C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G81EZhNEBfjywIhuDWJjtpTXYP61176MP839Y8OZoG8=; b=mcIzadJjXukxI62d9MoU4E87ko
	fVjHWL/0r+l2IS/D01Svdfr4RBX0U+lYEdt4x5xvmIApU0ue3CSRzGl68f35KGdElc9oySkHWbUWP
	8/jkZa5aapxcYcEvBVcpUmD4OcfPJ6S03bBRZf/2KdCJg7QZoiJN69um6jUr/WARI/gI2BDXfDfSD
	Uq52n+fDQwZZrwJZs+JST6tX5UK1IbPbAUaKSbn3qf9qwqLkUEDEjlo+anC1+//3lofnecoMkkzZ2
	v0bed6ETswxHl40NKjwqscmHPy2A/Rs0SY3JAFCxRPdml1RR0+v3vDmmkPm0SlIyZEBeWOhdcuhpB
	rp6r9sXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qurfn-006xhm-0C;
	Mon, 23 Oct 2023 09:56:35 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qureS-006weH-2Q
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:55:14 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32da4ffd7e5so1725553f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054911; x=1698659711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G81EZhNEBfjywIhuDWJjtpTXYP61176MP839Y8OZoG8=;
        b=J7T6p0od4pEeDOcbxJoXJcDzJGB+Z0x9xJ+2WwIuOphndrldZFzaEhzEEbtPEk3/ko
         BNB+OJLPa8cGtXFvsFzygFgCHyEnmlxTqNPFldduZhhVSm9i8hncu18458ZSfyZJEqxE
         bdILQ/PMKbkeDM74qVwvajf48J0ckCNJ+xB22q3XZ+kaFvGtqpLPG7qzosJ6USkuhZo3
         0XuiDbD45lLu6dGglv6Ae/p8ZUA0a5ar4PVyijChIydfUQWMPmJbhJ0CHQWl/3urvWL6
         spliZ63U5C1vuqUN1bShQJGVp/fHE5nqvOuqwPmJaRlqFVhRp7Nvj4bv4HAjLd2x0tV5
         P35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054911; x=1698659711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G81EZhNEBfjywIhuDWJjtpTXYP61176MP839Y8OZoG8=;
        b=Vqwhx/cZKnqDmXt902V2dl9QAfzAMeBo9FWMugPMc/ehmOJPFNfsJ8KRN/+BcX8ug9
         NtSQZgSVlrpxoqnkzG0MDS7kzpMvomoaWusYuFxbGv4JTueaSNtIanX2AKgoWN7OEPE3
         Y7Ob5fy9VqTbjcbQvKQBVmmB+XdVjpRuB6SVlMky3sksYXfG5V7DtTN2bmAoxN4SJAr1
         MvrIfuhndHXqV3x26yrnQ7tP+eZlzVxl/4GORhbrMjiktM/OZpYn+9IwsCpzlDBxnCKD
         ZIbjxJRZfdNKoFDVHsSRvLZfGB3AKeULnjRA4esfkPqgzFXgImguljjU3vYi6kOAahPq
         g+2g==
X-Gm-Message-State: AOJu0Yx2r6o7+pevt8qPn75Q0IcEIeCKADd9F2TwbU3D8Ug/mRq1CUAX
	kFt3BvfXkSoIaPypIDAuO3VdXQ==
X-Google-Smtp-Source: AGHT+IF2iXpBOUlnIxhQVTQ1O4HJJuZY9k94V739kocrPuR1iW5RroQxWCPWTyJ4Y36tYCQLJLsx0Q==
X-Received: by 2002:adf:a499:0:b0:32d:a3f7:f0dd with SMTP id g25-20020adfa499000000b0032da3f7f0ddmr10781049wrb.25.1698054911534;
        Mon, 23 Oct 2023 02:55:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:55:11 -0700 (PDT)
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
Subject: [RFT PATCH 17/17] ASoC: tegra: machine: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:28 +0200
Message-Id: <20231023095428.166563-18-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025512_802604_E52DD3E7 
X-CRM114-Status: UNSURE (   9.71  )
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
 sound/soc/tegra/tegra_asoc_machine.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 3caadee9584f..192e9692bdf2 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -81,19 +81,23 @@ static int tegra_machine_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_dapm_context *dapm = w->dapm;
 	struct tegra_machine *machine = snd_soc_card_get_drvdata(dapm->card);
 
-	if (!strcmp(w->name, "Int Spk") || !strcmp(w->name, "Speakers"))
+	if (!snd_soc_dapm_widget_name_cmp(w, "Int Spk") ||
+	    !snd_soc_dapm_widget_name_cmp(w, "Speakers"))
 		gpiod_set_value_cansleep(machine->gpiod_spkr_en,
 					 SND_SOC_DAPM_EVENT_ON(event));
 
-	if (!strcmp(w->name, "Mic Jack") || !strcmp(w->name, "Headset Mic"))
+	if (!snd_soc_dapm_widget_name_cmp(w, "Mic Jack") ||
+	    !snd_soc_dapm_widget_name_cmp(w, "Headset Mic"))
 		gpiod_set_value_cansleep(machine->gpiod_ext_mic_en,
 					 SND_SOC_DAPM_EVENT_ON(event));
 
-	if (!strcmp(w->name, "Int Mic") || !strcmp(w->name, "Internal Mic 2"))
+	if (!snd_soc_dapm_widget_name_cmp(w, "Int Mic") ||
+	    !snd_soc_dapm_widget_name_cmp(w, "Internal Mic 2"))
 		gpiod_set_value_cansleep(machine->gpiod_int_mic_en,
 					 SND_SOC_DAPM_EVENT_ON(event));
 
-	if (!strcmp(w->name, "Headphone") || !strcmp(w->name, "Headphone Jack"))
+	if (!snd_soc_dapm_widget_name_cmp(w, "Headphone") ||
+	    !snd_soc_dapm_widget_name_cmp(w, "Headphone Jack"))
 		gpiod_set_value_cansleep(machine->gpiod_hp_mute,
 					 !SND_SOC_DAPM_EVENT_ON(event));
 
-- 
2.34.1


