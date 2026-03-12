Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D786FED2C8
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 04:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/CLgwAizLdgwnVah8slW2Wa5Fqh07xJoE9OJwqSRCXM=; b=y5Mzrbj+DHNHv2WENm5EFj/7Cy
	YjmPb9Zw2ILFMZL7cc7ON4kNpqeCkHZ7wP89/0H2R6dv4TbF64KrRbMIbVhtYiREJR/fgDYEB/sN4
	GnKJFCI48jICbCxuClMEK1Tav5XRcd5tnV+NEGMmQuMxL0tHhpS43RHuUD/Bz2zEI91I7aZLvaU5e
	Er0eD5W958F6AkQNSHbxEECvjRtmHF+25qYguJ4zj6td74bWFz5WgwmRreqm0ahAiPOcGstGJTRdm
	VvkidiDLHqyAV4HaAPI4xVXW0FNBcDlCIMdiWPRIV2jWWEF6/JyqSxpCxsp3uRfAfYMzP5fcoYg6n
	3EBdgrbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XT0-0000000DEDU-3EcL;
	Thu, 12 Mar 2026 04:16:10 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XSx-0000000DEBh-3ouv
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 04:16:09 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-35a1749728dso78552a91.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 21:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288965; x=1773893765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/CLgwAizLdgwnVah8slW2Wa5Fqh07xJoE9OJwqSRCXM=;
        b=eWm0RnaZ5cUbZw9xgSgwP/nCTVPRl9pG75nGWfnZDKOY82xkdvEw+SonBEy2VlwyyE
         LB6FL+GoH5430LvXyYdj21ukY1WjzbAZo3hplb4uJVoxakj6/rRTZqEyl7oGtnsyEwh6
         F28Aglfav2KwgrszBI1mLl6hLSg3BXiILW34QSnPZucyjlon/0ji+7/5pcLBTU5+g3us
         WOUk7x1Pec9svwhPDVjh27EEqQnnj1Guu+v6XrD5+4lj2PnIbwofL/T4rJZUhoA0wVM9
         lx7ydLXUeZbIW6SIMG3X5w4AVdx0UeVnDX8s8N32A91TOOfsb0VN0MCJhqhhlxD96x5I
         tmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288965; x=1773893765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CLgwAizLdgwnVah8slW2Wa5Fqh07xJoE9OJwqSRCXM=;
        b=S8s6wfbgq/9lU8ZnOM9V34/+YQ/yu1kFXVz8pUsLRhk9iISbwACjYLHOn3bYCq8Okr
         f7PPpBbFTC8fNE5vFEK9WChfnvLkEV7f4k/hcetgp3SqkomYb3m0e4Lb1Wm0eM2S1atF
         U3nyFZCOvArozX+S3WG6lPU5lKpis/eQZzypzA7z+foxsZRYgJGZoWiJR+UR82PFvLMP
         wOLeZwZc+04q+MbDIdSAgFAynOHyPyePg4mhZMe7MMY0Qtb+diP6+riuMfZ7vxVmk/Th
         0wrKAnFkYfY3WyHIaLFrWeGIY6KKv0hxYKkegH5wGbJJ9UZBABh06A4GmoQQAD+t390J
         aXAw==
X-Forwarded-Encrypted: i=1; AJvYcCX/L8OYbQL4ihIzHswSRRPFRg+/wcSFEV4GHS0cA78YNSxUaIyZ4rF4RDPQBt5ZE8BJ/kIBKkZlIUwhzwSAUg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5/Ae0LpOTTE+dqTU8E8462m3DZw0AzzSe22YVgqQ5Q6h3hqgg
	cqwPk8gzL/Ais0oGepAFJDSGXc/lgJ1B7qByWzlKFV2zCdTgnQmGPX5h
X-Gm-Gg: ATEYQzw/q6dTP+9qIKd/MNS8F//+gloKJLtIwW8GVO1v9jqapQApkXUU0rwUyukbRsB
	OS95aP9YSI2sHh4FcdUfJeC8mHJZ58o5stj+ml6Ic5KG66mE/1MMtQXMHBEB2dFcReZ/+myVTTl
	DOq5Fu3yD0oC9u+t7zK6dQiAo98s+kcJjCXaG+ocIfOtjAthfk/Cq5rm36Z4uHcNk8ViWeW8eew
	YRpRKtbyUnpvLC0QDtgLB9SiPcAAFU+Ydu3gNfeUO93KVGN48T4qmGrLJNnkFwqwujBt7DY4T01
	WNQFL/03XwytMtZxd4NBy5a8evtXTVHyvEXAWJXXQc9I4GvJJ0Ro+Yq9jZobkOZ4xBqnuLBdG9w
	GQ18DuNrqZMAalTkZRqWkqBGtrBqrDhGBLlPhGYhzJr/7BTjmWh7qmcutWBMpMg6DtZWRmbqqGY
	qrKZXqGpAyJZyodgnXZdiMRB5hvlZiELZYECvp9ReAxLJtXpoKTADPmLjdDQgPX1AiwCA3Bs/aV
	BNmuWw=
