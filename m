Return-Path: <SRS0=bWHh=K5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDD6C47082
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 11:34:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A623A613E9
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 11:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A623A613E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfDqIEU1eBzzisZc22/Sh3y18g6S2rPTK6TW2x6E4d0=; b=ztUrB2m8vNlB40
	H7331HaF6Dh9YMsOL8dJ26W2VwzUh/AAD62DbguESXuV3NlK3sUylZMqIL0jIrK9XWINQUq8nC07S
	YL3j0s9hw7ckECJ0t4yUzwgcO0PHH4RWnykqBGDdM5j3Hhfe8ZfINYd9GAlDrhEE2rw6OxNDceg8f
	qwwjDkVUkZJMuoGS7QPwmn5+OfpgEbUCf9j8hnM28iUezvv94pU4jAVNP4dSC/iCZqWx/17T9lwaE
	JcIEnR4LbdmSQXHrs3vXdMH5DuKg25NhucmcGHK2XUdE09oX1uhYoPEMfRxg4k2xxasPemG+yA3gI
	pXxf/afNwyD94OsCfqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lolc1-008N14-Ja; Thu, 03 Jun 2021 11:34:09 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lolbx-008MzX-Nk
 for linux-mediatek@lists.infradead.org; Thu, 03 Jun 2021 11:34:07 +0000
Received: by mail-ej1-x629.google.com with SMTP id k25so3218749eja.9
 for <linux-mediatek@lists.infradead.org>; Thu, 03 Jun 2021 04:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=6HvIM789SubGuMYbkNpXgOUOzv2hDzoCVUlTW74s4fU=;
 b=Icz+hjCozpAbugnKTylUiZbczne6xNvCGiJZU4Ly+Y0sTLpTodbh9k4gjcGfRsjGg/
 no7FFQmnsdBfKr9sK4hrwdOb1O14S9safSd/B9yMITPwQlvWCp+FhIUkoUgp/bmsqz9c
 88sMh5y11ExAwXNyPJkPGgqwn4tfntMA/Y84s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=6HvIM789SubGuMYbkNpXgOUOzv2hDzoCVUlTW74s4fU=;
 b=lSfwNJ2EvHlc72pLPCKLBw7/8fyrqKTS+QzBqmsSL0FD1kfic05XPAbrSlwTYUev1H
 8vAE+rqwEtHDofaQlb2lctKV4KAgl817Ionvzk0BI4tLINkA/CfjQsS5psRJoIlQdTYE
 viq/mNgScJ+ZGzNK69Jxf5GQSyubUKqXKorpkBm6JpBIyKkIs0x2+RJO64AdVWyfDjeq
 INRkokxg1JUaRZ3PC6BtGmfLowf7kscJhkA5ZjPDBm+4noxYH+Sa2dAtBrh03QODLPAY
 JI+GIof2oVcixtYk/7Giu93Xf8bDln8+Yn1i2GJrH0GNzRJ4hJLhhovHbEp4hJ2ebcGx
 Ijhg==
X-Gm-Message-State: AOAM533UjLsNLTHOsK/IfazFduAeSeZWvvHPchQHZ57xX869WDk/2nf5
 sBUncNA7Hxr1HcTSBEMq5y5ChA==
X-Google-Smtp-Source: ABdhPJyCwjLRS9cmLZJ0uTIlfsEVYF9kSAF6LM5y2zAtZNY0+nXGguY0rzWF/YLHqYcWC2qrUHt3Fw==
X-Received: by 2002:a17:906:51d8:: with SMTP id
 v24mr23819138ejk.264.1622720043762; 
 Thu, 03 Jun 2021 04:34:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p7sm1638842edw.43.2021.06.03.04.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 04:34:03 -0700 (PDT)
Date: Thu, 3 Jun 2021 13:34:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, Adam Jackson <ajax@redhat.com>,
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agarwal <akshua@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Alistair Popple <apopple@nvidia.com>, amd-gfx@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Ben Skeggs <bskeggs@redhat.com>, Ben Widawsky <ben@bwidawsk.net>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
 Fabien Dessenne <fabien.dessenne@st.com>, freedreno@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Huang Rui <ray.huang@amd.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Rossi <issor.oruam@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, nouveau@lists.freedesktop.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robdclark@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Stephen Boyd <swboyd@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>
Subject: Re: [RESEND 00/26] Rid W=1 warnings from GPU
Message-ID: <YLi+KJrLjKbdXLxH@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, Adam Jackson <ajax@redhat.com>,
 Ajay Kumar <ajaykumar.rs@samsung.com>,
 Akshu Agarwal <akshua@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Alistair Popple <apopple@nvidia.com>, amd-gfx@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Ben Skeggs <bskeggs@redhat.com>, Ben Widawsky <ben@bwidawsk.net>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Eric Anholt <eric@anholt.net>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 freedreno@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Huang Rui <ray.huang@amd.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Rossi <issor.oruam@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 nouveau@lists.freedesktop.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robdclark@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_043405_806798_E52C4784 
