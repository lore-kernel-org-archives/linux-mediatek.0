Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2205C8303C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jul 2025 15:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbN9vJsY/mkHEsGghFEQy2rviLOqFLUvl0p6J+/2RvA=; b=frMPjqSiUoavrCwGtvN0sCpGSQ
	KCEchbK/XnJM50nqEYE5Al7/GaQN5aHolyhs7ME0Jnw7q4Q1ap9MK9ZK1loSrcPb3iGVxJdny9T0f
	ZvjBwqy64FghTsPcRsT0REcacZ3nTgvkGhHwpRkxc1bWYJWPwWgBwKyPYMVL9X4cRQvbHR4n4OsG5
	zz9gEEDmnJ+FwHZvR1sS83UZ26yic4no5uRVz9ePD9YmmNWHiwa3ikMzSkNg0h99E4DIEbHbk76C5
	VdPww/TO68d+m0CHmmnkz0gvTL8FnxVtL4R/HvFb4PaHqyBqnXC53jfIov9HiEDYl/g3MM7dW4mt7
	eRJUjPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9wX-00000005irD-1iQN;
	Tue, 08 Jul 2025 15:09:13 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9su-00000005i5b-2pN2
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Jul 2025 15:05:29 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e82278e3889so3272485276.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Jul 2025 08:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751987127; x=1752591927; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AbN9vJsY/mkHEsGghFEQy2rviLOqFLUvl0p6J+/2RvA=;
        b=t0qml0g2wJ6hlEhx195xTt5JypaSFnw5lYIVLtFmy1e6SQ477D9IieyCg7+wgVCH5/
         zkXlZHLquIgHMDDG8yHSYjwvCtK4YY9HoTU0QmpfgA6WhVuoTDvEdiC7TJeHwVXpOaEH
         onCw1nuOyDRQNFvJSiiHsrhmqZgzGtmgZDY4Z2ID1JVEKjootFSWviMx65US1MbSGzF2
         Xw/VHjThdAJO0MsBBPFNK7x0AnXO+IToBb9wM9WKDbwZ87AanACrXqDpODG/rIlZ92DS
         +KX4Xu0lGpnPx/tmwkfxEF3NarZygxx0LH7NZJGXFnfg8bcH8IuKZukFsOvdX8F33nrV
         W/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751987127; x=1752591927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbN9vJsY/mkHEsGghFEQy2rviLOqFLUvl0p6J+/2RvA=;
        b=eimxT2MypsG2t5wO8OuIXkEuqC/t7R+gByfAFLeo4c701RP0Gz+/Wc+gCMtOm/7ahF
         aN62WcGgJJXxf6IgNuAyYiDgIhDwwphHS+na2n/hE7QAAYES4/lYwsQTRUlGK6EGXNAJ
         HQEeG8jhy4bkOLjGDo/e6vH4kB2Vd8k/G5QRFAyEyfgoyaxT8cccPjjQXpAMJkmp6C7P
         D/3LdV66T+6KQW8ZO1RgNlh94S/1djdl0br6cJYCSeAcKDr4YRtb24IqSoZEZIXI/TZw
         xX1mtJzVZGmPCtOUd4AAKkvrfz/nVkvgEao0D+WKeKLwi1k+z0uMu6dO4izq+TJaRAg4
         tNTQ==
X-Gm-Message-State: AOJu0YwWF1XLXXoG08ltUkyxURPb2cncVDNz4DPQk5r1Kr0+A4boQerG
	dW93mBRJXQmcTwyNUWS51Lh7aXtEYRocsf1nwyv+KmkbPEPiUDCxkHKJRbJxFMdcgcgfIfnG067
	PVuyaT5jDLA1Nnie8zFRuwjoB/Mstc8ykOSalPP34ag==
X-Gm-Gg: ASbGncv9jioXCIjxx4XM4w1OZUJEeBa6aBALk2AgIwrZxOLwSFyp1I1XGPPYwrJPuX6
	qvFTRehmepjEhNtb+FMMfByIoKkb5zGXSzGMDE0Mq/KQt1zz1QLFVHVieqbj9ofO7gl/TTxohWN
	qKXcFzUEKTSDtTITOi5ghqRZb/X6IFzT3feOcnktkYZhwt
X-Google-Smtp-Source: AGHT+IHBtCLoH5+e5H6LltUDB7e8LY/seAM2AxugJI15zrEUc8YzJfSv/mbx//NgSFS3ANi+4dqcSKaKRPubRavB9Bw=
X-Received: by 2002:a05:690c:45c9:b0:708:16b0:59c3 with SMTP id
 00721157ae682-717a046193fmr41621337b3.33.1751987126648; Tue, 08 Jul 2025
 08:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250707105605.98248-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250707105605.98248-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Jul 2025 17:04:50 +0200
