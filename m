Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944F8C6FA99
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 13:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpf1hef413I/ZHnZ0xEh2bRT+ol+kiWfa5l40w5Sq9w=; b=oylTVojBj2tWkypRa+HEqsURAk
	1ghe0UbZ+drQwszDsyuNgQxgsqPnjC+aclny17jlMxKYVapyE+W51gJHVxmH1hL634EidnDZ1sJtB
	hVpzBKD6tq5fAT27StrAaWx1oMlrMbQLMg3mAwW/eS3+S31iLpnTfYNhFE2zLdF2gnAvzi1Ndwfvz
	/QwrAujMPePeRCwkrB0y6o9I1Vd+rObOhZxGfTn/Va1wMoilck9DKPrM0YJ2U4QKx1/EWrfFhmiu4
	Uee6tPh9In0wZrgcvwzSvgOp2qX3ESOiUc0cKRuOpZRaaTf/0wrxRDy0IaWtDXloDHQocVdj5j0sU
	YKjrcvtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXLJ-000Neq-8V; Tue, 07 Mar 2023 13:27:01 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXCt-000Jgu-El
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:18:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id g3so12084795wri.6
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpf1hef413I/ZHnZ0xEh2bRT+ol+kiWfa5l40w5Sq9w=;
        b=e+X8X0Jsk0dqls3NMDn3fw9zUNxs/YgMK8bfjdJ7jyEvYcQbDTBQ4i5cPpRfRDrxY7
         RX+dEMlZbo9uLbpYdNVajUpBfmKVrALP8e8Z1h5/clxNVXbNtf2/PlDVWN3dU5dKnBAe
         139LXWmAOlv2d0G6EvVX731DYkeHYMK7IP1EEvDl4TDvR//Jvjvf2/TZzMlWLf84rRqa
         oQZ9b/enbGrF09dAhWrYRiB8+6zkWVaVkQICrWFcpJU8ryurGczzw/pd9+pmwDOH/oNh
         xAqOf3HEyG1RZV4AlbpDjtNGLawp/SjokH7iQLaK75z29ZAf1E72XB1c6R05GTG3UQB+
         4AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpf1hef413I/ZHnZ0xEh2bRT+ol+kiWfa5l40w5Sq9w=;
        b=fzi5og6N02WzfhQsEKUbkYotoYQ1nL5M9PUl449g8TqHeDLPTLEQqd9HpTH8FQca9M
         nrfIIfrlvvmnR6WKX4PNRJghJFYi1pGpTgypsD1YCTXow5+Jg5GsVOexjCHHPvq+FJCG
         tEZ00gs1vxTI9U1iqg6+5tDEXAQ6HheBNcZY2F84am1rK8bITEJJ0dw7UiBbV/HnALZA
         H8xbDvL461HC9li67JTuXQi8EFSH21mMyhUixZp3qE+ZGOE5/l/MQJFrmg+vcqgt+fUH
         dKdqOFW+cCGB2g/8OnbNk9kXKZTd5idxW6RCwQIemo3kmhTdFggh2rqB/GQZnJam7Uo9
         Vhfw==
X-Gm-Message-State: AO0yUKVQ887wklriYlQx6krpJue8+BJ1mh1oZyxXLl4qc4fsO+moMVmA
	0zegPuiDStPwdP9V3RBiVMxmcQ==
X-Google-Smtp-Source: AK7set+lz/CmJjmd5k5O2YqV5P10ZAu4CCpWuKjgWkEyawSRDfcsdbkTTVeJWMOckQoUNySBWyiXJg==
X-Received: by 2002:adf:ee48:0:b0:2c9:b9bf:e21a with SMTP id w8-20020adfee48000000b002c9b9bfe21amr12804099wro.2.1678195098944;
        Tue, 07 Mar 2023 05:18:18 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:18:18 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:46 +0100
Subject: [PATCH v2 17/18] arm64: dts: mediatek: fix systimer properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230203-evk-board-support-v2-17-6ec7cdb10ccf@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bernhard Rosenkränzer <bero@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, devicetree@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=E0Rkd0GEdk/nHJRQV7wdWKOEfaqiyc4VUwtoIArZDWs=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmFO37mIpicQ7Ewsa6aUHcjrSr7sOFCTZQqXiVs
 GquIjR2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hQAKCRArRkmdfjHURT4XD/
 4/R7tjZdE7+Z/MhefTnf0HDdf4hPT2y9si0FcgfSJql9Pb/M50GDgqeSJRgo8f824+yCPeEMjB9quk
 b9ZnByxLJPCywhINCYqdD3OGtAClbKLIsHcxcvq2stjjuaQ9HNpmw+rnmkA1VMGS96ZQMKeByTd5Yy
 SJHVcAApoBLpc+cLHKL9sd2K8Un7pxTX8anvz3RLCXG01EegMmB4SM+hqjPZhntZoFTeV1GgD1x+w/
 kw2RUMbcM8LwCW+ZFdWFsGUaa+8Blp+fghC48+Sv5MPze1qfnMlfJH/a1RWp5Dbv3CgunLGs4jkQ10
 rpouVrXeE572TSN8+YKHiDM83dK/io3z7oakBJbb9CJy32SwG3oCbD5sMee5u155pOcQAupkgi9P5d
 II9+WqT3GvNKSzPAZtvM0O8iWNsyg7QI1v6N61UantDJfMoPRfM8AlEd6mRXtziDNY/1oQFg8Sz+nr
 eS5H6OO6tSD1tlmzKiqh+RcJBbTENZflL5GtJ0WDqIcN0/iuCe+eBGbpSp3jhmYnDiy2lJzZIihB2n
 K0zs9IwTMlVaWhYvRpqEwbQnA5PX9Lz8AmkwfSKCo2CgTOsGQB8VHtEw1UCmYHBRFK8Poa+v+VwTIU
 pHbvDP0Akr0NfRXg/NUnZ31ElAnlH9GUaKBikroX9+k21jLGmO4d0egmM++Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_051819_538114_21111893 
X-CRM114-Status: GOOD (  11.16  )
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

From: Amjad Ouled-Ameur <aouledameur@baylibre.com>

MT8365 has a SYST timer (System Timer), therefore the compatible node
should be "mediatek,mt6765-timer" instead of "mediatek,mt6795-systimer"
(which corresponds to ARM/ARM64 System Timer).

Plus, register range should be 0x100 instead of 0x10.

Finally, interrupt polarity of systimer is LEVEL_HIGH.

Fix the above properties accordingly.

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index c3ea3cc97a47..959d8533c24c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -575,9 +575,9 @@ system_clk: dummy13m {
 	};
 
 	systimer: timer@10017000 {
-		compatible = "mediatek,mt8365-systimer", "mediatek,mt6795-systimer";
-		reg = <0 0x10017000 0 0x10>;
-		interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_LOW>;
+		compatible = "mediatek,mt8365-systimer", "mediatek,mt6765-timer";
+		reg = <0 0x10017000 0 0x100>;
+		interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&system_clk>;
 		clock-names = "clk13m";
 	};

-- 
b4 0.10.1

