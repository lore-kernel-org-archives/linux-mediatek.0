Return-Path: <SRS0=47E0=3E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B43C33C9E
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 03:48:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41176222C3
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 03:48:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Umw9QDS4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="blCG6NNq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41176222C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3IKkmFHbdfDDYLAdQ7g3D6ZRqSfjadCVp+2rZQLQoE=; b=Umw9QDS4Gwc/dD
	0zyzJtz/8oBH23uyA7jbTJkPPGiS5CKUiW3X0vCGsT0m+JCTjyN4dBtrHA6ERtD/QDCyst6owHMi/
	GOWV+YOyigEn7OCzwZHVDnCfSeVuL+cC8/8IOmNvBMbCVXz3R9vtzSQfZtYqLCJ3vIRGXKBtHfk6A
	xFgoO4k7CVLxWhf8aovPcQrI8KDpPSySJimQ8OSJzPvebCvWOZb8FY41hxvddI026MDTDQZDkMC26
	FZSlB9s8GLlamuE/nGOC2wvfMpQ0z50Yh7swBBNEFI+W4mwGHCMCi9hGZuV20/1+SvXlI1F2vWzbR
	qPTeIe90GvhSV6ISuvmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irZeu-0005ab-BT; Wed, 15 Jan 2020 03:47:56 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irZem-0005UX-NS
 for linux-mediatek@lists.infradead.org; Wed, 15 Jan 2020 03:47:50 +0000
Received: by mail-ot1-x343.google.com with SMTP id r27so14875788otc.8
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Jan 2020 19:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fXE1pb9ZXSzUXM/cWp0vEuD1ufr49jnlyg/BuiYZBlA=;
 b=blCG6NNqmLU0+Yk3taOGfpNtJDvgllIRe1SUqtLakI2cGhtlgR7yOi6ZEASVsLviqR
 iyMUzuQ2s8+c3MOxNrGvBQg30aRdU8eM6KVBNxY9j8LAW4rePBASrqJ9bvNU+hQpe2Ea
 utDje7lx9JZAIV6DHWN8teCJ5y4glPgV1PECY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fXE1pb9ZXSzUXM/cWp0vEuD1ufr49jnlyg/BuiYZBlA=;
 b=g4fN59TEtcoQXOJOdjT1P4rWYflCf5VH4S4Ebn9b0qbaEPycXnESRefWg0xSFw27ZK
 JBSG5CKPeZuoIuT9TMNZ20mcvUORtXQCgBHDfwezVj+CXUmK+d4Jl6Zc5N3EI8p7loza
 k0p/h34xXCm2Cdn7RdmwbY456i5Y8IXkJ2y2JLXo6EmUnpzU7UN/Se8SKS4LghoZ5CSM
 7G0R7uTIBOXnZTAoraJseLyIo2mPJnCKwmVQC6SdYirFUMqcHnw4sC9qG/UhZNzlCV4n
 65RR8fOE+4mdbHFvi7nEkNG14Ws+Rq7DV7rIOCsHNQnYGVZnitllyDA9mLD2rtFEVOWS
 1ISw==
X-Gm-Message-State: APjAAAUdzSzays7XGUsWsuqRv3FPGnQq993xjcCYbns91fSLlNdrNJeD
 SyyJPosKKPNiU/MBuDYnUfNIEyoIhts=
X-Google-Smtp-Source: APXvYqwmLPzULBKlwX+ym9xLSA8dzwdxV2MVHTeZ/Qg+IiHZ8CnORwBwd0kaTFwpDtdYiTKO5p+gHA==
X-Received: by 2002:a05:6830:11d2:: with SMTP id
 v18mr1362843otq.151.1579060065198; 
 Tue, 14 Jan 2020 19:47:45 -0800 (PST)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com.
 [209.85.210.54])
 by smtp.gmail.com with ESMTPSA id z17sm6119229otk.3.2020.01.14.19.47.43
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 19:47:44 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id w21so14873190otj.7
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Jan 2020 19:47:43 -0800 (PST)
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr1239454otq.97.1579060063207; 
 Tue, 14 Jan 2020 19:47:43 -0800 (PST)
