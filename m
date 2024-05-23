Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DBEC25B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 10:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oK/A89Z/zNw46yDzJQlKHlc10yICfqRNuD9iOVPjR0A=; b=uC+sXY/kyESJvquqpkfCKWS3CR
	TSuCpQcObFL6ETl0bvWhDreGET6vicGGGmJ/LVjA5x8qNzKUymSznZQ5tasK6AXLaxmqAix/r8bgJ
	LBXUnPBrZ23wB9o+xfL+DytVygRwv8pUWcxm1pJCmY/kSQsQWJAyL2HcADiNQy1BfQhrOg4MPZMYK
	aNs7Dp7I+8p+MTNOMdR3Szh4tqFl+6CMOWyrbaj3Qo6GNZJCNdzzLPVWPNL7FR2KYXnNq95nIwUoy
	E78AtRKVGqsEsoK6+LVdWyILt54jcMGkguPgP/llZ7stcPnll5BPMpqvS0ct7s4IGQk02Q16DFAYK
	1LirGLZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA5o5-00000005u2k-2yek;
	Thu, 23 May 2024 10:36:21 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA5o2-00000005u1j-3dAB
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 10:36:20 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-51f12ccff5eso9405336e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 03:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716460576; x=1717065376; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oK/A89Z/zNw46yDzJQlKHlc10yICfqRNuD9iOVPjR0A=;
        b=OPwNAhNa70RwVsTPqa35TnrC65BiAl2Jx0B9mSS6n3ApR7wNsUmBBPPZzq0YKOt1HK
         6HYVJdBZv4wFsKMx7B8AaLzOrOM4YWG5Ryrrok2qbGjRFiXI6h0pqxngnc4faTOyzJob
         HU4eANzRnXwLC7EuZZZgL+p4hocPONyoE6k80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716460576; x=1717065376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oK/A89Z/zNw46yDzJQlKHlc10yICfqRNuD9iOVPjR0A=;
        b=Bi+2qsjjphrwIVMaTmSxEL4LZLmQKR2D/7iSrve2UtEXCTUCAFrOKAPvWz5wajzo8g
         d691tFpIluyyQMvqFxftdiwDaZKDBkbQOFrI3h0/Wi4Bwdsyofm7oen5XUcesGLgjTHe
         pUg5+CtcfTZazeWU/TAZrb3vGlix8qSA6Lqq85IsFZUZzAR0hVCMJJjEa3UfKlU2Fqpn
         KW5NIts8YCZu7wi1sUy3Hv+jetbCc6LwgL+d8Vre9qEsloy7SfFds+V/ZRgQDazhKBfr
         M/Wp1n0YJ5AR/aYlcnp4wDtmwowp2yEmS7+6ewyoJeNlkZOVqFggnqppeqblYsLsK9xX
         apJg==
X-Forwarded-Encrypted: i=1; AJvYcCWD2S3SoyZiQTzjkCW5ogJGZQ+ghRE0v0VQFMGRZvWsFfTkpQ4uToIptZCRRQbNc3rOooFUrjLv6rGLW2pbZ8aW/L+YHfMswsvBMFm9Xf/vfCaa
X-Gm-Message-State: AOJu0YwGuEGwzKYA+v9+H4rU3pv58tIohpSKlQpMv5dGO+3XW0tHDR2c
	TLFRe7lzNumAumykB8N+VY2xZrd+zH6cbw1vaeQA/SSfqvItJ2QiEWjTgVlVLMfajg12H2IkTij
	ARvNA2z2af42Ux/6TWjpl1aCcVnaMqJNwDmsQ
X-Google-Smtp-Source: AGHT+IF1qtqxIdOUuK18yoAkY3al5Dw2mSuMWQ9cFuoHZpQD9cry6r8COqpzTqWYrH9aBrtDFTCbGric5gRQDW1zyIw=
X-Received: by 2002:a05:6512:ac2:b0:51e:f68b:d2a2 with SMTP id
 2adb3069b0e04-526bf546146mr3472177e87.65.1716460575866; Thu, 23 May 2024
 03:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-15-yunfei.dong@mediatek.com> <1d4618ac-4316-495d-afdb-5849e4b1e805@collabora.com>
 <537a0969-afdf-4e48-a640-2d8fc665c964@collabora.com>
In-Reply-To: <537a0969-afdf-4e48-a640-2d8fc665c964@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 23 May 2024 18:36:04 +0800
Message-ID: <CAGXv+5Hg-61qQEiPScqEfO6irHnaJHHqcr=MYX=89RzUBRK7oA@mail.gmail.com>
Subject: Re: [PATCH v6,14/24] media: mediatek: vcodec: Add capture format to
 support one plane memory
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Jeffrey Kardatzke <jkardatzke@google.com>, 
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
X-CRM114-CacheID: sfid-20240523_033618_945494_B641C60E 
X-CRM114-Status: GOOD (  28.65  )
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

On Thu, May 23, 2024 at 6:14=E2=80=AFPM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> Hi,
>
> I'm having second thoughts, please see inline,
>
> W dniu 22.05.2024 o 14:26, Andrzej Pietrasiewicz pisze:
> > Hi Yunfei,
> >
> > W dniu 16.05.2024 o 14:20, Yunfei Dong pisze:
> >> Define one uncompressed capture format V4L2_PIX_FMT_MS21 in order to
> >> support one plane memory. The buffer size is luma + chroma, luma is
> >> stored at the start and chrome is stored at the end.
> >>
> >> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> >> ---
> >>   Documentation/userspace-api/media/v4l/pixfmt-reserved.rst | 8 ++++++=
++
> >>   drivers/media/v4l2-core/v4l2-common.c                     | 2 ++
> >>   drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
> >>   include/uapi/linux/videodev2.h                            | 1 +
> >>   4 files changed, 12 insertions(+)
> >>
> >> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst=
 b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> >> index 886ba7b08d6b..6ec899649d50 100644
