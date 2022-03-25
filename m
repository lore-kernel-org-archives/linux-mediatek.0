Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C059DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 18:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:In-Reply-To:References:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XIO+7WC8aneSRXmMQnlJH6Ma3jJFBdsE11QTod/WpqM=; b=Xdkm6ILgH+W/toCodd4Rg8g3tY
	yLigjRmfb81IJ2CMUdvr/Aj+kTpFTEf4ni9POpZEIFZWWMR2eBJdFAAsM/UT5CC5MR1F8E/tkGtEG
	2PgkcFpsYLddCs0g8UfnZL/uHIJv/9mWJqX62PTVAP2HQP7NgIKulgSPnUf+vI+5vwQcg/XtYcTCp
	3DUMxZZZlAr6ZxidUYTRCnKFgQXlJOVtBl2GUZRp0IN5jTMglECbPZDpwSzkSeTnrBtGXXK0RAFk4
	/jyB8eGHNXPDf/XNlEeXZ6sa7vuWQ5ado3Y9ck37GPPsWj/xDbTwwmNbN3EAJ/smNIJ8CnyTGbCWx
	OEdk3rEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXoNy-002ycl-Lp; Fri, 25 Mar 2022 18:10:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXoNv-002ycW-NG
 for linux-mediatek@bombadil.infradead.org; Fri, 25 Mar 2022 18:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:MIME-Version:In-Reply-To:References:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UsVgeYfaJ509Tslgy60qrERiqqOcqL3jk0p30JmJkWQ=; b=hVaNK5NjAIVlAnLSMXkquECxSV
 DcBhzenhEuzifW9XfjNkGAlQQwB8+7FKKOUIWmDeaYIU0WDuiQnRTrouA+RPPw4M1pTrupbZ8vg3d
 alWyc/xdFKYFSrRfMoBK71pWV7oHiIggdLjPYIuhXrjqKrgJODz+t6iIzpshu629TfN1CSdIEZKv7
 EO/FcygDj79F/R9Di8jkqgnv39lFfrAG/CDx1rdDj0PotiYu1LN46RxKH9ugPmVfdWOTen6LVDkGC
 S/OUqnyBLCGfvGawrVBULThkcf1T2GeIjyYiTP6IMAzEnYGdt2BPpzbRO4ciU/d7Ox4LXaZzkRMDR
 qLOwkIqw==;
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXo8G-004TBu-3I
 for linux-mediatek@lists.infradead.org; Fri, 25 Mar 2022 17:53:54 +0000
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-de3ca1efbaso8818978fac.9
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Mar 2022 10:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:user-agent:references:in-reply-to:mime-version:date:message-id
 :subject:to:cc;
 bh=UsVgeYfaJ509Tslgy60qrERiqqOcqL3jk0p30JmJkWQ=;
 b=hhlRnUQXbyBJmzhAL+CM/0K5cZ1aybx8S1kxzmMXQQ4jS6mL1MILd20jSy8DtFbZHZ
 tuiUZm+wRRIEudV/r9pD63VU89MvND8veQkiyC4DYFenrNwPvhByBOwC13TA9CwbQoZ/
 jGyLtzGYZlTMgGGCNq7KOzeYzg399O6i2BX+1n0HlxBLm5I1XYjCgzyXuCuVBqmvEyAP
 Obn9n0SJjJ7Dlyj5c+00dybeH9tzrLGeCLK7O+mUw9yTJ/J9CxTNS1DxTor3+3TbHX21
 6dvmswhw1vgSH8FA6KcEemRrApsTi9zOTOVWSQ5cLXC0uTq8h0Ji3+mG+HcpDEdXStN1
 ZkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:user-agent:references:in-reply-to
 :mime-version:date:message-id:subject:to:cc;
 bh=UsVgeYfaJ509Tslgy60qrERiqqOcqL3jk0p30JmJkWQ=;
 b=pX2V8wUOggCZks1Vkb9+sBafvadAfGq25dj87f4HzsMyjImvcrAH9BiXkGNMVH390+
 EekghlQgO+bznD7tL2HGa684YW7qMemCrJ0ybgSHaZRXekO5H+2kOoMO6QTrp6XD7mgn
 RoFjLKkK6PauPPdffCx5lcBCzufUWB1dCW9PW1fZOYzyyfAf11fESOVr25/rxiCHqtnX
 A4NSN+6ZZn/BTbaWifmya+IlMSkjj9O/aOze+oLyb4g/lOopxCfd7T2DgCVGUc7/FeYC
 f4ENr/mqckcYHTbd3qaQ9iN5kUM24tdT45z54DM+81aOO03qO8Xus0KsSjmUO5cp1Ool
 DPGg==
