Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A3AC25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 05:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hppWw3qKG50anKzk4FPv6N0n8i7i4RwwGHwsQsP3nDM=; b=ZcgBQA68fEe0eZ
	eKgi+/EI3b/ZWqQWCWscrCZpkupo74BB9ABLAUZFD7NSOdnbKCuz0kf3P7BR0bXgXO7EkKbh4UX1D
	G6yQvXhxwRpBQ33llghFVFzIlwbmALaCnuA1wnBhtb335FkI38lUNoumUXIJikfw93S0fA/Dagbew
	XJuzDPAc6Js5J0AGRzvcvDZP+gq/t1UaO5ke2zS//+NgZ5O87CU9D6gpEwecpZGNr3iaERP9CezGO
	6oQpAYMUbjUNqLMT3U3Q26g7SeWeV7+WP7kE0S7gOX5Yurkg6Cf0HAj/15Kd/5M3E3GAInPSYG6af
	vq62K7aH4XyzZJBacPrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCKA-00000002w2s-1Jmw;
	Wed, 29 May 2024 05:58:10 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCK6-00000002w0g-22qX
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 05:58:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4202c1d19d5so14535745e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 28 May 2024 22:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716962282; x=1717567082; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hppWw3qKG50anKzk4FPv6N0n8i7i4RwwGHwsQsP3nDM=;
        b=CZJt5cB79QJYoERVfcM1kVBh/w/9cecqI/kgFgdfxBRFX3TBReH8CqGGC5dqeJ1ltb
         QNqh2I+grAeDTfd6rVggfzwqLVRPpDfjT3+XyxQNF3B15TMZBKYOjNDhnSC6VLqnDpN0
         yBC9qmoS+CUby6sFEs7/9GHEZdIj2covrP7TtH3LFigSeoMUH6ZhMFWnQNXjcutcKH3k
         OFDZfUBbLONOX/8MAqMM0Yd9iEmlOLeLv6cMpIJlnI6Dcd1j0k91gDYxT8f0bOTorYv6
         JjBcH1QspmdfDcGCAviIB38dbkZpz0SDH9p1n8IH9dYpV2fzZV8b0HmoKR1WqglkxVa+
         ctcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716962282; x=1717567082;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hppWw3qKG50anKzk4FPv6N0n8i7i4RwwGHwsQsP3nDM=;
        b=lmPBlao0q0WwHOr2mOsIV2QM7EAs5U43YmakxF/LuPw4oZ3D0rq8JrvKY42H1VDtKn
         /LkECsNoszVqtWtjsyDTdiREhI2OdOw4nQmbOEZO/OYV5E96biizJgSByEdyhc7w7RKF
         Eifzao6XEilDMCThx8YUnxmPinaU+37TTAzz1dSR5WkZ9eh/aq/IBPQgrPmETYM+XsBF
         w7LDVsuOr6OFNp/vttdx5DGONxA6OG3w3dA+iKJ7EQVjfTRdoc/Me4B0ivoxsc9xhJPI
         KJQ8oeg4689NNFa7XXwS6ZuKMDB0tIa8WBeciZsoclrWh30hJyI7Nbugwnc8oPQWK7st
         3vGw==
X-Forwarded-Encrypted: i=1; AJvYcCXAt8k+iZFlyb21UUe6umrSkBbM6lK5EhbgnDhhgoH2CQRPQ5o6v9FJWqQ8KY+hJHd86KdddRjZFgNueF9JWfyTGa8nTYFGFNhp943rkvi+RZaf
X-Gm-Message-State: AOJu0YzLXSOctgid9gx6VnMDYGwZYB2n4jhOyQ9+kKfALRjUi0wDc3q2
	5xa95kjOYzHouAO+ufweLcSwwJQyGqxwQ8F/+t7pSdGbzlEZr5WVPPu2QNWachU=
X-Google-Smtp-Source: AGHT+IHVRqh3fwdmfS9SnJtxUCheN0eF6Bwow3iBM+UuBhpaZuRXURaYXNel/mNlFRK2OrKtThAnvw==
X-Received: by 2002:a7b:cbd0:0:b0:420:1284:475 with SMTP id 5b1f17b1804b1-421089cd413mr115076715e9.12.1716962281574;
        Tue, 28 May 2024 22:58:01 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4210896676bsm169075435e9.4.2024.05.28.22.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 22:58:00 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH v6 0/6] Mediatek thermal sensor driver support for MT8186
 and MT8188
Date: Wed, 29 May 2024 07:57:55 +0200
Message-Id: <20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOPDVmYC/3XNSwrDIBCA4asE17WoVWO66j1KF2omjTSPoiIJI
 XevCRRKIbv5B+abBQXwDgK6FgvykFxw45BDngpkWz08Abs6N2KEcSIYwX184diC73WXZ0XVhOs
 YHAarL6VqKiM1Qfn67aFx0y7fH7lbF+Lo5/1R4tv2a9JDM3FMsKkogCwVp9TejJ47Zzyc7dijj
 U3il+LHlMiUkI0SZaUYgfKPWtf1A0PIaroMAQAA
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
 linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716962279; l=3802;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=gD/PJ6MuVDFwyaeynPCnoxOi6c4HUNfJeNMrEukphYE=;
 b=nDzYAwEDpx0c9hRfOAq5XwkrlJuGVpfcUvab8uKv4mHH58zFeLfseR8VqQZo5+m+Ka74jj+1U
 EYdwrnFQnIVC+aFnqGH7Z8WQzMSEdG8wIApOliIJ+TgtQK3LeEjUtYF
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_225806_544287_7A2690C0 
X-CRM114-Status: GOOD (  16.35  )
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

Because of the GPU thermal zone, this series must be applied on top of [1].

[1] https://lore.kernel.org/all/20240527093908.97574-1-angelogioacchino.delregno@collabora.com/

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Nicolas Pitre <npitre@baylibre.com>
To: Rafael J. Wysocki <rafael@kernel.org>
To: Zhang Rui <rui.zhang@intel.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Julien Panis <jpanis@baylibre.com>

Changes in v6:
- Reorganize patches related to thermal zone renaming (dt-bindings + driver).
- Add cooling-cells property to GPU node in 'mt8188.dtsi'
- Link to v5: https://lore.kernel.org/r/20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com

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
      dt-bindings: thermal: mediatek: Fix thermal zone definition for MT8186
      dt-bindings: thermal: mediatek: Fix thermal zone definitions for MT8188

Nicolas Pitre (4):
      arm64: dts: mediatek: mt8186: add lvts definitions
      arm64: dts: mediatek: mt8186: add default thermal zones
      arm64: dts: mediatek: mt8188: add lvts definitions
      arm64: dts: mediatek: mt8188: add default thermal zones

 arch/arm64/boot/dts/mediatek/mt8186.dtsi           | 316 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi           | 482 +++++++++++++++++++++
 drivers/thermal/mediatek/lvts_thermal.c            |  12 +-
 .../dt-bindings/thermal/mediatek,lvts-thermal.h    |  12 +-
 4 files changed, 810 insertions(+), 12 deletions(-)
---
base-commit: b321abd919e22b240d53329cd726ea7afa8aca98
change-id: 20240520-mtk-thermal-mt818x-dtsi-eca378f9b6a0

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>


