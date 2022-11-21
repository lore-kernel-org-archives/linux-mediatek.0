Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A27C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 01:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CB+PKSY77gd3fDCjTpTtL8yvYXbKEU7hxFHC5zM8QI=; b=EQZZfRhnd6vyDRST3IDg5zDJRW
	odDQSgEXgqALDkF7e6CyadbCipUR+Tv5V05r+83JJh7YGg2R2Fs2zZM38SarUtwdraqyWq11uSSvw
	IETCXHqOrPXTIUE07oiRVuCTh03WNyW+THt/eqS85BEU+W0AgKcVuJuJyGOpr1Hrkz5oAX1AYCaaE
	Ji6ZhG2RGvNIah/PCZn5788lORz2gW2PDiWnjr5kYdnHusYN+ycVN2+vJtm0WzcPpuhgFuQNIdTHu
	r4D9hQ4mGfm73luDFlytCK4efu3wGvfmgNko2NRd5lD9eYUw3LJlgXGruVLi7EucgQGYdukHYa54D
	p/HGX5sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oww2o-008K7J-Sx; Mon, 21 Nov 2022 01:56:22 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oww1m-008JN5-3b
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 01:55:25 +0000
Received: by mail-ed1-x52a.google.com with SMTP id h23so6377306edj.1
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Nov 2022 17:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CB+PKSY77gd3fDCjTpTtL8yvYXbKEU7hxFHC5zM8QI=;
        b=Y/jhLVoxc5NITt+vyfGKjmI2MXk68J/n5/gDbcTVHtDrq+qHydLcpWCsqOLT+1tx4K
         vJGHmCzBcZprPMxttoFB4QAqBGD5FTiUZurSUlx8DwZbnsbuBN5KPdfLfSh12xI5q+45
         ewkXZiWodF0uOn4CbYPKzFB+wkOvdmACfiHT6TIbZ9oR1yWZ2VZV07itjNQh0y0ERljn
         72Pp4i82m1BgTZfFpIEihqSdWbivHdk9jukMKe9aFRW5kzdT9k7mPZiEcYoeksjZMeQi
         /4zaGQxnrqeC5FbdRmBZ5Fsw2EP2rTwytcD718KgJENUc9W0BT2cS1f0N20MjqK6Xjum
         +j2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CB+PKSY77gd3fDCjTpTtL8yvYXbKEU7hxFHC5zM8QI=;
        b=lv/tOpg7YSx3rT9qszTTZ+C/uqowK2Sy/V6rbTRzAZIn9nKzwjdlmcyaHY2Rgui4Of
         uL2V/FDBU3gZiSAWcoArcjDADRfu1k66NAJoaToFxfwRi95PIwM/XXn8CSXBdeggmyZt
         Po/va363TjRXfKesWr5uhmGZgvhfTcZmSSVLdCc0n6lRRblf5wSk5lWcQzmPvQyBnzd3
         AIiA6IbfnOJ7nE887TPD5PfHR8avln0cSVDVreM0K88J85WXhEPTaM6KKtWWH7UTovnP
         /biDkK/WhqKk8H3e1in+lhxcNPTmZaJrQdTlfrZJLvudR1+60BZ7U27ZT4+NreiCXH98
         0efg==
X-Gm-Message-State: ANoB5plKVaG5FEHZfdUUEum0ULbWGFlSlE0N79jLp79pNn4fkaRvDFGx
	Pm3FddJtefbUVPr0wN9ymIzbCQ==
X-Google-Smtp-Source: AA0mqf4SwjNK10hTsB4MvtZoRkF217NrnXjf0sIG6lLeKQigxLHaLKrlPchFql7FjvHVNq3vPF2dIA==
X-Received: by 2002:aa7:c055:0:b0:45a:1af2:ed6d with SMTP id k21-20020aa7c055000000b0045a1af2ed6dmr52132edo.364.1668995708996;
        Sun, 20 Nov 2022 17:55:08 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 17:55:08 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	khilman@baylibre.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	matthias.bgg@gmail.com
Subject: [PATCH 3/9] dt-bindings: pinctrl: mediatek,mt65xx: Make pins-are-numbered optional
Date: Mon, 21 Nov 2022 02:54:45 +0100
Message-Id: <20221121015451.2471196-4-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_175523_252185_1CD89281 
X-CRM114-Status: UNSURE (   7.67  )
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

Don't list the pins-are-numbered property as required

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index 33b5f79e741ab..cca9cc58a6934 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -62,7 +62,6 @@ properties:
 
 required:
   - compatible
-  - pins-are-numbered
   - gpio-controller
   - "#gpio-cells"
 
-- 
2.38.1


