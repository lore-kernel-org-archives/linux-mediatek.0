Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FA2C25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 07:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcSwrAOBgk0SabpBSOsxuNeS90Z/JnZDn0cwEFk4oc8=; b=KbMPBLvKj8FXvBev/P2vZejjsg
	0gm9wDHLGHTq/6x0KSM2n5/7/9scYLy6UUM6UvkBn96ZGPm/pETd5umJBVRUTK5xZkFuTJYAD8m6j
	hRIGgYdlAdzJ8eF9xskltP7LoGsUajkqA3vD0jH5vbBvStJKQUpGfLCxpqFaCQ6+r2YF0TQzsZDo4
	2/Hg4wMjJi/v/5urIKBo8KwLn6PhpkwrTz+uQz5X88hHqhkyMua6m+6N/2jKfygEWabg8SNpw5Jci
	B02NEI52ELplwnPxvBPlURcOiu3YXpzO2vb4LWLEhrCZu3tu6KJWXphenb/OOg4CST/hB47Ugmpcv
	EbmXIMfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBUSA-0000000E0Wl-0oZG;
	Mon, 27 May 2024 07:07:30 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBUS7-0000000E0Ue-470h
	for linux-mediatek@lists.infradead.org;
	Mon, 27 May 2024 07:07:29 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5295f012748so3212392e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 27 May 2024 00:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716793643; x=1717398443; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcSwrAOBgk0SabpBSOsxuNeS90Z/JnZDn0cwEFk4oc8=;
        b=iq3orxdZt3tlQJodE0VJXeTmbp/DpoLtn8v/CIuWdLgccv4hILwPcoR5wqSojfgz57
         twQ3fbYhZ4nc2v2kUdnhqscyfwXuU8eeJQdDL1o51EVm6GxxMffpp0N0t/yQFoieG95o
         maK9jTYDWDs3w4MfttJL5mmdExh/nJStuJwrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716793643; x=1717398443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcSwrAOBgk0SabpBSOsxuNeS90Z/JnZDn0cwEFk4oc8=;
        b=ono7MsvNNnUWnlyeJkO//tRZj86xPVIWQZhmwB+87SEcTmo5kYrhDJ82D0GMNvG0YG
         SXvv+/fNgvLqVdeeOZ5r3x3zdFpp4t30waHZ5KH9tB/5OrH97urO22xh97acoiMfV67t
         YPAhpSdBjxC8m0TT9YbI+IXvRp3gj2ClIwRWTjllDWLkdO4V2E0V67aqehYhwFq3mZMr
         YOhKM61qzRYC2GN5RXSkBHxArm6HgQ0X7rOnMQZjPeDYkrwQvwVR8RAjh5YoTgeoYQHj
         mL3LKShcW/NZpmcoF1TXDASSZec4eRgBimSnNVMRiJnishV5VRetczoo/vw1ZorAd7nD
         zrnA==
X-Forwarded-Encrypted: i=1; AJvYcCXxkoDEKTaVQZ9j1iFeuPsSDjkNnQysna06kIQY3oj34BnJjTU4L+TuqKGgvowjRKdAWpXrCOV2RXmL/wnlkZElaQSJdNvADS3UE/5k9yNJGADf
X-Gm-Message-State: AOJu0YzlzkRkJHWzKgoFASPFfotSaQThshKUAmOOC7Xj1mhzTC2ee5kW
	bUajRn3hZ5xWHFEuaYfBmt2FoYSa9il69ZrdvgWN2eQ8rocyx7Qnb73YKsQ4QNilBVaHZroBvaN
	ANSSWxVoPHeFzr4F36w4mpvGtAvqsawfC9ie8
X-Google-Smtp-Source: AGHT+IH6hkPVE7ofiPKTM1LpKdq3IVMXIknOENA5KSdXkvMNG/QOho/QQ2nuWyvBQu7FsSYAuoYRgFJca6ReR+79/8Q=
X-Received: by 2002:a19:5f07:0:b0:51f:3cb3:48a4 with SMTP id
 2adb3069b0e04-529646e3b70mr4742266e87.1.1716793643444; Mon, 27 May 2024
 00:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240516122102.16379-1-yunfei.dong@mediatek.com> <20240516122102.16379-15-yunfei.dong@mediatek.com>
