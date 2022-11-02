Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89362C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MOAU43uzzEUBwcN8jl9h6i5tY3MCh/3gF6pphcM5rw=; b=bUAlb2O8H89leEJG+i7GA1GwlY
	cU9mSFXTTKpvQS90ko/n/vHlEbHilUwsxSNQMNNwSd72wCqnFWEeyar+bw1eezbMZ4zLeKQr2pvNc
	esi3Z+Cw6r48TgcxMSyc5c1GnaRecxNgcQSPLdtte6INjDN1esOJARws3X3eN4WBAAHvfNdosDm/y
	t4wEClY5RsPq1kT0D3Vc2TXflO0s99sfD/WH79CYLsfxsaw2J5cZ4IndbDk/03lV3hjQq82MLvp8J
	yCjaLe6tugcV9QxYuxPI7brYkBrvkTONyx4L+JvuOxJtcvg3VP03xIr616fAG3/naRqKJM8mkdSss
	AntF2Q2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqDLY-00B7xk-Nw; Wed, 02 Nov 2022 12:59:56 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqDLR-00B7tY-7j
	for linux-mediatek@lists.infradead.org; Wed, 02 Nov 2022 12:59:50 +0000
Received: by mail-pj1-x1032.google.com with SMTP id b1-20020a17090a7ac100b00213fde52d49so1845597pjl.3
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Nov 2022 05:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MOAU43uzzEUBwcN8jl9h6i5tY3MCh/3gF6pphcM5rw=;
        b=AQ8kPTbbljZVxfnEfi0hbxKI6s+gMzT3qxWIe3ilfWN97UlKHjGVYW5BTYtNTaj/GR
         r5YSNGanhu5FZjRo6qzDGNK92FQVb90OmXFyhITipQcw0DQ8X7WRdldd1lVriuxJs3u8
         bclVsAx4PenGpbY2lU2i+m/kNgF3EyA0eELvzK2Hl8UfgFWodpYU4RQkOAPz4GnnjyY8
         dnHZoYjqs0AKUBo9KRCmhkHdy37BtxaoMfhq869YnSsr0DhuorCXvBpPW2KJrh0lZcj8
         m585Yw0icnATeNTAPidouJ8I/Ysoh3Crl1R2swI0tmLmCckEkpkplYx9g9uainWRrYOW
         8r7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MOAU43uzzEUBwcN8jl9h6i5tY3MCh/3gF6pphcM5rw=;
        b=EazX3uXfKkZ13/nSN4bJj2pRhyrC0g/7o/qf4LlcVfC7d/UYSzvTIa0+7xccqpE/BV
         C4Ey0BJFo9S/rhf4ItGU6Q+M6zTmnCdCE8L2Tpm5QmMjz/MMWu8MhUcl9tbsacfJYBnT
         3gTILnAz6o8HetYd2s61BzJrFW/s/CcGvnK2L6le1BcMKG77tScRs/+Uc5Ey6tYgTSog
         23hYm1cWBS0QY46lSg1YW92aR0T1EYgv45M2fJIQU+VEC9zJ23TH+7swgsQr+rYJLDVf
         hqVXf4AUkIGc6+zTLHz73nhdanKq9ukNmgy2MYq7+ZWEe7gP706rjFPgf1+u15jV/x7c
         KU9A==
X-Gm-Message-State: ACrzQf2KFD+ehnRY6IYd1xXyU/v1o6DbE8VRuK632KkiXAQegSRZvYnm
	XcQkVjgXk0aXve41h+0mG16IGg==
X-Google-Smtp-Source: AMsMyM52YMs6itJcER5nB0dN3QV1+Sc4QPdClAE5epUFWcxb/aLsW2ay/8oaQDOlk0eVDD79VsWRUw==
X-Received: by 2002:a17:902:e88e:b0:187:27a7:c8a9 with SMTP id w14-20020a170902e88e00b0018727a7c8a9mr13695292plg.169.1667393988129;
        Wed, 02 Nov 2022 05:59:48 -0700 (PDT)
Received: from localhost.localdomain (118-167-210-180.dynamic-ip.hinet.net. [118.167.210.180])
        by smtp.gmail.com with ESMTPSA id k14-20020a170902d58e00b0017f59ebafe7sm8259345plh.212.2022.11.02.05.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 05:59:47 -0700 (PDT)
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
Subject: [PATCH v6 1/2] ASoC: mediatek: dt-bindings: modify machine bindings for two MICs case
Date: Wed,  2 Nov 2022 20:59:35 +0800
Message-Id: <20221102125936.2176748-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102125936.2176748-1-ajye_huang@compal.corp-partner.google.com>
References: <20221102125936.2176748-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_055949_293860_F7F1353E 
X-CRM114-Status: GOOD (  11.39  )
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


