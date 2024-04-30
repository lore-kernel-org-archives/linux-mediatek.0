Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93212C10F16
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 10:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIx1dFfAcpeKO8TErHh7vGY1lorqPiA5UlnTCSzH2HY=; b=2BKRlkrQYPtJ3Gl2ZDgCDgzZZJ
	lB4A7KGAIOt/VNUMT93a1lXiPLSPdIFD6ZAnxI8uFRDc3V1YoKXC8JGaFLUK0gxIxU/m4EE5KwMIg
	crJSixO8HJjoNwwqUFvRb1XTtqDtpwGBEB+YQP84+28GKJA9AnoPpVUJ94brpYoKOjSENmWxJ1U6A
	eb/0QmbQU27vUwgWSRw91OX2wYX+rqtqtxXbS+B7k3EUgQ6k1wvrlkJaG9ooTNsn7w1nnYyUYcsMi
	F6NXz5LHkU60RMPoAkyd6GVNpdm/ulT4yrioH7JpII0NVla2jykr2TEvPvX1hfkzJIkIgpEfYOHpI
	ozGIY74Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1kW5-00000005yJ7-1Qaa;
	Tue, 30 Apr 2024 10:15:17 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1kW0-00000005yGf-44Yh
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Apr 2024 10:15:15 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-51bafbe7509so7718425e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Apr 2024 03:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714472110; x=1715076910; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dIx1dFfAcpeKO8TErHh7vGY1lorqPiA5UlnTCSzH2HY=;
        b=o6K0W/O/mrX+dEy9VOW0FHvUpriLDDGBtaSTM21kEzkxxra/w7FknU9EQGhW2X4+TX
         Fx7ABLMn+AQUq6+2rEAi9pC/pXFjQj0cqDTtovtPur97+8tjMyNzvaxjl64ZUziULrr3
         2RlKiTo/U+ekE9C2rfs3XXTPpNsD/0BjxurmRw03VYp7ypvdwFkixaatZhgdyB7YyLsh
         7UyWpjf5tdfzFcWXwnQM4tQGwNnKFL3KgDF+Gw96NJ5KWCMN7+Vn/T/rj9c1MDf7KkjX
         B+lbl/V2DdldwxIqZw39URXDpTa/h7G1TWYpDtrCOdEwN5/glwLdtYWw/6ZaLxM3B0xU
         SIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714472110; x=1715076910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIx1dFfAcpeKO8TErHh7vGY1lorqPiA5UlnTCSzH2HY=;
        b=uu60BS3hLwLjTLzSMHbOThLk1ww+7trk2bnMUDU2T9LQWVR+HJk7dpNVcAkky233R7
         UrQqljdPGi8nsadGz5n6aKApeoqTAaoYOtwyfwG0qsSu7ckzWvgs/GEkqJDI6cg+X244
         UPkLVO/P1O01jn0yFUwk/IJgRCTPszlCQz8JkWeaX3fsR1Zh20CEhzcNk3/sgIPkg97a
         4rMLAgQ6kL6stV3B6KEJgPbxtH2QLGFiPDi1aHcFgclZiEMouZiUUUcgvDcK4XtLE+rk
         uYZkQwH8QjPRBqWH2USISuUlfzQAP7X+aCjR4g7bfm1W+aP63HMjx4cWBRtf5aUIbR11
         ZJHA==
X-Forwarded-Encrypted: i=1; AJvYcCXLrFgE5mc7Mwi/KaMnsn5UDVX/MbrIUPuouNvTERk9aET6+VkRE+ND9IgEs8cBTOJLJ4UkPET5RaCm3dTEZTaD7yfXXdjjsxFCtrgGtoesC6uE
X-Gm-Message-State: AOJu0Yzck8ApiaMbKfDP3+Kk6YdoCOE4qf2OoHRV+4XrpGFJauX9uTlb
	skEgCRhs7Ej1lP9eeWmOQRAA3ZhltK/L9+hB7l13lAfyAy/Irx/0aeROxaP1LeA=
X-Google-Smtp-Source: AGHT+IEeZGVbkW3UvagFGYDQZ5bMmN4VdL24N9F8cduZig7xQbulffwe9LBCfuUp6MPaqlZqlp0YPw==
X-Received: by 2002:ac2:4945:0:b0:516:cf23:588 with SMTP id o5-20020ac24945000000b00516cf230588mr10156881lfi.27.1714472109993;
        Tue, 30 Apr 2024 03:15:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id g29-20020a0565123b9d00b0051d807addd7sm884156lfv.60.2024.04.30.03.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 03:15:09 -0700 (PDT)
Date: Tue, 30 Apr 2024 13:15:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/5] drm/ci: update xfails for the new testlist
Message-ID: <hon4klkoaouuxhtvm3qb3qstsrdcibihksyrmvxkt3taijl6wb@ubitr6namryw>
References: <20240430091121.508099-1-vignesh.raman@collabora.com>
 <20240430091121.508099-6-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430091121.508099-6-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_031513_045421_6ADCBA37 