X-Gm-Message-State: AOAM530siZnC51bAHqS3g7qZQ7quJnJTk84mx2ZXnfphEzg0TgvwkYk0
 mPfxerNjHS2N2jUiIIrjC6kEwVpAiTgL/v/RydOBcQ==
X-Google-Smtp-Source: ABdhPJw5cZK8/9EAx8SjjCkfF2UirJgUYGr8gfKiuxQmwCyGvJA58RP/M318o7Lu6s72crly3nL6u8xwlk9WEs9kfFQ=
X-Received: by 2002:a05:6870:d191:b0:dd:a91e:82dc with SMTP id
 a17-20020a056870d19100b000dda91e82dcmr9542770oac.248.1648230822908; Fri, 25
 Mar 2022 10:53:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Mar 2022 12:53:42 -0500
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220325171511.23493-1-granquet@baylibre.com>
In-Reply-To: <20220325171511.23493-1-granquet@baylibre.com>
MIME-Version: 1.0
Date: Fri, 25 Mar 2022 12:53:42 -0500
Message-ID: <CABnWg9tJvCJrFCFR1Ax_M4gPaqhqS94kCkzmfb-naCh_S36vEg@mail.gmail.com>
Subject: Re: [PATCH 00/22] drm/mediatek: Add mt8195 DisplayPort driver
To: angelogioacchino.delregno@collabora.com, chunkuang.hu@kernel.org, 
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, kishon@ti.com, 
 vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-fbdev@vger.kernel.org, markyacoub@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_175352_290942_CBC8228D 
X-CRM114-Status: GOOD (  21.09  )
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

