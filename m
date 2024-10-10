Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A17ACF11F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 13:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7+Y0UnqSCJyK4JfiDtNuNdtFaFzWSU45KXZfcE1fxFk=; b=geO0R3zcRWPV/7rJDDoZ5jJJ50
	ZxNGTexQ1Cvgokw8xPwiswvAEi4hlnxUhVrdOELiX1csbYmUbDfZewL8Osunki0wgVDaQ2DUoTza/
	9tkR/gfTszLSGyJ0sXV2mX38DIBBYyuCWlHXamjO4D30FHsyyX9cyXHg/xDn2UB+xCFFZ6x0VGLi6
	KXQArfSzLzG/KTYP73OqRW7EH+hO5uAaz+t6M+4HyR4EjJPMevZo83x9g/FGTDSxmOFuFlrf0zN0z
	AdxhwGl7ivGFeAP+4Kx8ubT5v9o6ezQNW6dKMihnwIjZsqBHvEmoyDsZdqm4NhGwIDamrnTpVhK55
	Zln4cAvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sytCN-0000000CuCS-2H58;
	Thu, 10 Oct 2024 13:27:23 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sytCL-0000000CuBs-2Q1K;
	Thu, 10 Oct 2024 13:27:23 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5c876ed9c93so1099947a12.2;
        Thu, 10 Oct 2024 06:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728566840; x=1729171640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7+Y0UnqSCJyK4JfiDtNuNdtFaFzWSU45KXZfcE1fxFk=;
        b=NyrAzeduNs5DxGGZrOESvmw6XfoYmFZJqUR2T3muNLMaNO1lZHtjYRZbK7G3Z3bv2m
         XTol2nNiAzMTcfVnzeO5oPOfzeCVtRxbBqfzqTbp/xFlIiyqchtDvSTbUq/4IYbJzE2F
         GI6Zn2K9+9FK4fxhY80V8A1U77MBEP+zRh9QVh7tCn5ZpyKv+tZMV7iHevOL8hdu8gW1
         +qu+b6g7of5wHHZQn1ioYf30E9wu2ByrwbZqwq/d66p3Pr/ctoYUOOREn6M7OQxMWNhD
         mwqKCCeiP97vDgM8aiBbEU+eEmQ2sEfL/qiECR0ld8kL5GMDsoSRACahqMeqs5eyF81m
         caYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728566840; x=1729171640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+Y0UnqSCJyK4JfiDtNuNdtFaFzWSU45KXZfcE1fxFk=;
        b=Y5nGz+cKviHJmREFySSVLZRdJB9h294QOLqYmVLDdOY07tSWBYaMmrCPyjhFjVyEmL
         j2OoLMtgJpkEcCegQWoRIBsKeQ9JLgzEpYe7NN0b40+K+x1K4/9+81RkQdOCZeZggUXz
         gJoDDmYCROZyDzzb/GKlfqhPkPvGpOmOCc/8vTHCWC+41+iCJ2L7rZaETSCPtic0WpJL
         K70VWy4nh22e07WnLMtd9ZiI5h1un/5IKCteQBwZMSlGb1kuZHcQX6EJw0OUVJcACiJ1
         pjMosKZSwRnAXku/fnXtd4XzF0p86aFz8FNMwaHfAIlDhSwZ3bJA2NV5CJxD3/4XSgL0
         JL4w==
X-Forwarded-Encrypted: i=1; AJvYcCV1UAM9uMf4WIjAzgYZLg4FWpvIIrtRadMSvi7LuWJg49SuHRgoFxvcreDiOukgHHzi53f5mm8OMS1ysJqWq5U=@lists.infradead.org, AJvYcCVSiPVQ3egAYsd51nYBa1Wgeqb0lwHgJtwXWKbbBju4akc5+q4ITrnF4F7XcVGz5R2yuV67mcj+kJxvMk0uhY1/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1FSHF+52wbIrIVcle1RZ/4NmZJDj2CZSZOFzgZQroqRYjwKtE
	JmDSJ//vOtuYw/6OS7gYatO3P2yQs2yHfkJzlGr+bXiksNrj68Ji
X-Google-Smtp-Source: AGHT+IEW8/apmqrpk1UObsIY0s6nDJHzLk8B90zHTPRtOwBtMiwpp6Ft3UHhYVu8O/D/2w1tW631aA==
X-Received: by 2002:a05:6402:42ca:b0:5c8:8fe7:73a8 with SMTP id 4fb4d7f45d1cf-5c91d538500mr5344625a12.7.1728566839821;
        Thu, 10 Oct 2024 06:27:19 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937260a9asm765198a12.67.2024.10.10.06.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:27:19 -0700 (PDT)
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
Subject: [PATCH v6 0/2] MediaTek MT6735 main clock and reset drivers
Date: Thu, 10 Oct 2024 16:26:55 +0300
Message-ID: <20241010132659.81606-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_062721_645383_918CFF64 
X-CRM114-Status: GOOD (  17.99  )
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

Changes since v5:
- Fixed typos in driver source.
Changes since v4:
- Follow naming convention for DT bindings.
- Add reset map.
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


