Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96ECC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 15:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wK0CnlZOX9M/iM8SewTczZ0sLEDRfVMf5U5O9npWUVY=; b=m2vZPOWCyZMkNaf0tcpx8K0tHo
	m5FHYFnkAoomZQaJf7R51gVga8zvbzBQlKwY6N9cGP6XGoNSbdE9Vr7AN+CANbjMgKApX3tztv3Sg
	kvfuVidU61lOz20WTq23GFefCtoR46sp7i+iSp+lZnmBvQJ+hgasWnGYwqpU0iSPesXTxj2DXogwD
	OofkDdSBisHcHuiKHQgKlK7Kz71SypluGS2exj+UHMcweRU92WFKEIyfqgID8shU3980+m8GSTMmM
	M+MLrsoHpavcu1dmnm+wg3ZRR/ArooUb3/AB+HsEAnK9w46RC3B0HNf8LYAaUt9F6lgktxlIxZl4K
	zzr9Y4nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyaRe-00HPi3-13; Fri, 25 Nov 2022 15:16:50 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyaMj-00HNVo-7g
	for linux-mediatek@bombadil.infradead.org; Fri, 25 Nov 2022 15:11:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wK0CnlZOX9M/iM8SewTczZ0sLEDRfVMf5U5O9npWUVY=; b=gPy/GXEz9aViobRulWeqoayxFW
	Wz1mKBrxKLb1a9m7r/G9JQCDX5fOtWDzocSz6b0Vf+SrZ/ICyZGzPqshVVT7HZ8h2Tbshe36zcE54
	n1OlQqZ3cmv1vLkQx9RyH0bt/xTNt3L8EvtPooKELey5rqj63buVpqW9qZKkMy606ZdLITSxjY0ek
	dPLuCy6xwb8MKKKOX9YHVnPjLvJjiyaIGGQEfm83ZGs8GngqqpFkCZDyHtJn6iiyHIrDMt1GZ0KMA
	t9+ePltAv76nC0B7+hS4WBVJmNkfnmVWHQcenQv/coROzN2nT1KNjZtIxL8ygIcGANom7+Pg0uKG3
	MJCPsOqw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyaMZ-004Yfv-1W
	for linux-mediatek@lists.infradead.org; Fri, 25 Nov 2022 15:11:38 +0000
Received: by mail-wr1-x433.google.com with SMTP id v1so7159331wrt.11
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Nov 2022 07:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wK0CnlZOX9M/iM8SewTczZ0sLEDRfVMf5U5O9npWUVY=;
        b=AjMhDKUSXlx31DgwVj59ktOHNOh5SInBB3Ica2qU2iTSFLl0FwgV5TPGAfJdydc+KJ
         n95nGRnjpEYMuNDi51sGoLqUpiUkP5MK2WGX6s/JbwPTziQPppNxTM9sFxdB/hWC3WXB
         oth989ifui1J3CNEn8NUdXx2nNr1MOLgaF9nWIW0QXBvQxjqDtphj2q4g7GwmxrlvLC8
         bewP7mKt06c0/hh+nio3CDoQzJHYRkRm/WyMY5ZdE4saUGPsVPGgr7w7SXI4pGQRTBII
         O0kM4fldfkHrqeRTbInIEFAS01RUwVUzzmWGYO7/eqpKytOJMn4tQZL1EwIvLpfXivaI
         yF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wK0CnlZOX9M/iM8SewTczZ0sLEDRfVMf5U5O9npWUVY=;
        b=DVPSQbXz1sWwgnU0qMr7atvFmpUnI6kEUDmD8ZOE6672C8zyjBj9NZzDBGPqvhVOr4
         k/Pa9xP7NQvmF7tSZYz8B8e5M90WgfPLbJQxjYbJvZ798sYTw8zu3/Ko3kz4w2vTwNrT
         CqWCUIz/Sy1O9DHw++yemVr3KWpZjvigsgSGf1H9tdMA65EFKW3jTGMkPCN0QEf1adBX
         V6FaIaXzMOwbt30Bzslwqq/qp8uuuxvMXgLFY3tYzDChoYBXLoavLY6N35bocFwGTRao
         DHbiNviCbyqKhxjjIlF4D6Szl1/AKgwge6mvvZJmigarNCDUakDaXaJ83FqChA1Ev6Mf
         CtzA==
