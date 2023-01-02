Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE1DC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jan 2023 16:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wK0CnlZOX9M/iM8SewTczZ0sLEDRfVMf5U5O9npWUVY=; b=dZBECBKRj1BF7Uj+4Y9cF/5bI3
	xsn1cWd1oUz57OcT1pP9LLOAw2I7PnLiw7gatqsPcKH6ZR07c8Dvg2sR9hjuWy0thwDY6NrZJVtnM
	H+jV2iz4qC5qt0+/3xZdq3QEzCeyW8CWN2e7AhD0MQY9yJyvZZZwrCZao6eEABX1ragAp2B+pPgI0
	nnw/f+ySqntoNhd1ZSXinqakqd5gpAhOukL043jo389l74Mp5aMbuNqBhcjyXj25eDF49e7MUpL4Q
	SCqJkit9iGacSEX+aaKDbEkyAAmRR5c47QuaaNdxWXyLjm4FLogoAClY2hMH3OZzVZnD1ysUBodCN
	mYIVJW4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNRl-00CeLl-Id; Mon, 02 Jan 2023 16:13:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNKZ-00CbB7-E8
	for linux-mediatek@lists.infradead.org; Mon, 02 Jan 2023 16:06:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so20943940wms.2
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Jan 2023 08:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wK0CnlZOX9M/iM8SewTczZ0sLEDRfVMf5U5O9npWUVY=;
        b=2FYgXeeIyu1zUMzH/LZdQxaJyDELlBn2SDXUP4TeGozc+CIUzVBKYvJtKUdiC3dnyJ
         kAh+w1SXjD0g5OL7RE2od7x2qLw3DF4CnnBsNsJIG2lz7JEtRt9SJv1fUa4261UTfBEI
         tZ201UfpbSTLIfbr+aEU8FRzTjc1DpUVbtRbguXYY9TeLHHVk2ktIWq6/CCFO8TneO33
         S/UuABhmM+NRus1/COyp7oKQsQ1oZxKHyn3Y7oh6aMf5GXDFRmAJIqIUN/3+iq2SDku4
         Fy74IIUiEzI6pIB/PFNL81KAr0kRAcQCuQodHUU0v8heTP9FsNone5AbHiZ8eaFxGQX8
         ZCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wK0CnlZOX9M/iM8SewTczZ0sLEDRfVMf5U5O9npWUVY=;
        b=fr2fiCQaoRCP8/RU1cnYDyeCfhYQlXjTkgkzpKLzGeIn2riVLyL9KhtdBF7vUEhSj3
         fM9z8CfQ4BTKEz29PzhmIJDhcp5mbNsd65Hp5s1cgNSrlxnHjHGvPziGtS9qwmKnobqZ
         gq256Mv5mxv6G3aS/KlczJJyA8YHa7t4r/aXZn/AVSWAu8JTMdQxYQYb6qfey/A80SXv
         ZNNSDAxYuQvwnnKftF680em8SbOQpxluZzPQCxwm8r1BWKwMovN+gDIa1qWOUZyc8vg7
         JlqFr46R9tk03iUN78bLybyOkkVlAi2G9WpaPkH6rDNNRfUXrY2Nrof32BBDby5n/R5d
         t9IA==
X-Gm-Message-State: AFqh2kqnD5D8kn4XKQ1D8ggt8rntbfxwn6w2HEwvs5d4TBMK6077Ocbg
	dYFvgoJqLFlSzkiPwN00ZRghmg==
X-Google-Smtp-Source: AMrXdXupzOcRaXBrx7YVEhlZ93ZDS9ldjMOS7DXOq9vFmlo8LA1CwXuVnAMi35jYHSvujzgP0Vk3sg==
X-Received: by 2002:a05:600c:16c7:b0:3d3:51a9:dba1 with SMTP id l7-20020a05600c16c700b003d351a9dba1mr29457203wmn.20.1672675589712;
        Mon, 02 Jan 2023 08:06:29 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id t5-20020a5d49c5000000b0028cf987d944sm11868020wrs.33.2023.01.02.08.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 08:06:29 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 02 Jan 2023 17:06:06 +0100
Subject: [PATCH v8 5/6] arm64: dts: mt8173: change node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v8-5-560caaafee53@baylibre.com>
References: <20221005-mt6357-support-v8-0-560caaafee53@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v8-0-560caaafee53@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Tianping Fang <tianping.fang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Fabien Parent <fabien.parent@linaro.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen Zhong <chen.zhong@mediatek.com>,
 Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Flora Fu <flora.fu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-rtc@vger.kernel.org, linux-leds@vger.kernel.org,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=sciAdvxNeIHiHj/noxHzFC381BQRCLfnWiRAfVX/Ztg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjswD9o0BjsP3A7sJoIm9QQ5qlHEZuTTfCJFpCVdWv
 uPpfN5eJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY7MA/QAKCRArRkmdfjHURe5uEA
 Ckh312DH3eo7sZbijdFcHI5VVIWhIUuOiMk0O6cpP1Jinf5vEQ3F5UxonV6IAtQlCnZnbWsa282XkZ
 hHL8zClliOlZtAQcklTp0hTL/bvJ/XrnmcLE9x0AuCSNJoGuYQD4n5tNn5INUZITXzf6iUT/EPQ1N5
 ficr2TG6G00ONIM0JOj+rBnXar6RLI3y9BSyT4Q64HrZRZNp2nenNU69xeI3TxovZhwyJqNELnUSg2
 f2QN4RfbHkMKnRRzS7ha4LP9x2ZztEhSFuuPHtnRdxIFBntCjhbGhDm95iCr8lCIKmVnU/Ut23q/FK
 FZg2Grd3kBSilbxMaW1xrrH3XhJKvZJ6kJsNrVFuVi4tsBrGv6RtUGHWdAZu4eqdGtFF7VCfaalXT9
 DNbmInwZBMGr7sFAZ0+6NWGWtLwlRS9UNroM7+MHk5+2H07rE4V8setqk3+amFGkEbc3lLclaE10Zy
 T5cSLg+AFkorQEOOnIziWBkp9bZJmcG7/hOwY2lX4WXR4MtqqSVjyUYa7sfEJF5XybKKcSZy3oAMdu
 4akf8M8WfxzdSOVggVqjDVmq4mCryqMn7j+mDNHNhmCNTqtv/hBcgCkgTyRcgzxD/yryiyo9JKaGZ3
 c+3uhvN5VVHgGuXyyjxLkqkTxO1G9EgT6daxyCo/9DQTsdteNXV1F2ZWTtQQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_080631_587082_400CCC99 
X-CRM114-Status: GOOD (  12.33  )
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

- Change the node name from "mt6397" to "pmic" to be consistent
with the generic names recommendation.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index e21feb85d822..a8f5c48e1782 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -913,7 +913,7 @@ &pwm0 {
 };
 
 &pwrap {
-	pmic: mt6397 {
+	pmic: pmic {
 		compatible = "mediatek,mt6397";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 0b5f154007be..755df5694234 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -300,7 +300,7 @@ &pwrap {
 	/* Only MT8173 E1 needs USB power domain */
 	power-domains = <&spm MT8173_POWER_DOMAIN_USB>;
 
-	pmic: mt6397 {
+	pmic: pmic {
 		compatible = "mediatek,mt6397";
 		interrupt-parent = <&pio>;
 		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;

-- 
b4 0.10.1

