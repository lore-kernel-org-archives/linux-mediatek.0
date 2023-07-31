Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC67FC001DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 09:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMM3/oOp03VQdiM5UtFP36bUtHvT73/cLwCpo+QdiIw=; b=thhqk0tfgxkWX3fySHAmIymeqH
	s4RBSaUirbXMvuoD9JXCHcFOwpwp1Lwh+QrLX89QxMkDVxvBlPV4BnMpWJUx8IzM4LH0JAfewgZvA
	gW5IjkKAUHXowguM1GLM1V8qFuTravSfXGiJH65MI0or3/fYkxbl9PZTcS/ol1MgfBjIIy2BqFvCW
	ofl8z16wpEIewf2L5ka6ts2NrJE6tx/5FF8TfIBudnc5VubyqB7BqOX9Rbu5lwROQFU6Ors48FWe/
	T5RLSOWYjIrFD+jkoGVzSAi/3x7k+ZRQ1psYsKz25ZCgYn7gX6KyEFB3CL1FIaGOq7+2mKGGa/fq6
	Wm6668Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPSO-00EoNr-2M;
	Mon, 31 Jul 2023 09:44:52 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPRK-00Enqg-01
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Jul 2023 09:43:47 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fe0d5f719dso7031998e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Jul 2023 02:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796622; x=1691401422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMM3/oOp03VQdiM5UtFP36bUtHvT73/cLwCpo+QdiIw=;
        b=p3V1KScmdLPmgJC69GcijUepICL5AVIM3EAETvRj+mTvl8smXeR7y+qE5llrGg1RBc
         mtCFxnbJt3diMjUWIgc/V85kdWzKsoCJU27yfBoQsImZvU0egnXL9lWKmOlI5YKzjUtW
         nfAwpgyk/SK6HEu+TBByd3i2lZDDBKYF1hDU/u/0nZYo5csjYCe+d9Wn3UvuunBi+GAQ
         aIRDBhMF6xnlo7gg5JTsuJtWglDKN/l9ppYfnwGgtyn5P0MR1WANzCPEbFSxY1bQjyVp
         KHd07Et7akegVLox7KMF1SsjBVlB78QSjiikAX4pc+rrOlH5LQdfQs5YXRumr1gfRBBz
         D92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796622; x=1691401422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMM3/oOp03VQdiM5UtFP36bUtHvT73/cLwCpo+QdiIw=;
        b=XiUYjUrNxi/XwgN9RWD3/a3RD+1cmqGv9RdkTM/0Pu+lNBESKJrMpa1++ucxwIvIO5
         Ipmy3Bkf9jQCTKIjLZSCchanl0KdsEA7U1ZWAh4kOSPXO1VVdoIL80vSJ/B8dC1Zecj0
         H3LCMjGy7CnaGvD5KDxToEl6AEq1O6TST8D9gSjAzf7kj46so0q9BECMjoSZnMXMaQkS
         85qwEXEUTp6AQWVbIcOzBGzuMUWHNRTePUAzuUCDSIS+gl7B2IniGLreF8r2Y7IavSND
         nbh1QZ4xz2vmfceXrLGxRRcIFOz96r6UhoOIXjUUKSeh6OuMTQfrg0+NquW2W/Q42wnd
         XoGA==
X-Gm-Message-State: ABy/qLax5mrrrZxEcSU9sghKC/pAUQ1lD6/3ZBKKgD4QLe/wh303c5DJ
	rh0SNJ53eupM4z/jjXJiqzfEJQ==
X-Google-Smtp-Source: APBJJlEp0ZNK+HWD6CIv96Mutem+tcF9lSytD8+rqw83Zg83lTGZaiCv/X0Q6YA+P3HWOwl2ZbY4yg==
X-Received: by 2002:a05:6512:459:b0:4f8:75cf:fdd7 with SMTP id y25-20020a056512045900b004f875cffdd7mr5655698lfk.22.1690796622165;
        Mon, 31 Jul 2023 02:43:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:41 -0700 (PDT)
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
Subject: [PATCH 11/12] ASoC: samsung: odroid: parse audio-routing
Date: Mon, 31 Jul 2023 11:43:02 +0200
Message-Id: <20230731094303.185067-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_024346_053676_CADBB171 
X-CRM114-Status: GOOD (  14.22  )
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
 sound/soc/samsung/odroid.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 1743bd55ba1a..c93cb5a86426 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -230,12 +230,13 @@ static int odroid_audio_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	if (of_property_present(dev->of_node, "samsung,audio-routing")) {
-		ret = snd_soc_of_parse_audio_routing(card,
-						"samsung,audio-routing");
-		if (ret < 0)
-			return ret;
-	}
+	ret = 0;
+	if (of_property_present(dev->of_node, "audio-routing"))
+		ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
+	else if (of_property_present(dev->of_node, "samsung,audio-routing"))
+		ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
+	if (ret < 0)
+		return ret;
 
 	card->dai_link = odroid_card_dais;
 	card->num_links = ARRAY_SIZE(odroid_card_dais);
-- 
2.34.1


