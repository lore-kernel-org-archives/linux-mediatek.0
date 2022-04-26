Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033D9C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJZrSE+zxngQ95epwNLJgbQtdKqt8JUnnVO8iaeAUaM=; b=Egk9OG6RCSAh56
	JGlZkaOZzitNWwg8bAhna4PN/n1t9/36ZpBkzilIrtsbPAHKEEb5opOaZP9XzdAUJ5Ua8wKwZKALx
	fUu2VgnLIWQYJlKoIM1mow6ZhRNuxMP8eqSsauL/Ve+yA5Wvesr45qs+wtyo4BWiPJ3u514ceuYty
	XEbWNM6mfLw8RrzB4Y1NE0czufYeViFs0p6FQNtcLmaUGscBlLnC2rp+W2VkkceGJNGZWm93Uw8Mu
	9LBrEjNrd7qswDoJJOZRmAWf+1rEO3alCeX7SCPSpkmdCv9Ftooy2xc82caFAcIRZB9OKVLD/utrM
	zZv50F7OqFZjg89ZQs4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLiv-00EooF-Iv; Tue, 26 Apr 2022 13:59:25 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLdM-00Em34-Ju
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 13:53:45 +0000
Received: by mail-wr1-x42c.google.com with SMTP id t6so22153304wra.4
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 06:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hO8uVhyORBvP7WeUtfTUf8CcXBR+w7H1dVOkhTVX69o=;
 b=5D3rmP5iwuE4GBHqGlhm38hSdktR2BWc+S8PxwVXPsTLn7jTcYbbwNacLE9HBYiXqO
 K7UqaSli/+RrDZMbUxSb+ef7+U0pkLlIZdLu42FAlMACYLy9CnPxoPymmOZoiMVF+5zR
 tMdSw3e+vvwXLKN61gt5RPMCrL3X1DoaMpq3MIwpPcexrcfPFqbZPx5q2CANFs2Mizcn
 KrciwOwA+N5X0ulwHbcXHvZTdYZHu8shJ2ocNsfUj6nNFjj3axvIuT0iaDKhDaFL0nqy
 6/6YDGalUCpGPaS2ahHjiT9qcwAtLqVCxTzOGV9/a9HTKB7Iwjccj5r/PlD29FHAnFcS
 NosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hO8uVhyORBvP7WeUtfTUf8CcXBR+w7H1dVOkhTVX69o=;
 b=Ugc5i0WiEZFsU3lgtBKNAbQ4CKAmAkhfn0v9YLmhaxwZ3yfub/MOSRmA4IQmUTc6Ng
 l+OINTzykXQxm2SQEqutXAGl4TMk+uGKTDhWxMQcD1lNO01kcMlULSF5sgANix8glKjN
 hjqmflZEbLHdCnzRz54uN3RNKVsHkDQINkWznsxUOyOW2XqYMtd1RRUOTFxXie8rYhIF
 x5QkQWuFFX8k1PBUhMg4UbKaUjLD+UqDP0eakxT3CVAkFCcKSkC26dRPvUHCLKPW8tR/
 RGnjyWic2uQKjcUMNL7df2l1PLVK4AKdqjHFemfC8Q39wWrFXzllziTMB27hyyPoe62t
 3IiA==
X-Gm-Message-State: AOAM530pzuWSltIXwCTA72eyKtf44WQNj9c+JxlsJTpoc6ipbZ4SCjKw
 oaKnPEBjTv0hd2VaOtUA70+f8Ku0O7zJFQ==
X-Google-Smtp-Source: ABdhPJxNSjH6bRtukJ+ygK8xFIc9+tMEJYgqCui66uTCUWv9AFUaOwJ7lqJtvUQL5d0DJj+7ZiZa3Q==
X-Received: by 2002:a5d:64a3:0:b0:20a:7931:5b91 with SMTP id
 m3-20020a5d64a3000000b0020a79315b91mr18423211wrp.388.1650981219106; 
 Tue, 26 Apr 2022 06:53:39 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 m35-20020a05600c3b2300b00393ebe201a6sm5504775wms.44.2022.04.26.06.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:53:38 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] arm64: dts: mediatek: mt8195-demo: define PMIC keys
 available
Date: Tue, 26 Apr 2022 15:53:13 +0200
Message-Id: <20220426135313.245466-9-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426135313.245466-1-fparent@baylibre.com>
References: <20220426135313.245466-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_065340_798861_B73C3CDF 
X-CRM114-Status: GOOD (  10.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MT8195 Demo board has two push buttons connected to the PMIC: Home
button and Power button. This commit adds support for both.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
v2: new patch

 arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index aa41df865c9c..810e69c5f7e0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -246,6 +246,17 @@ &mmc1 {
 	status = "okay";
 };
 
+&mt6359keys {
+	key-0 {
+		linux,keycodes = <KEY_POWER>;
+		wakeup-source;
+	};
+
+	key-1 {
+		linux,keycodes = <KEY_HOME>;
+	};
+};
+
 &mt6359_vbbck_ldo_reg {
 	regulator-always-on;
 };
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
