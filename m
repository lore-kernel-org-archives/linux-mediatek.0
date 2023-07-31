Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2ACFC001DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 09:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYK3gBdbZNa0sNOQK67Ss/5e2crqIr7FWYCpvQqQW+g=; b=W60oCEcwM2Y0nOZZia3C5j9sIk
	UDpwqcCTZStOntZ/p5VDg1foMQ1HiXmEqELslIu5GgKbk757mSmH7NDWeKG5qlhtS7KbXH82SnfME
	oJHAFZG2MRT9/k+8YZvGRidZE6u6B4hga+TsMSsepD3mPKfD7FffJAmr63aPm285wa4eeXMCyh5iU
	V7eZBt0ZBenDvIHL2w5lU8Cfn2/QIrkzHKLmNfpxwAnDGtrJ4Y+NvsGLEUchepWP435fuu5gFghQI
	qDcpleAC6zv+5Z227DZ/Vcq3ctgtu87WBSIa58tVtblWQMRYPv4OZzCsvx0jWv129hMkMYEvnlqgG
	giXWsIzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPS1-00EoF2-33;
	Mon, 31 Jul 2023 09:44:29 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPRC-00EnmO-1t
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Jul 2023 09:43:39 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so6673841e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Jul 2023 02:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796614; x=1691401414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYK3gBdbZNa0sNOQK67Ss/5e2crqIr7FWYCpvQqQW+g=;
        b=vGH2+BfyMZGVx2Mz2PghzNpH2Lq5fZhfgnQWWX6qIyUW7F+xe7yVIUgCvVGyO2jckw
         IhVxKo6jzyu9LgUCN+ZkGVOY3UHU4c4kbWcOCmwgeznYnO1nOX9iM1Y3SavG9vo56r1f
         nn7SRqa4w7Ohzz1EhhcN7Yn4waZCQTbIO24AlLB/qebcEymJ5BDEAUtGPxbKWlpvi1WV
         PPsNZXmmo8fZyOp4mM3g+ki5WCAgos85P6XQHdI3mYj/xUUWdl8B4HGsKc4k8TrR3JXv
         cgvoMuxzaih01U5doR1E2cYbIexG8RsB0ECGoC4deTSNRX89YVXAOyf5eX+pNR9Kz+7X
         dYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796614; x=1691401414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYK3gBdbZNa0sNOQK67Ss/5e2crqIr7FWYCpvQqQW+g=;
        b=OJqZbDGGUnFDA9v4D5/V8nOvtp+34hHZ0jhkYia6Ceh5cXRrZCe4oPBHLloZtzmjEO
         kl4fk0srY2II28xHhEemL2P7eeG1MqPQZlV0iHlvrSbpkM3XcReWf/pkoTp0Qm3WurZU
         qC9EswNSsUJrPN/+UbRw+SUmCekLWZehkfQI6uGEzOtM03oQ9ExJj4tHa7CJwNCe1KBu
         N1DZsypwkkKmWE4oN/Rb8ZTLX2LMuuAAk9aT9JR01lR9DEjPzlPAic0TTe5Z8SsB4lgc
         ASzsVUZA+rmm6J/Zld9HMkfXPNXhF1U+XitM0I2/F2+NXyn6Qbk88iCMApR/d5XcQPK7
         DQ2g==
X-Gm-Message-State: ABy/qLbHOCJriB9j0kZO9VcJRqbRkhIZplwLJZB4L30gYZ4Vs/Pc4Zg7
	TRK1NrY7xGNrMTN6YrZAyJilTA==
X-Google-Smtp-Source: APBJJlFi4tF2DDSDAGSo3/0U9Umv+lZh1Ow6pAepScqbXZ2BXO/rwOwioy/FJVCRSkz8wfIlGQX0uQ==
X-Received: by 2002:a05:6512:2399:b0:4f8:77f1:299a with SMTP id c25-20020a056512239900b004f877f1299amr6925105lfv.42.1690796613836;
        Mon, 31 Jul 2023 02:43:33 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:33 -0700 (PDT)
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
Subject: [PATCH 08/12] ASoC: samsung: odroid: use of_property_present to check for property
Date: Mon, 31 Jul 2023 11:42:59 +0200
Message-Id: <20230731094303.185067-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_024338_627743_8DDD8BBE 
X-CRM114-Status: GOOD (  13.54  )
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

"samsung,audio-widgets" and "samsung,audio-routing" are not boolean
properties, thus more appropriate is to use of_property_present() to
check if they are present.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/samsung/odroid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index a5442592bde4..1743bd55ba1a 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -223,14 +223,14 @@ static int odroid_audio_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	if (of_property_read_bool(dev->of_node, "samsung,audio-widgets")) {
+	if (of_property_present(dev->of_node, "samsung,audio-widgets")) {
 		ret = snd_soc_of_parse_audio_simple_widgets(card,
 						"samsung,audio-widgets");
 		if (ret < 0)
 			return ret;
 	}
 
-	if (of_property_read_bool(dev->of_node, "samsung,audio-routing")) {
+	if (of_property_present(dev->of_node, "samsung,audio-routing")) {
 		ret = snd_soc_of_parse_audio_routing(card,
 						"samsung,audio-routing");
 		if (ret < 0)
-- 
2.34.1