X-Gm-Message-State: ANoB5pkQ3ePVGUVO9z6bzWrWm8AU7fPdjfZ8Its7bFuSkRTJ99sENA/a
	3sWq+gkeTDng4ocztCjH2MPYhw==
X-Google-Smtp-Source: AA0mqf4T1yb35EpIiyEZ2qo9ePUN9VXa08cg2ZMi6OWKY9wZcGVA3BSKqkuf73pxaZ1l/ntdNVH30Q==
X-Received: by 2002:a5d:6183:0:b0:241:d386:f6d4 with SMTP id j3-20020a5d6183000000b00241d386f6d4mr13377172wru.707.1669389089975;
        Fri, 25 Nov 2022 07:11:29 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id w10-20020a05600c474a00b003b435c41103sm11565885wmo.0.2022.11.25.07.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 07:11:29 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 25 Nov 2022 16:10:19 +0100
Subject: [PATCH v6 08/10] arm64: dts: mt8173: change node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v6-8-4f589756befa@baylibre.com>
References: <20221005-mt6357-support-v6-0-4f589756befa@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v6-0-4f589756befa@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>,
 Fabien Parent <fabien.parent@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Flora Fu <flora.fu@mediatek.com>,
 Tianping Fang <tianping.fang@mediatek.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Rob Herring <robh@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=sciAdvxNeIHiHj/noxHzFC381BQRCLfnWiRAfVX/Ztg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjgNsXQ7iac4y/5bvYvfe1/XziFY5k1T+DtRd9Rmg3
 xQh0OBSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY4DbFwAKCRArRkmdfjHURWflD/
 4nuSKT8b5l8xDKS+q7gXOeVYhoAwNCl/KmRiV4oy4YMsbQpfEAMAYjBGM47Pwn6UdymVpk7+HeDXqx
 qRP2Aq2917yfRFh5xLKCEzpwIxTzQYu2xuCgBy1QCJ9dEAoK4FlzZNC4pkd4VVt2Eme2EXMkjhECQG
 u/QiQOridfxML1KnAkkl2gmaPKXc6g1nupW5ki8kNUy51+h98SExHp/K3ep29xfj/XALTbSuO9AI+e
 oW4Fx/T+Frbj/YS9tLQ8kh43rvv0hrkq7D9X0j50QsQb6cYHLuxTTIigkNCXnKJ406XHi9z6laXRZ2
 r292CcCk2xCCHqUlHusYpP8lV/LOj17WT1m+E4eBbWUQIe8aw/c+Yrtk16Jf76Eq3y5D5pKpQ1loJ5
 0wd/sEMOJ/hAmxN2ao/LvR/qOWqyaw4mifXIvebOlTys1NYhj0IZS8Aoi6I2Bg2nGBCJvqYUYrKrVZ
 ZKTwod6OyfzPOlazL5rXpJACTsIpMIu4Yaq0lbD8fBR6sfwE8DAwy6tiNY+8sSv3k/wHjy2rnWohp0
 EE8bkTdxUNg0XmaddcRbv0jJzm7S9abQyz1D0T2IkkLREXgkw5H2cbf0zIuCKZ872BAySimW7KxQ8G
 PZ1gATf0/CAjzm2pA6SSG7WzbmR/NgOLj4S3YD8Dp2TihgbAfrPanSLGskhQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_151135_373119_E906A8DA 
X-CRM114-Status: GOOD (  11.72  )
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

