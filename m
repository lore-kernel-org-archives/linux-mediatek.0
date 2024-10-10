Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5716CF11E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 13:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GVuj12UX8GIeD8p86YEe3fDqEXjeGtON8zAuREJZOWw=; b=rTpnBJFEOfoNbmU5NuUEoPQ+Nz
	OkzuvoOnNmePDzS2pdUdF1RaivsPckqziFP/+/CCPCRuaCXpwMZxgth/nLhaXDUjW4KfEz/4wbIky
	KOkP4x8S/2kbyLac2CnVFwNO+7HoxBB/1vlWGQzjgU9QClu6ylcGz60xahFIBhoThW51B4WLA6Odv
	JMkFlO6+Nti2j1QPTJDXCqwM7UOHTIqG8gpLxmi7rWtHaBZcEu/KR8tpDYvHsU548HtL4pwLEwePw
	rGCMaGZPJm1OzdYH1jS32LB09DsrnJQ2ram5n2fIE3td0xEtSqOvFvtJkdV0ilKCleJfiF/EGXe0A
	fJXADsTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sysna-0000000Cplx-2BvK;
	Thu, 10 Oct 2024 13:01:46 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sysYd-0000000CmIQ-0zBt;
	Thu, 10 Oct 2024 12:46:21 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2fad100dd9fso13330331fa.3;
        Thu, 10 Oct 2024 05:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728564377; x=1729169177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GVuj12UX8GIeD8p86YEe3fDqEXjeGtON8zAuREJZOWw=;
        b=Dm5brscY2xxoIp4VCXNRzzuZty8RI1ii0M0Kn3zOerMjE7Tv63waiShrm4oRv+PQhM
         ibUarCbb0eL2TZjhy1bQyr/6bMCLntI5RUhfKLhEdz4vwb3s2pUTJIwXkm6Pyg7svtZd
         rKBfg+6rw/hA6gLRRxKAstP61Iu4tB63kgUMS13zC+z5WlgVHDv/KMR5xS5kANO3PNPR
         6UDR+WuD5FVgfTGcEU/XGEqGHS9+7q3bgiVhVeEBkOPbShXNVq4I9aANnx0DMJ6Im2pQ
         yzz3eDszQCmPOS856TMDmiWpdYvZPA4j9MPWrt2GPsTzvWWk4QwEsWWhQuskF8SgkhKY
         csfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728564377; x=1729169177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVuj12UX8GIeD8p86YEe3fDqEXjeGtON8zAuREJZOWw=;
        b=Cb31Kug0T6SQkvjZcjgnsaBIdT2Wuh1ziSBYjDDpsu8TxFfPJuK2XpxqC/g5DpoS6Y
         righ4mJiFOK1hHKuSZDqEOrddFhQlJrA9B8cKQc2uMWny8MiWSH1eR9X728qnSkGYqpX
         b1Cv037QaLQDgnixmhHCExs4FN9PmGX8ABXJHuFVRUmfFrDWXaQyRjlZCpEQFT7sxs4z
         8SuOWZ0wHxZchl7rcS9wpkpI9I7DMGqlVDP3EDKLmKi12cEXVYd/orOtdNXXTQDnK7hz
         Fx9E80pLG6TrjlPRNhDJEqsSBKSKRDfzt7qQcfZuRGiRxuNH5KXvgzk7wtnvSfZql3IO
         ia1w==
X-Forwarded-Encrypted: i=1; AJvYcCUCigABeRgOWSM937FOB7j/w49xqitU6rrZqzQsWNB3+RU2c/gTwMbjqtPrJtTSgDljDNlWIzXBtn3MrDFeKjH+@lists.infradead.org, AJvYcCXWs8byBKpkuiV1vtoH42P8nXgYoEViFsczF6EVc7VdZdsBOL34ak7d6WA9lweK1btdg53j2Z5ebOs2bqK+/bo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyrDsSbiakBT3NVtKdHFUYc1pRdFuSr6T8aTfM29RszGg0wRnOm
	Pb1roj49C5HzqnZKItXu8Kao6x224k1HtL2Fknq/halIwgZHY8Fg
X-Google-Smtp-Source: AGHT+IG7c8Gke500MkQ4N2XCsbVSvFBBm3FK9CEdZEpbJJ7bFRkUTR6oAYq+eQ62P0q0phLlsaoFiQ==
X-Received: by 2002:a05:6512:3b8c:b0:539:9720:99dc with SMTP id 2adb3069b0e04-539c4953507mr5116745e87.46.1728564376238;
        Thu, 10 Oct 2024 05:46:16 -0700 (PDT)
