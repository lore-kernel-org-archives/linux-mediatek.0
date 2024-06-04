Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B357C27C52
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 06:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qw6WC+UXhi6yL4LfVmRqUq3NflMpRwcFjuQvOiKMoxw=; b=ivkp8bOpUK4TGOArIM7qjxwZYT
	ZrnQfMAzmW+hJtfzb14CLdRCgJl6QBcNBC1RzuZ9gKJumoKKD+IhNJooM3FgyvQex885zFvfxMpFF
	D8JD6589abRgkJ2bDBKh13D4aiS6RHScqNHKobmjnc/i6RZ7ViWzTUNvsiutHttVRDmlQI848xP4+
	vbh91NX3FumCEebruX8mzarG1Ft/ZaEAWusO6vQctuXbWfNgoQG8f+5yznpo4pYDuYAX2rm5OmkwJ
	8B1bYjQRYwWDoaN/Bpw3YmL11pPhMeuJplMXulehbCaY+Jby8/xaNb9jbE3qVkM72lUR+tn631uPh
	JtGO3Djg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sENtO-00000001PqD-0DEp;
	Tue, 04 Jun 2024 06:43:34 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sENtJ-00000001Pne-1q1Y;
	Tue, 04 Jun 2024 06:43:30 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a68c8b90c85so300699466b.2;
        Mon, 03 Jun 2024 23:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717483403; x=1718088203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qw6WC+UXhi6yL4LfVmRqUq3NflMpRwcFjuQvOiKMoxw=;
        b=RJKZvUI8Q//7s+b/1aW/xPdXKGGPbIxnG4lvh9pxY7zrZKdGloT9fgGZtjo2gzsCem
         UFv29oDn8QMsJHODRUJALtGdrtlVvl1eZUZc0jwLe2eDXRFJGbhlNeSHlvZQfOqi+66G
         u6qMxbNBqG/CHaNdi5bS2S8mn+zsEiaTGO8z9LYFaZrP8xYJKnS7PX4Gks5sO+CC3Smz
         uFhNcKyDj4gAOLBuD/g2F0wUKbNf8dHwFxrCxY2VCr4kqoLRKKlmmso/uAt/m5y/cQOU
         3K+tBkcdqmQti3KZ4tEJ1iF5v5YlasYSbB6b+ZRU9rYq5rTMnzcrPzaA9a7Gy1JdJVg2
         gI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717483403; x=1718088203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qw6WC+UXhi6yL4LfVmRqUq3NflMpRwcFjuQvOiKMoxw=;
        b=Oqk6WW+ZulnBdom/XbMRcfxMIDDeXC9kdHZR4JO53gAsCUGa468UIY+vFr3AFS3Qy4
         yMt/B3m9Ep9K8yy1Fx5g2eQWLZG0Phs8IRLXvQCh02qM5x1sKx/GgTU4mfmELvtBrokF
         XwKFcltfCDvAPVnDemWJgCQP1OFcC+pMUC0sEOkfP9dYj71YzNqw7XgPAt6M+1J1yx9e
         B/AGuIG3u53oNvgXamxXONyH21kvMJifX5CR7oUghkYy+MSrOZZFXVlPBnL2Juxr+WGE
         yHF7BbVlLoYDI/b2JuFlzHRTfSuuGdbD676LTB+CwehYodg7s2BV9zwzGn2+YeLffCnE
         Ku8g==
X-Forwarded-Encrypted: i=1; AJvYcCXnxYJxHledcTAj4zyRRraFbtPmq53ZGdRsLe0PKlBfbw6IAsvvPqgwOMZ8eDzIClVM9jMbIfbG6uw5H9K1uLfuVnguzii5nbGIbU9JIgahb/mSxT79YHrXC8x+ycTXQ//8vEIL733nbJq6kRClcmxhpbojZ/V4+uo=
X-Gm-Message-State: AOJu0YxZbAJzi+Z0DDYN6/31Z4LavjbrNliTnPLcUEBxHSIMN101Pysc
	MSvYGG84jC23piYkitqrB/gFTlHdj/AWh2ogXhUMuys5F44VqrIa
X-Google-Smtp-Source: AGHT+IFM3r6LYUVRqzzZNZE9WJH6tfwcLl5rjHZzDzgNIDhWshPhkcaNi+w42odT4TUUFKx5/iekBA==
X-Received: by 2002:a17:906:65d3:b0:a66:4b54:9c87 with SMTP id a640c23a62f3a-a682234b89amr931690866b.76.1717483403197;
        Mon, 03 Jun 2024 23:43:23 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a685b935b5csm547744066b.206.2024.06.03.23.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 23:43:22 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 2/2] arm64: dts: mediatek: mt7988: add I2C controllers
Date: Tue,  4 Jun 2024 08:43:02 +0200
Message-Id: <20240604064302.487-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240604064302.487-1-zajec5@gmail.com>
References: <20240604064302.487-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_234329_486098_8B5F710A 
X-CRM114-Status: GOOD (  10.38  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7988 has three on-SoC I2C controllers that are the same hardware
blocks as already noticed on MT7981 chipsets.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Don't put board-specific clock-div & clock-frequency in the SoC dtsi
    Thanks Angelo!

 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 39 +++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 27098f724b7a..aa728331e876 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -124,6 +124,45 @@ pwm@10048000 {
 			status = "disabled";
 		};
 
+		i2c@11003000 {
+			compatible = "mediatek,mt7981-i2c";
+			reg = <0 0x11003000 0 0x1000>,
+			      <0 0x10217080 0 0x80>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
+				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c@11004000 {
+			compatible = "mediatek,mt7981-i2c";
+			reg = <0 0x11004000 0 0x1000>,
+			      <0 0x10217100 0 0x80>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
+				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c@11005000 {
+			compatible = "mediatek,mt7981-i2c";
+			reg = <0 0x11005000 0 0x1000>,
+			      <0 0x10217180 0 0x80>;
+			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
+				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		usb@11190000 {
 			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
 			reg = <0 0x11190000 0 0x2e00>,
-- 
2.35.3


