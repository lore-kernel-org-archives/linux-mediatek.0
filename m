Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197D2C6FD1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 13:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTwUwSLISXupiYzHSzg22kxdlXmwobHt1s4yX2iCI30=; b=qEB3RSp6ivjoT5JkihQMwC6nTt
	8phi7uJvekdtoqOlxj9zhwK9zm2fIlU5yPEdsFm5oJ502JuAPH9I0tT78vtBveBEJ8bqagrlgc+0V
	hMuY/qNp8oHzArN8woQtDkZcCrJsdTD46Jt66caOd7aBGkq5VsLAcGboYijnpCJEiZuKQNVievJIo
	wTTqQq7sx0zG9nSSNSXUMPIrRkokdvVC5Xgzy7feAinMcF6f7VRuuXtFGkqKpixqXg5tIAMYndKjw
	NwVP3WzdqxsCjAy5sB5HynW0TKvztlHxjUhKyXd2F+51xzsyp89stn50Jy1Fz2n0opni5pmPNXMn8
	iy0Ag5Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXpU-000ZnW-SG; Tue, 07 Mar 2023 13:58:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXdq-000Uqj-Ke
	for linux-mediatek@bombadil.infradead.org; Tue, 07 Mar 2023 13:46:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WTwUwSLISXupiYzHSzg22kxdlXmwobHt1s4yX2iCI30=; b=A2xiOisdJ2xozCpnO/JfahXfOJ
	npj2JkNDcyVueN81SdDwDkki19gc1tVfKDcjmUbQNII1GWc6xxW45rUWThwKUypI/CI0KWamfK9ER
	6oSeC8S3ioPPP7Ik+lD7tKeHHKbIQAA0gDXy4z5xqW9ahgc284jpKGRvdTDrf9t02rLtG+n3u+Q74
	oFbCbzCXsoThipg6CmHs8BoSy0c2tyrBByrPgvoNSW/6cxJ+RScWBlf4WvtpY0xeeM1y36617QsRt
	fJKqllJkfZt521NERCO8GGGFC4zHA0K65nNXkxvxwuiGNIOeEeJVggnTvhOzOj+X5m42Nrwc1POLA
	rhtiOgxQ==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pZXCq-00H3CM-30
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Mar 2023 13:18:19 +0000
Received: by mail-wr1-x434.google.com with SMTP id e13so12057866wro.10
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTwUwSLISXupiYzHSzg22kxdlXmwobHt1s4yX2iCI30=;
        b=AImREh7EYVUqaehhWzUZxtGIBjaSqsCEYAUilNqh3fIYOwmSqT+WO5874wgxRa4fvy
         8W23oJI9Gd4tFMWSOLaqJCEI65vb24enNrTj/0fnUNfh/xSkp2XPZXT5sLgiAm9WorCH
         ZxfNLZgHEeDx75K647KUzD5wIb8c2HWFwskRNQMmxm4/N5mzEfsULaPRtuafLLtl3nuA
         mo4j6fwhNNe5hpbrGqrePLNWyY8IikTJmV9VTKfJj8mT1q2iYgC7LHMGVSbErXL2GMTG
         fl7yrpZsLnfzUuX59QoZ4iW8S8JrDlPljjLHxK+yuZpjTws1F+D57fxCGsLNbFCV03W9
         rlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTwUwSLISXupiYzHSzg22kxdlXmwobHt1s4yX2iCI30=;
        b=zmnA5ubyhTiESTpqaHzw1tW++wFh3labtDeKV9Wktnrbagw7pW/2n4tdiytS6/MeHE
         af81JpSElMqCInL6pbXVRswEDNwoN1eX4yhDglGgVTgyi+Ak6L3tEm8OikLinUcksGDz
         STVSix9dsJ3S1sYkMzlmV+e2ZPS8fmDffS+8k7ks5f5STRqVF7xFkPlai5c1BxPY0kQO
         X9v5qGUAcBf1SDRqzQQNj7a2dLTZ7w3tRh+VMT12sfq6jysFGIRgqIA6pe3+plA9DUwu
         inm+1u76F1oStGDW+xZ01nW0UO0iTH0HDbBZogjFqhaf6sVs25F4JBilWtKVZXK7dnpB
         vQfQ==
