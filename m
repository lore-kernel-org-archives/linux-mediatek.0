Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F27C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Dec 2021 07:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sX4gpaFxflJkFGDpf/l37NlFr4R/n4jaTDKb1fO922Y=; b=oQLHzrYkNnXPDp
	bsGluk6seShTCfHWS4GA/AzbKZRicHJjVIAHn2R2iFPMYiaWGo9ARbOVsHFFPhpzgO1C2fsfk+H0h
	vyQC+aeQVUBt5/oDI8Cb69aCDfKsSlZWi8yTRQFiu0EdjhTPwiWkEb73CR/NqaE1Wjvlr5AuARbs1
	FmJEtSSQhfI+anQGSjJthDGJ73lP/xPJixJrftN0nL7K75gCfFjL6zMOqtJNru4r90mpxy3pD1uq1
	YcAQYswwQhEuUoJ6E9qiR7Kb1ahbfwTMrVMr/9rXDkUezakFR1Mc3vDsG2fplwP0NP2Xm9m6Y0hr1
	pPo3VJJMhT656Ypy22hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1kC5-00GIo5-Bn; Mon, 27 Dec 2021 07:13:17 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1kC3-00GIne-2Y
 for linux-mediatek@lists.infradead.org; Mon, 27 Dec 2021 07:13:16 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso13659390pjb.1
 for <linux-mediatek@lists.infradead.org>; Sun, 26 Dec 2021 23:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5NO1al33KK9AHVngYVbDZ//RPzqF3GCVIYpihpM+V6E=;
 b=nbcXBPQ/7er1rZWmEfpq0TF/KSxhRx0TV39wk5WBswwtHGHRf13BjvS4oPacEr2phQ
 GIJJy0KN5yms6XcELwEfT95jAlJN7EB7BY+C6lw6M5lJdZeOXtIG2OmMEIY3KnwigNDC
 veTXyaLZUBkBlsHd+/DsjCiRoAdZZcCPGBV6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5NO1al33KK9AHVngYVbDZ//RPzqF3GCVIYpihpM+V6E=;
 b=q8ZLl9HFqSkPrq2lntahMpOMtHIc3fTuWkRpyN3Xa6m4wgIFrmAISr75n/aP/bQrPz
 UT24HbG4REpMdYEuzrcO14aPurkjXkD+jf0gnTrsEdyIftTVzczT2Md2bocgMOuGec60
 DCu0mJfqOA1BY4qLdQfe9ASeVwqUzy205ahKa9iq7pOW9T/Ni/PawXOcYbs3D0VtILe5
 vaF89ZY0D76Put3iax/dtel/ec9P91y6Tv+o/7TisImz0v4CVZjGhl1vrIgiwy6flIuX
 IqK89XixdtwSjCSD8Eic7hVcHYygXLCz9vr3RkTFOGhUEvw6z6Ateq/cJOQ1PM8tddZt
 r5Jw==
X-Gm-Message-State: AOAM530X38Tql8l16uktfqtTgQvcyMODaz7qpECWpFMMeDHnAOF4RDN6
 taZCblesGaTNWmbbq7HpLWpYDkwNGeyPvQ==
X-Google-Smtp-Source: ABdhPJyDooxG8gvbMqC7hj9+Df5PLg0s+LAvZseFayei2XUZ9Nf2D/rDoWAlWGSLoQJVpLBAy1BgxA==
X-Received: by 2002:a17:90a:1919:: with SMTP id
 25mr7653744pjg.181.1640589194171; 
 Sun, 26 Dec 2021 23:13:14 -0800 (PST)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com.
 [209.85.214.174])
 by smtp.gmail.com with ESMTPSA id x31sm16988424pfh.116.2021.12.26.23.13.13
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Dec 2021 23:13:14 -0800 (PST)
Received: by mail-pl1-f174.google.com with SMTP id n16so10867281plc.2
 for <linux-mediatek@lists.infradead.org>; Sun, 26 Dec 2021 23:13:13 -0800 (PST)
X-Received: by 2002:a05:6102:e89:: with SMTP id
 l9mr4547183vst.80.1640588810744; 
 Sun, 26 Dec 2021 23:06:50 -0800 (PST)
MIME-Version: 1.0
References: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
 <20211117130635.11633-8-dafna.hirschfeld@collabora.com>
