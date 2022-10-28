Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA005ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 17:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFMOsXdTB5Df8ggzsilthr4+D/qAdNxZr6+urTN5nT0=; b=jQAeHL46bys2vN22zpzfk4AYid
	vSo/kBukDr0/d/h3JOz+4uBPDAQwJwwYuaIpaXnZ5rXfc+s4+qNsNM27HVlH7VhIL+fOeCzb9xmVN
	vIfD4dQfEBPt5KCFNg4QqIp84JxZiJQ/E9C0O03zI/GaTCJAmORSI5SmrkiyObTE7/KZ51zrmIMb9
	cXW7ZkB4ELid/4aWsUMdpzJW9RVgOxUS+a+lArXrBYlLo74gVsVvBYr5+5vxgpzP8mCD+0CJtc9//
	LN1+9MDyLQ111HaO3s3S6oKCX9b4jVf+mWCk3x/zSVR0NFuxtywyl7MI2HMFnME4fbg3QpqjsYtg+
	sSm96tsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooTLg-001PtF-O3; Fri, 28 Oct 2022 17:40:52 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooT3u-001FpD-3n
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 17:22:31 +0000
Received: by mail-pl1-x634.google.com with SMTP id g24so5405643plq.3
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 10:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFMOsXdTB5Df8ggzsilthr4+D/qAdNxZr6+urTN5nT0=;
        b=8U/f+2hJhjF5TA6s84eiTLKl/O3fHVNMKbmkkAJ5FX/aRcszHn6fJBjnhGYYHQFhG2
         fTBTsLcL84cBOXGg2Q2mgiqcOwDnk0opQiYBNiOu+hlqD6C3F0E27LwvFgrg+Gg2KVws
         IY4kwfWNNnR2taX0KaH5Xdz+RlGQDTjTI2U7QhXlmr6JX79RWzIM7O4kL64obG6g93Ap
         mWD4qOOieD+oZ44d4vdRDuRIkCdVolcJZunUq0em5vrp7EzLh/2OkrNn4jIuIg3M2bYE
         cuTIJeKO+N8Hd8kHyOTSeNXd5vXuSV/aBQl2AyhpHg9klUbUKNp4gciAvT5jrIToqZuN
         lHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFMOsXdTB5Df8ggzsilthr4+D/qAdNxZr6+urTN5nT0=;
        b=Rah1QSjeP1jPRlPyFNd/INJngUMu/rrS689Wr7sTCJfVq0rrmJeC2cIUOcR5mvjAGP
         76sO7Yj9o2sK+ss4PMXgsh7OeTJ/l2gAtGTnt1deHoUOTXjXP9Z4TgF98/5IeRv/5SVY
         haEwGGAwgLloETWR011hgrCPxTJ7QYyfjP5Q0M9YY0mKYNbfvLIs9BKdZ76SABgt6V7c
         YYXM+ucO2v5TykSz7pVmVpMevdrzdtkxbtPJcn7u/8fgpzvkIlHAB5HfP3auTtT3LIe7
         1pXfNfI9SvekYB3ZHFV9zlOl5j67tWX2ja0a/Ihz/DJx1FTGKkcc2i6IGiTzh9+Pl0eA
         fsnA==
X-Gm-Message-State: ACrzQf2ElVtd6w016HbAalEpHgXPDNQ3I3wNYjIHRz7/ow9mUJsfTF9q
	7xWYCpZnQW5kmCLCocFr10io/w==
X-Google-Smtp-Source: AMsMyM7tCLeMSIkzuM8wzGQXwgjziB10x1ohi/U73N7eYMIHY7EgkGmX+ArJKDN2eNOxLRCaa23Crw==
X-Received: by 2002:a17:902:968f:b0:180:a7ff:78ba with SMTP id n15-20020a170902968f00b00180a7ff78bamr10947plp.87.1666977747715;
        Fri, 28 Oct 2022 10:22:27 -0700 (PDT)
Received: from localhost.localdomain (118-167-210-30.dynamic-ip.hinet.net. [118.167.210.30])
        by smtp.gmail.com with ESMTPSA id rm10-20020a17090b3eca00b0021282014066sm4604945pjb.9.2022.10.28.10.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 10:22:27 -0700 (PDT)
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
Subject: [PATCH v2 1/2] ASoC: mediatek: dt-bindings: modify machine bindings for two MICs case
Date: Sat, 29 Oct 2022 01:22:14 +0800
Message-Id: <20221028172215.1471235-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028172215.1471235-1-ajye_huang@compal.corp-partner.google.com>
References: <20221028172215.1471235-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_102230_189231_846E0202 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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
 .../bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index 4fc5b045d3cf..212d2982590a 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -21,6 +21,10 @@ properties:
     $ref: "/schemas/types.yaml#/definitions/phandle"
     description: The phandle of MT8186 ASoC platform.
 
+  dmic-gpios:
+    maxItems: 1
+    description: GPIO for switching between DMICs
+
   headset-codec:
     type: object
     additionalProperties: false
@@ -72,6 +76,8 @@ examples:
         pinctrl-0 = <&aud_clk_mosi_off>;
         pinctrl-1 = <&aud_clk_mosi_on>;
 
+        dmic-gpios = <&pio 23 0>;
+
         headset-codec {
             sound-dai = <&rt5682s>;
         };
-- 
2.25.1