X-Gm-Message-State: AO0yUKV/3iLaeP4YZ2oHHT/IKEg49qLE8zCc2DTEFh1TNlmZeYFIqxJk
	MdPI9qzOQMD/7UsFGz+9ACHX2A==
X-Google-Smtp-Source: AK7set+9nhyca70hEIORA9ihk8VcPxx61Ick2qkumdsaCswY2a3eyZE2HAhVl6yEdVLnbUFukGskdg==
X-Received: by 2002:adf:f448:0:b0:2ca:e8c2:6d29 with SMTP id f8-20020adff448000000b002cae8c26d29mr9172709wrp.7.1678195094636;
        Tue, 07 Mar 2023 05:18:14 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:18:14 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:42 +0100
Subject: [PATCH v2 13/18] arm64: dts: mediatek: add ethernet support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230203-evk-board-support-v2-13-6ec7cdb10ccf@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1366; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=7pGcYrXi2hCGwx6B3T21Sna5Awy1U2WZgVtirE5+dl8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmF1I9j0+IU2v2RxpbCwB2my0kNnwI44xhyeFNR
 uO6Rj5SJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hQAKCRArRkmdfjHUReT/D/
 9f/Z0AlnwLWfgxZfW4BDsRbISoCY87TTG4ZwHBUYDz6dJ+Q5sFIOxtg1DSXFWtYQYLS8+OTyZjJo/k
 Kv7O1Q8tD+UZ9YtLtpVxaH8WPckQSURjbCj2RG6qfSjQ5HOqmIlqwKIA3f5My78bfgDL91c13lgqp2
 7kOqOYp+B6goWCpZie3cYo3x4YJX2CCxP8dRWUHtjNh8xjzene2wm9aE1AiueQImqOKM5JdzDgJB/F
 WgG98pjdtUwuMQwgIgusg0tqmRpcVPBV/ksXv5jfkCz5ie3vAdN+r0iW2nYl2XnWca+9+PybQ1Kiav
 iPC5W7rHj/9g4+hXLCUr2ps6H0mkKibdairpalxKAl52SpL/h+LvgcdNqglIo8LkhSapfD39LmbQvb
 +Gr1ZIyVtvgrwlw0TH0MJ9W/SRo4K0wS4AgGKEcYxKDIXVLoGyQNVfYli08WFbsAx2cFCz0ekHWhxf
 XjmHYQFB3V92oJ5wsconzyqMsdtnu6ZLfCqpeqYfApfDHBJD21z/WmuAHS8X1kvHWux4qUq3namym2
 KRTA5Bi61m9IAnee7jxsL8++vm9eRuBNyjNbXjdkUqF9D5q/Wu4ujvDChlplnsqqH3PLLOV9oQq2Qm
 VFKhU3cTPyELITQ9PtDYkBevPK13IJ071Yfgb3jilFL/j7Jsump9OUHJzK7A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_131817_196958_39B67E41 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

This IP is a 10/100 MAC controller compliant with IEEE 802.3 standards.
It supports power management with Energy Efficient Ethernet and Wake-on-LAN
specification. Flow control is provided for half-duplex and full-duplex
mode. For packet transmission and reception, the controller supports
IPv4/UDP/TCP checksum offload and VLAN tag insertion.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index a67eeca28da5..394a5a61be59 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -438,6 +438,18 @@ mmc2: mmc@11250000 {
 			status = "disabled";
 		};
 
+		ethernet: ethernet@112a0000 {
+			compatible = "mediatek,mt8365-eth";
+			reg = <0 0x112a0000 0 0x1000>;
+			mediatek,pericfg = <&infracfg>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_ETH_SEL>,
+				 <&infracfg CLK_IFR_NIC_AXI>,
+				 <&infracfg CLK_IFR_NIC_SLV_AXI>;
+			clock-names = "core", "reg", "trans";
+			status = "disabled";
+		};
+
 		u3phy: t-phy@11cc0000 {
 			compatible = "mediatek,mt8365-tphy", "mediatek,generic-tphy-v2";
 			#address-cells = <1>;

-- 
b4 0.10.1