MIME-Version: 1.0
References: <20200114033226.16786-1-gtk_ruiwang@mediatek.com>
In-Reply-To: <20200114033226.16786-1-gtk_ruiwang@mediatek.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 15 Jan 2020 12:47:32 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXhiNK84PuUy8=RUUeSh5j4VXw-Ar5SbZDHZAobp7xpEQ@mail.gmail.com>
Message-ID: <CAPBb6MXhiNK84PuUy8=RUUeSh5j4VXw-Ar5SbZDHZAobp7xpEQ@mail.gmail.com>
Subject: Re: media: mtk-vcodec: reset segment data then trig decoder
To: gtk_ruiwang <gtk_ruiwang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_194748_766049_9C3DA3A3 
X-CRM114-Status: GOOD (  21.16  )
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
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, srv_heupstream@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 14, 2020 at 12:32 PM <gtk_ruiwang@mediatek.com> wrote:
>
> From: gtk_ruiwang <gtk_ruiwang@mediatek.com>
>
> VP9 bitstream specification indicate segment data should reset to
> default when meet key frames, intra only frames or enable error
> resilience mode. So memset segmentation map buffer before every
> decode process is not appropriate.
>
> Reset segment data only when needed, then trig decoder hardware
>
> Signed-off-by: Rui Wang <gtk_ruiwang@mediatek.com>
> ---
>  .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> index 24c1f0bf2147..42c9c3c98076 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> @@ -110,7 +110,9 @@ struct vp9_sf_ref_fb {
>   * @buf_len_sz_c : size used to store cbcr plane ufo info (AP-R, VPU-W)
>
>   * @profile : profile sparsed from vpu (AP-R, VPU-W)
> - * @show_frame : display this frame or not (AP-R, VPU-W)
> + * @show_frame : [BIT(0)] display this frame or not (AP-R, VPU-W)
> + *     [BIT(14)] reset segment data or not (AP-R, VPU-W)
> + *     [BIT(15)] trig decoder hardware or not (AP-R, VPU-W)
>   * @show_existing_frame : inform this frame is show existing frame
>   *     (AP-R, VPU-W)
>   * @frm_to_show_idx : index to show frame (AP-R, VPU-W)
> @@ -494,12 +496,12 @@ static void vp9_swap_frm_bufs(struct vdec_vp9_inst *inst)
>                                         frm_to_show->fb->base_y.size);
>                 }
>                 if (!vp9_is_sf_ref_fb(inst, inst->cur_fb)) {
> -                       if (vsi->show_frame)
> +                       if (vsi->show_frame & BIT(0))
>                                 vp9_add_to_fb_disp_list(inst, inst->cur_fb);
>                 }
>         } else {
>                 if (!vp9_is_sf_ref_fb(inst, inst->cur_fb)) {
> -                       if (vsi->show_frame)
> +                       if (vsi->show_frame & BIT(0))
>                                 vp9_add_to_fb_disp_list(inst, frm_to_show->fb);
>                 }
>         }
> @@ -870,13 +872,22 @@ static int vdec_vp9_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>                                         vsi->sf_frm_sz[idx]);
>                         }
>                 }
> -               memset(inst->seg_id_buf.va, 0, inst->seg_id_buf.size);
>                 ret = vpu_dec_start(&inst->vpu, data, 3);
>                 if (ret) {
>                         mtk_vcodec_err(inst, "vpu_dec_start failed");
>                         goto DECODE_ERROR;
>                 }
>
> +               if ((vsi->show_frame & BIT(15)) &&
> +                   (vsi->show_frame & BIT(14))) {

Using the new bits in this manner means this patch is not compatible
with the older firmware.

On an older firmware, these bits will be 0, which means the decoder
will never be started. To preserve compatibility, the behavior should
be reversed: *do not* reset and/or start the decoder if the bits are
set.

Also both bits are only used together - we should either separate the
data segment reset and decoder start, or rely on only one bit for
this.

> +                       memset(inst->seg_id_buf.va, 0, inst->seg_id_buf.size);
> +                       ret = vpu_dec_start(&inst->vpu, NULL, 0);
> +                       if (ret) {
> +                               mtk_vcodec_err(inst, "vpu trig decoder failed");
> +                               goto DECODE_ERROR;
> +                       }
> +               }
> +
>                 ret = validate_vsi_array_indexes(inst, vsi);
>                 if (ret) {
>                         mtk_vcodec_err(inst, "Invalid values from VPU.");
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
