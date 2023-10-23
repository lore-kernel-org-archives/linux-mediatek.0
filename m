Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0431C25B41
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mg1xiJ4tpWrc01TGrYLaIzComQYv1hvzEAR610Ntv3U=; b=dcCDFL3FIO8brQq82wIbc8eW/P
	ZC/zB1gHDT28hUKZ1s2ijnrwhmVs1aTJ1UiU9eh3nTx5AozCx0FVRcznqWdQWSY9wYwHjLQ64/Tf4
	UWVgshi+daRHIXIMs78dDwS9aIwoEzbbHwITldeH+9V71VErrtIi0MC9Ow1YT6g62RcCxgtI1cX+M
	/eyK80CfMjCDelXJ/Odc8BljN/bRDc7WQsl+VRObXlYqi/VA9NAlWxOC+iOSHc6i+yBt0UqlyB3xN
	7SQJZmGXcfEgLXZzV/w4cwQ+aRU3nETvmBwE0UEsdtI37xmTIC6z9//s2iUYbGGqyBcUEBkg3sr1w
	z0tJs1WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qureF-006wRA-1C;
	Mon, 23 Oct 2023 09:54:59 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qure4-006wET-2g
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:54:50 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50797cf5b69so4201997e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054886; x=1698659686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mg1xiJ4tpWrc01TGrYLaIzComQYv1hvzEAR610Ntv3U=;
        b=b2/+XrPn2ZOeEtaJbxQ/A9nd2NX3kN61R+tujC3pb1IkZkQqr17a0rbRzV6fymVB6A
         TznNZDDlkTUyhJe1yAU4gfVNMJlayU3A5dNFxLxzihiJQdFiwk0141LZJCKcvXgeRC6B
         wsp1j0NkL219SlGtaPxuJNW+eu5H3PIKSi2ig3kt8yxi/XOFxwEa8B8e4a9y/Z6uvrYU
         VRZnbkDNNmKK5e8V3AWxHWbxAue6R+m2XcKDF2tezwu3KYKzrPPutHEltmdb9grIV3DW
         gtXjg9xmPL9zWrbeO6jP2PlmMF/7KsURPW0sLuaBDCdV5eyKbm6VpJrCMfbTIlV3R836
         XmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054886; x=1698659686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mg1xiJ4tpWrc01TGrYLaIzComQYv1hvzEAR610Ntv3U=;
        b=LADlmD/H2cH1PZjEwcUpiY9MrmRXH4RBUCcW0EshWvqh1qKomah5HXnAg1Dq7Mnyd4
         kMI6W4pmzz0vyhBEuW4kmJIMtnrVwlFTTTIbqNKaf9wCZdERKNoR8kVxpZ21azW+VFc3
         qymshLY6jlxG2M/DJZil526xWjFLn7YiuseqMN3ZA/pKFyrVRBlHfDRxdrJ61mfE2Jsp
         6QWSAIuN9vGJJMw3W/t7ODV8Nh/pNu+OrkpL2uimktivEE35fc/xpPM/BMdC6KGk94Hk
         Z3RcirSxmn2m9B0ff1JK87n45JLMVcsrhW7v6H71lV6fvulEeWprDFk7sLayjh4/ocMQ
         PpNg==
X-Gm-Message-State: AOJu0YyK9dJ/+Rv3XodKdjzFYlioX5W7NcX7qaBe5o09Dyg6M3HP4ofV
	bXS8riY+UHajRFnHv/UMmAltig==
X-Google-Smtp-Source: AGHT+IGVnDVUzhqtZG2Rxtx8SwcXnzeMCoNHkuKGJvqRY3jD0nxvOcWU8+AB175lzXv5OfVrm4BxmA==
X-Received: by 2002:ac2:4430:0:b0:500:b7ed:105a with SMTP id w16-20020ac24430000000b00500b7ed105amr6312430lfl.29.1698054886439;
        Mon, 23 Oct 2023 02:54:46 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:46 -0700 (PDT)
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
Subject: [RFT PATCH 06/17] ASoC: codecs: rt5682s: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:17 +0200
Message-Id: <20231023095428.166563-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025448_870319_E23731C8 
X-CRM114-Status: GOOD (  11.43  )
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
 sound/soc/codecs/rt5682s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 68ac5ea50396..c261c33c4be7 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -1323,9 +1323,9 @@ static int set_i2s_event(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_ON(event))
 		on = 1;
 
-	if (!strcmp(w->name, "I2S1") && !rt5682s->wclk_enabled)
+	if (!snd_soc_dapm_widget_name_cmp(w, "I2S1") && !rt5682s->wclk_enabled)
 		rt5682s_set_i2s(rt5682s, RT5682S_AIF1, on);
-	else if (!strcmp(w->name, "I2S2"))
+	else if (!snd_soc_dapm_widget_name_cmp(w, "I2S2"))
 		rt5682s_set_i2s(rt5682s, RT5682S_AIF2, on);
 
 	return 0;
-- 
2.34.1