> >> --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> >> +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> >> @@ -295,6 +295,14 @@ please make a proposal on the linux-media mailing=
 list.
> >>         - Compressed format used by Nuvoton NPCM video driver. This fo=
rmat is
> >>           defined in Remote Framebuffer Protocol (RFC 6143, chapter 7.=
7.4 Hextile
> >>           Encoding).
> >> +    * .. _V4L2-PIX-FMT-MS21:
> >> +
> >> +      - ``V4L2_PIX_FMT_MS21``
> >> +      - 'MS21'
> >> +      - This format has one plane, luma and chroma are stored in a co=
ntiguous
> >
> > Maybe s/one/single ?
> >
> >> +        memory. Luma pixel in 16x32 tiles at the start, chroma pixel =
in 16x16
> >
> > maybe the word "pixel" is reduntant here? What else than pixels could t=
ile sizes mean?
> > Any padding between luma and chroma?
> >
> >> +        tiles at the end. The image height must be aligned with 32 an=
d the image
> >> +        width must be aligned with 16.
> >
> > Maybe aligned to?
> >
> >>   .. raw:: latex
> >>       \normalsize
> >> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l=
2-core/v4l2-common.c
> >> index 4165c815faef..5ae54cf48dc7 100644
> >> --- a/drivers/media/v4l2-core/v4l2-common.c
> >> +++ b/drivers/media/v4l2-core/v4l2-common.c
> >> @@ -271,6 +271,8 @@ const struct v4l2_format_info *v4l2_format_info(u3=
2 format)
> >>             .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0, 0 =
}},
> >>           { .format =3D V4L2_PIX_FMT_MT2110R, .pixel_enc =3D V4L2_PIXE=
L_ENC_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 },=
 .bpp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> >>             .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0, 0 =
}},
> >> +        { .format =3D V4L2_PIX_FMT_MS21, pixel_enc =3D V4L2_PIXEL_ENC=
_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> >> +          .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0, 0 }=
},
> >>           /* YUV planar formats */
> >>           { .format =3D V4L2_PIX_FMT_NV12,    .pixel_enc =3D V4L2_PIXE=
L_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, =
.bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> >> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2=
-core/v4l2-ioctl.c
> >> index 4c76d17b4629..3a68f2b9e7a4 100644
> >> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >> @@ -1529,6 +1529,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc=
 *fmt)
> >>           case V4L2_PIX_FMT_MT2110T:    descr =3D "Mediatek 10bit Tile=
 Mode"; break;
> >>           case V4L2_PIX_FMT_MT2110R:    descr =3D "Mediatek 10bit Rast=
er Mode"; break;
> >>           case V4L2_PIX_FMT_HEXTILE:    descr =3D "Hextile Compressed =
Format"; break;
> >> +        case V4L2_PIX_FMT_MS21:        descr =3D "MediaTek One Plane =
Format"; break;
> >
> > s/One/Single ?
> >
>
> On the other hand "single" would be [in this case incorrectly] associated=
 with
> single-planar API, which would be totally confusing.
>
> Still, the reality you are trying to model is complex: you use
> MPLANE, yet there's a single plane in case of secure playback.

I don't think that's a problem though. The NV12 format (seen above in
the diff context) has the same attributes: 1 contiguous memory plane
containing two component planes.

And it's perfectly fine for MPLANE drivers to support these formats,
Hantro being one of them that decodes to NV12. If a decoder can decode
into discontiguous buffers, it surely can decode into contiguous ones;
just set the second/third buffer address to the correct offset into
the first buffer based on the format layout.

In retrospect we probably should have named "MM21" as "MM21M" to denote
that it is multi-memory-plane, and this "MS21" would have been "MM21",
having a single contiguous memory plane.

And the MPLANE driver supporting "single memory plane" oddity gets
resolved if the API rework ever gets finished.


Regards,
ChenYu

> Regards,
>
> Andrzej
>
>
> > Regards,
> >
> > Andrzej
> >
> >>           default:
> >>               if (fmt->description[0])
> >>                   return;
> >> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/video=
dev2.h
> >> index 89eb1a3c6555..7aff2f2c8f9c 100644
> >> --- a/include/uapi/linux/videodev2.h
> >> +++ b/include/uapi/linux/videodev2.h
> >> @@ -800,6 +800,7 @@ struct v4l2_pix_format {
> >>   #define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Med=
iatek 8-bit block mode, two non-contiguous planes */
> >>   #define V4L2_PIX_FMT_MT2110T  v4l2_fourcc('M', 'T', '2', 'T') /* Med=
iatek 10-bit block tile mode */
> >>   #define V4L2_PIX_FMT_MT2110R  v4l2_fourcc('M', 'T', '2', 'R') /* Med=
iatek 10-bit block raster mode */
> >> +#define V4L2_PIX_FMT_MS21     v4l2_fourcc('M', 'S', '2', '1') /* Medi=
aTek 8-bit block mode with one plane */
> >>   #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Int=
el Planar Greyscale 10-bit and Depth 16-bit */
> >>   #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Int=
el 4-bit packed depth confidence information */
> >>   #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTT=
V 8-bit dithered RGB */
> >
>

