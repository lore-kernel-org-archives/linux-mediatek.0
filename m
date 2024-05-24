Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B19C25B74
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 May 2024 09:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9rV9T03dAOKaYLU4JhJP/yk7xRhqLtFBoRnbRFTh0Cw=; b=E23c0JLfuvcyAG
	PPmjqQdbH91vuTdcwQNntXe20ZaF6CblfITtSJo6zTtTfhwqlv1WsQSGBmxgHuA+ze9be8HepiYDO
	MZl2fTCZVAZBYmrlILJdUltCgOd7m16AvuP4ZAeq7SxWh/kuAEJn+ZaVJ2FAwZSbrIJ9pQLHNHqpI
	bHHqzNtjxjtqoAhr8JhVSndCidRpE0R7ZIbRqQt26Aavt2CEMh9Kk31PLQk7tAoGxNr0Fwy1vHEV8
	X6Dh5aRVzrrrRT5Jdz0UtouqCzVzeqOXUONrpSdn0xgU0Ixnrp2XfNXBlh5DV8vvq/M6PQqz1TG/p
	ij3KyQkOfBpJyAhiqVtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAQr5-00000008SuV-1owB;
	Fri, 24 May 2024 09:04:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAQr0-00000008SrT-0N10
	for linux-mediatek@lists.infradead.org;
	Fri, 24 May 2024 09:04:48 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42011507a54so16965245e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 May 2024 02:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716541481; x=1717146281; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9rV9T03dAOKaYLU4JhJP/yk7xRhqLtFBoRnbRFTh0Cw=;
        b=Cl8f10onwFYlE2WHeh0veeIhme7lXVaMVY/fB61y6zwylZriMPmw3+VBdAYgdD1MXa
         ubSEU8Jb/ZdrHN7PFgLyPGlPQphzHeQMxu6C6p0wWqTxh6nVccR6iLQ+qFuFiwhR0txJ
         QOfYrEg6/bYieJ5qA4UpglpSaYBBaIVRRaKJ766JTIQAy9qFr4tdhGjknNsRJvlkPxZI
         PC5HfK9ffhU4hFEzzdBRtDGQaG1u0QvPnAzWbNT1MOdBfq2Rtj8cwKZRn9qd1e/a2tAP
         1qfxDhaERybIRExuii6QtnI/Mqhs1vtpBWLsF3YvCrEbraZPLEYQB0Drd3My3yJ7K1no
         wDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716541481; x=1717146281;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9rV9T03dAOKaYLU4JhJP/yk7xRhqLtFBoRnbRFTh0Cw=;
        b=GX8Vwrez2Nzn0O8E8x7J4F2LVTsTHE10BgEx7+AKfS7Xx/FY7eVpKZsAhheTdq4atm
         rjF+cI9L61HJCkBvzFP5k/uS6778h4ZazqBaDJM/QkGeVV0idGDqZByKBHUhM8q3oOrT
         MizFt0H41+RrR9aMRr098+r8SiikpB1avD1nUgODST+MWKIuja4YAmtph4W/C41EBuwC
         QjYHbsO+GvP9AlIbjUNoD7kwlAcZArCNz3XdoaS4eRftp8de/b9R4wX2I7p8Byk9iIWJ
         IMJTgAbJ76feRV38oWZqjP0vPCMDuPNd3A0Yyeg4YkhKZwa4TB7s7GSTJpDeCkNLWKHh
         7JAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3yaHsV3z2vGQTVBaZaKzGSWl97/uOm9rMd859Cm/QgshtAlsNphm4lEa/7Aj5qYOj2yZYjCUmhM1y6Fct9va5p8+0VCsuIKW2/g5xLhAfQssU
X-Gm-Message-State: AOJu0YzzkbQPxRcbuXPuBoOMnYXrU/MUP86behOtmJLzrSdj1rmNhQtm
	BszA3yy1T5lAowxYtaQRfajeaiWyXbNWNC6gwRsH7w8VZ8BDM55L8y6C0ArpeEk=
X-Google-Smtp-Source: AGHT+IF7CQjZGEs3LnbK5/SUvoBlO1GBsf01qMc/AU90RdPkZ7/4pI6JpfohZZtS8F0E8KnZ0DDcnA==
X-Received: by 2002:a05:600c:46c8:b0:41f:ae5a:c72f with SMTP id 5b1f17b1804b1-421015a5fc5mr40923795e9.1.1716541481069;
        Fri, 24 May 2024 02:04:41 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f163a8sm47273045e9.13.2024.05.24.02.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 02:04:40 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH v5 0/6] Mediatek thermal sensor driver support for MT8186
 and MT8188
