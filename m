Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19352C761A6
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 08:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQkdLJH1pptyvVBYIMjpYp2X0cm5UeAwV0k97lbZ02w=; b=K/DjWaktXsySrEeDJxeR6jha34
	E/VEGFwlBkG9qek8t3kb7jToEXZq2nOeiZ+i/Z7X/q4JRDnhiPulUwsq+RL0hFpAiqf+ybF11yl6F
	9RJCcj9ttlXc5Mp3RbzH3xdmrPViNX9HJQ4TwgMgtVmaeLLL7ifHnDyaVMkQTLcZ+qAtVToCRfBok
	gWsIuZSghzApoRkYqEUz/9aCYz87sUs4jzgEy674WtbzktWbasXNcScP3mJXx5n7g0l8d/Igs0oWW
	T+ZVcv4mSC3TcwfpWYdzrGfrao38pkg5Xqr+Cja78dHnubHzaDAqRpy71xxMTijD/++yI5Dn6ePiT
	+IOLnKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phRax-00HCum-0x;
	Wed, 29 Mar 2023 08:55:51 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phRaA-00HCYd-1V
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 08:55:05 +0000
Received: by mail-wr1-x433.google.com with SMTP id q19so11776339wrc.5
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 01:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680080101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQkdLJH1pptyvVBYIMjpYp2X0cm5UeAwV0k97lbZ02w=;
        b=6Uuhw4SZ8KNxmIU4Rt6ZpiMUKZYxMhTqOoR37sn8PGHMs2isNDy4uGLZzF2o0uw8pX
         ulMW0V2DVv+YVbH/uadcHuLAIybTZ80u2nWIbGvQ82p9tRhhtJzNZefQCtSBkI09LFSv
         Fw5pYDVuhn6noZc0ATKT5gfy/xdQUIW6a7cvRqeLbNxet/Ae+TS8tqt1cP7F5ke2fQKV
         Qy+Dhtfkwt7wM2HDrIRZQgFWb2KIzAWu622SP6/9uqbOgDW6uRt4AoM6s/82RDnVBMfm
         JyjzX4gQaUvewZ3ot4mRo2TrXKdUHcAt81Pz3QUJJR/WcQNdw3RvmqpujxIxDN1ylX8c
         M5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQkdLJH1pptyvVBYIMjpYp2X0cm5UeAwV0k97lbZ02w=;
        b=k/exq9hsPVLWSwUNn7FZnCqv2zUTURKcVoWDNmGpGwJh8dEsfeDnJ/L1WlgOfcdtwZ
         DGemzCb5JU2tI10jPeE/5Ba/rK51mUKS0cRlNwmM1jVJ2cHkwkL7Y/SzdHakWEXXQ0RI
         0YS307PSdP7fYVMx9gy6PMplL1Bcbh0iMSUgnfU5ZjcV/nR6MqHoFDsQ2JnysmWuNX0P
         WL7SwN/fTZMDEfeUbXxXABqSepMXhHQFnkhXJ85vRGjTOqAflprNmiip3FZqHR2/zABg
         c/nXHI27WDi8zVIGU9/+a9C3Texog5quTlDfuwnfRCR90Ned/wAAPeoi9u1iIUJpecXD
         aVIw==
X-Gm-Message-State: AAQBX9ew32N1MreIIl0chML69HhgpnvRrY1KYAw/l3INBRwdowfE7aKU
	2ss+R776DdiYDDOhOjgOvHN4iw==
X-Google-Smtp-Source: AKy350b9G7J+QMoUbPNcQRlgqmiJdoa79V18SfeBWC1Bcrw810jNbJYGDf9D5khfb8hEy430C3xiOQ==
X-Received: by 2002:a05:6000:b:b0:2d8:2b0f:c3a3 with SMTP id h11-20020a056000000b00b002d82b0fc3a3mr13618009wrx.70.1680080101142;
        Wed, 29 Mar 2023 01:55:01 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm29571964wrr.69.2023.03.29.01.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:55:00 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 29 Mar 2023 10:54:28 +0200
Subject: [PATCH v3 07/17] arm64: dts: mediatek: add mt6357 PMIC support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v3-7-0003e80e0095@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=981; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=mvWYCtO8a3agAvj56gAEer+sR1kkD5/63RgRdiDwnr0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkI/zc5pYmoGfGivEZISvH9w1c8+Z+7eWhfM/jDpzW
 Ninyz5SJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCP83AAKCRArRkmdfjHURXZBD/
 0ZeMwkwsyHSmIA1GlE8JTHKFWbSo0pJ3pPUOCIo2CUyT/yItznGYDlyObZc49myC0vxLcl68loZzO7
 UyxRVrsGTguL5Bc0yzUPCnT8ffQKJfSPwETPqLV0eU2llN9f2QKtF7wDTBCAvpVL7zuanJIu5NIMHq
 ABjyLu152Sql/V65zGgIuutyMITg3mAWgtZMbfgh8TgDsKxwUicXqgMReAOgvoyzOvwEJqKGMhva7b
 Yb9VC+wEJnUBXD6ZLZ2qW4FD5/0UnZzyIJeYhA32jwpmIuK2egTPJsMPokhBd80H7jvI+Ipxurt9mS
 so81b2DU0fOvUHADDl40PBo4MhLGeoZYRcb41AbEg565THDP3tfrmvoLi/vWBE70cmjwuXMcLN3tUM
 bQsoMEtClp7e3WewMIIjQrU2aAmPQygHwegCTaBgl6I9NS8wOL4Ajz2yWqNU0+fGbgpVbyYD25Ixhv
 IBoaDsY9VEAWH0TLj+3XCXHQ29A2isO6Bg2lAzKhIFjZWVZ75MlJ+O0aCEYav+wNIza9GSD7LHun9i
 NRhtBBrxW+Pdcc6kHW+uQp2qS8D1fwu6C4TG2EaYBvpNCSXnXGteyPB2jJV7SsIYTtzgLCDaOmyHVj
 UqmMa0bwvQKZ8+FXXRdKuywJoDdTU+ivaZvQ61GFkLuletdlbBrq+rUXy6yg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_015502_530787_7CF6FEC8 
X-CRM114-Status: GOOD (  10.89  )
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

This power management system chip integration helps to manage regulators
and keys.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index fc7f6d8ae173..2f88562c638a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/mt8365-pinfunc.h>
 #include "mt8365.dtsi"
+#include "mt6357.dtsi"
 
 / {
 	model = "MediaTek MT8365 Open Platform EVK";
@@ -96,6 +97,13 @@ &i2c0 {
 	#size-cells = <0>;
 };
 
+&mt6357_pmic {
+	interrupt-parent = <&pio>;
+	interrupts = <145 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {

-- 
2.25.1


