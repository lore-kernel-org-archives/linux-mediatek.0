Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87A6C27C77
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 14:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QR9tmd+yNNNniijbyRPGMlyIsNhlrnteAwcBJgKWpb4=; b=n6OakYvRubML89k+paIG242myR
	Az88JIvuvggWWBkscTABTS0mJGYW65c2smYf+akMrgM3bgiLHE82qBzs3uRHHlhQhN96h16qR12Ww
	S3lriqmnENj7ekYgelPRAPT1qbitUFMCrriBjDEfhZNJ/2P7qLCjRDGuQKkZbl2m8e7hl7hMJbD28
	LAfFAbQcALB5mwGdYa4Mk3jl8SP3D4Y4wZCHzSwoOzBpj9GMgxugqbaQcw8Fr57ie1mTcyVZgFbH0
	1GPkEfMs20SW2MADRNGpPutLAVJue+RPEYRkFYTOzZ8UwWJVapEhDMokI+YigPkbA8ah8PdCi7KxB
	don6Oaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7hu-00000002ydO-2ksV;
	Fri, 14 Jun 2024 14:15:10 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7hp-00000002yb3-2qFF
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 14:15:07 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-57c60b13a56so2540715a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718374504; x=1718979304; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QR9tmd+yNNNniijbyRPGMlyIsNhlrnteAwcBJgKWpb4=;
        b=muaGK6I4PcLYbSPKxd92m1yYeKZqsyOSqnqXKAI9Z6CWcnrurkj/AcJBKKcn3ymRaI
         yVoQMALjDdyiYG/Me12SeGgr5vv0ayb5i0i5ytHarSoCRg3vrHbtRTVEggRJtrrHml7/
         ap4QCG4DkCyiC+fUfOdzoaU/PyfL0BSJUJt0Cydd6txrnXLT0HVLTlZvPx9XcoLRc9Jd
         xkEzPMv00oQxYbBzb/GVPzusoEXCy6i+Fb2GK+d4PlqwEreWuZr++M17RU7rfwsmT7Pn
         aBu848EFiVBirsPe5r1AOF2i5KOPlsvSToUV69QKLOx1iSxiWBUjJn9lbmJAILWDR/Ez
         ATdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718374504; x=1718979304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QR9tmd+yNNNniijbyRPGMlyIsNhlrnteAwcBJgKWpb4=;
        b=Id2VQnfODfanpWBtZ9HtsbXH+NN0sMlejmm2n3GMkj6tOs3k2mTyzBz0odRa3hxVOv
         OJKm/QLJHp9oIdLr2z1yuUdRl4RQQVnjqjn9r0BQ3Pp0JU87F0C9zOU0IyuvWeWEsG8Y
         u73CdfNRRNs+xu7gL+XAl2neeZpY3C7Grc5ZSLfO4JvkeUgfuoIh01G9zbNvYHUgGoy+
         WuY9Heea4SCA2AuXE74RVOOaSq30L3RS9sB9F0Z1Hb+svFVurqnnwVCcnNDrPOjrw1hi
         xzLRhqErtwaXcSJfsYqofQjupC1AfwE3kHsGHIrWQk50xcD05nlEYFDEVi8JEINVVn1y
         GBQA==
X-Forwarded-Encrypted: i=1; AJvYcCWRJF71Kf98DGhBIGjBmPh5IHCmbCv72/oR/vyj47t/yqqoDqB5BCzLnnD3Z+FBxvKgwDXZoLyHUhlatj8r3hvXJJYhs601bB7OBBxLno/XWjwY
X-Gm-Message-State: AOJu0Yz8fPFlJRx3zh/5hkJZq/VAYfFmxTe/W53GsWOALPaCO0mLdHol
	Tzu1U83nXiFGvHmDCE0CvgUhryiaXdGibeYt91L+X94beGJwyt1D2VVNZWM4xeIAoN8R/b3Lxdg
	2d/hAlxZ2tpo+FCjbTJGHWIXM5VbMIWiTMh2Jyw==
X-Google-Smtp-Source: AGHT+IGcfTO/OhWSnVz2aND6Cyuzd7ym0of3S6kctgW5UO9hM206VYdzcBCkxxrr6TybHlFMyjilw6ZJrQYVoc1c1uI=
X-Received: by 2002:a17:906:34d9:b0:a6f:15a3:b085 with SMTP id
 a640c23a62f3a-a6f60dc5539mr173229766b.51.1718374503888; Fri, 14 Jun 2024
 07:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-4-jstephan@baylibre.com> <3c2bee40-3792-409c-b42f-f8b013ff641c@collabora.com>
 <CAEHHSvaT_U+HNzWQUoK9EuqGuqEd11+Lu0CLz_rL7uQf0Q5isw@mail.gmail.com>
 <53838e76-bfa4-41f5-a015-a37472e98991@collabora.com> <CAEHHSvaRqZM9c8oD05WKkhOHdjKLBkR6tXp2Q1b8OMiDxDsDhQ@mail.gmail.com>
 <20240614123345.GN6019@pendragon.ideasonboard.com>
