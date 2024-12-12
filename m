Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D888E7717F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2024 06:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2sOU/zN1rnDAJHK7mSCpddQhh7N81+Tto3qj5XwbKbU=; b=pP2F5EyzHSrPaA7PJ9k+6kSA+2
	5nTfi6G5vIesuQwYXgD5GyLBdY4DmRiGwQpmc6mCDsA91hkgD0QzUGkT/s/FbeJ85BYPNuFQF1985
	OQfo802J4xCRyvfGbt90QQTsLXQ8+1kgkbVAj1NWn4PpJzd1PNKIa/0P2OMmh1jD9KbqMs6E6r49+
	B3oqR6jwRXKJUR5+oH01bd/kQmRHqzCTQqMk/dHwxcbWUAXA9ZWKNUOETDT/st7KsyniRNUTyNXzg
	VLJn80RmhkSTOYC3kgDiVBm+CtVbCCI77Pa1q/j1T4K4KOnKBZmLc1+IweI4CqyJzU1RO30LR8w5N
	84klc3CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLcaH-0000000H1la-2BKB;
	Thu, 12 Dec 2024 06:22:01 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLcZC-0000000H1Vs-3TRs
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Dec 2024 06:20:56 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2162b5d2e1fso480945ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Dec 2024 22:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1733984453; x=1734589253; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sOU/zN1rnDAJHK7mSCpddQhh7N81+Tto3qj5XwbKbU=;
        b=ejPxaq1jfWzIaBFtAs5fx8kjwOWsyDErKJc6ZwMF3y8/lKrqaWYK/RaiBTIIl+pQia
         jVfmGGKarovEDpbm0PIVIkrtvHT7+6K4MVVolbQGpxxaoSwf59aPov8uSiBNZ1TYgsBE
         fJbZoESIqGfXN0v1qIgynYrbwKWtP9eOxqHkhfIZ0IXKnDPQqCkRHzlC9D/pd58vlVvT
         KkEWQwkGrW9ffbW9RiTQ6hLYA4A2z16PNOe2jEh2wIihe57GvcD34cxP7mYMM1K5uoio
         w0+39kmoDG4A7LFSFF6TvPecveopz6gRICRSc9ZHLwEm3+JAaWxzSZ43EgfBWo6bzR2o
         icng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733984453; x=1734589253;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sOU/zN1rnDAJHK7mSCpddQhh7N81+Tto3qj5XwbKbU=;
        b=Hb5qpAVi+T5tCUrv7u39WoYRxJNOUVpNCxh6Kcp5f1wb0oahKi4PLNcyg3Lj+G0oS3
         mAtLA+Zrv6SKN16oGZjf8584yuLq1eA/aU0S8ECPdW+H5FrHnKOPS1J7rBhi79a4DEdj
         aqnGLs4nGLKm42tQSQKAVIbad1D6guvc4MmAlNMo1YtnGga8KM+HeYkYyNSHwr6/kgS7
         0YDRTmKIaBUNMKSGrbfbKLLSlhybjrAk5qDdxgbJCOlOQToz+LAwtLZ31DsypGTX/kA8
         Z19NWNT4H71vt0WEyvKJg9FPtmZ8g9z859pTDLclVoaJJ+Sgtn9/KwpNQfvvVtFc2g4H
         nqeg==
X-Forwarded-Encrypted: i=1; AJvYcCXyhQJYMbohPpNuwZs5cpUjkPRltY2r3bg6JeiTyuVvb2GYm09PGgctSY4MGM7n1DE6CkPHG0TOMuwNKWLKSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx+i1sOD4iI+7wv5pluKmMgB8n6oyoTvWsAymC6IditF1TiA3b
	ZP74rzG+jDK7RKG7sKiiu27YSkYkgIGQaI2gFI52cNN5jJK5CaHCcVD4mdbLJnw=
X-Gm-Gg: ASbGncsfrMNvflOvLtfTW+n7GoiZCpjD5izAlpkU2MhI+d16drSUNLQ68mfz9WaXlL9
	7NJWPTbROU/SWzOuhchMLj92ULg7tk23Jeyu5zLtz0iU0B2cZ/uO0FxjOQG1TSSX7nQ9YFZSm35
	ykvwgXD/fpDiS6pWDStLA1YfdJHdSk/6++1bKIEu+mCuQuBAaTboCw3qL6DT8Wv0uHhOnlYmpL4
	lQr2SWaMHDNK3F/Hj1VRGGIwqO5eYxJe7fMhT+R0tTtJ2EOPIawdA/S2Tb7rZO3V0lsbUqbdr9O
	vqwIjijnYXwhgF93/4lQ
X-Google-Smtp-Source: AGHT+IHLQqfTE6S33rXaKex6v5/nL8RuEZqh0jZ1l97VEOxPKBfxg+FVj8Clw/rAjJE+bNggu1IJ0w==
X-Received: by 2002:a17:902:dacb:b0:216:6590:d477 with SMTP id d9443c01a7336-21778397962mr36786945ad.2.1733984453430;
        Wed, 11 Dec 2024 22:20:53 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2162c278668sm83579165ad.81.2024.12.11.22.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 22:20:53 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	dianders@google.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v5 0/4] arm64: dts: mediatek: Add MT8186 Chinchou
Date: Thu, 12 Dec 2024 14:20:42 +0800
Message-Id: <20241212062046.22509-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_222055_140197_2CA15184 
X-CRM114-Status: GOOD (  11.78  )
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

This is v5 of the MT8186 Chromebook device tree series to support
MT8186 chinchou platform. It is based on the "corsola" design.
It includes chinchou and chinchou360, including LTE, stylus,
touchscreen combinations.

Changes in v5:
- move sku17 here to keep alphabetical order.
- do not use the MTK_DRIVE_xxx definitions.
- Modify exton to extcon
- Link to v4: https://patchwork.kernel.org/project/linux-arm-kernel/cover/20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com/

Changes in v4:
- modify 'rt1019p_pins_default' to 'speaker_codec_pins_default'
- Move usbc_extcon out of typec
- Link to v3: https://patchwork.kernel.org/project/linux-arm-kernel/cover/20241021072626.15102-1-xiazhengqiao@huaqin.corp-partner.google.com/

Changes in v3:
- Add a patch to change codec in pmic (in mt8186-corsola.dtsi) to audio-codec
- Link to v2: https://lore.kernel.org/all/20241018091135.17075-1-xiazhengqiao@huaqin.corp-partner.google.com/

Changes in v2:
- Modify location of "const: google,chinchou-sku17" in mediatek.yaml
- rename "pin-report" to "pin-report-pins"
- add "vcc33-supply" and "vcc33-supply" 
- rename "cbj-sleeve-gpio" to "cbj-sleeve-gpios"
- modify subnode of sound 
- Link to v1: https://lore.kernel.org/all/172900161180.733089.8963543745385219831.robh@kernel.org/


Zhengqiao Xia (4):
  dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
  arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
  arm64: dts: mediatek: Add extcon node for DP bridge
  arm64: dts: mediatek: Modify audio codec name for pmic

 .../devicetree/bindings/arm/mediatek.yaml     |  28 ++
 arch/arm64/boot/dts/mediatek/Makefile         |   3 +
 .../mediatek/mt8186-corsola-chinchou-sku0.dts |  18 +
 .../mediatek/mt8186-corsola-chinchou-sku1.dts |  35 ++
 .../mt8186-corsola-chinchou-sku16.dts         |  29 ++
 .../dts/mediatek/mt8186-corsola-chinchou.dtsi | 321 ++++++++++++++++++
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |   8 +-
 7 files changed, 441 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi

-- 
2.17.1


