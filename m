Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F963F47CDA
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 21:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLUdw3G1Oa8h+gUfTU4WhFpXDYDSf42qjb0ihw6v2cM=; b=nIOF5KvoQASAIv6ZvejsoE7Xn3
	aM4gUzwu/atvkOF/9ufjpBFM14lIf0++2FZGZhcBUZ0ylo/XbLI5vnwEZdRT0YBFchFK2Hfg7/eLv
	ZQ9RfcaWeUpJgqsSN5Jlgx2Wfh18iXLV58eRq44T/42jiARvw/FbRVfyyMf4mNub7rss9VHrnBYhH
	GKfC0KRgFajAusb/Jbi3DAQbwZMstAVDmAAGfyH1dLEbW5WLaY4ximDP2yLRvreExi+Ba3lxniBI/
	5w+cai1VFPxqvGrGHtUzBBw3uE74/qudmwj7G8bEA0EQWuFlNDuvdHIJad5PTtr9jLeWlIhL+ADq2
	dIXV/5UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFrR-00000002YRq-1tdy;
	Thu, 05 Mar 2026 21:03:57 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFrO-00000002YOM-01ZV
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Mar 2026 21:03:55 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-4638e238094so4815610b6e.3
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2026 13:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772744633; x=1773349433; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLUdw3G1Oa8h+gUfTU4WhFpXDYDSf42qjb0ihw6v2cM=;
        b=IYcPaCa6o93cnLGB4LtKydJqyKpEjDwqqJorWf9GxY/kJ1j/GglYGusi+ooTAJ/1jW
         iw3mVM6ev+5kEVog9qQymjoa1QvGairVq0hHsBnMI6T/jCWAsiZC77QBTLalZTuTaa0Z
         D+f86V0uDjngcmpwoCnlThkLHPaFKkTZesFp6HvMoOtzhmjPaNCTXaHieYbgcSb9jHpc
         r3WIS7+xf57Pd4X/JyMFmcpKuuELPPvkBob3rLtezUYV8D19pc70YZNdGqLTNRUZO1HL
         +FhTz+k7alaT3V3tcnikbhQXOhtYXOs3eTjWQ6XigOt5VNgCjYUopTbe4Z95f6B2V74q
         V70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772744633; x=1773349433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yLUdw3G1Oa8h+gUfTU4WhFpXDYDSf42qjb0ihw6v2cM=;
        b=fn2zhsBOONOEROn1/TqKxLhXUVjeSOr3jpJ6JXts1EXu6mpqaf4FyGFn5oLhHhJH5s
         ptrh7ZxrZX8leY9gkJP22tVGYBJdZd6DiW+OKvqCIM/eAJzsaUvR416ryZFHU9VJn4pp
         87S/y6lhSTfNz47YDaMMCQZT2gbcWLcCY4A9+4B0nfq/O3WRj4K0L2iKr12GWYxaSOxI
         8L1x4rfhFXxPedT3Dm/UHqm7Ree3+Svwhj5Re51nu1IUH2nzOzOnh5tq5DXJAbgQ4KQl
         w36U6O1KywYK3oUYSTkUUUZC4u0iz+C4qc2VPFq35g7QQ4KUlKMWwAh//V+A45DmXfGG
         jCiw==
X-Forwarded-Encrypted: i=1; AJvYcCWz6+YnhkbNQPrX6PBvmaCIK5/9i+JZAngt4tU0k56/IxfjNh2FRGAPca4teQujKa1kRglYAgLq/UqivekZhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyG+FHScVayqs8MXVgCoP8ly3Y5iMCyT/hbGsaLJ8Z0ZM2AnxsQ
	jK5quQjqt3KAYtXR84qt5GZHcgtHG14HuS70dklMpZo9dQxiUBBpOmo9DTxBIL7+zxA=