In-Reply-To: <20240614123345.GN6019@pendragon.ideasonboard.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 14 Jun 2024 16:14:52 +0200
Message-ID: <CAEHHSvaWO7m=n5_f0BM7gwuDMfh_GMX=x3DknG28PnmtZbrGQw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>, 
	Florian Sylvestre <fsylvestre@baylibre.com>, Andy Hsieh <andy.hsieh@mediatek.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-media@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Paul Elder <paul.elder@ideasonboard.com>, 
	Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_071505_854932_D987269C 
X-CRM114-Status: GOOD (  38.55  )
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

Le ven. 14 juin 2024 =C3=A0 14:34, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> a =C3=A9crit :
>
> On Fri, Jun 14, 2024 at 12:38:15PM +0200, Julien Stephan wrote:
> > Le mer. 12 juin 2024 =C3=A0 10:06, AngeloGioacchino Del Regno a =C3=A9c=
rit :
> > >
> > > Il 10/06/24 16:39, Julien Stephan ha scritto:
> > [...]
> > > >>
> > > >>> +     writel(0x10001, input->base + SENINF_TG1_SEN_CK);
> > > >>
> > > >> Unroll this one... this is the TG1 sensor clock divider.
> > > >>
> > > >> CLKFL GENMASK(5, 0)
> > > >> CLKRS GENMASK(13, 8)
> > > >> CLKCNT GENMASK(21,16)
> > > >>
> > > >> Like this, I don't get what you're trying to set, because you're u=
sing a fixed
> > > >> sensor clock rate, meaning that only a handful of camera sensors w=
ill be usable.
> > > >>
> > > >> Is this 8Mhz? 16? 24? what? :-)
> > > >>
> > > >> Two hints:
> > > >>    - sensor_clk =3D clk_get_rate(isp_clk) / (tg1_sen_ck_clkcnt + 1=
);
> > > >>    - int mtk_seninf_set_sensor_clk(u8 rate_mhz);
> > > >>
> > > >> Please :-)
> > > >
> > > > Hi Angelo,
> > > >
> > > > I think I get your point about not hardcoding the sensor rate, but =
I
> > > > am not sure how to use
> > > > a mtk_seninf_set_sensor_clk(u8 rate_mhz); function.
> > > >
> > > > Where would it be called? How is it exposed to the user?
> > > >
> > >
> > > As for where: setup, streaming start, resolution change (which may be=
 covered
> > > by streaming start anyway, as a change should be calling stop->start =
anyway).
> > >
> > > And for the how is it exposed to the user - well, depends what you me=
an for user,
> > > but it's all standard V4L2 API :-)
> > >
> > > Last but not least, I can give you another hint....
> > >
> > > struct media_entity *entity =3D (something_here);
> > > struct media_pad *mpad;
> > > struct v4l2_subdev *cam_subdev;
> > > struct v4l2_ctrl *ctl;
> > > s64 link_frequency, pixel_clock;
> > >
> > > if (entity->pads[0].flags & MEDIA_PAD_FL_SINK)
> > >     return -E_NOT_A_CAMERA_SENSOR_WE_IGNORE_THIS_ONE;
> > >
> > > pad =3D media_pad_remote_pad_first(&entity->pads[0]);
> > > if (!pad)
> > >    return -ENOENT;
> > >
> > > if (!is_media_entity_v4l2_subdev(pad->entity))
> > >    return -ENOENT;
> > >
> > > if (pad->entity->function !=3D MEDIA_ENT_F_CAM_SENSOR)
> > >    return -ENOENT;
> > >
> >
> > Hi Angelo,
> >
> > Thank you for the detailed explanation :)
> > However, I can't make it work because in my case, seninf is connected
> > to an external ISP
> > so pad->entity->function =3D=3D MEDIA_ENT_F_PROC_VIDEO_ISP.
> >
> > How can I get the pad corresponding to the sensor?
>
> You don't have to. You can drop that check, and get the link frequency
> of the source subdev with v4l2_get_link_freq(), whatever it is.
>
> > > cam_subdev =3D media_entity_to_v4l2_subdev(pad->entity);
> > > ctl =3D v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
> >
> > Is this mandatory to implement V4L2_CID_PIXEL_RATE ?
> > Should I return an error if not found?
>
> Does SENINF need to know both the pixel rate and link frequency ?
> V4L2_CID_PIXEL_RATE is very ill-defined, at the moment it only makes
> sense as a value relative to the sensor pixel array, and doesn't really
> apply further down in the pipeline. What information do you need to
> program the SENINF ?
>

Hi Laurent,

I need to know the clock divider for the sensor

Cheers
Julien

> > > /* multiplier is usually bits per pixel, divider is usually num of la=
nes */
> > > link_frequency =3D v4l2_get_link_freq(cam_subdev->ctrl_handler, multi=
plier, divider);
> > > pixel_clock =3D v4l2_ctrl_g_ctrl_int64(ctl);
> >
> > How to know the sensor clock given link_frequency and pixel_clock?
> > Can you point me to drivers doing something similar?
> >
> > >
> > > ....now you know what the sensor wants, set the seninf sensor clock a=
ccordingly.
> > >
> > > Cheers
> > > Angelo
> > >
> > [...]
>
> --
> Regards,
>
> Laurent Pinchart

