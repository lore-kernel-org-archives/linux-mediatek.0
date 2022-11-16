Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6975C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L20WZDfB4Ry2n4XJgPN1jHb78hlwsc6RiwrnFa7B3l8=; b=W3oR0A8cl/dLqVQBt1s2BqPNAc
	oGb+oIwG4+nUhCcSSRzZYD5PNBz7EtmL4UkYg9UazYGlzPexs7XRB/TU5XffO2bf5ppMwKSVsd+rJ
	0hLtwl9n3vg1pUFwiwanHmiZr1Y4m+xom58m4wpiu6uWJDuMHHWlH9i8onK+SVpxnx9ypFdaCrP/O
	2WT/PPHtNYr8prpZ7glBq6IdPWZ/ZWxQ9UJ2i01C+M0X16/XiZkG+7WBjj7mIJSOJq+7nqCw/NLR1
	o9QBCgATiBnCzTOEONkT7K+va4Tn+EH9apZHkOWgzvF73wCmn9qfz+EvKo52dh2g0kZaXEMMnK6/I
	Yvv2DYVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHsA-003aav-Pp; Wed, 16 Nov 2022 12:50:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHry-003ZyC-JR
	for linux-mediatek@bombadil.infradead.org; Wed, 16 Nov 2022 12:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=L20WZDfB4Ry2n4XJgPN1jHb78hlwsc6RiwrnFa7B3l8=; b=iV5sweh7UqTIMJ8xlBkdYmCqrc
	NXXbBYgPPOtUkJ83pEsWUAhmtpRXh5pUPyWKRQUD0sJfj7kmydvpCJa8P1W9XZtveD3lUzf6eYP/J
	ZveAjlrD9c491IyrJHzT/7/YODRVOZxCo9kemFdcgEx05iOx+s2xiFe1JHztjRSA9t74imPnMV2DM
	nsxY4qa73DimtomFjwIy2lvDKGo6ix+nq0esGQuTK9YYNha50o3mzP1JA/xgo8lsIubbDqOwN1WdK
	NCUJLAPAB5WIQDS/Ai8e0nZUqnOldP/dcO4lFdu4YHU8Wda2zvS6Pg8FvUIoUO04kuHfemt910AID
	ZYNqECmw==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHbv-001Ja4-G1
	for linux-mediatek@lists.infradead.org; Wed, 16 Nov 2022 12:33:49 +0000
Received: by mail-wr1-x431.google.com with SMTP id a14so29701899wru.5
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Nov 2022 04:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L20WZDfB4Ry2n4XJgPN1jHb78hlwsc6RiwrnFa7B3l8=;
        b=2sgjlHBxqdWwtFrhVJB8iW1yxKZ2cpU/ng8+DLzHv8kTH5P754dpAb3i+qLO59zY5f
         tAbYx0PuP86OqDYnTs72Ms53vR2exDNmjxomDaB1gm+YI8W2cH9nUil+4gtWVF2dIsSf
         kfGCzQmrbL0lMaIGwqi0MHWl5PvA3WRK1o6j1sAqDG3QEShsMYMvebNMKEzg15YrS427
         V53Z9em/ftamEDGvGQNrQ2jz0zQs0kuSa+JfZzLdfHY7lTULX0agNVup6zZeluIWF5T+
         bKzHWjUvuL35aGT/PJraaZr5q+NopvYkIF797b220EBOjAM5WNn4T1MJdmse0c6hrdoL
         q4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L20WZDfB4Ry2n4XJgPN1jHb78hlwsc6RiwrnFa7B3l8=;
        b=dFfFb1lIaaoIVm5ZVC7WXJWwiYh5yZa2XjA57/5jq/LHVgR4mH2GFFyOX6x9J3EMgq
         TBI7SuS9Hz6MC48vYs1bbK6qKIwvMFfqH5VikBEcEDI+kHVCR7uUP6BkBUVdPIKmx2gQ
         VQLQDYF4Oe3M/S8GWdlirgIKxsCXYRL7yfd12EcjUoAljUoeC2fduF3HwwoPCuGDavtx
         Y7w/1VhYuQJqRpp6+n+jCCPM5WxSV7zMBFr1Bgb2+dhaWO9VUh3R3kAj5SgV9II5nqui
         t5piyEb18epAZ7pyTEFlNcpemp6vDbSUwMRpcCdygS23DEb6m9aYQACFa8+NW2shAbFY
         mDsA==
X-Gm-Message-State: ANoB5pmNmI1OAmmsdyM91sriMHwsbAsfGO9vFmjDb+hLn1iUCeAFWI8K
	xMZRPX688M+Xyz1vIrc6VoDMiA==
X-Google-Smtp-Source: AA0mqf4khQTenypGm3STBNu3vcrYHdKH0RrgEXM0QSi8ly0xCjMQR/O3vU6YbPaA5xg5D2azqPyn0g==
X-Received: by 2002:adf:fcce:0:b0:236:6ab6:a51c with SMTP id f14-20020adffcce000000b002366ab6a51cmr14184436wrs.54.1668602025031;
        Wed, 16 Nov 2022 04:33:45 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id z13-20020adff1cd000000b0024166413a4fsm15051607wro.37.2022.11.16.04.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 04:33:44 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 16 Nov 2022 13:33:02 +0100
Subject: [PATCH v5 08/10] arm64: dts: mt8173: change node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v5-8-8210d955dd3d@baylibre.com>
References: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
To: Flora Fu <flora.fu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tianping Fang <tianping.fang@mediatek.com>,
 Fabien Parent <fabien.parent@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Brown <broonie@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-rtc@vger.kernel.org,
 linux-input@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=GBaNKrSWOOj3IIbimro7kSOdhFcUdE4vLaUrLB+TgIA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjdNiegKLOAjGwCfqePOAUGXCPeQFCHu6Os+/wzG+t
 VrGU5r2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY3TYngAKCRArRkmdfjHURdAID/
 47+yQajMgunjJTszn1jqdu1ck+aZ9AoF/9pqC/z6QZxgFuZ4f+Lus/UfxCPM179jOS691bjF3ThMRg
 okUP8GEWY138LjJk2dmziTA8OH+VMdXO8SSiLwjX4MBGIFuak6cH8wPpFZJb8IxsaMaeF5jHk07WOg
 MgXjeuhcsV8rALPPv9B83HRjh2bBbmokwxh+jsW0r4jEGuwMwlr3xjXEjpCaih888TVWpq42og79Y3
 IVKUQEzoKuI19+dvvDO1FBU47Asy5BNqj373EP2qbYCP32qpyHUL5EHmn9rGMfF0hYUP6LnLUbqIX0
 WfTtBJvfc9IFgRIM7/04l7Z0j5HeUE4WQLi8jxSRs4QrFE6JQ8GsdmtdRQ+R4WyiamiSvxqf4RALjF
 6kOXgfCmCIqn2Y2s23SRIFiX0vlqnEkYh6B9psS2wqyWZPwMQyQsIgUwrbVQemHT8iMBBUflJwl1We
 864KwSHLGPnlm0J1zRvNzETRmg52ri4tSfANr1rb9MtiGTQFh0zFAhHAAmm8ELziYZkZWOK5jHzeul
 Wqd0vAV4OlB26cuo545E5CUOL/Z9+rW8fd0h0mdUOH9piOoR+vcz8pEggiRJIfDG5hbO2qCl3/MPst
 wpONj0Xw9HlH3ko32pbBvWMn3AW2BOUpLH6SXkL31avYSrnNDxXVrwz2fNbw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_123347_633789_F3BF3319 
X-CRM114-Status: GOOD (  11.63  )
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

