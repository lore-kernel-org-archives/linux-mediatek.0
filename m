Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67175FA373D
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Oct 2022 08:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mv+BLBNqBpWOA3vNeD4kjDL2MA9szaMxuhuDzPkq1ks=; b=Smuvd5PITK/opTBKLVqh9T+RCS
	eaCK5gp4V+gpE1pz4a1KJrpcBuDpCrOE636HgDOFo726BeEq5MsdDq90d7Knwb5U3IptH0O8fHfNu
	TZbOY6qEy9bTf0YCSk7Vx+bddaCdFOjkkaSa6n+fR1hREBUvNePmeDKP3h0A3S/WOPuLGQLAYTf95
	gwvTfy+0nteHfud1us7Jr3C4XHWSeset53XD4cQGzpvIwk8Ixu/0+XIUvoNKEgRczCfpP/hPHBsBH
	Igvor/9DWR6TUKUQaHdEflpZoho3AMkjvUqqh4wrgFYgDK8pV774JOPac7kdyFJdCM0CEUxyPPJpL
	YUm4tpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op45G-00ES1S-Nv; Sun, 30 Oct 2022 08:54:22 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op456-00ERrG-UX
	for linux-mediatek@lists.infradead.org; Sun, 30 Oct 2022 08:54:14 +0000
Received: by mail-pl1-x635.google.com with SMTP id p3so8361223pld.10
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Oct 2022 01:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mv+BLBNqBpWOA3vNeD4kjDL2MA9szaMxuhuDzPkq1ks=;
        b=TMAYw7yigmzOnPFudyA0NvbqzI6+opZd+SUpXDi5eDzotTQJ0WK2rDpLf5ccdeVE8g
         3PqS7MQpWLfHuwgGbYKmJZ2ysQsAW1YmjPIcozhsoG9zMMJZpaOr+M9Pul9ru6h0VY4S
         BGS9GSTc7OXtM8PWGJJW6xY4PeB5KTn5r/+Qw5zirqfqnBqIQO+x4EZD1RBvKsebU5Yp
         ZbBBx/6D3kgyYQQnbdOIvxb90fDUTc28u/3Nn7yVrKmk1TRLw5gOQqggutvvSCKoRof1
         s9C69TJ6maRenZJG0/QV+XYqrl4hWPrdxOdA1gSC3UVBdl5NGNTTpSEoaE0IvmFl03h9
         uBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mv+BLBNqBpWOA3vNeD4kjDL2MA9szaMxuhuDzPkq1ks=;
        b=hiBRwSEoMWGfNY/rwf1eYdn/Ut4OxFr9ZNZZ6W9As03dZnRROlklB5ND+TydnLOtqO
         veTnmDp6qEmlo/zBM5/lDQ70Mj5tQshRw6ZNl7VDfppZomjdGfZcuZT8ncp9Er5q+n7k
         4WGdtsFEkhti7FHcbTZeVwvkejqvTBuAcMW6rJ4tHgdDbJtSJFMezKhK2qtJ6Uf6uigz
         EWk+uOfbvaO83u3OX9mQy2wxpF/+mWNhLI4UpzONlyUlQDpujEhr6sUQaWhunoTF8rVQ
         QZtSoUGSHH1BFMl4YW/WXtmqaX+ARogZpIQ/uvJBZIrooPMMS5qZHcQ8HrptLsO7KlQK
         RJHw==
X-Gm-Message-State: ACrzQf2N8DkCberLhTLtRSnFGyTZaIRE9Foxh0eLQuA3Dce5rrlysZpv
	AhgoiD4EArgBs/MFuVbmPPt2JQ==
X-Google-Smtp-Source: AMsMyM74Wq7d2lV8Ds8HII8GqBYH4mUQ5vxzN4bfvVHLfopJFxA14Df2ZPsSepJWrLU8Zi+ASuBHUg==
X-Received: by 2002:a17:902:7897:b0:178:9292:57b9 with SMTP id q23-20020a170902789700b00178929257b9mr8369620pll.102.1667120051195;
        Sun, 30 Oct 2022 01:54:11 -0700 (PDT)
Received: from localhost.localdomain (118-167-185-125.dynamic-ip.hinet.net. [118.167.185.125])
        by smtp.gmail.com with ESMTPSA id n9-20020a63f809000000b0041ae78c3493sm2054627pgh.52.2022.10.30.01.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 01:54:10 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	"chunxu . li" <chunxu.li@mediatek.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v3 1/2] ASoC: mediatek: dt-bindings: modify machine bindings for two MICs case
Date: Sun, 30 Oct 2022 16:53:57 +0800
Message-Id: <20221030085358.1619285-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221030085358.1619285-1-ajye_huang@compal.corp-partner.google.com>
References: <20221030085358.1619285-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_015413_016949_80A56062 
X-CRM114-Status: GOOD (  11.23  )
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

Add a property "dmic-gpios" for switching between two MICs.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml         | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index 4fc5b045d3cf..46ad2cf4365e 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -21,6 +21,13 @@ properties:
     $ref: "/schemas/types.yaml#/definitions/phandle"
     description: The phandle of MT8186 ASoC platform.
 
+  dmic-gpios:
+    maxItems: 1
+    description:
+      dmic-gpios optional prop for switching between two DMICs.
+      Ex, the GPIO can control a MUX HW component to select
+      dmic clk and data form a Front or Rear dmic.
+
   headset-codec:
     type: object
     additionalProperties: false
@@ -68,9 +75,13 @@ examples:
         compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound";
         mediatek,platform = <&afe>;
         pinctrl-names = "aud_clk_mosi_off",
-                        "aud_clk_mosi_on";
+                        "aud_clk_mosi_on" ,
+                        "aud_gpio_dmic_sec";
         pinctrl-0 = <&aud_clk_mosi_off>;
         pinctrl-1 = <&aud_clk_mosi_on>;
+        pinctrl-2 = <&aud_gpio_dmic_sec>;
+
+        dmic-gpios = <&pio 23 GPIO_ACTIVE_HIGH>;
 
         headset-codec {
             sound-dai = <&rt5682s>;
-- 
2.25.1


