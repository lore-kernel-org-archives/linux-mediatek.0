Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DFBC25B76
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 10:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UdnKk0U8YIgyphmfdZ5S6P2OG6FjluzorDu+ngQ8lF4=; b=DtHpiX9t+bjBIQ
	yH7ahCXLUZIBF8uc3wAWJqZxnw+AE6qBPqV6UOMZkocZ0IgJX/7e5wSrj9erOEyPJoWvwlSIDmsTQ
	2Ob3ye1Z7TM0xaXdg4usdyJZeGan2YWS0al1w03uIxbjJpklTmDB0q8tKFA9Tnjt5XN9tlxKlGRnZ
	gyGcEsRjMvEDJN54OvmE1NrK+0Ubka+nUmMal5NEMSrSOf7uosaE0bLdUWqEvlHl4VcIZubwjVVAX
	ojf1Z6K4vvgi41TabMkbj3wKLGz1xZiJCSCnaV/0qHYM34OPAeKL+IG2yj7vAbfgUZEKdbiQe0oFQ
	Jeoch8nLSy0pbCWQgvyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE5HN-0000000GQGl-35MQ;
	Mon, 03 Jun 2024 10:51:05 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE5HI-0000000GQEO-3kjb
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Jun 2024 10:51:03 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4210aa012e5so40085495e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Jun 2024 03:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717411858; x=1718016658; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UdnKk0U8YIgyphmfdZ5S6P2OG6FjluzorDu+ngQ8lF4=;
        b=YZm3qJ6m36Y7B2MJdJiKUaS3oRe3gjOqPN9e1n4cB+pFB7+lalxQ+Y502Y7+pU0lfw
         6UcZ4N65/Kzc7i2m6/f1xPkY6VxXH4XQ9n+87q6uA08YfyFkLSitb4VBuBVBq+hj+lhQ
         p7qBeCdtdyrv+Sv5HzUGbQkB2t/DB4ZqGPlwDq9u9cumMgVOZu+nWQUHsjEyOl76BgLi
         o2Jok7kUWjmYp+Qi2m3O5HRsn/jy1M+3zZI2vd8ZhhMkZPgBYCXFs8d+VjS3FgJPsUWE
         HMZh+v6LBrv1YbSWt5P9FhY/GcIFD0pCkYbzbiPEYZXLIEXjbLIHZjh9NL40J26p58FI
         ePwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717411858; x=1718016658;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UdnKk0U8YIgyphmfdZ5S6P2OG6FjluzorDu+ngQ8lF4=;
        b=sUnDbnL/EGUcZDE/XFX0LOVWI6afrWZdNFwqr9BqGrO6DXIR+v1KuRnDvOkeRbmdSk
         3lth8GhA52J5AGUPkUbPM5Rocn1FtkUDCQERYrtQoCdoVf+NXRq6KmbDYu182lQk9Xot
         QoQ2Xg97gV4dYVYc2JyXTLv3F4J6JoMdfSH1qgi8lKj3neM8JlejUIFQ4o6EfHJ6iQQh
         mUgg4/MwVf+3RMb/ioVbd6aMPdM5s4apI2CI5YrgOhlLE86xWQsPuTinvqiB4Oq95+c9
         dOJvU0F00MMFBfPwVxX8PlxGqkWAKIDMGPPPFu3r9M6rI5PPbaUoxG78bnxpwWwj/1nm
         nV1w==
X-Forwarded-Encrypted: i=1; AJvYcCUvdF/SlEeGhcA9yke9NaM4hfmLpX1ybALmFtp4Mx3UK/1Y4m0zLBxPED4KaQ6QYtxsbEyVNA4SB+XZBasaZwRK0+rwP0yYQs7Oouan+jIqjMID
X-Gm-Message-State: AOJu0YwJOfhvBDeWY9kmJAaqK28fnHD0bHwlmZ7YdGP1Xu5QBY0co2NB
	67EKDOffkCDts5c8A3FZe4blTOZ0VMZfwRyIMPz9FP/Vrrm8xicDzp0QZGaxKZw=
X-Google-Smtp-Source: AGHT+IFaWoT1e6TvoB0AgmpyT+2utdI+mwIyeAACDTQGOs0bgoK2STYvUX7gmBuqBz+wV3mWSKvPyA==
X-Received: by 2002:a05:600c:511f:b0:41e:3272:6476 with SMTP id 5b1f17b1804b1-4212e049d8dmr81844775e9.10.1717411857652;
        Mon, 03 Jun 2024 03:50:57 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42133227f8asm95372535e9.19.2024.06.03.03.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 03:50:57 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH v7 0/6] Mediatek thermal sensor driver support for MT8186
 and MT8188
Date: Mon, 03 Jun 2024 12:50:47 +0200
Message-Id: <20240603-mtk-thermal-mt818x-dtsi-v7-0-8c8e3c7a3643@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAegXWYC/3XNSwqDMBCA4auUrJuSxDy76j1KFzGONdRHSUQU8
 e6NQkFK3c0/MN/MKELwENH1NKMAg4++a1Oo8wm5yrZPwL5IjRhhnAhGcNO/cF9BaGydZk31iIs
 +egzOZkqXJpeWoHT9DlD6cZPvj9SVj30Xpu3RwNft16SH5sAxwbmhAFJpTqm75XaqfR7g4roGr
 ewg9hQ/pkSihCy1UEYzAuoPJfeUOaZkoohTlCttjct+qWVZPubgLqFXAQAA
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
 Julien Panis <jpanis@baylibre.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717411855; l=3307;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=5DVeAMWdqWUXERR27J00cNATFK2F7gYJVhCAomHF6Qg=;
 b=NesfOkcMI7jH2us7UExx5sohtZ+j/QjcLttLXw1c0jGe3ZLnWMyVUDrdRjdSDV57lDUh26sOi
 fHX5skCdve7D6y0WGoeYBsNs3MWYJRL/097ekokb7VojvzooFZVV7AN
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_035100_980324_216C5F0D 
X-CRM114-Status: GOOD (  14.23  )
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

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
Changes in v7:
- Change commit message for dt-bindings patches.
- Link to v6: https://lore.kernel.org/r/20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com

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


