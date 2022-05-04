Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22134C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 12:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7vOxG2GKPDduq+lMKQweYpkubFCqlG83IVN+nB3aJNs=; b=ExfqZjcSaQfl5K
	wRdv0WCREktVeVIwmTrqB9OqY989qYd3O2BPVACxMXTr55E0nq3vpsszX0fxLx1Fvf/EO+DXuTuXE
	vV/btRYjs8bVoX2T8TYzMM8WMGLUGVJB+Z5KesDTY4fr0kGY1qRuaEMmnTwfQ4Q9KYs6vaC4lS0GE
	AqystEXhMBaj57Hz95qEh9Kw+ZiGSG8Og9ly1apTa8I58XSPaNv3cy4zB1BzVwHuzDDcZhxpWgYJb
	udAgj+WGS/Sjzu4aft4buYVGvUFVCCTfsc/eG9OVmkwAfBofbx6qgPVxb/ZjwY9C1IAKlXWURMJTn
	b3xAV/r+PTVxigadyW1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmE7K-00AiES-Ir; Wed, 04 May 2022 12:28:30 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmE7H-00AiCm-I6; Wed, 04 May 2022 12:28:28 +0000
Received: by mail-ed1-x529.google.com with SMTP id p18so1510708edr.7;
 Wed, 04 May 2022 05:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v8deg2KLDPfn0MYLkDdTzpE851zZE5QzG2ocaiOOkBo=;
 b=CLTbKxWNFX6edptI+ZvYTsXKN81abpGJmTLXmBFKatFJax0iYOADG2PnCoD+/l2VwA
 UTy4Ng6y6ptMNezJx/4XMUPYUJJAgvMWuzzmTwKFUkUFIv0epgIVsL5U70nxYIz5LwV8
 9vLpv8YKG7TBGlUdUrHoQepDCvzZ5DUa/+BDwy47FwDS3i51ok/Tt02EAJqjMRZNaENm
 ShehKHGJTI+EyGYgS18O4GjAc5u5IupRKsMIKrUQrkAB4wPzCW9lNk7iRpUpUH5Wfcfb
 9yS/5g40xIJ3BzqRgHvgaMZizwhDizJR7u/JqyDu7rPhRUDbK3hdCWguH9WRf5NZc98J
 aTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v8deg2KLDPfn0MYLkDdTzpE851zZE5QzG2ocaiOOkBo=;
 b=cdsK4cAo+gcsnHhyK5GXtlLvuQ2k2FR6rlsKUNNsiZk6tv95oG3LCTsO2EwsCloUVH
 NSjnbQq39YMT8KN0/ftHv36T+V9kK73kzpo+IX/1FOGuBBBT03jiXFCW3nttq4IHKHiA
 VtS1ayqPR2Y42a5SGG3XDvNvwNQo9BmH1iiXEGl2JjpJhQHykDl5AKExO87h7f+ci3Mv
 UnZjJqeuq9LU9xT3qM2P/H6UOqQ4on48JNFP1im8JstTn9q+x9xswZnS3FEDDNScTfXM
 mQ5P9coUyG88fTvS9lHUHCqEpt0rZdeUN/TK/kskhSV0sWRcfgb4iPagF7T5RXBXIyiI
 bETA==
X-Gm-Message-State: AOAM533UyGx0FLnMQVfNJNeyJJ39qVJmS24gtMNShiJs/bFnZ3+z1X9z
 xsGWV9UFIBKoZI2Py5fxWDM=
X-Google-Smtp-Source: ABdhPJx78kwFzBXfvJvi8YwuMRvR0iUjeHn1QZnqQXHsSFpeV5QrHysEmB7yI8b1v+iASOqFaO2LQA==
X-Received: by 2002:aa7:d459:0:b0:427:bd8f:61f8 with SMTP id
 q25-20020aa7d459000000b00427bd8f61f8mr16374482edr.157.1651667305522; 
 Wed, 04 May 2022 05:28:25 -0700 (PDT)
