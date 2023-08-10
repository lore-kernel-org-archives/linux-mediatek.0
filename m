Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D738C04E69
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 06:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vbXpmjMjw+lKtOoDoBL66la8kJXNdX97D3faoVkRss=; b=zM9e6VliXvMtjaDLpD7VXGWecb
	JqsO6JNC8g4ZxBx33FMFSB7zDJzBmQe3OuqPC6ao/lHBkbxaNhB4t9IajFfcHbD7I7iMinqsT9NJd
	eIgZvMV2RCPwtkzJ/Jk4d+GY5gNAdP4wNmluLFW7tRw/wtTHSbzU/X+D1t4grkhKkwkeSEBtWywjX
	8N+rbhmYEL7FnVElTKsOffjwukVButFvJHJcYdPVRwOZEAP2j1xkvGwsQgPwq4/UR/VTe1RBY/Hd8
	kd30e00mbUz8M8ZLbzJ/5hVSgL2BwL3N94Bns9SZoDaCh0wVRnCZbKAYJ4oXDpuaP+1h0tvq/O83t
	YfFRZckw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEf-006fc1-12;
	Thu, 10 Aug 2023 06:33:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEX-006fUu-1s
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 06:33:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fbea14700bso4689015e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 23:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691649200; x=1692254000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vbXpmjMjw+lKtOoDoBL66la8kJXNdX97D3faoVkRss=;
        b=qRwFGkjs7FH05bLZCJETWbxdoViNxeC39FXgvqqlKU61gi57Ql7yy45M1F9AB8/Vnf
         m4mxqNHy7YspE8rZapqbpkWRGZNRknmR0Yw7mWVyCBYFhav+VPIm769MnpWWKLDWK6vD
         vC9kR5dcS6XYThPTkqfm7G3IaFxYAITemSv9pNs25yTxEymWJ1iCR4S+CpNCl/bM8AyP
         mrkj897BIXv6i7FCzrK0Wv2NRScb1bjBumNlC2vJIZeqIGZU5Uqzi7GP1fP1aQdTNOBW
         HBwf/zF4nwCb5TmpvViNmeug8wNpHdz1zKVQBEZuO6N2j7ktVNinkhjQ1eADaGOvVh0w
         T7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649200; x=1692254000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vbXpmjMjw+lKtOoDoBL66la8kJXNdX97D3faoVkRss=;
        b=cM0JPWfgfsXEgqoBaf0Oe1+NRcJvZpOHhNUOmLfio021KGWkoNf4qm38LFV0oPKmww
         Q28qRI7vfKVrVD8qSO/5m4lL5s511i/dBH6mOHPlRABnc1CNCULk5rODtZPsgEpCelEN
         VOgH6nJv/cEvSH5AsuGNEljoNV8EZk4FkZAZLzFrSIZ+y40kNDhgNvY6U06Yu+N2gHMy
         CbztuYHdk2HJ3Ev9ci+DqhUyw31gV9WgaknYZjAJ+2zAZYPimnen2mfY6wyZM5tOGM4e
         5HsQLbc58mP4l/Y68gxCjFx4fe9ybZ4kCD8vfB/jW3P8AJlxd8qmOt3emakMf1GJn9wH
         a+mA==
X-Gm-Message-State: AOJu0YwUNF2rI8KvdUWFfHfI7tair5tKu5TsQ9GRfhHk70c/Iu6CBN7i
	lnik+b1ZWoI3bM8PsGtgFTzXXw==
X-Google-Smtp-Source: AGHT+IFDBMmqGDMuwzh1dxYq3965kvpNZ6gEY/ZZqIfT2y0gnQEekNtyV10m0SOedP3uEd/zcYBgQw==
X-Received: by 2002:a7b:c398:0:b0:3fe:1820:2434 with SMTP id s24-20020a7bc398000000b003fe18202434mr1112564wmj.1.1691649200441;
        Wed, 09 Aug 2023 23:33:20 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003fe2b6d64c8sm4020018wmc.21.2023.08.09.23.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:33:20 -0700 (PDT)
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
Subject: [PATCH v2 08/11] ASoC: samsung: aries_wm8994: parse audio-routing
Date: Thu, 10 Aug 2023 08:32:56 +0200
Message-Id: <20230810063300.20151-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_233321_640065_90F1860E 
X-CRM114-Status: GOOD (  13.13  )
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


