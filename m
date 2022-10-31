Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB297C38A02
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 12:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MOAU43uzzEUBwcN8jl9h6i5tY3MCh/3gF6pphcM5rw=; b=JgpEkH3gMQZhGJQ7yjROwGzTvQ
	61HI1APK42CQramUzlygptkpjKC5v7MRdHDP/KfiJ7DSE9cMSzBVuU0dKn39CPTf6g15YKyqicxeM
	cy+Es7GHetFntNtMJaDYCIaB+KddlbVX/qooYJlqoJiY3tm2Z154fSj/hdfmr8mtQjIyHqmUbNMUQ
	NMqH/gBvPawRC2/iJjDr1seAvg8t5ZWdXJT4MkU29l4QPbOh2+5SGY+xPKl8+0gO8VNaV7c4cvVQL
	i1aNCa4dUxB3SK1YS5Xf3Ia6Oo9EmL+VRdI7btpkuS/7VgS9iV3gfc+hfW/cj17oYMR9CxO91M8yR
	7OUqwz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTpL-00BdlO-4e; Mon, 31 Oct 2022 12:23:39 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opToM-00BdCV-D4
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 12:22:40 +0000
Received: by mail-pl1-x632.google.com with SMTP id c2so10564791plz.11
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Oct 2022 05:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MOAU43uzzEUBwcN8jl9h6i5tY3MCh/3gF6pphcM5rw=;
        b=xN7tZuq2qouAUfQeHfc1L09Per4c9T2dfiX3qbfhPmIHtEpLihIg5PUhpTLg4cy6Yz
         y4qRiWhmHwBlpXJ29ln1E28k7ZzojpUiQKRbv9wZLFEhOr0Z942UjtTXEfeimin3jDqa
         neD3zqkPD662BsriBkWqUIVqFs4EfQqZDqFkWyoOP3nau+pvtuuuTCrxPtIHI/GnqzQm
         0sVgDmgPPSNmx9cwmnDeaAkfefXEJfd75ywNTMS2PqMgugfqehY62FXP4MSugTcp/RG8
         fJqsXymPgQMRD3XCT/djPuBES7ykfUoXAsTLjqKrJz9DfqFUAAcaG1dKG+mMr356jFzl
         bmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MOAU43uzzEUBwcN8jl9h6i5tY3MCh/3gF6pphcM5rw=;
        b=Geb8C/iLVx1oBjX+eUsjBQXo3gelXQjEhksKJLkBevXUQt7duGavWj/wOvUpmBaVwo
         EIKd35uLFxGEJZuqa7aH3bMf+aLi0u6piAstJnhQ+mk+2zuNNxbYfGa3hNRhSRgLScFG
         Ubb05jbPEJDZFAmfUxY66cCl1u9JkMFawSw3A8D1v0njUZnCXtY/oNrUYesTneYdkrdx
         ZYfcn2N0DdBiE3k1Vb7ySRZLqMSqlMviaav88d7+FqWel1rWSG2lq6KMva0rxBav7+U5
         HHFGwMfKaT2KRAzLBmR9xuGSmt8GubAkD25hfglejtjz8QhxYRMbQYT8CK7fP59fp0Ti
         kQog==
X-Gm-Message-State: ACrzQf1/EnClYZJeTbxFR2SccvN1RnEk1NAu66bWrVeBYv7uaCWfpHx8
	iK093OYK4ueTdNy6cK+zqtZMug==
X-Google-Smtp-Source: AMsMyM6YF1Ot+9V5drlAzDff3KujPHKAXkBxz0hQIsb2pJJFxWRH1341O2ZxT8TggMSOEsuLif+hKA==
X-Received: by 2002:a17:90a:b00d:b0:212:f91d:88c7 with SMTP id x13-20020a17090ab00d00b00212f91d88c7mr14690544pjq.112.1667218956067;
        Mon, 31 Oct 2022 05:22:36 -0700 (PDT)
Received: from localhost.localdomain (118-167-185-125.dynamic-ip.hinet.net. [118.167.185.125])
        by smtp.gmail.com with ESMTPSA id y123-20020a623281000000b0056bf24f0837sm4445483pfy.166.2022.10.31.05.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 05:22:35 -0700 (PDT)
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
Subject: [PATCH v5 1/2] ASoC: mediatek: dt-bindings: modify machine bindings for two MICs case
Date: Mon, 31 Oct 2022 20:22:23 +0800
Message-Id: <20221031122224.1846221-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031122224.1846221-1-ajye_huang@compal.corp-partner.google.com>
References: <20221031122224.1846221-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_052238_502939_BFD0EB0D 
X-CRM114-Status: GOOD (  10.73  )
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
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml        | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index 4fc5b045d3cf..9d3139990237 100644
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
@@ -63,14 +70,19 @@ required:
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
 
     sound: mt8186-sound {
         compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound";
         mediatek,platform = <&afe>;
         pinctrl-names = "aud_clk_mosi_off",
-                        "aud_clk_mosi_on";
+                        "aud_clk_mosi_on",
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


