Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABACC636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 09:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDtWmLW2+rIn62rWSCtJexgwQxHrKFFfxiLCKNCrz7I=; b=GGLFXUrvJqBz1wLvCGtzfDogYh
	BSyLFMQHwtv0dl+mUedftLQbi8HYSqnuCzJJpsW8J9dxuauP6y9Vgpq4n7e41DcY2Gk1zU0fVJ1FM
	XP3MySIBpKpZaffAO84gr5cnhN/FpzGsYGvDC61ukQM1BCX28DGbYytHS1WAPBW4TwzY48VtNaBQM
	aH7YwyTwYUTpPvDPpVAnrZjYd1mD5InYejw7Il29Yp7HBSsEs157GRjztBGJ4TU7X5rR5VeBGBe0k
	246CLIVcP+4tEKlkx5kNoKPWLanKxHptxIVtmNz7hTSf0HF3INqL2QziY8r3HS3MlBS7zgBwRVZ2N
	5Y1BzcUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPJtt-00BN5N-Qw; Tue, 07 Feb 2023 09:04:29 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPJtp-00BN2e-Sw
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 09:04:28 +0000
Received: by mail-io1-xd35.google.com with SMTP id e204so5431158iof.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 01:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YDtWmLW2+rIn62rWSCtJexgwQxHrKFFfxiLCKNCrz7I=;
        b=aytrUwXgsQWj8v6VyU0OCawjn3EJfMkwm8VRTpoFmbacZn/UPLHFcYTI5tVm2j1RKl
         UOH4AalBhqxtZmRE8qYIOw1cfNeulI8BIqw3oBqaCb8v6xmvd3Y+1Vi05rZUysBbZRi+
         H530nAln2feKNQVs32n8+/mUbMnPzdrMOmH9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDtWmLW2+rIn62rWSCtJexgwQxHrKFFfxiLCKNCrz7I=;
        b=yTQo7iPn5Whkqhw6pHU10Y/Z+FuVVg+rxllMMXJP8Be2QhbI/O+CswvyEhV7HPTbvl
         PXzA/W+6rRjBf4DwM8NiHGsaUHWdgwiERIdc/OJxIZyUMYM08jPegaS/2DPzviLCkwsX
         OGYWtI1YqE9aIuaYiCUrzpyZgEaHsAbquI9GSeWLMG+hUoqLo0INYTNODZg0LLxt82mG
         hUYR8X7Ka/MQqNiPjmBIRwQk7TlzP0xbdJVNfAwYzuo2ZhzJw4mZeDFg7HJVsuKR3J9q
         mT4WRJnmBe4dPn5BdAOK9pGOgIkHGuPzT4Yg+DJRPiUZGr3+Ftce3kUGgtFjqjqgJ2x2
         unig==
X-Gm-Message-State: AO0yUKX1CmyFmN3DGoC88KISldzft/2+4EofD/fAVqoKkc4uGGoanDLo
	g4BQAL6/eAVQYSztMWIT0CcuNUJTetp0QcyVDyMqNA==
X-Google-Smtp-Source: AK7set8BLcM2LkjWPmAc03PMO/FabErzoQIE5/+bcU5rY25B2EID8F9EzP4dVNJPquc83jtMonIuTw/9NB4+yeOtlBs=
X-Received: by 2002:a5d:9c49:0:b0:718:b11d:a972 with SMTP id
 9-20020a5d9c49000000b00718b11da972mr1592674iof.36.1675760663010; Tue, 07 Feb
 2023 01:04:23 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <847332fb-5f10-a8dd-4203-a1906973d0ff@collabora.com>
In-Reply-To: <847332fb-5f10-a8dd-4203-a1906973d0ff@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 17:04:11 +0800
Message-ID: <CAGXv+5GUaWzoPZuO3ZUX60exZeg2S=91u-i1bGOraV1AcWP9Og@mail.gmail.com>
Subject: Re: [PATCH v1 00/45] MediaTek clocks: full module build and cleanups
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_010425_982862_9100457D 
X-CRM114-Status: GOOD (  35.52  )
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

