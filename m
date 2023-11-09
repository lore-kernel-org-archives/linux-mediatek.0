Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E547CC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 09:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DilLKYDfiJHifO/My66ufTYoZBnb4NT+vvrqkX7FBNE=; b=Kh+c5u0AObChS43gtnLJsxS0wd
	Xve1+FGA6SNsHwuAKiUkCeaBXYvi6K+A3zyUZ6O3ZIR2I99fuHRquyX6Me42rvYHnlIe7s4KVZ4LD
	Jrv3BqReHFhfF1yKctwh0xpKgXAw7UsRwPb8Bi0Hem6aSRInNjY6fAVL/wg+FOsU7sQZg/iSwm6MY
	wonS615pgI4dKWKMQkQavBwPkN5Wy3F+4U1pU18+ZKnDflvpl6ZFu479TVpkBum71Pf1p+6Svs4nb
	baroAN9oBobefAxIc1aq4H5YD+xyqEtwhtgIMg5F6kPA8ble9oU4iaZ/y/aqolmatXvMOjUKoLLbg
	5vhRgPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11lW-005qCF-2u;
	Thu, 09 Nov 2023 09:55:58 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11lU-005qBl-0W
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Nov 2023 09:55:57 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9c773ac9b15so103010866b.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Nov 2023 01:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699523753; x=1700128553; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DilLKYDfiJHifO/My66ufTYoZBnb4NT+vvrqkX7FBNE=;
        b=Ra0Q3J0Q7ARPaT6oh5se0T2riG1NFBkNQy3Wy3EN3+p7rpaG7e+aTP6XdaEDCk+RaH
         IgSiBXmg6o2jbksJVf3FDDHbW+oETSSQ9+gQ3Z5rBHPBJir+MC01ypBt8mSa2rhqV2y1
         L0P1+d/nvMcXs0GscX4FYhK+CttEvvycckLkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699523753; x=1700128553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DilLKYDfiJHifO/My66ufTYoZBnb4NT+vvrqkX7FBNE=;
        b=mPFmqFsOuAboTZuu2ZFZe69Mryt7Q/307CebZNWu9ietmjLCiUHhB/jPEeC8J6BZFD
         2SN7Rup74P4uZYdjLnUjs1NrPoQZNfkfPKTFDutt/DO+GTQqi/alZKMA0OL+YQHXgPBt
         FzUDMfWyJ9GFG9Fwo6kl5yQxFZzB8b4bR6aXH5/akbPt1j+G1alGBJMqJM4HPTC5gbxw
         z2unWVdL8orFt5k2xGNJ5b1TZ0JzjWR8sPhKxNo8M6X4ti4YatcybNXrPBY968KOce/+
         d8ZPGMM3657KTECwVNylEbv4e33b0kPXeWhHEf4gkvPFbbCSPUeubnn/ndJ81D7AECfO
         ANww==
X-Gm-Message-State: AOJu0Yy4n7zbbxERHeZfWprar1Rzjo1FdYmrnTzH3PDm3IrTS62IMPY9
	75OHU0SsMxI8K3A2hHTFfgXSWuSvfqqdnvO8k5SDOP6N
X-Google-Smtp-Source: AGHT+IFxccL/IpMnupcpLU5pa3wpEojOGBWtC8u8p77oIvN8KxRbizkMbLqCZmNnsnQc9VJoLth1bg==
X-Received: by 2002:a17:906:fe0c:b0:9c6:306f:677f with SMTP id wy12-20020a170906fe0c00b009c6306f677fmr3289537ejb.47.1699523753496;
        Thu, 09 Nov 2023 01:55:53 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id qx11-20020a170906fccb00b009b2f2451381sm2317152ejb.182.2023.11.09.01.55.53
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 01:55:53 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-53de0d1dc46so992384a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Nov 2023 01:55:53 -0800 (PST)
X-Received: by 2002:a5d:64a9:0:b0:32f:7f09:160f with SMTP id
 m9-20020a5d64a9000000b0032f7f09160fmr4230407wrp.12.1699523312965; Thu, 09 Nov
 2023 01:48:32 -0800 (PST)
MIME-Version: 1.0
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-57-benjamin.gaignard@collabora.com>
 <20231109094311.yzmmn4vvskmrk4tk@chromium.org> <2f5ad14b-528d-4656-84d8-f85467c5b475@collabora.com>
In-Reply-To: <2f5ad14b-528d-4656-84d8-f85467c5b475@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 9 Nov 2023 18:48:15 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CH=NoDUJArp=6_28WSgkQ3jTMR3SOyx1iYro-7e4c2hA@mail.gmail.com>
Message-ID: <CAAFQd5CH=NoDUJArp=6_28WSgkQ3jTMR3SOyx1iYro-7e4c2hA@mail.gmail.com>
Subject: Re: [PATCH v14 56/56] media: test-drivers: Use helper for DELETE_BUFS ioctl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, m.szyprowski@samsung.com, ming.qian@nxp.com, 
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, 
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl, 
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_015556_199196_5356D1B3 
X-CRM114-Status: GOOD (  18.14  )
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

On Thu, Nov 9, 2023 at 6:46=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 09/11/2023 =C3=A0 10:43, Tomasz Figa a =C3=A9crit :
> > On Tue, Oct 31, 2023 at 05:31:04PM +0100, Benjamin Gaignard wrote:
> >> Allow test drivers to use DELETE_BUFS by adding vb2_ioctl_delete_bufs(=
) helper.
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >> ---
> >>   drivers/media/test-drivers/vicodec/vicodec-core.c |  2 ++
> >>   drivers/media/test-drivers/vimc/vimc-capture.c    |  2 ++
> >>   drivers/media/test-drivers/visl/visl-video.c      |  2 ++
> >>   drivers/media/test-drivers/vivid/vivid-core.c     | 13 ++++++++++---
> >>   4 files changed, 16 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drive=
rs/media/test-drivers/vicodec/vicodec-core.c
> >> index 69cbe2c094e1..f14a8fd506d0 100644
> >> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> >> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> >> @@ -1339,6 +1339,7 @@ static const struct v4l2_ioctl_ops vicodec_ioctl=
_ops =3D {
> >>      .vidioc_prepare_buf     =3D v4l2_m2m_ioctl_prepare_buf,
> >>      .vidioc_create_bufs     =3D v4l2_m2m_ioctl_create_bufs,
> >>      .vidioc_expbuf          =3D v4l2_m2m_ioctl_expbuf,
> >> +    .vidioc_delete_bufs     =3D v4l2_m2m_ioctl_delete_bufs,
> >>
> >>      .vidioc_streamon        =3D v4l2_m2m_ioctl_streamon,
> >>      .vidioc_streamoff       =3D v4l2_m2m_ioctl_streamoff,
> >> @@ -1725,6 +1726,7 @@ static int queue_init(void *priv, struct vb2_que=
ue *src_vq,
> >>      dst_vq->mem_ops =3D &vb2_vmalloc_memops;
> >>      dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> >>      dst_vq->lock =3D src_vq->lock;
> >> +    dst_vq->supports_delete_bufs =3D true;
> > Since we have to explicitly provide the vidioc_delete_bufs callback any=
way,
> > is there any value in having a separate supports_delete_bufs flag? Or w=
e
> > envision that some drivers would support deleting buffers only for some
> > queues?
>
> That exactly the case for Hantro driver, it can support deleting buffers =
on
> capture queue but not on output queue.

Fair enough.

Best regards,
Tomasz