Received: from zenbook.agu.edu.tr (89-38-97-199.hosted-by-worldstream.net. [89.38.97.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80dc5easm85654466b.170.2024.10.10.05.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 05:46:15 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/2] MediaTek MT6735 main clock and reset drivers
Date: Thu, 10 Oct 2024 15:45:24 +0300
Message-ID: <20241010124529.78460-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_054619_332006_E87DF00E 
X-CRM114-Status: GOOD (  17.75  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

These patches are part of a larger effort to support the MT6735 SoC family in
mainline Linux. More patches (unsent or sent and pending review or revision) can
be found here[1].

This series adds support for the main clock and reset controllers on the
Mediatek MT6735 SoC:
- apmixedsys (global PLLs)
- topckgen (global divisors and muxes)
- infracfg (gates and resets for infrastructure blocks)
- pericfg (gates and resets for peripherals)

MT6735 has other more specialized clock/reset controllers, support for which is
not included in this series:
- mfgcfg (GPU)
- imgsys (camera)
- mmsys (display)
- vdecsys (video decoder)
- vencsys (video encoder)
- audsys (audio)

Changes since v4:
- Follow naming convention for DT bindings
- Add reset map
Changes since v3:
- Squash DT binding patches.
- Use mtk_clk_simple_probe/mtk_clk_simple_remove for topckgen.
- Add MODULE_DEVICE_TABLE in all drivers.
Changes since v2:
- Add "CLK_" prefix to infracfg and pericfg clock definitions to avoid possible
  clashes with reset bindings.
- Replace "_RST" suffix with "RST_" prefix to maintain consistency with clock
  bindings.
- Use macros to define clocks.
- Abandon mtk_clk_simple_probe/mtk_clk_simple_remove in favor of custom
  functions in apmixedsys and topckgen drivers for the time being. 
- Capitalize T in MediaTek in MODULE_DESCRIPTION.
Changes since v1:
- Rebase on some pending patches.
- Move common clock improvements to a separate series.
- Use mtk_clk_simple_probe/remove after making them support several clock types
  in said series.
- Combine all 4 drivers into one patch, and use one Kconfig symbol for all
  following a conversation seen on a different series[2].
- Correct APLL2 registers in apmixedsys driver (were offset backwards by 0x4).
- Make irtx clock name lower case to match the other clocks.

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging
[2] https://lore.kernel.org/linux-mediatek/CAGXv+5H4gF5GXzfk8mjkG4Kry8uCs1CQbKoViBuc9LC+XdHH=A@mail.gmail.com/

Yassine Oudjana (2):
  dt-bindings: clock: Add MediaTek MT6735 clock and reset bindings
  clk: mediatek: Add drivers for MediaTek MT6735 main clock and reset
    drivers

 .../bindings/clock/mediatek,apmixedsys.yaml   |   4 +-
 .../bindings/clock/mediatek,infracfg.yaml     |   8 +-
 .../bindings/clock/mediatek,pericfg.yaml      |   1 +
 .../bindings/clock/mediatek,topckgen.yaml     |   4 +-
 MAINTAINERS                                   |  16 +
 drivers/clk/mediatek/Kconfig                  |   9 +
 drivers/clk/mediatek/Makefile                 |   1 +
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c  | 138 ++++++
 drivers/clk/mediatek/clk-mt6735-infracfg.c    | 107 +++++
 drivers/clk/mediatek/clk-mt6735-pericfg.c     | 124 ++++++
 drivers/clk/mediatek/clk-mt6735-topckgen.c    | 394 ++++++++++++++++++
 .../clock/mediatek,mt6735-apmixedsys.h        |  16 +
 .../clock/mediatek,mt6735-infracfg.h          |  25 ++
 .../clock/mediatek,mt6735-pericfg.h           |  37 ++
 .../clock/mediatek,mt6735-topckgen.h          |  79 ++++
 .../reset/mediatek,mt6735-infracfg.h          |  27 ++
 .../reset/mediatek,mt6735-pericfg.h           |  31 ++
 17 files changed, 1016 insertions(+), 5 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt6735-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt6735-infracfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt6735-pericfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt6735-topckgen.c
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-infracfg.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-pericfg.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-topckgen.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-infracfg.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-pericfg.h

-- 
2.46.2


