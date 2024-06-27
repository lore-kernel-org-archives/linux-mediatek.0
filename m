Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8F2C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 08:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLrEboALRZdxdEXYrbHRXF19aT/W7AkEgiNEUpYGTaU=; b=kGajt40BCBxb4EnWcj+9+AkkJa
	cOQPcW6J4/aZNr56QAofeVESsWbygiiEAeQyKpQaOazFkvA75u8jvnl3lnab2rLzVr6QVEnZ8uJri
	V/VLObYfJ23FijS7Y19RofscltXf/oPWLd16JeadVNMNYMGQ7qbp4Z0PWfFFCH+IdyeQ5zWdJ9P//
	Fqs0PP2jKkkHtu1QPW/qeDK6WhI8cw4JIir4NYKf7gb/EwZGVsMkkozQGQSY2/fBEaAcs7dLzmSYb
	Z0n8w5Zf1WzCXPN1ubn2pWFFP2kTXn+vwq39BKOI8wdIu0mYPfr91skxfFfvZmLSPuYMUXF9Cy9xS
	5gD+hPQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMk3c-00000009f76-0o2r;
	Thu, 27 Jun 2024 08:00:40 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMk31-00000009eug-07xB
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 08:00:05 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5c2284616f7so718156eaf.1
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jun 2024 01:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bade.nz; s=google; t=1719475201; x=1720080001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLrEboALRZdxdEXYrbHRXF19aT/W7AkEgiNEUpYGTaU=;
        b=eBOBwy6icagkB434sAUHU4rN/u7pfHzCpYZq18jzwthz5wGjFL+lcJd6c0ya8ODrgt
         Ur5x3jANsZWJC5Ygc2Gc0INTyjJ+Ht/amyk9jSpgP1MFoi38guBSP32deLeJMIihcgiG
         GD7giowIyfUXvRrYI7SE/BOZaLuwzFajaXBBKTROoEuliMRr7TfpnCCbV0Fvmk3fkvQo
         lDsOmzNPe44EbC3NLfQnofkvG9t1jqqa7E1NH1VHLzbba/zYcdCd9l/RI5L0d51/ZO/A
         J4PWdGxBjViVtN2yzQHBwX8QiRk0fP/lfowfdUlgbe2nYDMI9bQNU0X28mOVPtsXKXdC
         kU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719475201; x=1720080001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLrEboALRZdxdEXYrbHRXF19aT/W7AkEgiNEUpYGTaU=;
        b=TKa8tbgSzo1XAgDGRzm+V8T892eNbAR7P76KZIcG4QW0wvba2kYejogVX7wEydr4g1
         RaXl7j/kfYFwVB/LLLE8QMGMOdfcPV/7m+X8BJFr0LTTi7jgwFaVDIzjm4EZdjyBlBi/
         kJcS5e3Oqff3Q06f4al0TiUv5YAyNl3fT8ajTbivZda2a/Caff1t3Yps4DWDTyzu2a4E
         qSeqBe7+/rx0Q7rSM1VlQut7uJ1OWceuYpaE9eFq4h8gXzlI6MSloq9E/2PFy3YK8jkW
         OhC9xI8ZQQQ79Uhvils6hZ7kwFMhFiti4JRYydvDneAEpaWuye0A900wMWNQ7q4wZ6EU
         aN/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXloJ/yMsJUHZv0/gC+gVcUfUy+SkRdKmYspAMMqGgv3sBcap122bdwVwua+jwXJ7GhTCzoLZirtDCPSLkD0yafnEjR0gHRAjYEPDYeAqn/jMA+
X-Gm-Message-State: AOJu0YxpFG35c7zZTw9PaZ8rovfQ9gjeoIJOtZIpGPtILFVADOBzKvbx
	HIdsmmgxUjBW6e0RjAcUA7aDEa9+0kP6HK8GwRy48OaE8mDq1GLAND21ZpY3tQ==
X-Google-Smtp-Source: AGHT+IFkN0ubSaKPqjXkvWd5Aw4rBqZo9lhwryAwfy3XDy7tr4/U2Sfjt2ekvvF7l3gOffo10mAi1w==
X-Received: by 2002:a05:6358:7e47:b0:1a6:7af3:22ce with SMTP id e5c5f4694b2df-1a67af32e24mr94322855d.2.1719475200751;
        Thu, 27 Jun 2024 01:00:00 -0700 (PDT)
Received: from localhost.localdomain ([2403:5816:cd6c:0:6d45:ae2f:1ead:bd58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac9c4cf4sm7181895ad.290.2024.06.27.00.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 01:00:00 -0700 (PDT)
From: Leith Bade <leith@bade.nz>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	frank-w@public-files.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	didi.debian@cknow.org,
	Leith Bade <leith@bade.nz>
Subject: [PATCH 4/4] arm64: dts: mediatek: mt7986: add missing UART1 CTS/RTS pins in BPI-R3
Date: Thu, 27 Jun 2024 17:58:56 +1000
Message-Id: <20240627075856.2314804-5-leith@bade.nz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627075856.2314804-1-leith@bade.nz>
References: <20240627075856.2314804-1-leith@bade.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_010003_575835_F327765D 
X-CRM114-Status: GOOD (  13.43  )
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

The current definition of the uart1_pins pin group does not include the
CTS and RTS pins that are available on header CON1.

In the public schematic for the BPI-R3 (titled "BPI-R3-MT7986A",
revision "V1.1", sheet 4), the UART1_RTS and UART1_CTS pins are connected
via nets to the connector CON1 (sheet 14) UART0-RTS and UART0-CTS pins.
The datasheet does not show these nets as connected to anything else.

These pins can be configured for either UART1 or as a GPIO, with no other
alternate usage listed in the pinctrl driver. By changing the pin group
definition from uart1_rx_tx to uart1 the additional RTS and CTS pins are
included.

Signed-off-by: Leith Bade <leith@bade.nz>
---
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index 54087001cc8c..48bd1e04963c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -349,7 +349,7 @@ mux {
 	uart1_pins: uart1-pins {
 		mux {
 			function = "uart";
-			groups = "uart1_rx_tx";
+			groups = "uart1";
 		};
 	};
 
-- 
2.25.1


