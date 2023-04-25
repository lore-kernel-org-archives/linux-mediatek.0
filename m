Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8881AC77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 06:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/4po1Ej3WlfOvU1adXzD1g1bzAX945MwQFA0TAxTFI=; b=IFVpF6uvinqDTk/1vFtrDvB2fz
	Ad0BxrdJzlIcVtHfcOSUXXuRX25HhEDA6Phk8+f4F+NgMaLwmQW36GWrtM3Zi7LL3NSt3KRT63zJP
	8CVinpw7z+5zOBRBBgf6dlf10OOKpW5EFxW0Io07/y//KFiMI3f2olZW8w4GNUZqQdszYrR4Stcmj
	xpw7ze5y9Um5II5WsVf/kXt40VPwNM+I3NkoaPsK4QAAJxWxIOKxZWKyu5TA/o8V1x7a14dN3ptK5
	iJrzG75zJvp2gnbgNHNcWnqy4UxOzrRxgmLUnT+JPUiVchsg6SKDndHDJf7ZR4ruZu1BXP0aHSXH6
	lgUuANzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prCJx-000J2d-1p;
	Tue, 25 Apr 2023 06:38:37 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prCJv-000J10-0K
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 06:38:36 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-76fd0036c7fso1379133241.3
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Apr 2023 23:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682404712; x=1684996712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/4po1Ej3WlfOvU1adXzD1g1bzAX945MwQFA0TAxTFI=;
        b=nFbieztOPswW5GxKKRLXOuztCpyAKY9mEjRZBMEICHGO1mEr4lOyasrgFTeqpGgjkM
         ZVarB5HMqvVpOvv0t0+9B1RcIWFMy1IH+lchfuVbvAR5ex1IiPV2XfN06pd0Epa4XknE
         WOuntHpjHKejNoMhtXaT2wWCOPaKUPevx4HHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682404712; x=1684996712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/4po1Ej3WlfOvU1adXzD1g1bzAX945MwQFA0TAxTFI=;
        b=NQvTkyxwzjLNewFBiJ4oKr+qHvFAP2m/PbhHfIdILQs81Ou9+nrRkVaID7Aed45/U2
         hSm9rWuMBPKTniNLER44W65ua1yQKZL9EGjcF1j6f721crRivSw6nkGnFj5o2V6Auaa4
         Gmr3VlhkTB9OPpT/B2NwVMvst/wIIEeIN8MCm54wl5paHQDEDRradc4Rg+NTxmwn5734
         6ZOqwZv0Mx3zduDgV7lFob6TQfrogK3hTjr6XhHBv1bVfO4EvCdilvVUWkIsvdxVVtYO
         LhOyNNX/oKIedQU4zHxjHwE0V5viF0TE94QNgL2IJ3Ia6kx8ORAKaDwdnBXo+ctB4pdg
         CtNw==
X-Gm-Message-State: AAQBX9caN6TMWAE7ZZWWLZbFU7k7KunfYGRJgzFmcOw9OFuZuDJImSSb
	anU2NJXRCsiVUBNqtQoX3dRlAZIxnyB4AJDlnXlJCQ==
X-Google-Smtp-Source: AKy350bAqm4/VLyKdgzolsEnGjY/HHjmxsgcud09926UX90Ij1K67+wBUb5KDEvOlucOh39eKpAS/LkMZ7WwxRXo5PA=
X-Received: by 2002:a1f:3f44:0:b0:43b:ef4d:f6c0 with SMTP id
 m65-20020a1f3f44000000b0043bef4df6c0mr4118847vka.0.1682404711878; Mon, 24 Apr
 2023 23:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230422103905.1995271-1-treapking@chromium.org>
In-Reply-To: <20230422103905.1995271-1-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 25 Apr 2023 14:38:20 +0800
Message-ID: <CAGXv+5HszT12aSaupe0occaFSC-9pZUmaCiKagbFSA5++X3xcA@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Only apply 4K frame sizes on
 decoder formats
To: Pin-yen Lin <treapking@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_233835_139728_A310DC27 
X-CRM114-Status: GOOD (  15.58  )
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

On Sat, Apr 22, 2023 at 6:39=E2=80=AFPM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> When VCODEC_CAPABILITY_4K_DISABLED is not set in dec_capability, skip
> formats that are not MTK_FMT_DEC so only decoder formats is updated in
> mtk_init_vdec_params.
>
> Fixes: e25528e1dbe5 ("media: mediatek: vcodec: Use 4K frame size when sup=
ported by stateful decoder")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>
>  .../media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c   | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_statef=
ul.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
> index 29991551cf61..0fbd030026c7 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
> @@ -584,6 +584,9 @@ static void mtk_init_vdec_params(struct mtk_vcodec_ct=
x *ctx)
>
>         if (!(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED)) =
{
>                 for (i =3D 0; i < num_supported_formats; i++) {
> +                       if (mtk_video_formats[i].type !=3D MTK_FMT_DEC)
> +                               continue;
> +
>                         mtk_video_formats[i].frmsize.max_width =3D
>                                 VCODEC_DEC_4K_CODED_WIDTH;
>                         mtk_video_formats[i].frmsize.max_height =3D
> --
> 2.40.0.634.g4ca3ef3211-goog
>

