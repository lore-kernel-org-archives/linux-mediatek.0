Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175BEC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jan 2023 16:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/qGjMKoEF7UDLliJtrbx4rWqxj8RHaEUJHMJYnhdEk=; b=i66SiCxaVOVOUxGyrFvLQkCZNK
	BRcEvG3AezTMwbV363l+VYu5+J4bk3aUa+lpA3rSDayiKPQnZu5XBwVehhPdhHNq8uvdJE/jTq6ug
	SMUafD7POHOxk4Z+1kC+uLiS7N3m898alUOCiZtYQ0EeSXRMXbKaznaaYCiU7FP+a0TxzFJ670IH6
	N2Xx2o18OQISUMMpfISl24tB5ygi2g6f888Vo57VVqGjHpBRDGjg+E1rEoSD5OtpNlP6wUGtRKcfo
	ejOLGPsiwKG8EYW4hp+R9haDc015DN3zz+LvKmPkEeNEA4OZ3TtN2tL9G7kDi3BPoFI/JHTJ82nOK
	Ir7OdHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNRe-00CeIV-Mx; Mon, 02 Jan 2023 16:13:50 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNKY-00CbA8-81
	for linux-mediatek@lists.infradead.org; Mon, 02 Jan 2023 16:06:34 +0000
Received: by mail-wr1-x42b.google.com with SMTP id co23so26700045wrb.4
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Jan 2023 08:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/qGjMKoEF7UDLliJtrbx4rWqxj8RHaEUJHMJYnhdEk=;
        b=JD0PytvfQKiP0KCgIFa224x/z21Y8Ln1q9WsUA2rBHGWEgP0TNt3fs2VbhzQgZ8Fxx
         zyOFsVobxAqzU9WsW+BHdWvDKBYD+sAtpcev4piUjImBrYd075T0kb8INQJwy//NoeD1
         osRJ9fDvpWDQwSxS4H4TENCC81yXJHvHZzQjoFMTMTlIjkCf5J/xicw7J3nlOXJJ18hV
         op3/yMLpH0twS4G7HcRZp0tLIHiz8WDfcbcKZcxMnh4kusWJK+vndljBwV10jvfKcbRO
         UZlEC4TJI7OyI4eotMMBI61tKbwAvz3X1pLJ3kb+yZzdcLWkmQcadqAar7nWSMPnWMeS
         6Yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/qGjMKoEF7UDLliJtrbx4rWqxj8RHaEUJHMJYnhdEk=;
        b=sSr2wK2gOSp6RUHBJ9slt7iZJjObdgJGgIDICCcUhZwrmjTITSDwAvi9z0JpXm1/+i
         6kGpwy/v+l7ams4OBxPg1ql6c4AKHK77nwH/rCQfoJ99x781FO1p9aLZz/P6godsJK1C
         NDyCsGF/+iTcma5Y2mU9ryzAThXL/Jjb4AOM+yKmlJ4/QZOps7EQ+aXbN5vL/DoR11sZ
         SCBZPpdI8NQTofjB0Kxfr9UcMRByYdNCCPbDgGA0uw77V9S0sJok0qhIWk2IHKbpJlW7
         Ht6VEa36R6WXI2QZE1Uxg+UOi9GT92LgF6zsZsPfyIJ9iweeRX8ARH3pkAowndlqUnKx
         cjhA==
X-Gm-Message-State: AFqh2kpJutit8ezkAjwKfsEKct4dGcYfp9b9XrCqrsEEWxZeFNgbz1U/
	ITtIn5e5h+KSVJcjJd1C4i/WAQ==
X-Google-Smtp-Source: AMrXdXvjwZmAJ2M2OTzwt74Sep+YZN4mH/ZAN7DYpa5PXSm+x/oy/o866YahUsqVNq3+XMEUF7gMdw==
X-Received: by 2002:adf:fa84:0:b0:28b:ca44:641f with SMTP id h4-20020adffa84000000b0028bca44641fmr8914254wrr.30.1672675588380;
        Mon, 02 Jan 2023 08:06:28 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id t5-20020a5d49c5000000b0028cf987d944sm11868020wrs.33.2023.01.02.08.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 08:06:27 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 02 Jan 2023 17:06:05 +0100
Subject: [PATCH v8 4/6] arm64: dts: mt6358: change node names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v8-4-560caaafee53@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=0w3mp8M+1h003hGCAyGu3KsDIgwbdfb6BOTNA6p/zCk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjswD9dCSutgNMv2SYoxP9C4n46Q+Vf4BRrXmGchHp
 RGXeIyuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY7MA/QAKCRArRkmdfjHURfoQD/
 9d3SIM5wFv7fU5vzlhESrtOnWCDmlEA0vox75QLA78Ow62ca0QtUwYGB+1/h4VZQ5qqC7RqjBdZqY9
 zrZ4kSK6ZvbNVA0if3vaJwVgFYJ8GcnkEhzTpGWaVGCZfO8qpshGL6SgfLdEjuZAGJoHgO/I5vJh5x
 vhVAGwEW5OvjoxODjaWZ9FYEGEbsuQKsQBwAoiH4Yjl5uXOkmagR4v4+HfiXYYNs33fqyCCcvjo+LG
 XRVqvFlg3VpKs9B11+lXSE/XW5lmC6dcHzyqmiUoca54U4CQd8+BOYC8PJ9EwKQRKZOATIBie8zpfN
 ExLlS+K6e5XcmBEbDbLz07GghJ6CvrokSsp3xr75pmfnwq3iRXOkpdzsDHlbjKQYjQP4w9qsFHhEO4
 mIbc/XCdzbIoEZBhl8Gg4Jx/ED0WV5AmoSHQlW8vUv4SQyZ3E9IOFIq/K1Sk3lxo+7ivHX8O3lXDZx
 9kkTylzGYDaD50mnVIlzG00ngfT8RpuIhSVDdOiD5MWtmlAR4euYQp+Q0J8cRpYCpgP0z+7MPVWuTt
 W5mRq2JSywvM7rBpM33v4uBdp9Zn62NCpRbVBp7GwcHgtj2o9NHXFsfY2xkjIN1FAs+HyACL0Atqxe
 mF1/Vx/TWVlLTMcCJRjHe1D1aymw8ey2KDg0gwfo/jcnaQeS/6/uZSZQ17Eg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_080630_374180_E66193C1 
X-CRM114-Status: GOOD (  11.44  )
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

- Change the node name from "mt6358" to "pmic", "mt6358rtc" to "rtc" and
"mt6358keys" to "keys" to be consistent with the generic names recommendation.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index 98f3b0e0c9f6..b605313bed99 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -5,7 +5,7 @@
 #include <dt-bindings/input/input.h>
 
 &pwrap {
-	pmic: mt6358 {
+	pmic: pmic {
 		compatible = "mediatek,mt6358";
 		interrupt-controller;
 		interrupt-parent = <&pio>;
@@ -355,11 +355,11 @@ mt6358_vsim2_reg: ldo_vsim2 {
 			};
 		};
 
-		mt6358rtc: mt6358rtc {
+		mt6358rtc: rtc {
 			compatible = "mediatek,mt6358-rtc";
 		};
 
-		mt6358keys: mt6358keys {
+		mt6358keys: keys {
 			compatible = "mediatek,mt6358-keys";
 			power {
 				linux,keycodes = <KEY_POWER>;

-- 
b4 0.10.1

