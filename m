Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA94C30658
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 08:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OXRweFobEGV2dQzUWK018aOdtxKilWjm6XN9Kcy62E=; b=H+8dA1bOApwSGzHTcD2K1jtL1+
	4xm6KIDZLkNT857KBSVq2EWn33FPhncQjgf1f0OSUeXlW89ZCjdZd9nG/diZtHblA/lNosfiPgA+P
	id/FXK22SnVk4oF0FIyOXFlLU0govBr/5Lo4TJTBELo0DmtrghJuIeUk1OGIWC05XZqa0i0RTnDqZ
	QiewmjKWZ4vsvMYckc4vWvq2wen/C6D7Z/xMOx1YrOiPSb+BF/2mRNAo9LcwBCpFNqbSdWBHOTC5f
	DhQ/t7kjsFhw/fQD6sQCTggetkZMjsrF4omSzL+eCO6OETmDkoIbgFrIhsjI8QCyJ/iaULpte73Jx
	pxflazEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMk2y-00000009euO-3vrU;
	Thu, 27 Jun 2024 08:00:00 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMk2p-00000009eqN-3XxR
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 07:59:54 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5c21a177affso1158374eaf.2
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jun 2024 00:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bade.nz; s=google; t=1719475186; x=1720079986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OXRweFobEGV2dQzUWK018aOdtxKilWjm6XN9Kcy62E=;
        b=G3DEitQlEvzqGiOdxaCHSUa5pruzN9wu2MnyMtTEnk+/KD6hhcKG3V7fPFpNAKbyTi
         n1FI+0PrmxOHgZddxH1YsEIZrmoNxrNT0vLtfpsyzcAuRIMoPZOawXIQ/0xLAZY36lbQ
         Qv31sWO4IZdUF2Av3ZQXtFQo8pSS3bMmAQTLf3V8UwGAAfVauvvl+OQmVEng86loCd5c
         8PWaeDRAZsHH24c1IWuRcNx79kWU5FE7O+luBwmuD9LczorYLuysCoxINTrr1MwxzNHf
         eYN+lfvNP0npMhfNL0/ByVdiBL1je2IBu7kc8T4NcRCnbTyX8YoY1XqQt2tuPtEvR/il
         DBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719475186; x=1720079986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OXRweFobEGV2dQzUWK018aOdtxKilWjm6XN9Kcy62E=;
        b=ZgJWAeK90y+t0bHX/xOU/hzxhp+LS73FyzGwMDZYAgJExbKAoVl6A/K7f66U73iWBh
         QtJtYTrobQSHPU5o0e/0SeK0u5dNBhvEpbhRz2wD5n+ZLlqBrJJFWWUaDGdscJWbYqpT
         KxgumvlhuwBR2rZHPhdAWS1ZA36OjfMH+phvcFR5RGZokYJPalhTAjutMtFt9rlAq/5g
         pfkXpBbGNbcYWHsGN03E6YvP2Ru1hkASX2W2oKdMvEvdkLrIPmjfojy9270KKrj5SylC
         09SWyKb8VQmDeO71ft9NSr5kIvKIFfM3VqXx5zGIoYBqAYtI0yBlpjVel3n/nChE3elr
         b4fA==
X-Forwarded-Encrypted: i=1; AJvYcCV0ZCvPcRIyhiE33LTXT5+jQL8otYr5/BMW+kCSTGJuY1r2NLTayKJcTtb7CjOP1VTDd5eKW9yhvqCjCOPbXHnqi3j+ecRzey6E7NXCWk/hzEYn
X-Gm-Message-State: AOJu0YwSxt1bcyn3yClembesiJak83mIBhZ6eVOLaHY8H9YfygZnpS3z
	jJ2yvXSmF8/rpWZgpgVhPTPn+v0eMCoiImegtdl5XapJclLz1lHq8MknrxPwVw==
X-Google-Smtp-Source: AGHT+IHq6ql5dluNAvM3m09ay3+tSbfsSgfh7pATvqKfHdP2z7gQ8/LBSft8+sTU5UrJEuU2LPHobg==
X-Received: by 2002:a05:6359:4c93:b0:1a5:bbe2:5046 with SMTP id e5c5f4694b2df-1a5bbe25a8amr372547655d.30.1719475186426;
        Thu, 27 Jun 2024 00:59:46 -0700 (PDT)
Received: from localhost.localdomain ([2403:5816:cd6c:0:6d45:ae2f:1ead:bd58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac9c4cf4sm7181895ad.290.2024.06.27.00.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:59:46 -0700 (PDT)
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
Subject: [PATCH 2/4] arm64: dts: mediatek: mt7986: add gpio-hog for boot mode switch on BPI-R3
Date: Thu, 27 Jun 2024 17:58:54 +1000
Message-Id: <20240627075856.2314804-3-leith@bade.nz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627075856.2314804-1-leith@bade.nz>
References: <20240627075856.2314804-1-leith@bade.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_005952_028590_BB194E53 
X-CRM114-Status: GOOD (  13.35  )
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

To avoid future pin conflicts with the boot mode dip switch (SW1), add
a gpio-hog to document the two GPIOs it is connected to. If another device
attempts to then claim the pins a log message will get printed.

The BPI-R3 has a four position DIP switch (labelled SW1), that is used to
configure the boot mode. The first two positions (labelled A & B)
configure two bootstrap pins on the MT7986 that select which flash chip
the boot ROM will load the second stage bootloader from. The third
position toggles chip select lines to select between the NOR or NAND chip
on the SPI0 bus. The fourth position toggles chip select lines to select
between the eMMC chip or SD card on the MMC0 bus.

Only the first two positions are connected to GPIO pins on the MT7986. In
the public schematic for the BPI-R3 (titled "BPI-R3-MT7986A",
revision "V1.1", sheet 4), these are the MT7986 (U1E) pins GPIO_0 (GPIO5)
and GPIO_1 (GPIO6). This gpio-hog configures the two boot mode pins as
inputs.

Signed-off-by: Leith Bade <leith@bade.nz>
---
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index 951612ea1e66..2cccbec39d34 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -235,6 +235,13 @@ &pcie_phy {
 };
 
 &pio {
+	boot_mode_hog: boot-mode-hog {
+		gpio-hog;
+		gpios = <5 GPIO_ACTIVE_HIGH>,
+			<6 GPIO_ACTIVE_HIGH>;
+		input;
+	};
+
 	i2c_pins: i2c-pins {
 		mux {
 			function = "i2c";
-- 
2.25.1


