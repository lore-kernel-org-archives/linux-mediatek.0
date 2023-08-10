Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F4FC001DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 06:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNOB2kSBm/ZCjLUQLsGBk0BsOPSn2yUKgs+5rBFTqgc=; b=NUYhGzaAhdBtypHENQMjNRiv0G
	UwS3UV4uztO2A/CkyhshQrWvcDq1mZ+LQ5Kb0FnCgTAXuYIq/ujqlPWJGObGPfd0yZW4WLKO4ydZP
	ImWbNryPtfaxKAO5Giaqs5fOieRCAoWRtniIHAO3ffuZIEiBliPJ4jAsivytDLOfQ2//YtfvhowXO
	U3s30ghgSwvvGfTQkqqlPPsgT8WkLR2OqLJzNrEvJhlAuF90NuH3iAfL/My4A62K2MWfxsUALKB17
	3RxClzSOJBRz11mJGKk0L4VoqQwPoQOBUrjiL+kATrtLG5JYbqgSI1l3ReAYpy5xN8KZX1QpPYFVE
	rEEj+l6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEn-006fjF-2N;
	Thu, 10 Aug 2023 06:33:37 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTzEa-006fWn-14
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 06:33:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so4922615e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 23:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691649203; x=1692254003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNOB2kSBm/ZCjLUQLsGBk0BsOPSn2yUKgs+5rBFTqgc=;
        b=nLzSxmdCld1p6/GNXMg8hXGakyqAdX2VctistK9WujPaXg2PnipVH+tA2okLWW90UN
         YK/BFf8rIAf9y9/FGQ16JTl3nEBJ/MahEeOfpBlHh+TGbMxyT3EbfPpUk4Sm9grnzt2z
         gZp/ofk3kXabjgpR2yA9JR5MjMdRURursj822tzChJxLFRvP1VLsc0LlKXQT0c6d+ti9
         rSq3OGfAnGXEG0/5D0ATH2CgUFxhUIBl4ymOlV3u6DabbmQOrsaSODD0uljC0IGsD/tD
         OezEw1qzk81Eqwk/q90jugj+om1k4tatpOqQqvVcsUpFq19K3NW2VUO7WrhFuFTXTL0G
         vZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649203; x=1692254003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNOB2kSBm/ZCjLUQLsGBk0BsOPSn2yUKgs+5rBFTqgc=;
        b=XZ+d9W+pguLJXDUSODiUq5Q/ImsrgJxAQkOlyNZLwz8Db0NMHnekfe1C/UEkqP6gOH
         u/WjPc9uWGkcNQBz0lepR8rnZoKAmclzjtoOSLgrpmP2Ywp1ABVIP/AV/OeSiXNSZMqC
         QTagHwdPcKrvMPtHy1wm9qhNhbPYuEIU8U7oh+1t3X7EuuClhSPfpS5eq4XGtIXO/cR0
         Ku3kD5Jya5ros5aXzbURyW+a/uOpIIaDYhS1i2c/1echUt1v5+JXz6MyJQ9xavtRQqF3
         Tcp3QNyud2vqlUBOUauhhbsTuMvivXwrM5623AXa1WY18Wf+zeFy1DLXEOkPzVkEbVdg
         RSfQ==
X-Gm-Message-State: AOJu0Yw1f/kAdorxQFQF6jKi3XzRvHHswAYuhmdpgLpck/wGGH0kNH2Q
	15mX2elJ6S0l1TNoWk1mORSr8Q==
X-Google-Smtp-Source: AGHT+IHTzWeiFzQtz6B61NWeYjn6qIfVxR+QqP5IsC0pkDiH1Mt6bYQC6K+5H8AdGVl3d82V9DJTJw==
X-Received: by 2002:a05:600c:d6:b0:3fe:1cac:37d7 with SMTP id u22-20020a05600c00d600b003fe1cac37d7mr1221145wmm.10.1691649203041;
        Wed, 09 Aug 2023 23:33:23 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003fe2b6d64c8sm4020018wmc.21.2023.08.09.23.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:33:22 -0700 (PDT)
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
Subject: [PATCH v2 09/11] ASoC: samsung: midas_wm1811: parse audio-routing
Date: Thu, 10 Aug 2023 08:32:57 +0200
Message-Id: <20230810063300.20151-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_233324_383152_9694A581 
X-CRM114-Status: GOOD (  13.15  )
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
 sound/soc/samsung/midas_wm1811.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index 6931b9a45b3e..9e83ed071f39 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -462,10 +462,14 @@ static int midas_probe(struct platform_device *pdev)
 		return ret;
 	}
 
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
 
 	cpu = of_get_child_by_name(dev->of_node, "cpu");
-- 
2.34.1