Date: Fri, 24 May 2024 11:04:33 +0200
Message-Id: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACFYUGYC/3WNzQ6CMBCEX4Xs2TUtFiiefA/Doa2LbOTHtA2BE
 N7dSuLR23yTzDcbBPJMAa7ZBp5mDjyNCYpTBq4z45OQH4khF7kSRS5wiC+MHfnB9ClrqRd8xMB
 Izlwq3da2NALS+u2p5eUw35vEHYc4+fU4mtW3/TnlX+esUKCtJVFZaSWlu1mz9mw9nd00QLPv+
 wdkDEJBwQAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716541478; l=3306;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=mfDmkw0HIx+IomXuMfp9apB/0evtliDnYultANgR4zI=;
 b=hrtC52UcUaT+pplwH+tZsJghD1tr1rDCfrQA55d38kaALKgzhDIy+7+8Eik+Me5NQqxH+Ab/w
 HxQjT4VnR4wD0YPNNGFMWaGIXofHdFhivEgBaTbUyTAYtRe0tozS+xv
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_020446_229319_512A8A2C 
X-CRM114-Status: GOOD (  16.17  )
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

This is a bunch of patches to support the MT8186 and MT8188 thermal
sensor configurations.

Since the patches of v3 were applied except those related to the SoC
device trees, this series includes mainly patches for 'mt8186.dtsi'
and 'mt8188.dtsi'. Due to some thermal zone renaming in these 2 device
trees, the related definitions were also renamed in the dt-bindings and
in the driver.

[RFC] When PATCH 1/6 and 2/6 are squashed, checkpatch raises this WARNING:
"DT binding docs and includes should be a separate patch." That's why I
split them in this v5. The problem is that the driver can't be compiled
any more at PATCH 1/6. It needs PATCH 2/6 to be compiled. Should the
checkpatch warning be ignored here ? Should I finally squash PATCH 1/6
and PATCH 2/6 ?

[NOTE] Before being applied, PATCH 6/6 needs a 'gpu' node in 'mt8188.dtsi',
but this node does not exist yet. A series will be submitted by Angelo to
add this GPU support in MT8188.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
Changes in v5:
- Rename some thermal zones
  (mfg -> gpu / soc1 -> adsp / soc2 -> vdo / soc3 -> infra).
- Add cooling-device for GPUs.
- Link to v4: https://lore.kernel.org/r/20240521-mtk-thermal-mt818x-dtsi-v4-0-b91ee678411c@baylibre.com

Changes in v4:
- Fix wrong thermal zone names.
- Lower 'polling-delay-passive' values.
- Set 'hysteresis' value to 0 for 'critical' trips.
- Add a 'hot' trip point in between 'passive' and 'critical' trips.
- Link to v3: https://lore.kernel.org/all/20240402032729.2736685-1-nico@fluxnic.net/

Changes in v3:
- use meaningful name for binding index definitions
- reuse LVTS_COEFF_*_MT7988 on MT8186 per reviewer request
- do similarly for MT8188 that now reuses LVTS_COEFF_*_MT8195
- use thermal zone names the svs driver wants
- adjust some DT node names and iospace length
- remove variable .hw_tshut_temp as it is constant across all SOCs
- Link to v2: https://lore.kernel.org/all/20240318212428.3843952-1-nico@fluxnic.net/

Changes in v2:
- renamed CPU cluster thermal zones in DT
- fixed logic to cope with empty controller slots at the beginning
- isolated bindings to their own patches
- added MT8188 default thermal zones
- Link to v1: https://lore.kernel.org/all/20240111223020.3593558-1-nico@fluxnic.net/T/

---
Julien Panis (2):
      dt-bindings: thermal: mediatek: Rename thermal zone definitions for MT8186 and MT8188
      thermal/drivers/mediatek/lvts_thermal: Use renamed thermal zone definitions for MT8186 and MT8188

Nicolas Pitre (4):
      arm64: dts: mediatek: mt8186: add lvts definitions
      arm64: dts: mediatek: mt8186: add default thermal zones
      arm64: dts: mediatek: mt8188: add lvts definitions
      arm64: dts: mediatek: mt8188: add default thermal zones

 arch/arm64/boot/dts/mediatek/mt8186.dtsi           | 316 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi           | 481 +++++++++++++++++++++
 drivers/thermal/mediatek/lvts_thermal.c            |  12 +-
 .../dt-bindings/thermal/mediatek,lvts-thermal.h    |  12 +-
 4 files changed, 809 insertions(+), 12 deletions(-)
---
base-commit: 632483ea8004edfadd035de36e1ab2c7c4f53158
change-id: 20240520-mtk-thermal-mt818x-dtsi-eca378f9b6a0

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>