In-Reply-To: <20211117130635.11633-8-dafna.hirschfeld@collabora.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 27 Dec 2021 16:06:39 +0900
X-Gmail-Original-Message-ID: <CAPBb6MX8Yq5eoumOUxK+OmSEu6cQE8nqfABtHTz+UdAsRfXtvQ@mail.gmail.com>
Message-ID: <CAPBb6MX8Yq5eoumOUxK+OmSEu6cQE8nqfABtHTz+UdAsRfXtvQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] meida: mtk-vcodec: remove unused func parameter
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 kernel@collabora.com, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, courbot@chromium.org, 
 Dafna Hirschfeld <dafna3@gmail.com>, eizan@chromium.org,
 houlong.wei@mediatek.com, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Irui Wang <irui.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?= <maoguang.meng@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, minghsiu.tsai@mediatek.com, 
 Tomasz Figa <tfiga@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_231315_128635_08F52C17 
X-CRM114-Status: GOOD (  16.97  )
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

On Wed, Nov 17, 2021 at 10:07 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> The prarameter bs_size to function vpu_enc_encode
> is not used. Remove it.
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Indeed, it's an output parameter of the calling functions and has no
business being passed to vpu_enc_encode.

With the typo in the headline fixed,

Reviewed-by: Alexandre Courbot <acourbot@chromium.org>


> ---
>  drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c | 9 +++------
>  drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c  | 3 +--
>  drivers/media/platform/mtk-vcodec/venc_vpu_if.c       | 1 -
>  drivers/media/platform/mtk-vcodec/venc_vpu_if.h       | 1 -
>  4 files changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> index b6a4f2074fa5..bf03888a824f 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> @@ -367,8 +367,7 @@ static int h264_encode_sps(struct venc_h264_inst *inst,
>
>         mtk_vcodec_debug_enter(inst);
>
> -       ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_SPS, NULL,
> -                            bs_buf, bs_size, NULL);
> +       ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_SPS, NULL, bs_buf, NULL);
>         if (ret)
>                 return ret;
>
> @@ -394,8 +393,7 @@ static int h264_encode_pps(struct venc_h264_inst *inst,
>
>         mtk_vcodec_debug_enter(inst);
>
> -       ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_PPS, NULL,
> -                            bs_buf, bs_size, NULL);
> +       ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_PPS, NULL, bs_buf, NULL);
>         if (ret)
>                 return ret;
>
> @@ -451,8 +449,7 @@ static int h264_encode_frame(struct venc_h264_inst *inst,
>         mtk_vcodec_debug(inst, "frm_count = %d,skip_frm_count =%d,frm_type=%d.\n",
>                          frame_info.frm_count, frame_info.skip_frm_count,
>                          frame_info.frm_type);
> -       ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_FRAME, frm_buf,
> -                            bs_buf, bs_size, &frame_info);
> +       ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_FRAME, frm_buf, bs_buf, &frame_info);
>         if (ret)
>                 return ret;
>
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> index 8267a9c4fd25..6b66957d5192 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> @@ -302,8 +302,7 @@ static int vp8_enc_encode_frame(struct venc_vp8_inst *inst,
>
>         mtk_vcodec_debug(inst, "->frm_cnt=%d", inst->frm_cnt);
>
> -       ret = vpu_enc_encode(&inst->vpu_inst, 0, frm_buf, bs_buf, bs_size,
> -                            NULL);
> +       ret = vpu_enc_encode(&inst->vpu_inst, 0, frm_buf, bs_buf, NULL);
>         if (ret)
>                 return ret;
>
> diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> index be6d8790a41e..e7899d8a3e4e 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> @@ -225,7 +225,6 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
>  int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
>                    struct venc_frm_buf *frm_buf,
>                    struct mtk_vcodec_mem *bs_buf,
> -                  unsigned int *bs_size,
>                    struct venc_frame_info *frame_info)
>  {
>         const bool is_ext = MTK_ENC_CTX_IS_EXT(vpu->ctx);
> diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
> index f9be9cab7ff7..f83bc1b3f2bf 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
> +++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
> @@ -45,7 +45,6 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
>  int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
>                    struct venc_frm_buf *frm_buf,
>                    struct mtk_vcodec_mem *bs_buf,
> -                  unsigned int *bs_size,
>                    struct venc_frame_info *frame_info);
>  int vpu_enc_deinit(struct venc_vpu_inst *vpu);
>
> --
> 2.17.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