X-CRM114-Status: GOOD (  22.81  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jun 02, 2021 at 03:32:34PM +0100, Lee Jones wrote:
> Some off these patches have been knocking around for a while.
> =

> Who will hoover them up please?
> =

> This set is part of a larger effort attempting to clean-up W=3D1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> =

> Lee Jones (26):
>   drm/mediatek/mtk_disp_color: Strip incorrect doc and demote header
>   drm/mediatek/mtk_disp_gamma: Strip and demote non-conformant
>     kernel-doc header
>   drm/mediatek/mtk_disp_ovl: Strip and demote non-conformant header
>   drm/mediatek/mtk_disp_rdma: Strip and demote non-conformant kernel-doc
>     header
>   drm/sti/sti_hdmi_tx3g4c28phy: Provide function names for kernel-doc
>     headers
>   drm/sti/sti_hda: Provide missing function names
>   drm/sti/sti_tvout: Provide a bunch of missing function names
>   drm/sti/sti_hqvdp: Fix incorrectly named function 'sti_hqvdp_vtg_cb()'
>   drm/msm/disp/dpu1/dpu_encoder_phys_cmd: Remove unused variable
>     'cmd_enc'
>   drm/msm/disp/dpu1/dpu_hw_interrupts: Demote a bunch of kernel-doc
>     abuses
>   drm/msm/disp/dpu1/dpu_plane: Fix a couple of naming issues
>   drm/msm/msm_gem: Demote kernel-doc abuses
>   drm/msm/dp/dp_catalog: Correctly document param 'dp_catalog'
>   drm/msm/dp/dp_link: Fix some potential doc-rot
>   drm/nouveau/nvkm/subdev/mc/tu102: Make functions called by reference
>     static
>   drm/amd/display/dc/dce/dce_transform: Remove superfluous
>     re-initialisation of DCFE_MEM_LIGHT_SLEEP_CNTL,
>   drm/xlnx/zynqmp_disp: Fix incorrectly named enum
>     'zynqmp_disp_layer_id'
>   drm/xlnx/zynqmp_dp: Fix incorrectly name function 'zynqmp_dp_train()'
>   drm/ttm/ttm_tt: Demote non-conformant kernel-doc header
>   drm/panel/panel-raspberrypi-touchscreen: Demote kernel-doc abuse
>   drm/panel/panel-sitronix-st7701: Demote kernel-doc abuse
>   drm/vgem/vgem_drv: Standard comment blocks should not use kernel-doc
>     format
>   drm/exynos/exynos7_drm_decon: Fix incorrect naming of
>     'decon_shadow_protect_win()'
>   drm/exynos/exynos_drm_ipp: Fix documentation for
>     'exynos_drm_ipp_get_{caps,res}_ioctl()'
>   drm/vboxvideo/hgsmi_base: Place function names into headers
>   drm/vboxvideo/modesetting: Provide function names for prototype
>     headers

Except for msm (Rob Clark promised on irc he'll pick them up for 5.14
soon) and amd (Alex is on top of things I think) I picked them all up and
merged into drm-misc-next.

Thanks, Daniel

> =

>  .../drm/amd/display/dc/dce/dce_transform.h    |  3 +-
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c       |  4 +--
>  drivers/gpu/drm/mediatek/mtk_disp_color.c     |  3 +-
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c     |  4 +--
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  3 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  4 +--
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  4 ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 32 +++++++++----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  4 +--
>  drivers/gpu/drm/msm/dp/dp_catalog.c           |  2 +-
>  drivers/gpu/drm/msm/dp/dp_link.c              |  6 ++--
>  drivers/gpu/drm/msm/msm_gem.c                 |  4 +--
>  .../gpu/drm/nouveau/nvkm/subdev/mc/tu102.c    |  6 ++--
>  .../drm/panel/panel-raspberrypi-touchscreen.c |  2 +-
>  drivers/gpu/drm/panel/panel-sitronix-st7701.c |  2 +-
>  drivers/gpu/drm/sti/sti_hda.c                 |  6 ++--
>  drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c    |  4 +--
>  drivers/gpu/drm/sti/sti_hqvdp.c               |  2 +-
>  drivers/gpu/drm/sti/sti_tvout.c               | 18 +++++------
>  drivers/gpu/drm/ttm/ttm_tt.c                  |  2 +-
>  drivers/gpu/drm/vboxvideo/hgsmi_base.c        | 19 +++++++----
>  drivers/gpu/drm/vboxvideo/modesetting.c       | 20 +++++++-----
>  drivers/gpu/drm/vgem/vgem_drv.c               |  2 +-
>  drivers/gpu/drm/xlnx/zynqmp_disp.c            |  2 +-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c              |  2 +-
>  26 files changed, 80 insertions(+), 82 deletions(-)
> =

> Cc: Adam Jackson <ajax@redhat.com>
> Cc: Ajay Kumar <ajaykumar.rs@samsung.com>
> Cc: Akshu Agarwal <akshua@gmail.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Ben Widawsky <ben@bwidawsk.net>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Fabien Dessenne <fabien.dessenne@st.com>
> Cc: freedreno@lists.freedesktop.org
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Krishna Manikandan <mkrishn@codeaurora.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Mauro Rossi <issor.oruam@gmail.com>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: nouveau@lists.freedesktop.org
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> -- =

> 2.31.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