X-Received: by 2002:a17:90b:5445:b0:359:7a1f:1b83 with SMTP id 98e67ed59e1d1-35a01323909mr4580458a91.26.1773288964582;
        Wed, 11 Mar 2026 21:16:04 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:04 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linusw@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	hui.liu@mediatek.com,
	nfraprado@collabora.com,
	linus.walleij@linaro.org,
	mars.cheng@mediatek.com,
	andy.teng@mediatek.com,
	hanks.chen@mediatek.com,
	sam.shih@mediatek.com,
	rafal@milecki.pl,
	ben.ho@mediatek.com,
	erin.lo@mediatek.com,
	zhiyong.tao@mediatek.com,
	Jason-ch.Chen@mediatek.com,
	amergnat@baylibre.com,
	seiya.wang@mediatek.com,
	tinghan.shen@mediatek.com,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 0/6] pinctrl: mediatek: Fix gpio-ranges and include guard issues
Date: Thu, 12 Mar 2026 13:15:27 +0900
Message-ID: <20260312041533.187553-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_211607_964256_96E21F7D 
X-CRM114-Status: GOOD (  13.01  )
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

While looking at MediaTek's Pinctrl driver and device tree, I discovered
that on some SoCs, the gpio-ranges count was a little less than the pins
defined. This means that the last pin will no longer be available.

And fixing this issue, I also discovered that the #endif comment in the
include guard for some header files was different from the macro name at
the beginning. These issues do not affect the compiled kernel, but they
affect the readability and consistency of the code.

This series addresses the cases that can be confirmed correct without
requiring datasheet verification:

- mt6795 : gpio-ranges 196 -> 197
- mt7981b: gpio-ranges 56 -> 57
- mt7986a: gpio-ranges 100 -> 101
- mt6779 : include guard #endif comment fix
- mt8188 : include guard #endif comment fix (two files)

The following additional issues were identified during this investigation
but are not included in this series as they require further analysis
or datasheet confirmation:

MT6779: gpio-ranges = <&pio 0 0 210>;
    This matches the number of pins, but GPIO203 to 209 don't have
    GPIO function, and the driver also has no control over those pins.
    Probably needs to be fixed to "gpio-ranges = <&pio 0 0 203>;"

MT8183: gpio-ranges = <&pio 0 0 192>;
    This seems correct because it matches "pinctrl-mtk-mt8183.h".
    But, mode/dir/di/do are defined from pin 0 to 192.
    "pinctrl-mt8183.c" looks wrong.

MT8188: gpio-ranges = <&pio 0 0 176>;
    According to "pinctrl-mtk-mt8188.h", GPIO0 to 176 have GPIO function,
    and GPIO177 to 189 are EINT only pin, but mode/dir/di/do are defined
    from pin 0 to 177. "pinctrl-mt8188.c" is likely to be wrong.
    At least "176" is wrong, probably "gpio-ranges = <&pio 0 0 177>;"

MT8192: gpio-ranges = <&pio 0 0 220>;
    "pinctrl-mtk-mt8192.h" defines GPIO0 to 227 which have GPIO function,
    but mode/dir/di/do are defined from pin 0 to 228.
    "pinctrl-mt8192.c" looks wrong.
    Also, probably "gpio-ranges = <&pio 0 0 229>;"

MT8195: gpio-ranges = <&pio 0 0 144>;
    Like MT8188, GPIO144 to 164 don't have GPIO function,
    but mode/dir/di/do are defined from pin 0 to pin 144.
    "pinctrl-mt8195.c" is likely to be wrong.


Akari Tsuyukusa (6):
  arm64: dts: mediatek: mt6795: Fix gpio-ranges pin count
  arm64: dts: mediatek: mt7981b: Fix gpio-ranges pin count
  arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count
  pinctrl: mediatek: mt6779: Fix include guard comment in the header
  pinctrl: mediatek: mt8188: Fix include guard comment in the header
  dt-bindings: pinctrl: mediatek: mt8188: Fix include guard comment

 arch/arm64/boot/dts/mediatek/mt6795.dtsi              | 2 +-
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi             | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi             | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h         | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h         | 2 +-
 include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.53.0


