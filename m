Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0EDC636CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 20:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Am8Z7TkpcdDZ8GRL/LneNulRFJmC6a0UjMBT8TzAGTs=; b=2EMhuMLwj4wq51LtZzXLYqIyUY
	QV7XnzXpfHgDIGgZu6Lj1ZHyWYvwBfvzWFf8p0/3zr2wUie4LV53XE9YjseqKrPl1eUPI56b9I2Qz
	bLHT+kF9l2z1A8tGu7vKt097cBbPMjjI7sJaS4C04V6FdTGpeWDUMsFefaILM8tbJq4ru9ANVpN3i
	jjQAobPbh3v4t4n0FUozJEcBqjNKhh/jNItZxKI8Ym0RzwYoFpbTJTHYmAQtAXzAiVHRdDDVvelfc
	FXQCuAypLeb9AVO18/XrQGYOFWomUPybC2j+jOp31KaYfeyaOd6GTBCoCPeLba+jJLZWMYl/XFtm4
	LYgkwfxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMx3X-009FJS-QB; Tue, 31 Jan 2023 20:16:39 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMx3V-009FIy-MH
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 20:16:39 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 7so5995028pgh.7
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Jan 2023 12:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Am8Z7TkpcdDZ8GRL/LneNulRFJmC6a0UjMBT8TzAGTs=;
        b=QUkF0DxBy7WyhNMn/+Y1eVegdNj5n1Tnfaz8RfohJjBMATVcZGLq5ny6pD0J34rQyz
         2JMuMo5/iIyVd2LyWi1mzQlHa/25nypMNvJWXwVEB6GuhVS85sorsXsTce6WINHZotMR
         6y7sQvZh5KPrExjuTY0E+hpZmwXGMBjF1XBE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Am8Z7TkpcdDZ8GRL/LneNulRFJmC6a0UjMBT8TzAGTs=;
        b=OqdCIXvT57PKyMbHZ7c/uWG8M3EmOlTp5dX0DICyrYg3EZas80y6NlUtp2eQhv1gtk
         SXJxyojIfrXP33/2LQkulHVTFI3SFMMZjKuMoR67CqmB88vXAKgMQ+pPOI4exuPUEKmv
         2d9UXuZo7xRAojICl5reOeKUgrpnRMGGZ7kQylgtnS3GkRkSYVr47kDIRyKo6aDefL/e
         sPs6G8AWlC/fhp+Kh2NX/nEKt2kMZaiYWCJ7RGauOmUgIUafByGNnPqqkd5/NvzvsQD2
         ILAVwjYZ0cgXcirgCDAcRghu0b2tQoYgh2hs4WST50AU/J+AlZBDLU4w5JjasDoTMV2K
         +mYg==
X-Gm-Message-State: AO0yUKUAmiAwUbB0ApWcseoIqX3wgVf3CYHg6HGKkpxolABO5ClRpwBQ
	9EotrnRh67CT3h+hsRCdYgfSWCufm/447EG+2nvaqL+fjVVvSs7p
X-Google-Smtp-Source: AK7set9OkhSjU8TN/f2hRWvQ1VR0Q5ugDNILjcngdVc7Yrkmts/q3dd2kbN9jc8WcSWKxReo+7fq26qAIePDkXB5LuQ=
X-Received: by 2002:a63:5418:0:b0:4d7:fc60:7ec1 with SMTP id
 i24-20020a635418000000b004d7fc607ec1mr3440901pgb.106.1675196195971; Tue, 31
 Jan 2023 12:16:35 -0800 (PST)
MIME-Version: 1.0
References: <20230131200842.341272-1-greenjustin@chromium.org>
In-Reply-To: <20230131200842.341272-1-greenjustin@chromium.org>
From: Justin Green <greenjustin@chromium.org>
Date: Tue, 31 Jan 2023 15:16:25 -0500
Message-ID: <CAHC42RfBvn2jGKnPzCOmnZHvFyaXBXMJFfswKFjXxuTzk+mraQ@mail.gmail.com>
Subject: Re: [PATCH 0/2 v6] drm/mediatek: Add support for 10-bit overlays
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
	justin.yeh@mediatek.com, wenst@chromium.org, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, airlied@linux.ie, matthias.bgg@gmail.com, 
	daniel@ffwll.ch, daniel@fooishbar.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_121637_788703_A540AA46 
X-CRM114-Status: GOOD (  17.20  )
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

My apologies, I accidentally mangled the version history. It should
actually read:

v2:
 * Rebase and resolve merge conflicts with the AFBC patch.
v3:
 * Moved 10-bit support detection to mtk_disk_ovl.c
v4:
 * Moved formats to mtk_disp_ovl.c and mtk_disp_rdma.c
v5:
 * Minor style adjustments per checkpatch.pl
v6:
 * Refactor patch into patch series.
 * Add formats directly to private data.

On Tue, Jan 31, 2023 at 3:08 PM Justin Green <greenjustin@chromium.org> wrote:
>
> This patch series adds support for 10-bit overlays to the Mediatek DRM driver.
> Specifically, we add support for AR30 and BA30 overlays on MT8195 devices and
> lay the groundwork for supporting more 10-bit formats on more devices.
>
> 1. Refactor plane initialization logic to allow individual DDP components to
> provide their supported pixel formats.
>
> 2. Add AR30 and BA30 support to the MT8195 overlay driver.
>
>
> Version history:
> v6:
>  * Refactor patch into patch series.
>  * Add formats directly to private data.
>
> v5:
> * Removed some dead defines.
> * Refactored mtk_ovl_set_afbc().
>
> v4:
> * Move modifier validation to format_mod_supported function.
> * Add modifiers to drm_universal_plane_init() call.
> * Make comparisons to DRM_FORMAT_MOD_LINEAR explicit rather than relying on
>   DRM_FORMAT_LINEAR being equal to 0.
> * Gate AFBC control bit writes on device compatibility.
>
> v3:
> * Replaced pitch bitshift math with union based approach.
> * Refactored overlay register writes to shared code between non-AFBC and
>   AFBC.
> * Minor code cleanups.
>
> v2:
> * Marked mtk_ovl_set_afbc as static.
> * Reflowed some lines to fit column limit.
>
>
> Justin Green (2):
>   drm/mediatek: Refactor pixel format logic
>   drm/mediatek: Add support for AR30 and BA30 overlays
>
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 +
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 89 +++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 38 +++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 20 +++++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 24 ++----
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  3 +-
>  8 files changed, 168 insertions(+), 18 deletions(-)
>
> --
> 2.39.1.456.gfc5497dd1b-goog
>