Received: from localhost.localdomain
 (185-177-124-12.hosted-by-worldstream.net. [185.177.124.12])
 by smtp.gmail.com with ESMTPSA id
 ig1-20020a1709072e0100b006f3ef214e7asm5688693ejc.224.2022.05.04.05.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 05:28:25 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/13] Mediatek MT6735 main clock and reset drivers
Date: Wed,  4 May 2022 16:25:48 +0400
Message-Id: <20220504122601.335495-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_052827_638897_DE593A9F 
X-CRM114-Status: GOOD (  14.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yassine Oudjana <y.oudjana@protonmail.com>

This series adds support for the main clock and reset controllers on the
Mediatek MT6735 SoC:
- apmixedsys (global PLLs)
- topckgen (global divisors and muxes)
- infracfg (gates and resets for internal components)
- pericfg (gates and resets for peripherals)

MT6735 has other more specialized clock controllers, support for which is
not included in this series:
- imgsys (camera)
- mmsys (display)
- vdecsys (video decoder)
- audsys (audio)

Some symbols in common objects are exported to get the drivers to compile
as modules, and mtk_unregister_reset_controller() is implemented to allow
for unregistering reset controllers in the infracfg and pericfg drivers
when unloading them.

Yassine Oudjana (13):
  dt-bindings: clock: Add Mediatek MT6735 clock bindings
  dt-bindings: reset: Add MT6735 reset bindings
  dt-bindings: arm: mediatek: Add MT6735 clock controller compatibles
  clk: composite: Export clk_unregister_composite
  clk: mediatek: Export mtk_free_clk_data
  clk: mediatek: Add driver for MT6735 apmixedsys
  clk: mediatek: Add driver for MT6735 topckgen
  clk: mediatek: gate: Export mtk_clk_register_gates_with_dev
  clk: mediatek: reset: Export mtk_register_reset_controller symbols
  clk: mediatek: reset: Return mtk_reset pointer on register
  clk: mediatek: reset: Implement mtk_unregister_reset_controller() API
  clk: mediatek: Add driver for MT6735 infracfg
  clk: mediatek: Add driver for MT6735 pericfg

 .../arm/mediatek/mediatek,infracfg.yaml       |    8 +-
 .../arm/mediatek/mediatek,pericfg.yaml        |    1 +
 .../bindings/clock/mediatek,apmixedsys.yaml   |    4 +-
 .../bindings/clock/mediatek,topckgen.yaml     |    4 +-
 MAINTAINERS                                   |   16 +
 drivers/clk/clk-composite.c                   |    1 +
 drivers/clk/mediatek/Kconfig                  |   28 +
 drivers/clk/mediatek/Makefile                 |    4 +
 drivers/clk/mediatek/clk-gate.c               |    1 +
 drivers/clk/mediatek/clk-mt6735-apmixed.c     |  274 ++++
 drivers/clk/mediatek/clk-mt6735-infracfg.c    |  265 ++++
 drivers/clk/mediatek/clk-mt6735-pericfg.c     |  360 +++++
 drivers/clk/mediatek/clk-mt6735-topckgen.c    | 1159 +++++++++++++++++
 drivers/clk/mediatek/clk-mtk.c                |    1 +
 drivers/clk/mediatek/clk-mtk.h                |    8 +-
 drivers/clk/mediatek/reset.c                  |   31 +-
 .../clock/mediatek,mt6735-apmixedsys.h        |   16 +
 .../clock/mediatek,mt6735-infracfg.h          |   25 +
 .../clock/mediatek,mt6735-pericfg.h           |   37 +
 .../clock/mediatek,mt6735-topckgen.h          |   79 ++
 .../reset/mediatek,mt6735-infracfg.h          |   31 +
 .../reset/mediatek,mt6735-pericfg.h           |   31 +
 22 files changed, 2366 insertions(+), 18 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt6735-apmixed.c
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
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
