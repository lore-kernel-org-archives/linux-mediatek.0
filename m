Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64836C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 13:12:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBC2822EBE
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 13:12:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0jlWJxhe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7rK4C8m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBC2822EBE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xv3DxN4prBu6luGl/+uEodpJeZ3dM+KY1SZB9hAuXfQ=; b=0jlWJxheXwyorKX5RwTks0an/
	x2YnNqcD9TFalNwa5neC72N3+50BxDESkcBAc2+o/zztzZs37CB9Mxj126Rxc1msygo1JTdw1OWaY
	FlpEYWRzoRLMLaA2OcE15f0+TKtCjU6vreIcmRXLHXH6lFgvl/bQBVV/kNYmAC1q1CtBugSL+J12w
	eXBieXynD/0rBX7or0ncBoHqTWlvt8YmFWE+dYOIgNm+32v7gJnFN6QOSMsGv9Jvvtqntt9MRF3em
	hMlOIpMoPQrxgtVMNXfoss2zAA/8C/EknXbvLFkEBukcOSgp29wooICicQ0gllNlAjjQWZptxrRew
	Tz6wOvePA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSK5s-0003QG-UH; Tue, 13 Oct 2020 13:11:57 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSK5m-0003Nz-SU; Tue, 13 Oct 2020 13:11:51 +0000
Received: by mail-wr1-x444.google.com with SMTP id i1so17860740wro.1;
 Tue, 13 Oct 2020 06:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hP4I1TSE0iiKe4uFVvPyKh5ZjOZU39ztMJs9eGzKphE=;
 b=d7rK4C8mM7F7Mme2iU2+7ZjVgizAOHZSsRSZe5ZPmBkFa7mDw5CR4Z/BftFM5EMzSn
 5A6rRSaYV9xFqjcsRSWKas27xMHogPcTggZkiLuwP96It/VGrrLF1KBgyKV6OtGNlsFK
 VjmRlV5FgTBf2LYV1MEXXTqpR3rIaiD4xgM7gPLQ/TfEOrpUnXicpnFfbXQKoJ0Gu4WM
 aNy/qZKePQWr+spaE7cwccOBkp/F/ZqsRO2UVEvDk6iM5m2hF1DQC98fPByh9Xacd5Vd
 FJJgWhfTHkZgWBM9ZjStW/z3oGUQIRDoSpoBHi8avv2MHVIomMrvaxvknNf15MYnqnXD
 GtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hP4I1TSE0iiKe4uFVvPyKh5ZjOZU39ztMJs9eGzKphE=;
 b=D9LBnuwOT0GgoGiti2nnd0IrWnMyalclxAlIEtz42UaQj/A5sdOpfjQ5zOM5JHSVev
 Yc8evW+ciXS7NhzVfe9+PX2qW5rEoXEOp7uJpRd+g2ojk+UIRbPIpQJgxIRTCjSJ6MRr
 XoYcaLW02BicEgVj6tISxJenzZtMY/EDJsIErkV1vWzv+uSDRs4gE93U7b2wvrrXaWd6
 ldMPZhauE4iE4OkpAzGUCyJXeiTUyYwalnJxtJZuCMPsVtLvaKM/tcMbaRTZHv+c+aBV
 1b0MIxZ2hq7xXfUr4aZP9wCEWR5RCRBe42Tkql/Sw6nUTW5D9ytDva45ObV/3A0asVq4
 wJmQ==
X-Gm-Message-State: AOAM531oCLLlrB1DrebOaB/6Xs6H4JcVSwMwcaYLx8am8O2tI5dt3Se2
 VXfUA5R33vDDzeypKM0Xl7rw7RcAYL1e0j+tqp4=
X-Google-Smtp-Source: ABdhPJwCH8a1D0+3oh4RSFSUGPQPJdoPQvQkpSD/avgAkn1KFZidf8NIXW/31BQm3MiFaQm16TPeo37b3nLk2KIkeY4=
X-Received: by 2002:adf:f246:: with SMTP id b6mr29643949wrp.111.1602594707982; 
 Tue, 13 Oct 2020 06:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201012114623.8583-1-bernard@vivo.com>
