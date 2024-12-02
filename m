Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AE8D7833D
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 17:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQBhvBNYSI1fNvIhGqfRe5QD/yRE1BVFAKx554DMguU=; b=CupK+InUAdxbdu/tpJm/CMY6k0
	n+efL5HGZ2OtPGQh/c8mINVZAtAlKk2gmhrLTm9ow7V4a/B+ga+yU3EI/GGp9EHpWZwdScxgWJIlL
	TxqwECmEzUlO2URlFqGs6cJjGQZuMtK00wvyyoA+PYzb/lhHM+GOlCBO8KIbQfTQOB/Ne9mlDIjqD
	LQIPbX7Ih2It7wR4Vnzq+ByCx2irJSlEBc6znVjBfyXvChJIiU/Ey3Wsel01eCcHCoQD540iLcmT6
	BPCNB0ZkZuy4GATZW3pEv+AfSowJuga/W3OgeKFP/x8KDPa77i+VW9vTNEvTyYEL5t3Z8eJyvmrAc
	hBzcuwxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAPE-000000073Oa-1vPa;
	Mon, 02 Dec 2024 17:40:20 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAJO-000000071op-0DyU
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 17:34:19 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6d8878ec049so32509076d6.3
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Dec 2024 09:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733160856; x=1733765656; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hQBhvBNYSI1fNvIhGqfRe5QD/yRE1BVFAKx554DMguU=;
        b=XLjMdkNXGvG+pNeOiIRlPWENVtvJUGt7y35bij/x8265XQmOYfqkbXzLk42Oh6Utmb
         Hq2EQ8KmfxBKFpItIlA9FppUXVtIDq/PZFQ4yJeFT3zzvBo0vY4ZzqN+bkYOZDHy7bQ3
         ZOYm3dV3mhCkG0v3XhOMwIJ8p+ABxF2wCrv4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733160856; x=1733765656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQBhvBNYSI1fNvIhGqfRe5QD/yRE1BVFAKx554DMguU=;
        b=wWk89vq9K/d8j4IZH/xwdz6KQRYphLfeyLUr2Y/sbpwfN+uD4GXDFycKVz2PPisG2m
         n/Va3HWCD9QCeemtA8HI5EDFi03un5wu8kSV1WQl6k4dYJNLurnnSRw9vTGtrNDV/j+l
         q3nw64EKPD1e0zQlf5ZQ8ndPph8XAK5l8jJsEFWU0hwNKAgcCt1WEzH8c8Z+sBVMSdV8
         4tpGGb4S6Z4zhelS509qItLp5Op9QBShoRO6dvfddF0wXQKi2+QfBsGAtKo9jjcwJn3a
         T7RZZmP50Uw+X2LxcuoBSxT+Tx+QrK2XMcWqUGFWEWqCsXMAnG42omYj5MzxQuq04ICE
         0vpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSbjKo18WBWPHlP+kInVCbEcifkjhzIc80UxtCJYC2o19JruSu4pt6fUHkiZ9J+AspeQfgV/8CrQaTJGpNpg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt0JxlK5wqZdw8pNCVa0H2m94S7iG3N4ir98non8VQ0slLTbbu
	8pIKRPXDv7lrW0z5SrgXVGM5HU7pMmYWtjWxeEVpYJ2NG8qp2SqbcXZMMwqF+CtatxdlvI2iTXs
	=
X-Gm-Gg: ASbGncth+hCh8PQzvDiq9a48uluyGf201Bl9qMgQxSUVfWNLw4fEyNKNT0BlnYA8ypb
	EVM1lKdvin/0BI7tnAFRWw4A+1somBSVhjXI1MWnYyWh6FfK0bMAPq6ahUNUvzFAm3ikXDRLj9B
	Q9ovqE+iwJNvHlHIA6k2QTx+yU/GDTrUj5Mwy3OYwMAsL1whPW8ypCw/2+ZhUVMKe+S03q0DteE
	9UECcxLRLSogcVnm4oaScduqodGbzR3ptLUOcJBId5vTa+cm2Wm8SM3z1j+udTdZrKKQ4XUyR3S
	lMGsOR19UCd93Ea/
