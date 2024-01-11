Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5874FC4707B
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 10:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MuVNFMNu/znFyjhI4YiVPNBcWz8JIXuuibOlcW6cauo=; b=sxsk5YVUOfZdP1Xk2TwIR4HKon
	ufPIyr1xAphfdkNlA+rFhgSwRI29wU+gMDJNQsU6KkvFeDz0zq3MCpE4uDEoyeInnAAFmg1VEgXKN
	b340S/m5NueYo8i4bGmYwhuCAuMtEk7bVYCFIbxM2J0rhPoa+3zhRvwt+DCY1JaXv+MNC9Qr2gsG/
	aATTfeLm9J1u25HpDffHCSHjGVPMy1BO0f9PfwB3DffCgk4jlLvYzlGgC4eJCoZV7TB7KSFO5ctnd
	ThrjaLgIuywo5g+b1YjTn96UCAMJX8anUggbW8EdMYYJO8233KsOWUf33SeTDcy3FAOShYMB7jmsn
	p1lpZXMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsTY-00H2CT-0c;
	Thu, 11 Jan 2024 10:39:52 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsTR-00H26p-31;
	Thu, 11 Jan 2024 10:39:47 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50eabfac2b7so5828918e87.0;
        Thu, 11 Jan 2024 02:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704969574; x=1705574374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MuVNFMNu/znFyjhI4YiVPNBcWz8JIXuuibOlcW6cauo=;
        b=gSCAuqCTjhYeMZzreqTZkIDP/mFqLP1Q5R6V9jDBnVZLA7442c6sA9jRbsJxu67VcU
         CcMHE8kqRo2CIAGFIlyrhK91SY+yaFV3OxqkVpmfVjhRN8OsXVK3BpCSh07DnCOWULdb
         7NLArj9e0oWDi2vOql0RJEknJGVvE7dzU6eGfro5yRBCIeDqkBNvEwOOY5Kp1lGN8/p+
         nZMLZD32UT9KSI2zKtc9Jz/VJebQyjUBmfRFpXbrys3cigQeSk0cKHehSbnz8bSOLulQ
         1tYVqTodDYswYOgS1IhKGkZNQBHZZFZRqD5EMnGUcPNfNojaBCScYKr1U2hoD1VbW1jj
         KzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704969574; x=1705574374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MuVNFMNu/znFyjhI4YiVPNBcWz8JIXuuibOlcW6cauo=;
        b=lyI+/3osx61Gv5Fl0ucwtupnvU+x15hA6CWWbbrwdiglxiC4Lv3FdQX7uY8qCc45+J
         QJ2wdQnN9ij56TwkpeLI+Bwoto7PB6i8y4u7eFJSyfpHLMv01dXv0KdcQimRXqa9ynJT
         CQ3bv8hiv2+tDgWAMMIUm+imN9DzhV0JHP+Y+Xx4LStIlh9ZcqLdxYOtb5MNGLwJLa5t
         xvaYQjZuZDrqjl8AV6PHw1KAz+vxv2IaPUUnWAYDENGG8gl5b7XEy1+2aDq9goU+KNUm
         gO98+t3Pf5T7n6B3g/N0REDXcNMVjJDLY3Eq8tezplPiHD4FXvNd9p+F9hjA+lMRS/xI
         1k0Q==
X-Gm-Message-State: AOJu0YxIBOCt16trqGpWsU15OGU8KWzjkJ67QURtMBhjx/uHOZ8GpsHl
	u62aOYDVWyZR3xaVtu2OHI8=
X-Google-Smtp-Source: AGHT+IEnpP/pKX/gXbee57tP/8wAV93Q1jQEFfaBg+OenM/0Ooa1lAhiPzT2sTpofQ+k5kRMXR9eVw==
X-Received: by 2002:a19:ad4b:0:b0:50e:dc99:b9d4 with SMTP id s11-20020a19ad4b000000b0050edc99b9d4mr385313lfd.44.1704969574165;
        Thu, 11 Jan 2024 02:39:34 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id d14-20020a170906c20e00b00a298e2f6b3csm407179ejz.213.2024.01.11.02.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 02:39:33 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	soc@kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 0/2] mt7981b: initial DT code
Date: Thu, 11 Jan 2024 11:39:26 +0100
Message-Id: <20240111103928.721-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_023945_976133_5E97D64F 
X-CRM114-Status: GOOD (  10.66  )
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

This work is based on linux-next content and was successfully verified
using "dtbs_check".

I'm not sure who should apply this work. Given I received reviews from
AngeloGioacchino should I expect Arnd to pick it to his tree directly?

Rafał Miłecki (2):
  dt-bindings: arm64: mediatek: Add MT7981B and Xiaomi AX3000T
  arm64: dts: mediatek: Add initial MT7981B and Xiaomi AX3000T

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt7981b-xiaomi-ax3000t.dts   |  15 +++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 105 ++++++++++++++++++
 4 files changed, 125 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b.dtsi

-- 
2.35.3