In-Reply-To: <20201012114623.8583-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 13 Oct 2020 09:11:36 -0400
Message-ID: <CADnq5_MH2EYWuumqtZ+UPF-5TAW_+91F6mHFEu3MScTGQOQ0Dg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove no need return value
To: Bernard Zhao <bernard@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_091150_955087_85A123D0 
X-CRM114-Status: GOOD (  22.16  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Aric Cyr <aric.cyr@amd.com>, David Airlie <airlied@linux.ie>,
 Samson Tam <Samson.Tam@amd.com>, Reza Amini <Reza.Amini@amd.com>,
 Wyatt Wood <wyatt.wood@amd.com>, Jun Lei <jun.lei@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 opensource.kernel@vivo.com, Leo Li <sunpeng.li@amd.com>,
 Brandon Syu <Brandon.Syu@amd.com>, linux-mediatek@lists.infradead.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Applied.  Thanks!

Alex

On Mon, Oct 12, 2020 at 9:44 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> Functions (disable_all_writeback_pipes_for_stream &
> dc_enable_stereo & dc_post_update_surfaces_to_stream)
> always return true, there is no need to keep the return value.
> This change is to make the code a bit more readable.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c   | 17 +++++------------
>  drivers/gpu/drm/amd/display/dc/dc.h        |  2 +-
>  drivers/gpu/drm/amd/display/dc/dc_stream.h |  2 +-
>  3 files changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 92eb1ca1634f..8dc598a632b5 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -761,7 +761,7 @@ static bool dc_construct(struct dc *dc,
>         return false;
>  }
>
> -static bool disable_all_writeback_pipes_for_stream(
> +static void disable_all_writeback_pipes_for_stream(
>                 const struct dc *dc,
>                 struct dc_stream_state *stream,
>                 struct dc_state *context)
> @@ -770,8 +770,6 @@ static bool disable_all_writeback_pipes_for_stream(
>
>         for (i = 0; i < stream->num_wb_info; i++)
>                 stream->writeback_info[i].wb_enabled = false;
> -
> -       return true;
>  }
>
>  void apply_ctx_interdependent_lock(struct dc *dc, struct dc_state *context, struct dc_stream_state *stream, bool lock)
> @@ -1213,13 +1211,12 @@ bool dc_validate_seamless_boot_timing(const struct dc *dc,
>         return true;
>  }
>
> -bool dc_enable_stereo(
> +void dc_enable_stereo(
>         struct dc *dc,
>         struct dc_state *context,
>         struct dc_stream_state *streams[],
>         uint8_t stream_count)
>  {
> -       bool ret = true;
>         int i, j;
>         struct pipe_ctx *pipe;
>
> @@ -1234,8 +1231,6 @@ bool dc_enable_stereo(
>                                 dc->hwss.setup_stereo(pipe, dc);
>                 }
>         }
> -
> -       return ret;
>  }
>
>  /*
> @@ -1448,18 +1443,18 @@ static bool is_flip_pending_in_pipes(struct dc *dc, struct dc_state *context)
>         return false;
>  }
>
> -bool dc_post_update_surfaces_to_stream(struct dc *dc)
> +void dc_post_update_surfaces_to_stream(struct dc *dc)
>  {
>         int i;
>         struct dc_state *context = dc->current_state;
>
>         if ((!dc->optimized_required) || dc->optimize_seamless_boot_streams > 0)
> -               return true;
> +               return;
>
>         post_surface_trace(dc);
>
>         if (is_flip_pending_in_pipes(dc, context))
> -               return true;
> +               return;
>
>         for (i = 0; i < dc->res_pool->pipe_count; i++)
>                 if (context->res_ctx.pipe_ctx[i].stream == NULL ||
> @@ -1472,8 +1467,6 @@ bool dc_post_update_surfaces_to_stream(struct dc *dc)
>
>         dc->optimized_required = false;
>         dc->wm_optimized_required = false;
> -
> -       return true;
>  }
>
>  struct dc_state *dc_create_state(struct dc *dc)
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index f50ef4255020..f79a3c318757 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -962,7 +962,7 @@ struct dc_flip_addrs {
>         bool triplebuffer_flips;
>  };
>
> -bool dc_post_update_surfaces_to_stream(
> +void dc_post_update_surfaces_to_stream(
>                 struct dc *dc);
>
>  #include "dc_stream.h"
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
> index d9888f316da6..0047ab33f88e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
> @@ -391,7 +391,7 @@ enum dc_status dc_validate_stream(struct dc *dc, struct dc_stream_state *stream)
>   * Enable stereo when commit_streams is not required,
>   * for example, frame alternate.
>   */
> -bool dc_enable_stereo(
> +void dc_enable_stereo(
>         struct dc *dc,
>         struct dc_state *context,
>         struct dc_stream_state *streams[],
> --
> 2.28.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