X-CRM114-Status: GOOD (  20.50  )
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

On Tue, Apr 30, 2024 at 02:41:21PM +0530, Vignesh Raman wrote:
> Now the testlist is used from IGT build, so update
> xfails with the new testlist.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt | 47 +++++++----
>  .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  8 +-
>  .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt | 15 ++++
>  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt | 22 ++++-
>  .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |  8 ++
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |  8 ++
>  drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  | 45 +++++-----
>  drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |  5 ++
>  drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  | 12 +++
>  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  | 26 +++++-
>  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |  6 ++
>  drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |  8 ++
>  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  | 28 +++++--
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  | 12 +++
>  drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  | 39 ++++-----
>  drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt | 10 ++-
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  | 21 +++++
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  | 75 +++++++++--------
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  | 13 +++
>  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  | 46 +++++------
>  drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |  8 ++
>  .../drm/ci/xfails/mediatek-mt8173-fails.txt   | 47 +++--------
>  .../drm/ci/xfails/mediatek-mt8183-fails.txt   | 17 +---
>  .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |  5 ++
>  .../gpu/drm/ci/xfails/meson-g12b-fails.txt    | 20 +----
>  .../gpu/drm/ci/xfails/meson-g12b-flakes.txt   |  5 ++
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   | 26 ++----
>  .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |  5 ++
>  .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |  5 +-
>  .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |  5 ++
>  .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   | 67 +++++++++++++++
>  .../msm-sc7180-trogdor-kingoftown-fails.txt   | 34 ++++----
>  .../msm-sc7180-trogdor-kingoftown-flakes.txt  |  5 ++
>  ...sm-sc7180-trogdor-lazor-limozeen-fails.txt | 34 ++++----
>  ...m-sc7180-trogdor-lazor-limozeen-flakes.txt |  5 ++
>  .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    | 75 ++++-------------
>  .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   | 26 ++----
>  .../drm/ci/xfails/rockchip-rk3288-fails.txt   | 54 ------------
>  .../drm/ci/xfails/rockchip-rk3399-fails.txt   | 80 ++----------------
>  .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  7 --
>  .../drm/ci/xfails/virtio_gpu-none-fails.txt   | 82 +++++++++++++------
>  .../drm/ci/xfails/virtio_gpu-none-skips.txt   |  3 +
>  42 files changed, 574 insertions(+), 495 deletions(-)
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
>  delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
>  delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
> 

[skipped]

> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> index 44a5c62dedad..96e9faf0e607 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> @@ -1,19 +1,9 @@
> +core_setmaster_vs_auth,Fail
> +device_reset,Fail
> +dumb_buffer,Fail

This doesn't look correct, core tests should be passing.

>  kms_3d,Fail
> -kms_addfb_basic@addfb25-bad-modifier,Fail
> -kms_cursor_legacy@all-pipes-forked-bo,Fail
> -kms_cursor_legacy@all-pipes-forked-move,Fail
> -kms_cursor_legacy@all-pipes-single-bo,Fail
> -kms_cursor_legacy@all-pipes-single-move,Fail
> -kms_cursor_legacy@all-pipes-torture-bo,Fail
> -kms_cursor_legacy@all-pipes-torture-move,Fail
> -kms_cursor_legacy@pipe-A-forked-bo,Fail
> -kms_cursor_legacy@pipe-A-forked-move,Fail
> -kms_cursor_legacy@pipe-A-single-bo,Fail
> -kms_cursor_legacy@pipe-A-single-move,Fail
> -kms_cursor_legacy@pipe-A-torture-bo,Fail
> -kms_cursor_legacy@pipe-A-torture-move,Fail
> -kms_force_connector_basic@force-edid,Fail
> -kms_hdmi_inject@inject-4k,Fail
> -kms_selftest@drm_format,Timeout
> -kms_selftest@drm_format_helper,Timeout

Fine, kms_cursor_legacy tests were migrated to -flakes. But what
happened with the rest of the failures?

> -msm_mapping@ring,Fail
> +kms_force_connector_basic,Fail
> +kms_lease,Fail
> +msm_mapping,Fail
> +msm_submit,Fail
> +tools_test,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
> new file mode 100644
> index 000000000000..3cc361b3d3b3
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
> @@ -0,0 +1,5 @@
> +# Board Name: apq8016-sbc-usb-host
> +# Bug Report: TBD
> +# IGT Version: 1.28-gd2af13d9f
> +# Linux Version: 6.9.0-rc4
> +kms_cursor_legacy

It looks like one of the scripts has lost subtest granularity. It should
be fixed before the patchset can be merged.

-- 
With best wishes
Dmitry

