Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD75EC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 19:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L20WZDfB4Ry2n4XJgPN1jHb78hlwsc6RiwrnFa7B3l8=; b=ehj46yktd2mrt6A5EfD8WDTokN
	EWUF1372q3IC0ypOr01ETnGZxLFlDgmRWVuNrI5Pu/AAk8nRblw1hskZgGkrJ0ko8bhgnGr0IKkm7
	epQ23xtkZBuHnMZTU2+n4xRAfpn4wStXHlS1sh1ZvLs2kOj8suyxc7Tb+dl6C3yYNEh6j/8oX28Fg
	PkrtfLxJxYyiCBmpcu3xJcJ9IO/I2FaF/pfGlytXXoqSNN2A/H+2iqjnF6c1IwgWyf27kUFOtB/oZ
	gXefPhQUscgLvT43Ktn4k5HqrcefAvkQ+R9XjpSWiBe/yypoB9UXdx4VKadmD/TAkCmbPJz0RGvZT
	vGa6jzrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osUZ3-007y6J-AL; Tue, 08 Nov 2022 19:47:17 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTaB-007ZtP-UM
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 18:44:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso9652630wmp.5
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 10:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L20WZDfB4Ry2n4XJgPN1jHb78hlwsc6RiwrnFa7B3l8=;
        b=X86Oj3VmY3z3bN2okv+TrWhSiG93o1+Bir6b0bYrqyp135B2umDW7xqcJkVEhTmZ/Z
         MB+gadlvP0VfJtGVAp5at1NLQlI/Q5dFTB2ZeFTNY9KhKetvTIzlDVitWUM/bzArLYWq
         tuM8IJxSMFTMKRa6NzZ+vshthnbkHEe6spYuIXbSIK8AiFYtPY+XM66rxFlOrBk9ommT
         Uye0K15SbIfzFfgRHXGDJME3j3k+sssu/h0VH0g8kQGIzBB9/CtO80Rxjeb1Ckrnt2r7
         WmEozoJR+lxVFcwH36Cba8WYcd9xCx14eNO73I9vB951UVnhLzERbJLmq7UxHPe83dGl
         iQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L20WZDfB4Ry2n4XJgPN1jHb78hlwsc6RiwrnFa7B3l8=;
        b=pESLwvWxs8P+NCDxe9lFmk+zNSE3O3ZUD+uZJ9ciFas/PXhfFakrlvuTgH/clc0cPx
         H9mok5GNo30OA86axSphzlN6PdLugVfSXI0YGqvUo6zOJOuEoq0KL+JqRgZJ8M+F+Qg6
         gpQFp1XOt8Xaxt3T5EUhs3D5Fu+q9z0i68KJjugRciJBS3R97y4da4MUnI03r6PPUlM/
         wDC/e6sn8xlLJtJ4hD7+p1npqLDiimlAZdtI8BVQeaEcBTPDFf3ZCME5dcqIQoYEANnA
         uPaKNaAGSjdS0snUpKFZB1bD39+xTNvVjrtAaZ3f/9w2T6ZgZJGODo1BROshQnFidTAb
         v5hg==
X-Gm-Message-State: ACrzQf1tMJADqNw7kSOw/V73EyzwSvy3QUT7J/HuBvznBD4AI/cL3Ylh
	vAmC28uSa0K5cMXojqP3rWUZZA==
X-Google-Smtp-Source: AMsMyM5AarrbeV++fniByKtEg7T79sU7xpN3t7OCokfHeIAVTF2NddszH+lHi7AY22w1kclM/wF7Ng==
X-Received: by 2002:a05:600c:33a5:b0:3cf:6fd1:d94b with SMTP id o37-20020a05600c33a500b003cf6fd1d94bmr34657965wmp.52.1667933060018;
        Tue, 08 Nov 2022 10:44:20 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id m6-20020a05600c3b0600b003cf6c2f9513sm13564009wms.2.2022.11.08.10.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 10:44:19 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 08 Nov 2022 19:43:42 +0100
Subject: [PATCH v4 7/9] arm64: dts: mt8173: change node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v4-7-5d2bb58e6087@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
To: Fabien Parent <fabien.parent@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Chen Zhong <chen.zhong@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-leds@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>,
 linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=GBaNKrSWOOj3IIbimro7kSOdhFcUdE4vLaUrLB+TgIA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjaqN6jIHrLK5ba/9RboyYvb9OrGAYOnQPvqiWbBzU
 up+6X4SJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY2qjegAKCRArRkmdfjHURRjvD/
 9UtpSjMXT2IvEQImHV2/Je0WrnfGK0wXBLP6+2wFX7Cm13Kz1MYbkybczKtN/pJEkMKc4Wpyt5WNuH
 W85VLgZ9dVoYeWP9jbas1EqFtF/1iuKRNiEM2Fy4PpZ3Qx35kqkdFGsOjGzWeX9e+wevdfdOCAfOCJ
 x+UDnQjULKhVTzyg4oTTIcas78RdGgiVyTKjCt5ZHfbAGkSk+wAjaR9igJ/6YR58lQLolRGekMbu94
 irH5Y7fhDOqZ61gZXpMXBjYSbs7iRzNrBlYhmcPIC1WZMbrpQx7n/d8JiuY3eS+1bdBxi3TBuf9u43
 7uYveEt/BKSarifYxJVE14YO4XMSC7R5mRcCYx32dYzWhur5g27wSN03f35EDjI+zdnlkfUFx1q/lZ
 vkOmirajHD3XiI4urH1wqBdpLUuoJm41YYtvCd2B6VAPEJ9md4r9Ko7IXkvR1BZ+3r7GRToX7YrRLt
 Sf2HdzPmmVXsLC1yt1F/UGwXWqKjLfWiT4FRaN/WTgqLYXTarDtLO5UT2ul1KbrLYvwtuc6OWhbXEc
 J565kVwabYoFdgVCCHmaPSoAUOYwRCshCzbc6cpLDfDKppLJKN1MWzcmsC9K8YLUieuUeJoVvT9KAe
 m5oP/cT9MvTgJjnnKg2Gg0hr/dX7fJ6JjvgG96BiUj+aTrYaei5RPPCnnwEA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_104424_041155_21B38756 
X-CRM114-Status: GOOD (  12.30  )
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
with mediatek,pwrap.yaml documentation.

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