On Mon, Feb 6, 2023 at 11:38 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 06/02/23 16:28, AngeloGioacchino Del Regno ha scritto:
> > This is part 2 of the "MediaTek clocks cleanups and improvements" series,
> > which was already picked.
> >
> > If reading this full cover letter is too boring for you, here's a short
> > summary of the changes of this series:
> >   - Added mtk_clk_pdev_probe() for mtk-mmsys probed clocks;
> >   - Added divider clock support to common probe mechanism;
> >   - Various cleanups here and there;
> >   - Converted most clock drivers to platform_driver;
> >   - MediaTek clocks can now be built as modules.
> >
> > NOTE: Applies on top of [1].
> >
> >

Something broke on MT8183 Juniper, though I'm not sure what. It ended up
crashing in mtk-cpufreq in a badly written error path. Once that was fixed
it was endlessly looping through deferred probe. Seems like mtk-cpufreq
was not able to get all its resources.

ChenYu

> ...and of course I forgot to paste the link.
>
> [1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=719067
>
> Cheers,
> Angelo
>
>
> > Full blurb:
> >
> > This huge series adds more cleanups on top, reducing size and adding more
> > commonization for clock drivers probe/remove, which also includes a new
> > common probe mechanism for multimedia clock drivers that are usually
> > probed by mtk-mmsys instead of a dt clock node: thanks to this, it was
> > finally possible to convert almost all clock drivers to the common probe
> > mechanism, which *finally again* makes us able to build all these drivers
> > as modules!
> >
> > Since this looked like being *the* way forward, I went on converting some
> > more drivers away from OF_CLK_DECLARE_DRIVER to full platform_driver(s),
> > allowing for more (actually, almost all!) drivers to be built as modules.
> >
> > While at it, I also added some more consistency in macros usage by
> > removing all of the duplicated full macro declaration for MediaTek gate
> > clocks and replacing all of those with using the GATE_MTK macro instead,
> > producing a nice reduction in amount of lines per file but, more
> > importantly, improving readability and eventual future batch changes.
> >
> > This amount of commonization will also, in my opinion, greatly improve
> > the review process for new clock drivers, as they will be mostly just a
> > list of clocks and won't contain much new code, as it's all going to be
> > handled in the common places, which also reduces chances to see new clock
> > driver related bugs emerging on one SoC or the other.
> >
> > Since I don't own devices with all of the supported MediaTek SoCs, I
> > could not test some of the conversions on real hardware... but I am
> > confident that this will work as the drivers are *very* similar on a
> > per-generation basis.
> >
> > This series was build-tested for all (both module and built-in build)
> > and was manually tested on MT6795, MT8173, MT8192, MT8195.
> >
> > AngeloGioacchino Del Regno (45):
> >    clk: mediatek: clk-mtk: Switch to device_get_match_data()
> >    clk: mediatek: clk-mtk: Introduce clk_mtk_pdev_{probe,remove}()
> >    clk: mediatek: Migrate to mtk_clk_pdev_probe() for multimedia clocks
> >    clk: mediatek: Add divider clocks to mtk_clk_simple_{probe,remove}()
> >    clk: mediatek: mt2712: Migrate topckgen/mcucfg to
> >      mtk_clk_simple_probe()
> >    clk: mediatek: mt2712: Compress clock arrays entries to 90 columns
> >    clk: mediatek: mt2712: Add error handling to
> >      clk_mt2712_apmixed_probe()
> >    clk: mediatek: mt2712: Move apmixedsys clock driver to its own file
> >    clk: mediatek: mt2712: Change to use module_platform_driver macro
> >    clk: mediatek: mt2712: Change Kconfig options to allow module build
> >    clk: mediatek: mt8365: Move apmixedsys clock driver to its own file
> >    clk: mediatek: mt8365: Convert to mtk_clk_simple_{probe,remove}()
> >    clk: mediatek: mt8167: Compress GATE_TOPx macros
> >    clk: mediatek: mt8167: Move apmixedsys as platform_driver in new file
> >    clk: mediatek: mt8167: Remove __initconst annotation from arrays
> >    clk: mediatek: mt8167: Convert to mtk_clk_simple_{probe,remove}()
> >    clk: mediatek: mt8183: Move apmixedsys clock driver to its own file
> >    clk: mediatek: mt8183: Compress clocks arrays entries where possible
> >    clk: mediatek: mt8183: Convert all remaining clocks to common probe
> >    clk: mediatek: Consistently use GATE_MTK() macro
> >    clk: mediatek: mt7622: Properly use CLK_IS_CRITICAL flag
> >    clk: mediatek: mt7622: Move apmixedsys clock driver to its own file
> >    clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c
> >    clk: mediatek: mt7622: Convert to platform driver and simple probe
> >    clk: mediatek: mt8516: Move apmixedsys clock driver to its own file
> >    clk: mediatek: mt8516: Convert to platform driver and simple probe
> >    clk: mediatek: mt8516: Allow building clock drivers as modules
> >    clk: mediatek: Propagate struct device with
> >      mtk_clk_register_dividers()
> >    clk: mediatek: mt7986-apmixed: Use PLL_AO flag to set critical clock
> >    clk: mediatek: mt7986-infracfg: Migrate to common probe mechanism
> >    clk: mediatek: mt7986-eth: Migrate to common probe mechanism
> >    clk: mediatek: mt8186-mcu: Migrate to common probe mechanism
> >    clk: mediatek: Switch to module_platform_driver() where possible
> >    clk: mediatek: Add MODULE_LICENSE() where missing
> >    clk: mediatek: Split MT8195 clock drivers and allow module build
> >    clk: mediatek: Allow building MT8192 non-critical clocks as modules
> >    clk: mediatek: Allow MT7622 clocks to be built as modules
> >    clk: mediatek: Allow all MT8167 clocks to be built as modules
> >    clk: mediatek: Allow all MT8183 clocks to be built as modules
> >    clk: mediatek: Allow building most MT6765 clock drivers as modules
> >    clk: mediatek: Allow building most MT6797 clock drivers as modules
> >    clk: mediatek: Split configuration options for MT8186 clock drivers
> >    clk: mediatek: mt8192: Move apmixedsys clock driver to its own file
> >    clk: mediatek: Kconfig: Allow module build for core mt8192 clocks
> >    clk: mediatek: Add MODULE_DEVICE_TABLE() where appropriate
> >
> >   drivers/clk/mediatek/Kconfig                  |  282 +++--
> >   drivers/clk/mediatek/Makefile                 |   53 +-
> >   drivers/clk/mediatek/clk-mt2701-aud.c         |   49 +-
> >   drivers/clk/mediatek/clk-mt2701-bdp.c         |   27 +-
> >   drivers/clk/mediatek/clk-mt2701-eth.c         |   16 +-
> >   drivers/clk/mediatek/clk-mt2701-g3d.c         |   16 +-
> >   drivers/clk/mediatek/clk-mt2701-hif.c         |   16 +-
> >   drivers/clk/mediatek/clk-mt2701-img.c         |   15 +-
> >   drivers/clk/mediatek/clk-mt2701-mm.c          |   56 +-
> >   drivers/clk/mediatek/clk-mt2701-vdec.c        |   27 +-
> >   drivers/clk/mediatek/clk-mt2701.c             |   48 +-
> >   drivers/clk/mediatek/clk-mt2712-apmixedsys.c  |  154 +++
> >   drivers/clk/mediatek/clk-mt2712-bdp.c         |   16 +-
> >   drivers/clk/mediatek/clk-mt2712-img.c         |   15 +-
> >   drivers/clk/mediatek/clk-mt2712-jpgdec.c      |   16 +-
> >   drivers/clk/mediatek/clk-mt2712-mfg.c         |   15 +-
> >   drivers/clk/mediatek/clk-mt2712-mm.c          |   66 +-
> >   drivers/clk/mediatek/clk-mt2712-vdec.c        |   27 +-
> >   drivers/clk/mediatek/clk-mt2712-venc.c        |   16 +-
> >   drivers/clk/mediatek/clk-mt2712.c             | 1016 +++++------------
> >   drivers/clk/mediatek/clk-mt6765-audio.c       |   27 +-
> >   drivers/clk/mediatek/clk-mt6765-cam.c         |   16 +-
> >   drivers/clk/mediatek/clk-mt6765-img.c         |   15 +-
> >   drivers/clk/mediatek/clk-mt6765-mipi0a.c      |   16 +-
> >   drivers/clk/mediatek/clk-mt6765-mm.c          |   15 +-
> >   drivers/clk/mediatek/clk-mt6765-vcodec.c      |   16 +-
> >   drivers/clk/mediatek/clk-mt6765.c             |   90 +-
> >   drivers/clk/mediatek/clk-mt6779-aud.c         |    1 +
> >   drivers/clk/mediatek/clk-mt6779-cam.c         |    1 +
> >   drivers/clk/mediatek/clk-mt6779-img.c         |    1 +
> >   drivers/clk/mediatek/clk-mt6779-ipe.c         |    1 +
> >   drivers/clk/mediatek/clk-mt6779-mfg.c         |    1 +
> >   drivers/clk/mediatek/clk-mt6779-mm.c          |   25 +-
> >   drivers/clk/mediatek/clk-mt6779-vdec.c        |    1 +
> >   drivers/clk/mediatek/clk-mt6779-venc.c        |    1 +
> >   drivers/clk/mediatek/clk-mt6779.c             |    1 +
> >   drivers/clk/mediatek/clk-mt6795-apmixedsys.c  |    1 +
> >   drivers/clk/mediatek/clk-mt6795-infracfg.c    |    1 +
> >   drivers/clk/mediatek/clk-mt6795-mfg.c         |    1 +
> >   drivers/clk/mediatek/clk-mt6795-mm.c          |   56 +-
> >   drivers/clk/mediatek/clk-mt6795-pericfg.c     |    1 +
> >   drivers/clk/mediatek/clk-mt6795-topckgen.c    |    1 +
> >   drivers/clk/mediatek/clk-mt6795-vdecsys.c     |    1 +
> >   drivers/clk/mediatek/clk-mt6795-vencsys.c     |    1 +
> >   drivers/clk/mediatek/clk-mt6797-img.c         |   15 +-
> >   drivers/clk/mediatek/clk-mt6797-mm.c          |   56 +-
> >   drivers/clk/mediatek/clk-mt6797-vdec.c        |   27 +-
> >   drivers/clk/mediatek/clk-mt6797-venc.c        |   16 +-
> >   drivers/clk/mediatek/clk-mt6797.c             |   47 +-
> >   drivers/clk/mediatek/clk-mt7622-apmixedsys.c  |  138 +++
> >   drivers/clk/mediatek/clk-mt7622-aud.c         |   49 +-
> >   drivers/clk/mediatek/clk-mt7622-eth.c         |   27 +-
> >   drivers/clk/mediatek/clk-mt7622-hif.c         |   27 +-
> >   drivers/clk/mediatek/clk-mt7622-infracfg.c    |  129 +++
> >   drivers/clk/mediatek/clk-mt7622.c             |  375 +-----
> >   drivers/clk/mediatek/clk-mt7629-eth.c         |   25 +-
> >   drivers/clk/mediatek/clk-mt7629-hif.c         |   27 +-
> >   drivers/clk/mediatek/clk-mt7629.c             |   46 +-
> >   drivers/clk/mediatek/clk-mt7981-apmixed.c     |    2 +
> >   drivers/clk/mediatek/clk-mt7981-eth.c         |    3 +-
> >   drivers/clk/mediatek/clk-mt7981-infracfg.c    |    4 +-
> >   drivers/clk/mediatek/clk-mt7981-topckgen.c    |    4 +-
> >   drivers/clk/mediatek/clk-mt7986-apmixed.c     |    8 +-
> >   drivers/clk/mediatek/clk-mt7986-eth.c         |  115 +-
> >   drivers/clk/mediatek/clk-mt7986-infracfg.c    |   93 +-
> >   drivers/clk/mediatek/clk-mt7986-topckgen.c    |    4 +-
> >   drivers/clk/mediatek/clk-mt8135.c             |   31 +-
> >   drivers/clk/mediatek/clk-mt8167-apmixedsys.c  |  145 +++
> >   drivers/clk/mediatek/clk-mt8167-aud.c         |   47 +-
> >   drivers/clk/mediatek/clk-mt8167-img.c         |   50 +-
> >   drivers/clk/mediatek/clk-mt8167-mfgcfg.c      |   50 +-
> >   drivers/clk/mediatek/clk-mt8167-mm.c          |   69 +-
> >   drivers/clk/mediatek/clk-mt8167-vdec.c        |   59 +-
> >   drivers/clk/mediatek/clk-mt8167.c             |  390 ++-----
> >   drivers/clk/mediatek/clk-mt8173-apmixedsys.c  |    1 +
> >   drivers/clk/mediatek/clk-mt8173-img.c         |    1 +
> >   drivers/clk/mediatek/clk-mt8173-infracfg.c    |    1 +
> >   drivers/clk/mediatek/clk-mt8173-mm.c          |   82 +-
> >   drivers/clk/mediatek/clk-mt8173-pericfg.c     |    1 +
> >   drivers/clk/mediatek/clk-mt8173-topckgen.c    |    1 +
> >   drivers/clk/mediatek/clk-mt8173-vdecsys.c     |    1 +
> >   drivers/clk/mediatek/clk-mt8173-vencsys.c     |    1 +
> >   drivers/clk/mediatek/clk-mt8183-apmixedsys.c  |  194 ++++
> >   drivers/clk/mediatek/clk-mt8183-audio.c       |    5 +-
> >   drivers/clk/mediatek/clk-mt8183-cam.c         |    5 +-
> >   drivers/clk/mediatek/clk-mt8183-img.c         |    5 +-
> >   drivers/clk/mediatek/clk-mt8183-ipu0.c        |    5 +-
> >   drivers/clk/mediatek/clk-mt8183-ipu1.c        |    5 +-
> >   drivers/clk/mediatek/clk-mt8183-ipu_adl.c     |    5 +-
> >   drivers/clk/mediatek/clk-mt8183-ipu_conn.c    |    5 +-
> >   drivers/clk/mediatek/clk-mt8183-mfgcfg.c      |    5 +-
> >   drivers/clk/mediatek/clk-mt8183-mm.c          |   29 +-
> >   drivers/clk/mediatek/clk-mt8183-vdec.c        |    5 +-
> >   drivers/clk/mediatek/clk-mt8183-venc.c        |    5 +-
> >   drivers/clk/mediatek/clk-mt8183.c             |  747 +++---------
> >   drivers/clk/mediatek/clk-mt8186-apmixedsys.c  |    4 +-
> >   drivers/clk/mediatek/clk-mt8186-cam.c         |    4 +-
> >   drivers/clk/mediatek/clk-mt8186-img.c         |    4 +-
> >   .../clk/mediatek/clk-mt8186-imp_iic_wrap.c    |    4 +-
> >   drivers/clk/mediatek/clk-mt8186-infra_ao.c    |    4 +-
> >   drivers/clk/mediatek/clk-mt8186-ipe.c         |    4 +-
> >   drivers/clk/mediatek/clk-mt8186-mcu.c         |   69 +-
> >   drivers/clk/mediatek/clk-mt8186-mdp.c         |    4 +-
> >   drivers/clk/mediatek/clk-mt8186-mfg.c         |    4 +-
> >   drivers/clk/mediatek/clk-mt8186-mm.c          |   59 +-
> >   drivers/clk/mediatek/clk-mt8186-topckgen.c    |    4 +-
> >   drivers/clk/mediatek/clk-mt8186-vdec.c        |    4 +-
> >   drivers/clk/mediatek/clk-mt8186-venc.c        |    4 +-
> >   drivers/clk/mediatek/clk-mt8186-wpe.c         |    4 +-
> >   drivers/clk/mediatek/clk-mt8192-apmixedsys.c  |  215 ++++
> >   drivers/clk/mediatek/clk-mt8192-aud.c         |    5 +-
> >   drivers/clk/mediatek/clk-mt8192-cam.c         |    5 +-
> >   drivers/clk/mediatek/clk-mt8192-img.c         |    5 +-
> >   .../clk/mediatek/clk-mt8192-imp_iic_wrap.c    |    5 +-
> >   drivers/clk/mediatek/clk-mt8192-ipe.c         |    5 +-
> >   drivers/clk/mediatek/clk-mt8192-mdp.c         |    5 +-
> >   drivers/clk/mediatek/clk-mt8192-mfg.c         |    5 +-
> >   drivers/clk/mediatek/clk-mt8192-mm.c          |   34 +-
> >   drivers/clk/mediatek/clk-mt8192-msdc.c        |    5 +-
> >   drivers/clk/mediatek/clk-mt8192-scp_adsp.c    |    5 +-
> >   drivers/clk/mediatek/clk-mt8192-vdec.c        |    5 +-
> >   drivers/clk/mediatek/clk-mt8192-venc.c        |    5 +-
> >   drivers/clk/mediatek/clk-mt8192.c             |  223 +---
> >   drivers/clk/mediatek/clk-mt8195-apmixedsys.c  |    4 +-
> >   drivers/clk/mediatek/clk-mt8195-apusys_pll.c  |    4 +-
> >   drivers/clk/mediatek/clk-mt8195-cam.c         |    4 +-
> >   drivers/clk/mediatek/clk-mt8195-ccu.c         |    4 +-
> >   drivers/clk/mediatek/clk-mt8195-img.c         |    4 +-
> >   .../clk/mediatek/clk-mt8195-imp_iic_wrap.c    |    4 +-
> >   drivers/clk/mediatek/clk-mt8195-infra_ao.c    |    4 +-
> >   drivers/clk/mediatek/clk-mt8195-ipe.c         |    4 +-
> >   drivers/clk/mediatek/clk-mt8195-mfg.c         |    4 +-
> >   drivers/clk/mediatek/clk-mt8195-peri_ao.c     |    4 +-
> >   drivers/clk/mediatek/clk-mt8195-scp_adsp.c    |    4 +-
> >   drivers/clk/mediatek/clk-mt8195-topckgen.c    |    4 +-
> >   drivers/clk/mediatek/clk-mt8195-vdec.c        |    4 +-
> >   drivers/clk/mediatek/clk-mt8195-vdo0.c        |   59 +-
> >   drivers/clk/mediatek/clk-mt8195-vdo1.c        |   61 +-
> >   drivers/clk/mediatek/clk-mt8195-venc.c        |    4 +-
> >   drivers/clk/mediatek/clk-mt8195-vpp0.c        |    4 +-
> >   drivers/clk/mediatek/clk-mt8195-vpp1.c        |    4 +-
> >   drivers/clk/mediatek/clk-mt8195-wpe.c         |    4 +-
> >   drivers/clk/mediatek/clk-mt8365-apmixedsys.c  |  166 +++
> >   drivers/clk/mediatek/clk-mt8365-apu.c         |    3 +-
> >   drivers/clk/mediatek/clk-mt8365-cam.c         |    3 +-
> >   drivers/clk/mediatek/clk-mt8365-mfg.c         |    3 +-
> >   drivers/clk/mediatek/clk-mt8365-mm.c          |   42 +-
> >   drivers/clk/mediatek/clk-mt8365-vdec.c        |    3 +-
> >   drivers/clk/mediatek/clk-mt8365-venc.c        |    3 +-
> >   drivers/clk/mediatek/clk-mt8365.c             |  605 ++--------
> >   drivers/clk/mediatek/clk-mt8516-apmixedsys.c  |  122 ++
> >   drivers/clk/mediatek/clk-mt8516-aud.c         |   47 +-
> >   drivers/clk/mediatek/clk-mt8516.c             |  246 +---
> >   drivers/clk/mediatek/clk-mtk.c                |   82 +-
> >   drivers/clk/mediatek/clk-mtk.h                |    7 +-
> >   155 files changed, 3292 insertions(+), 4355 deletions(-)
> >   create mode 100644 drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> >   create mode 100644 drivers/clk/mediatek/clk-mt7622-apmixedsys.c
> >   create mode 100644 drivers/clk/mediatek/clk-mt7622-infracfg.c
> >   create mode 100644 drivers/clk/mediatek/clk-mt8167-apmixedsys.c
> >   create mode 100644 drivers/clk/mediatek/clk-mt8183-apmixedsys.c
> >   create mode 100644 drivers/clk/mediatek/clk-mt8192-apmixedsys.c
> >   create mode 100644 drivers/clk/mediatek/clk-mt8365-apmixedsys.c
> >   create mode 100644 drivers/clk/mediatek/clk-mt8516-apmixedsys.c
> >

