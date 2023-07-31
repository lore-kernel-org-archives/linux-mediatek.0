Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEE0C001DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 09:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6++1atFcJlpU6KcQ6EW+qw2Dj8W42OQi/XJDZGdi1g=; b=BPCBQk6ttdTea87+R8kYrvEJCG
	R14WP5oO/zaYVSJJVCTgit3RnSIA3pmsqYYU4sJMH/vQByGem/CIufl4PyIrC2wBKoHdun9mSRHl0
	m6gegUtBAxb4i66aqkBgxNfZxbAFdol8U3ApvBNIqSGmMZOrg/M548DrDhvYZgaI36PsDZnKM9I0f
	pikf1SlpGZp6OryqM6rjgs5XQzSg/UUzK9V6+JUuaaHbzz9RqRhqANXLYSxEPHhaPekmbBeJi6W6c
	naJEOtQAJJY9aIOBJvCkrYLNczjoYLG9UYBCpOfNNvIsr4b5C2lOU4CBdjyBHW5697qjUoHrZE5aC
	Y5MRfbUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPQs-00EnbC-2H;
	Mon, 31 Jul 2023 09:43:18 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPQq-00EnZU-04
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Jul 2023 09:43:17 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-522c9d388d2so1027199a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Jul 2023 02:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796594; x=1691401394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6++1atFcJlpU6KcQ6EW+qw2Dj8W42OQi/XJDZGdi1g=;
        b=dhc03fGGpA5as1+HMhYMWdZE3IsL092HC0LprsNTQBPQ7s6TkXj6YxXAQqPWytVh44
         cb7SNFy7YjkMCHLx7fxXAZBDfQvbHE87OLNS2OdhRomqKJJlzT6k6gHtLaZEOZy2CLOx
         2VRDt7SdmllRm1yYORj/MI3aRZbrIwKLb2/6RnHVesH2HAh1d5L6M3ZHrZhtkYl+0Vpm
         OrVV5xkeBfvzo1fxSl3sE/3HPfPBEYMcyLl+L6/C3UMXWC651H+jsnnSOBFAzr8DxI3w
         udHKxhJmN8ichJzsj0QspP+1UYSEPxBXkMJi88MqqrUlzTtP8d81k25fDK4sYQ5R5ls+
         SvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796594; x=1691401394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6++1atFcJlpU6KcQ6EW+qw2Dj8W42OQi/XJDZGdi1g=;
        b=YJnRGom96n+6l93i0J+CaZuS0QrZr4IO3Kc4Bu17LHnmTPvzeVPVpu0i+drOJtFaTf
         mA2OQ3B4T2GtUAt0fKLBhYytzauvfcsJ1031+SAFiNs+j3KxgONj4khbRVc3O4XJe3Zi
         QWVgaDR1hlsY1+WfZ9XziI0Mkltsv9PvSMle4LXijJQbTtE40qKSiNnosyaxbukh8uFK
         WHO5oNescBxV4W/h6k+X4RROY1v5G8X4fUXUbbIs+UduQx0/ocXeknPjWPO5+pDLxLNP
         XauBeOk8gGKUMPnAVMryMKvBrxFkPVlPBXO3zfcROTQja7WWFDdR8mYwFSjcDX/Itpn8
         AkpA==
X-Gm-Message-State: ABy/qLZ4rGU2nAc7hVmVk1Sg1Xxyaqu1aHFY3dAUFdH3c6EpFzzP0fEu
	Tmo56n/6aY5rmVhLqtZgvkIWUQ==
X-Google-Smtp-Source: APBJJlGWo3hFADwY+WaMzw9Z36mCtTdvjCEOo31rIf0hKufIkRKpCycEbTJFgmy0co12hnDOO35r7Q==
X-Received: by 2002:a17:907:7711:b0:99b:f3ef:f088 with SMTP id kw17-20020a170907771100b0099bf3eff088mr6220810ejc.69.1690796594520;
        Mon, 31 Jul 2023 02:43:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:14 -0700 (PDT)
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
Subject: [PATCH 01/12] ASoC: dt-bindings: amlogic,gx-sound-card: correct maxItems constraints
Date: Mon, 31 Jul 2023 11:42:52 +0200
Message-Id: <20230731094303.185067-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_024316_092065_7D007847 
X-CRM114-Status: GOOD (  10.76  )
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

minItems without maxItems implies upper limit, so add some high maxItems
to fix dtbs_check warnings like:

  meson-gxm-s912-libretech-pc.dtb: sound: audio-routing: ['AU2 INL', 'ACODEC LOLN', 'AU2 INR', 'ACODEC LORN', '7J4-14 LEFT', 'AU2 OUTL', '7J4-11 RIGHT', 'AU2 OUTR'] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index b358fd601ed3..45d6202d9730 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -21,6 +21,7 @@ properties:
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
     minItems: 2
+    maxItems: 32
     description: |-
       A list of the connections between audio components. Each entry is a
       pair of strings, the first being the connection's sink, the second
@@ -29,6 +30,7 @@ properties:
   audio-widgets:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
     minItems: 2
+    maxItems: 8
     description: |-
       A list off component DAPM widget. Each entry is a pair of strings,
       the first being the widget type, the second being the widget name
-- 
2.34.1