X-Google-Smtp-Source: AGHT+IFStbrANMCmTjgKSZGeVBB1CbTMvlyGo3xFOI0hBdP/JQy7bjjcmadC8E4hutxYPsdUQLU1GA==
X-Received: by 2002:a05:6214:da4:b0:6d8:9c92:6555 with SMTP id 6a1803df08f44-6d89c926859mr135384096d6.29.1733160856477;
        Mon, 02 Dec 2024 09:34:16 -0800 (PST)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d88665ef2dsm39897046d6.129.2024.12.02.09.34.16
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 09:34:16 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-46679337c24so38235751cf.3
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Dec 2024 09:34:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXHVV7CPXWVHtByajWqOyzv2OKqVPNgAHeVBrKBWQ2mq6S0WiSC2G1BjXIONtSCZ2MVmYnDRP1afyAKIIGgOw==@lists.infradead.org
X-Received: by 2002:a17:902:e5d0:b0:215:5a53:eded with SMTP id
 d9443c01a7336-2155a53eff1mr163851165ad.39.1733160379613; Mon, 02 Dec 2024
 09:26:19 -0800 (PST)
MIME-Version: 1.0
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
 <20241202-fix-llvm9-v1-3-2a50f5acfd0b@chromium.org> <20241202162454.GA2848026@thelio-3990X>
In-Reply-To: <20241202162454.GA2848026@thelio-3990X>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Dec 2024 18:26:07 +0100
X-Gmail-Original-Message-ID: <CANiDSCu+gJb5aTywEnGDQUJYws++9x=be5QLsdSUqS=XjFZGnQ@mail.gmail.com>
Message-ID: <CANiDSCu+gJb5aTywEnGDQUJYws++9x=be5QLsdSUqS=XjFZGnQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: mediatek: vcodec: Workaround a compiler warning
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_093418_103883_87F5F100 
X-CRM114-Status: GOOD (  25.76  )
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

Hi


On Mon, 2 Dec 2024 at 17:25, Nathan Chancellor <nathan@kernel.org> wrote:
>
>  Mon, Dec 02, 2024 at 03:47:17PM +0000, Ricardo Ribalda wrote:
> > llvm identifies that the SCP_IPI_VENC_H264 and IPI_VENC_H264 are from
> > the same enum type, but their are part of the same ternary operator.
> >
> > vpu_inst.id is of type int, so we can just rewrite a bit the code and
> > avoid the following llvm9 warning:
>
> LLVM 19, not LLVM 9, as the minimum version for building the kernel is
> LLVM 13.
>
> > drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:597:29: warning: conditional expression between different enumeration types ('enum scp_ipi_id' and 'enum ipi_id') [-Wenum-compare-conditional]
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> FYI, Arnd basically sent the same patch October 18 but I guess it has
> not been picked up?
>
> https://lore.kernel.org/20241018152127.3958436-1-arnd@kernel.org/
>
> Hopefully the new media committers model will help patches like that get
> picked up in a more timely manner.

We can take Arnd's patch.

Yeah, this is the kind of patches that the multi committers can really
help with :)

>
> > ---
> >  drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> > index f8145998fcaf..4786062e879a 100644
> > --- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> > +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> > @@ -584,7 +584,6 @@ static void h264_encode_filler(struct venc_h264_inst *inst, void *buf,
> >
> >  static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
> >  {
> > -     const bool is_ext = MTK_ENC_CTX_IS_EXT(ctx);
> >       int ret = 0;
> >       struct venc_h264_inst *inst;
> >
> > @@ -594,7 +593,10 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
> >
> >       inst->ctx = ctx;
> >       inst->vpu_inst.ctx = ctx;
> > -     inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
> > +     if (MTK_ENC_CTX_IS_EXT(ctx))
> > +             inst->vpu_inst.id = SCP_IPI_VENC_H264;
> > +     else
> > +             inst->vpu_inst.id = IPI_VENC_H264;
> >       inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
> >
> >       ret = vpu_enc_init(&inst->vpu_inst);
> >
> > --
> > 2.47.0.338.g60cca15819-goog
> >



--
Ricardo Ribalda