In-Reply-To: <20240516122102.16379-15-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 May 2024 15:07:12 +0800
Message-ID: <CAGXv+5Fo2x1R1=rJgC6ymLPMJYOypQdu9wQNdgSrjREyiQWHPw@mail.gmail.com>
Subject: Re: [PATCH v6,14/24] media: mediatek: vcodec: Add capture format to
 support one plane memory
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Nathan Hebert <nhebert@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Yong Wu <yong.wu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Steve Cho <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T . J . Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_000728_050411_58F49453 
X-CRM114-Status: GOOD (  22.27  )
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

Hi,

On Thu, May 16, 2024 at 8:21=E2=80=AFPM Yunfei Dong <yunfei.dong@mediatek.c=
om> wrote:
>
> Define one uncompressed capture format V4L2_PIX_FMT_MS21 in order to
> support one plane memory. The buffer size is luma + chroma, luma is
> stored at the start and chrome is stored at the end.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  Documentation/userspace-api/media/v4l/pixfmt-reserved.rst | 8 ++++++++
>  drivers/media/v4l2-core/v4l2-common.c                     | 2 ++
>  drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
>  include/uapi/linux/videodev2.h                            | 1 +
>  4 files changed, 12 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/=
Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> index 886ba7b08d6b..6ec899649d50 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> @@ -295,6 +295,14 @@ please make a proposal on the linux-media mailing li=
st.
>        - Compressed format used by Nuvoton NPCM video driver. This format=
 is
>          defined in Remote Framebuffer Protocol (RFC 6143, chapter 7.7.4 =
Hextile
>          Encoding).
> +    * .. _V4L2-PIX-FMT-MS21:
> +
> +      - ``V4L2_PIX_FMT_MS21``
> +      - 'MS21'
> +      - This format has one plane, luma and chroma are stored in a conti=
guous
> +        memory. Luma pixel in 16x32 tiles at the start, chroma pixel in =
16x16
> +        tiles at the end. The image height must be aligned with 32 and t=
he image
> +        width must be aligned with 16.
>  .. raw:: latex
>
>      \normalsize
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 4165c815faef..5ae54cf48dc7 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -271,6 +271,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
>                   .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0,=
 0 }},
>                 { .format =3D V4L2_PIX_FMT_MT2110R, .pixel_enc =3D V4L2_P=
IXEL_ENC_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0=
 }, .bpp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
>                   .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0,=
 0 }},
> +               { .format =3D V4L2_PIX_FMT_MS21, pixel_enc =3D V4L2_PIXEL=
_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .=
bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,

                                                 ^
This is missing a '.' before 'pixel_enc', which breaks the build.

ChenYu

> +                 .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0,=
 0 }},
>
>                 /* YUV planar formats */
>                 { .format =3D V4L2_PIX_FMT_NV12,    .pixel_enc =3D V4L2_P=
IXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 =
}, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 4c76d17b4629..3a68f2b9e7a4 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1529,6 +1529,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>                 case V4L2_PIX_FMT_MT2110T:      descr =3D "Mediatek 10bit=
 Tile Mode"; break;
>                 case V4L2_PIX_FMT_MT2110R:      descr =3D "Mediatek 10bit=
 Raster Mode"; break;
>                 case V4L2_PIX_FMT_HEXTILE:      descr =3D "Hextile Compre=
ssed Format"; break;
> +               case V4L2_PIX_FMT_MS21:         descr =3D "MediaTek One P=
lane Format"; break;
>                 default:
>                         if (fmt->description[0])
>                                 return;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 89eb1a3c6555..7aff2f2c8f9c 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -800,6 +800,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediate=
k 8-bit block mode, two non-contiguous planes */
>  #define V4L2_PIX_FMT_MT2110T  v4l2_fourcc('M', 'T', '2', 'T') /* Mediate=
k 10-bit block tile mode */
>  #define V4L2_PIX_FMT_MT2110R  v4l2_fourcc('M', 'T', '2', 'R') /* Mediate=
k 10-bit block raster mode */
> +#define V4L2_PIX_FMT_MS21     v4l2_fourcc('M', 'S', '2', '1') /* MediaTe=
k 8-bit block mode with one plane */
>  #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel P=
lanar Greyscale 10-bit and Depth 16-bit */
>  #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4=
-bit packed depth confidence information */
>  #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTTV 8-=
bit dithered RGB */
> --
> 2.25.1
>

