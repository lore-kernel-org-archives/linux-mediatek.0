Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77979C636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 18:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YyBzoWonyroiVWOV9YyUOPxjVW7NIqHXUCfTqPDs494=; b=zRXz+J0fElLoUq
	LyhTaJneT0cTNAcDrZLm81fSTp9W+yBEaaSg3Znl1OCiF5SNfPctONWAmNyu9TQLbHDwcs0pRUXzD
	bLABSjevIs/Kwc8FKNYwJArK3JLHKI5PFOGYornFW7wQMun/ehrBALt895UJGG6K4MPkuQeU9j/8v
	D8qK1ZwvX4Ctq7KyxtwsWIDK6VxJ5lUCsIFMaKCLLx1bqpqTPEb22rN9mBtNxqyGIMpOqqOX6LPe7
	xzRsYa5216npiu/FULjyZ/+nlcsQj9S8XFSNcTT5ZdR9uNI7gIcZ15vM71QINuB5itV7rH9clbHE/
	9FDFHutZNXmtIO3eN4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQY6R-006v9u-PI; Fri, 10 Feb 2023 18:26:31 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQY5N-006uf0-PQ; Fri, 10 Feb 2023 18:25:27 +0000
Received: by mail-ej1-x62e.google.com with SMTP id dr8so18101620ejc.12;
        Fri, 10 Feb 2023 10:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyBzoWonyroiVWOV9YyUOPxjVW7NIqHXUCfTqPDs494=;
        b=ebLy1htRwAGPgbF4vheWwt/5UYmixRi8gd57rvXUC7dUEqTvLJgMh3/BgPbUsv5XlY
         pmQ5wje3aKntpnAOSHtpUDeHVJsgmwHPtJzIUVFn4F5+t3wM2EIlqRH5QljT/bGupf1p
         YE/Jt3Q5CEeXA89z+ybYm0JqLb/L6qgFrY5rUD2vORu6X9rLrt4sfUCOcDP5lOEwPCSh
         Buvpt2eYPkxkPpDFn6abMQI42nxoXYz0SgnBqSQk5Dj/hQ4rTwXWz0RuBhaD8tWfU39V
         wf0o/hZzd1G6rfpYWdFoAhzSHF5/oMnwT9RU22FPp2/Gqv4iQjarvFf/EVDiJhOLv/6S
         /F2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YyBzoWonyroiVWOV9YyUOPxjVW7NIqHXUCfTqPDs494=;
        b=sdyOuOrHWix1/K5d6ppCexYkspy1tEbYEs7mDsx/QomZLEXzOstIgu8yJ65x/YU5LO
         IcxnV45Zkjqyw5MoNUPChhBecYw0n8cBQKj4P3a03dwPTgdUvdTC2wEYTtQmoxQnCkGx
         r9ZVkvB/NI7JAxd4SxH5UGOt5tkYZMcfP54KUbtchqDA2YFXr7ypOg+uI4ayHcuQZuYt
         Cz4JeJoRJINjRT/OpNOwDZ//WAhe963zRmtmxPTLfrncAk0+1tHrMAwl4jmNgo5Bmg+i
         TQLcf3mB6pWBG80sbf4h5L/Mk+JnNx7f2qNI8NZnByZiHx949U2LxrweLRj4rS1ELECR
         Nj/w==
X-Gm-Message-State: AO0yUKWThyUQPXMiA9UylG4LzszVU2Yb+uSa/tm2GTOzyynuJsnOe9C7
	kDA1nqHNYKVexJg5K0aVTJg=
X-Google-Smtp-Source: AK7set9xA/Pdz2Tf7LtUnn5pvUgmMkZJr4RCfb4ZnexC6hSS+IRoYOLRpI/4WFVbv7fJ1z1XAThcng==
X-Received: by 2002:a17:906:7952:b0:884:b467:ae4a with SMTP id l18-20020a170906795200b00884b467ae4amr20535503ejo.64.1676053524019;
        Fri, 10 Feb 2023 10:25:24 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id 4-20020a170906024400b008aef19f678asm2708966ejl.165.2023.02.10.10.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 10:25:23 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 5/5] arm: dts: mt7623: add port@5 as CPU port
Date: Fri, 10 Feb 2023 21:25:05 +0300
Message-Id: <20230210182505.24597-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230210182505.24597-1-arinc.unal@arinc9.com>
References: <20230210182505.24597-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_102525_853482_3920226B 
X-CRM114-Status: GOOD (  11.18  )
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

On the MT7623AI SoC and Bananapi BPI-R2, port 5 of the MT7530 switch is
connected to the second MAC of the SoC as a CPU port. Add the port and set
up the second MAC on the bindings.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/arm/boot/dts/mt7623a.dtsi                | 24 +++++++++++++++++++
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 24 +++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623a.dtsi b/arch/arm/boot/dts/mt7623a.dtsi
index 2a50b5c0c933..bcf909d58a1c 100644
--- a/arch/arm/boot/dts/mt7623a.dtsi
+++ b/arch/arm/boot/dts/mt7623a.dtsi
@@ -28,6 +28,17 @@ fixed-link {
 	};
 };
 
+&gmac1 {
+	status = "okay";
+	phy-mode = "rgmii";
+
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+		pause;
+	};
+};
+
 &eth {
 	status = "okay";
 	power-domains = <&scpsys MT7623A_POWER_DOMAIN_ETH>;
@@ -79,6 +90,19 @@ port@4 {
 					label = "swp4";
 				};
 
+				port@5 {
+					reg = <5>;
+					label = "cpu";
+					ethernet = <&gmac1>;
+					phy-mode = "rgmii";
+
+					fixed-link {
+						speed = <1000>;
+						full-duplex;
+						pause;
+					};
+				};
+
 				port@6 {
 					reg = <6>;
 					label = "cpu";
diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index dc9b4f99eb8b..642b1c0a96ba 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -182,6 +182,17 @@ fixed-link {
 	};
 };
 
+&gmac1 {
+	status = "okay";
+	phy-mode = "rgmii";
+
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+		pause;
+	};
+};
+
 &eth {
 	status = "okay";
 
@@ -225,6 +236,19 @@ port@4 {
 					label = "lan3";
 				};
 
+				port@5 {
+					reg = <5>;
+					label = "cpu";
+					ethernet = <&gmac1>;
+					phy-mode = "rgmii";
+
+					fixed-link {
+						speed = <1000>;
+						full-duplex;
+						pause;
+					};
+				};
+
 				port@6 {
 					reg = <6>;
 					label = "cpu";
-- 
2.37.2