On Fri, 25 Mar 2022 18:14, Guillaume Ranquet <granquet@baylibre.com> wrote:
>this series is built around the DisplayPort driver. The dpi/dpintf
>driver and the added helper functions are required for the DisplayPort
>driver to work.
>
>This v9 is not quite ready yet, as project constraints forces me to
>publish v9 this week, I'm sorry if it's not standard practice.
>
>Moreover, it is still un-tested on a recent kernel.
>The integration kernel we are using is still based on 5.10... but we
>are actively working on bringing up a mt8195 integration branch on 5.17.
>The patches have been rebased on top of next-20220301 and have been
>tested to build sucessfully (no functional testing).
>
>Changes from v8:
>- The DP-Phy now has its own dt-bindings and now shares a regmap using the
>  syscon facility with the DP driver.
>- hot plug detection has been removed from the Embedded Display Port.
>  patch and moved to the patch adding External Display Port support.
>- started working on better error handling for the mtk_dp driver.
>- rebased on linux-next.
>- removal of tvd pll clocks re-introduced by mistake.
>- various coding style fixes.
>
>Things that are in my todolist for v10:
>- fixing the train_handler in the mtk_dp driver, as I haven't been able
>  to reproduce locally (hopefully migrating to running the tests on a
>  more recent kernel will help)
>- explaining the various sleep/delays introduced in the drivers
>- explaining some of the differences between mt8195 and "legacy"
>- retrieve CK/DE support from panel driver instead of hardcoding it into
>  the dpi driver.
>- better error handling/reporting in mtk_dp
>- look into re-implementing mtk_dp_aux_transfer() using drm_dp_dpcd_read and
>  drm_dp_dpcd_write as suggested by Rex.
>
>Older revisions:
>RFC - https://lore.kernel.org/linux-mediatek/20210816192523.1739365-1-msp@baylibre.com/
>v1  - https://lore.kernel.org/linux-mediatek/20210906193529.718845-1-msp@baylibre.com/
>v2  - https://lore.kernel.org/linux-mediatek/20210920084424.231825-1-msp@baylibre.com/
>v3  - https://lore.kernel.org/linux-mediatek/20211001094443.2770169-1-msp@baylibre.com/
>v4  - https://lore.kernel.org/linux-mediatek/20211011094624.3416029-1-msp@baylibre.com/
>v5  - https://lore.kernel.org/all/20211021092707.3562523-1-msp@baylibre.com/
>v6  - https://lore.kernel.org/linux-mediatek/20211110130623.20553-1-granquet@baylibre.com/
>v7  - https://lore.kernel.org/linux-mediatek/20211217150854.2081-1-granquet@baylibre.com/
>v8  - https://lore.kernel.org/linux-mediatek/20220218145437.18563-1-granquet@baylibre.com/
>
>Functional dependencies are:
>- Add Mediatek Soc DRM (vdosys0) support for mt8195
>  https://lore.kernel.org/all/20211026155911.17651-1-jason-jh.lin@mediatek.com/
>- Add MediaTek SoC DRM (vdosys1) support for mt8195
>  https://lore.kernel.org/all/20211029075203.17093-1-nancy.lin@mediatek.com/
>
>Guillaume Ranquet (15):
>  dt-bindings: mediatek,dp_phy: Add Display Port PHY binding
>  drm/edid: Convert cea_sad helper struct to kernelDoc
>  drm/edid: Add cea_sad helpers for freq/length
>  drm/mediatek: dpi: move dpi limits to SoC config
>  drm/mediatek: dpi: implement a CK/DE pol toggle in SoC config
>  drm/mediatek: dpi: implement a swap_input toggle in SoC config
>  drm/mediatek: dpi: move dimension mask to SoC config
>  drm/mediatek: dpi: move hvsize_mask to SoC config
>  drm/mediatek: dpi: move swap_shift to SoC config
>  drm/mediatek: dpi: move the yuv422_en_bit to SoC config
>  drm/mediatek: dpi: move the csc_enable bit to SoC config
>  drm/mediatek: dpi: Add dpintf support
>  drm/meditek: dpi: Add matrix_sel helper
>  drm/mediatek: Add mt8195 External DisplayPort support
>  drm/mediatek: DP audio support for mt8195
>
>Jitao Shi (2):
>  drm/mediatek: add hpd debounce
>  drm/mediatek: change the aux retries times when receiving AUX_DEFER
>
>Markus Schneider-Pargmann (5):
>  dt-bindings: mediatek,dpi: Add DP_INTF compatible
>  dt-bindings: mediatek,dp: Add Display Port binding
>  video/hdmi: Add audio_infoframe packing for DP
>  phy: phy-mtk-dp: Add driver for DP phy
>  drm/mediatek: Add mt8195 Embedded DisplayPort driver
>
> .../display/mediatek/mediatek,dp.yaml         |   97 +
> .../display/mediatek/mediatek,dpi.yaml        |   11 +-
> .../bindings/phy/mediatek,dp-phy.yaml         |   43 +
> MAINTAINERS                                   |    1 +
> drivers/gpu/drm/drm_edid.c                    |   74 +
> drivers/gpu/drm/mediatek/Kconfig              |    8 +
> drivers/gpu/drm/mediatek/Makefile             |    2 +
> drivers/gpu/drm/mediatek/mtk_dp.c             | 3204 +++++++++++++++++
> drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  568 +++
> drivers/gpu/drm/mediatek/mtk_dpi.c            |  222 +-
> drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |   38 +
> drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |    8 +
> drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |    1 +
> drivers/gpu/drm/mediatek/mtk_drm_drv.c        |    6 +-
> drivers/gpu/drm/mediatek/mtk_drm_drv.h        |    1 +
> drivers/phy/mediatek/Kconfig                  |    8 +
> drivers/phy/mediatek/Makefile                 |    1 +
> drivers/phy/mediatek/phy-mtk-dp.c             |  202 ++
> drivers/video/hdmi.c                          |   82 +-
> include/drm/dp/drm_dp_helper.h                |    2 +
> include/drm/drm_edid.h                        |   25 +-
> include/linux/hdmi.h                          |    7 +-
> include/linux/soc/mediatek/mtk-mmsys.h        |    3 +-
> 23 files changed, 4541 insertions(+), 73 deletions(-)
> create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
> create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
> create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c
>
>--
>2.34.1
>

This is actually v9.
Please ignore these as I will resend the patches properly tagged as v9.

Sorry for the inconveniance,
Guillaume.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
