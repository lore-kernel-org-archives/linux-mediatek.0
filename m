Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F519C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 20:22:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49FA2613EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 20:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49FA2613EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fy5TXbpkvOcIj5RE/OdEMptcl2+Bcj+hvHB9N3qem9s=; b=bTIQXNgcIo9sotw0tP/vWPfng
	ijDXxxQwb1vqZu5qbtth5x8CMspSoM9/Un2VQqpjgKf7YCmNOewEVWMkVifcCS0ddZ5EhkBMDCP7S
	TBxixURptoZFy2vViorDMk14Ch1caXb4bgHgU4Tn3AARy5fnzsMEZursu0KMGiFbFl/qUdzqvXLCE
	lrvkPmFgDZeB7kg9H9wzXewO/oyYc1sXRSUIsg8irGC4oQBbAQfqXbTDGzBUhsXFjDGDHXOkpB0/S
	J4smJ6Wjj5DZPyXT9hMlG4uvOIGdEhP0g25wvThINooScPOvRQneg0b1/LHCg6eHCNhtT1azYPmyw
	O1Ur4guDw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbqgy-004E3J-P7; Wed, 28 Apr 2021 20:21:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbqgk-004E1v-5r
 for linux-mediatek@desiato.infradead.org; Wed, 28 Apr 2021 20:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3FlfJuCO/i0lHXz9Yi8JuX0LHEp/FCSt5EvXf/XQhbw=; b=ZDNo1eAvCptxppEbAOc2slS3/6
 tnJg1wObvJlh03NCLvsLa38mY/zesMoW63Vdde09w3LZ8K0aSmIaQmDY+0zx5MaKrtrgBTXBQECYB
 NsXNJD2PD2pEztn2o0ZCYMuvLZb72IBLcHH3+AnASO88pQqsDW1t4KGP6JjT7NKaOJ1pO5ntKpuHG
 YbLenxQoi4JL/Qk3bD1EBFS3Z+Q7fA3aaGUOhhGplRfmHZrzq/stvAjWJgWjsK0Dr7506Qghbweul
 hLj9RgqQqLKE9zdVb805iCdt19n82faMn+AkZ21kYWj16cNeE46IsMCyCHOCBAtUW8b0Oy7qIvcUa
 6SVf2XSQ==;
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbqgg-000AUb-AZ
 for linux-mediatek@lists.infradead.org; Wed, 28 Apr 2021 20:21:37 +0000
Received: by mail-il1-x12d.google.com with SMTP id v13so3923640ilj.8
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 13:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3FlfJuCO/i0lHXz9Yi8JuX0LHEp/FCSt5EvXf/XQhbw=;
 b=Twe/v+kPHslIBdnujIpFoTmjqKiXz3Qw86igYBt6JKw9MRVlLASnJezyH+2HX0D5/y
 1S+ZoIf/DhA5jzqOmWyOdNWhi372TPnKzo2U1odOVbpIh9peetD1cWRUTXNOuHiur8RF
 CTAf8QNFFktBK+T6i7jMTFhiGslZ/9XyFimZ73V5HSutx9tH2bKP85o42syoYOj9MinU
 N7vUUXLASROmijnkzZEYDKhs1CIZcc88YyxWOpDVZ46m4dn3JJAqyEJPLohCA9ebVbju
 OYL1e2aCMN1Gi1lP9HTfavKkJuXnOqd3N6Tdd5CHP0iPUiI120LMpSdC1aXMgJjhs6dD
 oW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3FlfJuCO/i0lHXz9Yi8JuX0LHEp/FCSt5EvXf/XQhbw=;
 b=O+LWCFXMpjnn5COcuf7YDKsNQjTLk52X/2ogsSDP83f3JueYxN1a41CvS+689Xhjc8
 LK0t0z4XLO03nNGFd9F5ceMhEs6FtJiTqrcF5u/V5y7R95vRGa+nBtydRoksv26X+bqa
 aQLvtetQfmoLQxdkZXuKjXSX/7WHhe5YGyWWISyBhmYAnV4gIrPisOfaAHVQ9XVS7tpj
 kPVb1dcbkWaj2Gf0doVxM28YqlztYe4PGfUX1vcFMrwuMmaL4PECFdQTE/KZV4a3IXSk
 bRGX4KZj/OO5Gv3jd91+EWpy8nRU7NyocmeffP9Xw6v5WGoIaVGLcLp4pqCdNt7xagiU
 r3HQ==
X-Gm-Message-State: AOAM531EcuDMsNQWzb72vIWolND7DQQrbBUYNT1sB5yk6zSKn2t2n8nU
 BlcwRwEzoNZLOBA0Rz84mbStako21FJjyrkIi0kkYA==
X-Google-Smtp-Source: ABdhPJxW0HbA94ewF7F3weEGbYhyR1USNUWGh56KyTn6uWBkUkN9dCEH3OgkE9YeiRwCBSERhbC4leLYiC4JNncqOlo=
X-Received: by 2002:a05:6e02:1d06:: with SMTP id
 i6mr24290849ila.165.1619641292908; 
 Wed, 28 Apr 2021 13:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210428170416.1027484-1-hsinyi@chromium.org>
 <20210428170416.1027484-3-hsinyi@chromium.org>
In-Reply-To: <20210428170416.1027484-3-hsinyi@chromium.org>
From: Sean Paul <sean@poorly.run>
Date: Wed, 28 Apr 2021 16:20:56 -0400
Message-ID: <CAMavQK+RJATzOVfgRhpU5i3kGsYM2-y4whgZMTdwNnK=z63nYA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] drm/i915: init panel orientation property
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_132134_458489_C61F760F 
X-CRM114-Status: GOOD (  15.13  )
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

On Wed, Apr 28, 2021 at 1:04 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Creating the panel orientation property first since we separate the
> property creating and value setting.

This should probably be included in patch 1 so you don't regress i915
in between patches.

Sean

>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/i915/display/icl_dsi.c  | 1 +
>  drivers/gpu/drm/i915/display/intel_dp.c | 1 +
>  drivers/gpu/drm/i915/display/vlv_dsi.c  | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
> index 9282978060b0..162fb3cf0f5a 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -1903,6 +1903,7 @@ static void icl_dsi_add_properties(struct intel_connector *connector)
>
>         connector->base.state->scaling_mode = DRM_MODE_SCALE_ASPECT;
>
> +       drm_connector_attach_scaling_mode_property(&connector->base);
>         drm_connector_set_panel_orientation_with_quirk(&connector->base,
>                                 intel_dsi_get_panel_orientation(connector),
>                                 connector->panel.fixed_mode->hdisplay,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index a5231ac3443a..f1d664e5abb2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5263,6 +5263,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
>         intel_panel_setup_backlight(connector, pipe);
>
>         if (fixed_mode) {
> +               drm_connector_init_panel_orientation_property(connector);
>                 drm_connector_set_panel_orientation_with_quirk(connector,
>                                 dev_priv->vbt.orientation,
>                                 fixed_mode->hdisplay, fixed_mode->vdisplay);
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index 9bee99fe5495..853855482af1 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -1632,6 +1632,7 @@ static void vlv_dsi_add_properties(struct intel_connector *connector)
>
>                 connector->base.state->scaling_mode = DRM_MODE_SCALE_ASPECT;
>
> +               drm_connector_init_panel_orientation_property(&connector->base);
>                 drm_connector_set_panel_orientation_with_quirk(
>                                 &connector->base,
>                                 intel_dsi_get_panel_orientation(connector),
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
