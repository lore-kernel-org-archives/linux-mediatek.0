Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40866C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 09:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vbXpmjMjw+lKtOoDoBL66la8kJXNdX97D3faoVkRss=; b=sY5VnETMLe6BYfy8WbMHv4kHVq
	8ktg2VjrGcpSxWz5N7LvRBN/t1K+PFrd8GlFGGDiCRT3qndZN8/xD8xq9hMH5QIct5Bv52lAxwt3c
	jpSoY+UzjO8CwasKVeC7PjJ4lcq1HJ+URa2jZSo2An6HugdXYwZ/wRizrbHFgO9/4nYXohxfsN097
	2a0VA4u0ixri7fMfYX4pFr8tGH/cWFtVTgyc2+Dlg3l5/SH4GyP72ALJJoJO2murml0u75i+Xdkbo
	CYV+wCtblMSRN08VJ4cLWagsb24tx0XOMSOOx7VxlHQruFTkNEqGeayMr03yqlEAH6mtOfcrVsdcB
	BUlmZPxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPS2-00EoFI-0o;
	Mon, 31 Jul 2023 09:44:30 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPRD-00EnnC-2I
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Jul 2023 09:43:41 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5221b90f763so6328552a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Jul 2023 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796616; x=1691401416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vbXpmjMjw+lKtOoDoBL66la8kJXNdX97D3faoVkRss=;
        b=h0U8orN3P8YFW+0Ac69J0BgBO4B5tO/PrgUCdrR26HbMX7htpegZrJu+ZNW2PA6CQ3
         OqweKqo09CAaM3sAN1p3n+aIIDDOjktrgs3LE2WhF29mggUMc17XPGZ7U5aNN/O8glwo
         ZMOPQKFLs5rfQ1lTijtCibzI/9SwgQvdH7jz3Hwdcr9dv1DhuwhEAAuSJqLyFrfOnTdK
         0w90tdeYVvtHbJ16IGl8k1HRk+thSstWj24w0hG5AL/PFBPI5Cvay2JjO6HxW9Q7Gqs4
         K4+DO5Wz9tHY5sdFrJWPVNX/dMrUbFMZocazfiGWyUv5dis5MD9MCcPV08OPXyC3X+01
         /M5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796616; x=1691401416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vbXpmjMjw+lKtOoDoBL66la8kJXNdX97D3faoVkRss=;
        b=ICuY4uWwYSolqJB3ZzordeNh3KK1iL9e7h2elZKJmEFTeHx34dJQ61CofaFL+7W7U/
         7EtwV0ZT7FBTPkfboRrd07VgDo04zqhy2SOKAJPsocPhDAZ67LHYwoZ3NBN4MdG3lpiS
         9MqTeWhyejbATxeUYyxh2D0XbJMSalgwHqdwIdhMjzssGHXbvkcZAg6ndkbAaUiXyxTR
         wMVRjZI77I1BGJYKjG4rbspL1bAxIniaisqijxLlLUVj4mrIgM7qv40K2R/bDTnxUfRW
         LvI3Pfxp/N7XxrLMO8iY7BYmwOc/b29nMVf8vO1v4MAK9x2mpUmWSufLZCbUVMi01WC6
         20sQ==
X-Gm-Message-State: ABy/qLZRbACf7u8P9Vigh4yccQRmXFYm+eYMGDOdj9BaZc5BdUFGV/82
	RM65yvixKZqFWlMiqi1/GaiwWg==
X-Google-Smtp-Source: APBJJlH95qguXBDd28tv5zYfROsmG2YCNzdEPQjZ/n9M5l2bQqmUAM/BlIg2lNBRwJKlhNLMIYYX6w==
X-Received: by 2002:a17:906:77d0:b0:99b:ef9c:e634 with SMTP id m16-20020a17090677d000b0099bef9ce634mr6065950ejn.65.1690796616598;
        Mon, 31 Jul 2023 02:43:36 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Rao Mandadapu <srivasam@codeaurora.org>,
	Judy Hsiao <judyhsiao@chromium.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jonathan Bakker <xc-racer2@live.ca>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 09/12] ASoC: samsung: aries_wm8994: parse audio-routing
Date: Mon, 31 Jul 2023 11:43:00 +0200
Message-Id: <20230731094303.185067-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_024339_747269_126FBB44 
X-CRM114-Status: GOOD (  13.20  )
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

Parse generic sound card "audio-routing" property and fallback to
"samsung,audio-routing" if it is missing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/samsung/aries_wm8994.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index 7492bb41456c..dd3cd2c9644a 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -620,10 +620,14 @@ static int aries_audio_probe(struct platform_device *pdev)
 	/* Update card-name if provided through DT, else use default name */
 	snd_soc_of_parse_card_name(card, "model");
 
-	ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
+	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
 	if (ret < 0) {
-		dev_err(dev, "Audio routing invalid/unspecified\n");
-		return ret;
+		/* Backwards compatible way */
+		ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
+		if (ret < 0) {
+			dev_err(dev, "Audio routing invalid/unspecified\n");
+			return ret;
+		}
 	}
 
 	aries_dai[1].dai_fmt = priv->variant->modem_dai_fmt;
-- 
2.34.1