X-Gm-Gg: ATEYQzxThK24PiOORNl6YOMDvBRfPITL3QnO99XEy3IW83ep6gwQr2DUWeqTVlKgstS
	LcngbQ1lyaoAeWTJl641pQngUfS7pgbrGXug44PJZEBI7OCXLEKfoOb/qKC2KYYSI0Zu4til4oU
	QQgh9sFcqwyL8/LCieLvEGKPw0YKFBQzpDUtIu0Ws1jJ0ll3B8y4Lm8paCUtAN4f17mRn+Ai6/8
	eVIgjlkLctRD1wB/6FNYyJL0r7YmacJk7CzPOH8YqoERWwIH185t6SlHOyXG4hBIXHyQkhnk5Fw
	CathvgVpkXioBXGfraP8oCz1crk93yaSNSaYDWay7GoSj2eE8Dh5zxLRN4QOdwLs6SDtpsciM4n
	9RFlmkbZXtsYpp5y2MoFJywj/rNU+o8UqA3Z8Xf6iev8hFhy/E52dIVDrz3uUO7sxlxLRPxFzoV
	ld1swhAtUtIIPiYp29Iab9CumB8Hn+
X-Received: by 2002:a05:6808:2f19:b0:450:5e3a:6f1a with SMTP id 5614622812f47-4651abba7b9mr3988299b6e.20.1772744633230;
        Thu, 05 Mar 2026 13:03:53 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:874e:e775:4f67:b3a5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb5d0a8csm13729227b6e.14.2026.03.05.13.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:03:51 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 05 Mar 2026 15:03:18 -0600
Subject: [PATCH v2 3/3] arm: dts: mediatek: mt8135: fix pinctrl node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-mtk-fix-mt7623-pinctl-name-v2-3-a68854a51065@baylibre.com>
References: <20260305-mtk-fix-mt7623-pinctl-name-v2-0-a68854a51065@baylibre.com>
In-Reply-To: <20260305-mtk-fix-mt7623-pinctl-name-v2-0-a68854a51065@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=853; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=/r4SI0+l+6elgaFXyZuBmLqw3XZThStXnYZaeAp4zQ8=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpqe+q61fQg0Se4w258lQkpeMgGkcngGiz+mQG2
 PE0OP0joRCJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaanvqgAKCRDCzCAB/wGP
 wB4FB/44iUz+SQ+oBg1sMW6mRRlWtbIgyWdNLTCnbkmFf5/Wt/t1uBg7CWi+dmFQLWJT14tLQD8
 SAokLqmtlADTwENqEwAoVt0yHBpfOi8wVJeGpEduZ/XzYwtrrkyu1HxqlItk/xOSoBwMYbB28tq
 sDVTUzJH5rVjw/RhpTtfl1G/Xr5Wj+ObdMiYx5g+7SeWj701+9ZvcJAKexlYq7/Cis6jxpBanK3
 u1pQdLMP4X+lyvjNeTTJgm+bQMZr87PmTWo8w9HNXDggixpEmBv4x158fQjNyz8iH5DhNwqfOQ1
 7Y059ibhtO92ANFuKyStFLcOJZGoZDdByIbMZfmvok6i2M2f
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_130354_084674_6F0304C4 
X-CRM114-Status: GOOD (  11.51  )
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

Correct the pinctrl node name to use the same address as the reg
property.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 arch/arm/boot/dts/mediatek/mt8135.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mediatek/mt8135.dtsi b/arch/arm/boot/dts/mediatek/mt8135.dtsi
index 0f291ad22d3a..b03bd980ec37 100644
--- a/arch/arm/boot/dts/mediatek/mt8135.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt8135.dtsi
@@ -148,7 +148,7 @@ pericfg: pericfg@10003000 {
 		 * Pinctrl access register at 0x10005000 and 0x1020c000 through
 		 * regmap. Register 0x1000b000 is used by EINT.
 		 */
-		pio: pinctrl@10005000 {
+		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8135-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
 			mediatek,pctl-regmap = <&syscfg_pctl_a &syscfg_pctl_b>;

-- 
2.43.0


