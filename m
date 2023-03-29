Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30213C761A6
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 09:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dNu/yHcKe6XE6P0BXTDhxax+BTFAlj51fPshovNp84=; b=eRFuxRCRMxvZfGv8jf01oXmNKp
	o3wZxyhygj/Cb/zXOk5JibNboNmYg86Svqy1gHcX6ndLeWro4O/scjJ85/iRAeQKQVveaBsUc6Zre
	lDM9leIICvwSzy2AMDKUYmn+Son3+H/aQMuVj7AQHHuBstT2dicNf2xQuYkEt3qjUI0jOjOZsMhdu
	OPSqojHrV6CcCzCAAYTSnzazRG6tqSa269ZLjAfOASW7yBGING473jM9+86k6m2W6w96Dc8c7MK8N
	QZ+zMptI0taq3Ujg9ksLkxzDZQ+MRBE291j5UdCuSWQyPWhUmJBeeU2ma1HoQ1DUpR89irUnL6Wld
	EYH1xg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phSN2-00HLTl-1x;
	Wed, 29 Mar 2023 09:45:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phSN0-00HLS6-0n
	for linux-mediatek@bombadil.infradead.org;
	Wed, 29 Mar 2023 09:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+dNu/yHcKe6XE6P0BXTDhxax+BTFAlj51fPshovNp84=; b=XuaQFcsWf1kok/Xfdg1ZD/ihet
	sfJFv5QRMOClzZ4868f7UFNp5uTywMlAN3Yt9CdyFum6PXdOlgzV/nHq9+Txzf0qem8DDHicH3QwY
	OriDY8zbvBAJdyCLjMrXaxs71IaGan8Bk0GrDN/kyhJJH7abJzTezhHDlD9drODi1GX3fImJ/aKNd
	8e7HEKdxQVp1+QMd2hna9Ktl9tKtXKBhKvFMxIkZMGWQREQ/A3QoAL+DRioll5ryA9SkkZxRAgR2x
	DTaqmLXf260D74LiX4Lx8zrHUMn/+9rivnrMex3C5FPLF8s8FCLkGp5JvG+VA7R5W7a0jiOXxBe9K
	j8UEHcrw==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phRaN-006oFS-0A
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 08:55:19 +0000
Received: by mail-wr1-x432.google.com with SMTP id i9so14861640wrp.3
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 01:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680080111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dNu/yHcKe6XE6P0BXTDhxax+BTFAlj51fPshovNp84=;
        b=dKS1xTQikBkAUWbUbeweB1ty6gQOw+SeO0EHFM5IRhAHfnBlSFyqc66JDBGwE8rpeU
         DBQUZ5svqAPbxxsNgJfUPBeBlaeI2DbgH7OPmBEVgozVYxKhhBpP/+HeWNdQdObBmBrp
         YC+jBA7THSDU55qqaU3NsuTqmdBPVj3N7DZtmd77woHo8fqQtNJvKB/gtEyS4HsQ50aI
         WgPBQHVeEcRX0lQl4uFLsJ3G4EDUEu8g4Hi4etlghnqGBUOd9ElfZ3f5i5uJ4xFPyPDM
         aXZofS+s8/9jFRv7Zt4VViWfyEpQROVWcPEGE84SUaFTHvJzogQLCg81jmREgjL/O6Z5
         Z1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dNu/yHcKe6XE6P0BXTDhxax+BTFAlj51fPshovNp84=;
        b=fwGgjSDrP5+NlH0/2HtdS+lMkUS7rnqNSxvRIWqKgWlXp/+pbStvfN9IYj/8HHmVx6
         aowWRzwhsKrRGw+t7sgKutFRr3VqeSHHRX/YYBKGq+i909GchKRR7J7n8bf7xvvEl7Iy
         1h+PkbzHz8/1+mRpYdrcEvfIMZgzqyAsCULOjJCkz7PVUhuzLoXL/BEi4RVECMOXn+/7
         YDAGQov75bNcHoYq9CT5zlIxXTgRDFs9ZOHKsc/Cot6X+iWc/pqpclQKFzmPZ1HA0Kfk
         DqE61ORCgWhXjLi+YE8Rs5QiWHi/3HyxTKcYcp94uki/aLUjEP1+YBvrDZRSaEJTvWzv
         a9wA==
X-Gm-Message-State: AAQBX9fqVooCKiwHsxJaHHwVNTE3HfXq8YJA0/lW09/+E/puvcOciVfI
	rzM03ROOghRTKEaX4bbXC5gEhg==
X-Google-Smtp-Source: AKy350Yop67dGlqTahEGHCkmUG4PMP+3YKBPdodkLoUj/Dtd3ftOlu+EiCPbc8oNU3rF7KipQ1oUYA==
X-Received: by 2002:a5d:564c:0:b0:2de:bb7c:ea16 with SMTP id j12-20020a5d564c000000b002debb7cea16mr10684242wrw.37.1680080111205;
        Wed, 29 Mar 2023 01:55:11 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm29571964wrr.69.2023.03.29.01.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:55:10 -0700 (PDT)
From: amergnat@baylibre.com
Date: Wed, 29 Mar 2023 10:54:37 +0200
Subject: [PATCH v3 16/17] arm64: dts: mediatek: fix systimer properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v3-16-0003e80e0095@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=+UMf7BGwqr9S9F2Y6i650CVFdcd7ChQf7ofZelsC0lc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkI/zciyXZEJx+wDiM8bVq7sw6ESNQTgEPnH/YfxhD
 O322rreJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCP83AAKCRArRkmdfjHURU6/D/
 9aZIBu2JCMOBy1o0zsHejPIphVYBMwQyultm5Hz7EUY5aqRCcMsPjLTgjwExXP7LqGp6q6eZi518r2
 IRZjNcwS6Ennm0ctF1xXhqQWFStjNwqEe6qsbpFZqoB3jkHCbw0/QhHkZeRW43MKNx5+ySCSQame6p
 VQDrKptAb9A4COVHwjYpHP/z+D/cAxTzvy8+Hrej/d9MiEZOk+f3JqY4beERhDAVU5WzkMwgZmd7g6
 ziBaFMNjKlkyB2n6B4JK9/h4nClQUhwsGzi5MXgZSVslxHJBeB3BiIaJ5K0tAfp6JSZdIGzij6Jk6/
 yL18+39TBTWoVOm8DPnTkvYloe+Jf+BWyuEZv4UKulDrb2hYkdd3JFi/rqgBe2YQo+Vl3W+Rhuq0O8
 hO1BkGfYni/WPNReiYhFqVcABjl3K+NNxzTnH246MF8bkOWHJ9FDectOPsKS9YfWWRlzUUuB2TGK3S
 AqPCtlo29qQHaS0QShPX0USmK0ZsphSKHwaI9AHxAVKyDOL75tap1PYNGd2RFTdJODINyWmQy5P73B
 S5TjGjqeGZrT2K0onCku7GzwPSbMDpLdnMnhK1rXFxw+ZP5FLsvUobOxzsORyGKzN6zjwiT5V6j259
 0dkDiDnJBmMID2uO74ESIVA2nQG+k22SuzuD9lzGzZMCsdX2ncuwQc494KxQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_095515_917488_D634FB9C 
X-CRM114-Status: GOOD (  11.98  )
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
2.25.1


