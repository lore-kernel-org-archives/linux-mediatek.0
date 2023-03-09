Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E656EC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIAq75lH2Ms2bL3QI5/GLr9JphmlHB8/ymqV5IkJpKc=; b=y9cjXWIts5A0b+CZQg1xwzKkTC
	TuCPduSL72JOrWu8BP7wl3UU31pLo5FhspP7zw3mpbREe6KiPoGLU2bxlK6m1+ZUM++l4pPUbCAlh
	qBgIpqcx3XtQ3YsETL2II/0k5+mNpSAdckjBIKnyRF3wVBlrgCV4v5iDxeQTJ7mla/V1xFQeIurAO
	5KABp5FO4aAZNbQJkEPa/jNt5sXy6zsyiGLDd65jqtWo09ROBqdG9UkbvHC7L8p3ngGchCy8WcdXv
	XTrSOdzJzdHDF/JwPQkuN7rSpmIP7yrXXCsGI53XERQpITeWn9sXAHfWdkQStxkW1dYFlZufoY2Tt
	/EZ9r2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHCN-00AUij-2L; Thu, 09 Mar 2023 14:24:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHAZ-00ATfi-M6
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 14:23:02 +0000
Received: by mail-wm1-x32f.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so1358302wmq.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIAq75lH2Ms2bL3QI5/GLr9JphmlHB8/ymqV5IkJpKc=;
        b=iQ/Z08i+xnf0+QqJE0gYVxQ4HzKmXpqQEAOp8qp6ZOh4Bah0fbXKiDFQcJii6ajJ+f
         lj9QKiceDCt7X0u/RNFd9QMU6wnsrC4Stx9kDpsQrydI4GTt7yGozhUGTj4zBDZJ4ufT
         0rkmkcJgQse9ID1Nu4c48hz33JrvyeYhkez5o9TpFnmq/8BNKZKz7bfyvwZEHY/xOLkY
         74IC7uqk6UiuQAdvyYmbsfTj9OZuYjouSQSzIFf5xnvlgg4QKzCMoZXzl3xaeDdg/4l1
         NEuyqEkuf9MekN0owXFrv9vl3hVDmB0loaok4kLdi5yf+e5YpHn9LNVz1jz2Zi7OMYSy
         1VsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIAq75lH2Ms2bL3QI5/GLr9JphmlHB8/ymqV5IkJpKc=;
        b=oNbptisE9UAWUGC8GuLR26mSBn48EIHmE63H8MLXtuYN5T6EDq61yPbuLTHlFE0G5V
         MdZTuYV1rbGogBulq9+jmg9d6S6J1kiQiabkhQ9XjWgawoWhXj/raOOjdRWdwGaKD5By
         ezJ4PuI5AMqLnFQ9jDzfkYL405YmrV4vJzLIv85NjzP7fuilf3Aej1wjea4o+kPmlqK+
         DA2vNN3sThHDSYqNFYXw2etN+yjwh1v5UMoCpBanEXD7/V0Q+7+AuwTeUJU8S4z61FOR
         3/YMDk634jOZYBu9AwMntyfuRCM7enQenxmWvNQzQ7frYBQVnICOrwzNS4zRIrgdtUo3
         GgRw==
X-Gm-Message-State: AO0yUKXMgMNJjiWo5he8lUY6CW46LKwc5S0t4BcVFSqVtZOYh/pyKE6Q
	wSzEw60eDMiDV8IBPyW6xFuyog==
X-Google-Smtp-Source: AK7set8x+PI0RC1jqr6FcGHLymEePMs/0jRVfw13/HyaF1qSj0O2qlIoeWJ4Fj1seTcF8i4J9aGxow==
X-Received: by 2002:a05:600c:5127:b0:3ea:dbdd:66df with SMTP id o39-20020a05600c512700b003eadbdd66dfmr19528568wms.2.1678371777251;
        Thu, 09 Mar 2023 06:22:57 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:22:56 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:50 +0100
Subject: [PATCH 01/21] dt-bindings: display: mediatek: aal: add binding for MT8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-1-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>, dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=927; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=WEnU1yh+Xf5Fm/UQMnsfiUO7zkGJUQGiUbGopVaYs98=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+4sd0fzV97pSR5UsZOhCfXfr87D9x2eqrQp2p
 9rnV6IOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURewmD/
 0aPeRYQ6rCDSvjWKnRIJcolIOK3MGqzimlQ2PN5YzvyIhAHyJdWyzxAOuU0O2zE1Oa2NRenPZ0cJ89
 xA4XdvNTMwDrNpieSu+6K/mreygJWymCHanAtu8M4lZnRIc1QQiAB0S2PHxSuuLTiLVA74b3hUljao
 VLDcOtl3WxrlxKMe4rv1BtUcGN9a0v4I9qxSNC9aoWzZG2/hyuZtk38ziMe+TzT8G23n749o1frHZg
 RILO/9bTJYihnhwtjCV9ujmOM6e6weak2msm5Hu8ua9KWFOaFAgyGoN09Ox0Nut+YwkxfEp99cQnId
 oao1ipTTAkXcZgfjpuUgWLhmIGsiJvvZFRsdOtXuX9g/H1b/mmfojPnHrokuOi0XZxhBiaTYg+WdeG
 8quLYTLR9Vtp2PfaaZXuDXAWcFKGW+tvDy1dFpkqqPTXI9KQeA/wfWIIDosdlAqLnC9rXG8FCfwCeJ
 kIJGMGAQIvEWoz93A5aSvaM4KHOevj5mfm5b0nssksvKEZ7wP0gxpM1YVTCrj+vTo1doIhTzxrR6DS
 G6HqmHhulONoHNM+bvJzYiH00fPMIRsteIuQIa4HdyLweEvcQMYhF0IgYGtNdLnDH253Bxc4fOnFer
 7MAlBwHSlvzkuZbjwvCMcpDFTjeHkeJGF2Wq0arbAIN5WcntO3VeWC1vNwKw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_062259_805348_2970AFF1 
X-CRM114-Status: UNSURE (   8.80  )
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

Display Adaptive Ambient Light for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index d4d585485e7b..d47bc72f09c0 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -33,6 +33,7 @@ properties:
               - mediatek,mt8186-disp-aal
               - mediatek,mt8192-disp-aal
               - mediatek,mt8195-disp-aal
+              - mediatek,mt8365-disp-aal
           - const: mediatek,mt8183-disp-aal
 
   reg:

-- 
b4 0.10.1

