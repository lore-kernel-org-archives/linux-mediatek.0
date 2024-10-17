Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A48D2F7F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 07:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LPNLPgog+vbCNk0LoFWcYy/EHFJxqj69cSg/nXPsFdU=; b=PZx1xBfPmBB+d1FBsnEuLsO9zt
	2AmmEyt17FoQAZKbaX5i6309sQzqE0ntrZTQcoSG68lRFOxhds0AlFKjZ1cVjDPkby4uhnNQNLXT/
	CRPpRlaO9bt0pFgmCqdFBy46jKKU6R/AQzvoJHzJsE2a8tYViIcg9Wd36d37nhKccBeok08YMwNqW
	C7UUGz+gEwGAhZ2R4BmjCHWbQYnmCkX+38PylMNprrPh4bDTOYZaAb5RIzdZP0eUulPTMfUD/1K3y
	kXy0Af+hLfAHHiSAFtynWNnU+jyvLFnUvykVAqwcIVUzkmKSFFv3a5Vo26ark9X8HtLwLmP144386
	y0/6eBGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1KlN-0000000DyQY-42W4;
	Thu, 17 Oct 2024 07:17:37 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1KlI-0000000DyOB-3qj3;
	Thu, 17 Oct 2024 07:17:37 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2fb599aac99so6647301fa.1;
        Thu, 17 Oct 2024 00:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729149451; x=1729754251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LPNLPgog+vbCNk0LoFWcYy/EHFJxqj69cSg/nXPsFdU=;
        b=D5yRk1UpiXkLdqUDpaZfKk4IKItw5tcF0q78RPvn7IwtRZLkD1Ym+QAJX7flmVLNeW
         OuI2zC6iw8t4y6QihctSELxYczwcJrdz81PzFn1Gvs88E1A+V54MpaKhh4qCPriVozP1
         kPSDexTjXgp/is9uEEWZAA4Z08JF8VNNY+2okRMB3pRfRZeJ+5D2fA5sX6AliNCkCSvZ
         7W2C9LafLUhwxFFpkpjLdRO8+9MnjE35j0OyBihirRJHoBl4hSWmbFLbxgIpzSlSXInn
         /ac2JT9mc+D/zR1w+M0yb00r53JsyV4PYHI2X9TD+AfdcpVlJM+RMbkng4/M1+0u07uf
         Xiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729149451; x=1729754251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPNLPgog+vbCNk0LoFWcYy/EHFJxqj69cSg/nXPsFdU=;
        b=tmwpD9crjX26dydlOoAIkvTutWP0gTNDpBKu0XEv0LiKYXPovXBKadUyyigqVNbbLC
         5v1bHxGVXBPvBb1crqcSuXdEhytMzO/ovlt+Wlq5I0ReV6EPHoo7Dqxq83Eb/mKW6Hvo
         bkx9qw8ugEspLVfa1Ex+g8PeSZY5cqiThd1tIg5mGjYN2Yhy8XzDCxT4SGk3rHlc4fBw
         Xd/v1a8qCdP02bPjrgRmHqNjpCag+5435Ma9dVJypaFAcD+Pc3Y33VKlJH0/JoiOPjzk
         2b1+3asV55a3R66sEYmQpJAhUxyObGDSmGCc8L1m6hodnOKlmc7AxjfaAzRmmmv2XxEW
         5a0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhKPUZ6FlkkAuevXffZ3n8/AdgNWAcC59DLKeovCWH6yCX82d8yLUUUC6pBPbg+MWpMb/RVRxsja/bkZLivrqa@lists.infradead.org, AJvYcCX0WL2lCbnSmTpYm9Gzg8wngg0TRZtYLrsQwvhvFp0aIYmSc+/nxqpA4AzQFmgWg/kIq1ZB3SZe9oJeHRcNLGA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmQr9XUJeyv7sReFSQQ5jd3j6OECfxzAV3pyFbNiCcpp86I10k
	WEeMoViHxiu94ZJWO7I9wjBVjezPKz4RuKQXNO52wl/6yhLtrtu6
X-Google-Smtp-Source: AGHT+IE0e+JRuUmErjYZCGI8T82wUui0287djy2ICfp5vPfucLeYv+FrmzFELL6uAEWUR9QgzHH5LQ==
X-Received: by 2002:a2e:b88f:0:b0:2fb:3c44:7f8b with SMTP id 38308e7fff4ca-2fb3f2e8e69mr88977821fa.43.1729149450347;
        Thu, 17 Oct 2024 00:17:30 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d778266sm2392174a12.70.2024.10.17.00.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 00:17:29 -0700 (PDT)
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
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 0/2] MediaTek MT6735 main clock and reset drivers
Date: Thu, 17 Oct 2024 10:17:04 +0300
Message-ID: <20241017071708.38663-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_001733_002635_5B93A187 
X-CRM114-Status: GOOD (  17.96  )
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

Changes since v6:
- Change .remove_new to .remove in platform driver structs.
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
2.47.0