X-Gm-Features: Ac12FXwX-NP6E6P2Q56_QdBCypnbJ4xWnF08vZN6p09NHmwLlHzcTOT7bmz8Wbg
Message-ID: <CAPDyKFrDytmrkd6SsJc6W=k7Ayijfadu5jTOyTGn9rJS1osQBg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] pmdomain: Partial refactor, support modem and RTFF
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_080528_716568_FC9C62B3 
X-CRM114-Status: GOOD (  32.83  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, mbrugger@suse.com, y.oudjana@protonmail.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, lihongbo22@huawei.com, wenst@chromium.org, matthias.bgg@gmail.com, mandyjh.liu@mediatek.com, krzk+dt@kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 7 Jul 2025 at 12:56, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Changes in v2:
>  - Added #access-controller-cells allowance for MT8188/95 infracfg_ao
>
> This series is a subset of [1], leaving out the Hardware Voter specific
> bits for MT8196 until the discussion around it reaches a conclusion.
>
> Even though the proposed code was born as a preparation to support the
> MT8196/MT6991 SoCs power domain controllers, it is a necessary cleanup
> for all power domain controllers of all of the currently supported SoCs
> from MediaTek.
>
> You may also notice the addition of support for modem power sequences:
> this was brought up 6 months ago (or more) by community contributors
> (mainly Yassine Oudjana) that were trying to upstream the MediaTek
> MT6735 Smartphone SoC and needed support to provide power to the MD
> subsystem - so, even though in this specific series the code for the
> modem power sequence is not yet triggered by any SoC, please please
> please, let it in.
> Besides, "a bunch" of upstream supported SoCs do have the MD power
> domain even though it wasn't added to their drivers (because if there
> was no support in the driver, it would just crash the system); the
> addition is something that I plan to do at some point, but definitely
> not now as I have no bandwidth for that (bar MT8196, which will have
> this domain).
>
> Compared to v1 in [1]:
>  - Changed mediatek,bus-protection to access-controllers
>    as suggested by Rob (thanks!)
>  - Added commits to document #access-controller-cells on all of
>    the access control providers

The series looks good to me! I can pick patch 1->9, but I am awaiting
an ack from some of the DT maintainers for patch 1->3 first.

Kind regards
Uffe



>
> In the meanwhile.... relevant excerpt from the old series:
>
> This series refactors the bus protection regmaps retrieval to avoid
> searching in all power domain devicetree subnodes for vendor properties
> to get syscons for different busses, and adds a new property which is
> located in the power controller root node containing handles to the same.
>
> Retrocompatibility is retained and was tested on multiple SoCs in the
> Collabora lab - specifically, on Genio 350/510/700/1200, and manually
> on MT6795 Helio (Xperia M5 Smartphone), MT8186, MT8192 and MT8195
> Chromebooks.
>
> This was tested *three times*:
>  - Before the per-SoC conversion in drivers/pmdomain/mediatek
>  - With per-SoC conversion code but with *legacy* devicetree
>  - With per-SoC conversion code and with *new* devicetree conversion
>
> All of those tests were successful on all of the aforementioned SoCs.
>
> This also adds support for:
>  - Modem power domain for both old and new MediaTek SoCs, useful for
>    bringing up the GSM/3G/4G/5G modem for both laptop and smartphone use
>  - RTFF MCU HW, as found in MT8196 Chromebooks and MT6991 Dimensity 9400
>
> ...and prepares the pmdomain code to accomodate only the directly
> controlled power domains for MT8196 (HW Voter support was left out).
>
> [1] https://lore.kernel.org/all/20250623120154.109429-1-angelogioacchino.delregno@collabora.com
>
> AngeloGioacchino Del Regno (10):
>   dt-bindings: memory: mtk-smi: Document #access-controller-cells
>   dt-bindings: clock: mediatek: Document #access-controller-cells
>   dt-bindings: power: mediatek: Document access-controllers property
>   pmdomain: mediatek: Refactor bus protection regmaps retrieval
>   pmdomain: mediatek: Handle SoCs with inverted SRAM power-down bits
>   pmdomain: mediatek: Move ctl sequences out of power_on/off functions
>   pmdomain: mediatek: Add support for modem power sequences
>   pmdomain: mediatek: Add support for RTFF Hardware in MT8196/MT6991
>   pmdomain: mediatek: Convert all SoCs to new style regmap retrieval
>   arm64: dts: mediatek: Convert all SoCs to use access-controllers
>
>  .../bindings/clock/mediatek,infracfg.yaml     |   3 +
>  .../clock/mediatek,mt8186-sys-clock.yaml      |  15 +
>  .../clock/mediatek,mt8188-sys-clock.yaml      |  15 +
>  .../clock/mediatek,mt8192-sys-clock.yaml      |  15 +
>  .../clock/mediatek,mt8195-sys-clock.yaml      |  15 +
>  .../clock/mediatek,mt8365-sys-clock.yaml      |  15 +
>  .../mediatek,smi-common.yaml                  |  16 +
>  .../power/mediatek,power-controller.yaml      |  39 ++
>  arch/arm64/boot/dts/mediatek/mt6795.dtsi      |   5 +-
>  arch/arm64/boot/dts/mediatek/mt8167.dtsi      |   6 +-
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |   4 +-
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  17 +-
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  12 +-
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi      |  23 +-
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  13 +-
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  20 +-
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi      |  16 +-
>  drivers/pmdomain/mediatek/mt6795-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8167-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8173-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8183-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8186-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8188-pm-domains.h |   6 +
>  drivers/pmdomain/mediatek/mt8192-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8195-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8365-pm-domains.h |  14 +-
>  drivers/pmdomain/mediatek/mtk-pm-domains.c    | 399 +++++++++++++++---
>  drivers/pmdomain/mediatek/mtk-pm-domains.h    |  74 +++-
>  28 files changed, 596 insertions(+), 181 deletions(-)
>
> --
> 2.49.0
>

