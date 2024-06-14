Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB02CC27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 14:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdyE64ITlsEjDYdjWbst/sH7Q92347D+3IPnUE30Q5I=; b=VtUv5ql/QoPyLzrSZPFwMNVV8X
	ZsX70Lmt+rQQwlTV6S1PPN6ZgauPDpwVVNCbkaH5jwSv5dUkAkC1hnNSHcDTYPP9RxWSFKcCQZ2k4
	EHKeuwTGB4RCgsOnUrTrpeApi5Gs7Y12HCMsHVVWeX6t6jAewzgK5Qrt+i0N+tOqcAhx3NwfcYrHS
	j1in9FDdF2V5C0wMvP4PGxcJmpSKNTamefyudhsuMKB91R5Qz6AjDJLjDT26cQPI2Tlbiu7JWMAV3
	fwpqWA2JxQwrTLSlQSq8wT9WBUXVPSCxjWJKGmh5xYKLQni/0PEfjwrTno5G2HpiEhZxHFCkeIeE2
	Dc0Qo/RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI8KX-0000000372x-0Svc;
	Fri, 14 Jun 2024 14:55:05 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI8KS-0000000371K-1Apo
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 14:55:02 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a6f0dc80ab9so368992966b.2
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 07:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718376898; x=1718981698; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdyE64ITlsEjDYdjWbst/sH7Q92347D+3IPnUE30Q5I=;
        b=pOgvvn5MmQ8GoRIjtjbWtBQgo+f7rXZib7hr3OVkpS1l2NFZy8sYaPF6VVtpgF5vjT
         LD+Gg/3+RopCyUWq4sH8ChS3Bq8EPRGlwzXp3wAFHm6uxdExcG5zyBrS4Nzg/UY0M63Z
         leP4iwiMJsOsAia7GABj+L18mtE9VZVkcOqLPqHD9vsEEu4X/oe9kbf0UMb0XmQX9oy7
         ResZZGvixr4gbK0qy0j0Ss+Z+BiS/rvIUVzHe18G1QocAcv6L6jocjdTVgpDY66Igp8x
         cCBj7CRH7tfj0tXNcv9m9v5M38rziUyRdCtHkuqnKUbSIgPb8HejHqZtIkkxH/7GLNxc
         gJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718376898; x=1718981698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdyE64ITlsEjDYdjWbst/sH7Q92347D+3IPnUE30Q5I=;
        b=AHmRLOEUFf9ZyefX3DNo5jKH6DLjcXOLNs0Ha81kVjsuC/MY947NsV0QIdAFBqzP9o
         nr7wmnCRkTYJcsSL4njrXNxJS3yJkZRB/O2BZwc18vFFn1iX9tWHKgeGX33AFX1jtsXc
         0cMdu93jqcV5C+7aAyxwEfcKcVsw/YSXmvPTQUbJn/kT835TOGZPfF0A/SQMbtO5uPYq
         EVFu5CL8Jg5nPjeWgK6vNSlrtpRly9yAvA1nYqhNabre/3wchARhk4OhlvR02b180scA
         BKhOLi39whMFqg+rI5aVklK2xKsUfO9x/zEPKDBxKvBTYKCqpVmnOiSJWPftG3RhbQ6a
         MrzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbbjwwuBPhbNR9aIRy8yCPCxCLNnqXy+vboKmOxJX/zmdrKrKoupMUy3dnFqLbHMekztGjBHPOwdRcO6b2Z03r6GJpZhfVNmuna8J2pZCIpp2m
X-Gm-Message-State: AOJu0YzhlZUAAe7VD2sNYhVfHoWsRw6Ki+KC1Aw7hB76N0wwWY1t9/Oa
	MXyV6cTBlk2PlbY/MLoXtZwfh1rkWbSuJ8G8Jk8dhk9F86nhfvtnvUn5tiOHuzdMz9AZuawhmYJ
	sxSXZ+FMp47pHmYFMw5RACOXqOp/S2dJS+fVnxGafFGs+SFbi
X-Google-Smtp-Source: AGHT+IFVQaFnc4sfLJ78hdBU5GqD7d5dF9LIJLkwZUP4nd0PeFSLQwba1QbMbPKaH5pBbY4kR1qCtQocrfy0T/ty0cM=
X-Received: by 2002:a17:907:d312:b0:a6f:668b:3434 with SMTP id
 a640c23a62f3a-a6f668b35f7mr185814266b.31.1718376898096; Fri, 14 Jun 2024
 07:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-4-jstephan@baylibre.com> <3c2bee40-3792-409c-b42f-f8b013ff641c@collabora.com>
 <CAEHHSvaT_U+HNzWQUoK9EuqGuqEd11+Lu0CLz_rL7uQf0Q5isw@mail.gmail.com>
 <53838e76-bfa4-41f5-a015-a37472e98991@collabora.com> <CAEHHSvaRqZM9c8oD05WKkhOHdjKLBkR6tXp2Q1b8OMiDxDsDhQ@mail.gmail.com>
 <20240614123345.GN6019@pendragon.ideasonboard.com> <CAEHHSvaWO7m=n5_f0BM7gwuDMfh_GMX=x3DknG28PnmtZbrGQw@mail.gmail.com>
 <20240614144248.GA20136@pendragon.ideasonboard.com>
In-Reply-To: <20240614144248.GA20136@pendragon.ideasonboard.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 14 Jun 2024 16:54:47 +0200
Message-ID: <CAEHHSvZPATFV=w451KaaT+e__EK9u3Vc5ORPRQ-Gfa4rJ_o8hA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240614_075500_645070_34A82597 
X-CRM114-Status: GOOD (  43.02  )
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

Le ven. 14 juin 2024 =C3=A0 16:43, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> a =C3=A9crit :
>
> Hi Julien,
>
> On Fri, Jun 14, 2024 at 04:14:52PM +0200, Julien Stephan wrote:
> > Le ven. 14 juin 2024 =C3=A0 14:34, Laurent Pinchart a =C3=A9crit :
> > > On Fri, Jun 14, 2024 at 12:38:15PM +0200, Julien Stephan wrote:
> > > > Le mer. 12 juin 2024 =C3=A0 10:06, AngeloGioacchino Del Regno a =C3=
=A9crit :
> > > > >
> > > > > Il 10/06/24 16:39, Julien Stephan ha scritto:
> > > > [...]
> > > > > >>
> > > > > >>> +     writel(0x10001, input->base + SENINF_TG1_SEN_CK);
> > > > > >>
> > > > > >> Unroll this one... this is the TG1 sensor clock divider.
> > > > > >>
> > > > > >> CLKFL GENMASK(5, 0)
> > > > > >> CLKRS GENMASK(13, 8)
> > > > > >> CLKCNT GENMASK(21,16)
> > > > > >>
> > > > > >> Like this, I don't get what you're trying to set, because you'=
re using a fixed
> > > > > >> sensor clock rate, meaning that only a handful of camera senso=
rs will be usable.
> > > > > >>
> > > > > >> Is this 8Mhz? 16? 24? what? :-)
> > > > > >>
> > > > > >> Two hints:
> > > > > >>    - sensor_clk =3D clk_get_rate(isp_clk) / (tg1_sen_ck_clkcnt=
 + 1);
> > > > > >>    - int mtk_seninf_set_sensor_clk(u8 rate_mhz);
> > > > > >>
> > > > > >> Please :-)
> > > > > >
> > > > > > Hi Angelo,
> > > > > >
> > > > > > I think I get your point about not hardcoding the sensor rate, =
but I
> > > > > > am not sure how to use
> > > > > > a mtk_seninf_set_sensor_clk(u8 rate_mhz); function.
> > > > > >
> > > > > > Where would it be called? How is it exposed to the user?
> > > > > >
> > > > >
> > > > > As for where: setup, streaming start, resolution change (which ma=
y be covered
> > > > > by streaming start anyway, as a change should be calling stop->st=
art anyway).
> > > > >
> > > > > And for the how is it exposed to the user - well, depends what yo=
u mean for user,
> > > > > but it's all standard V4L2 API :-)
> > > > >
> > > > > Last but not least, I can give you another hint....
> > > > >
> > > > > struct media_entity *entity =3D (something_here);
> > > > > struct media_pad *mpad;
> > > > > struct v4l2_subdev *cam_subdev;
> > > > > struct v4l2_ctrl *ctl;
> > > > > s64 link_frequency, pixel_clock;
> > > > >
> > > > > if (entity->pads[0].flags & MEDIA_PAD_FL_SINK)
> > > > >     return -E_NOT_A_CAMERA_SENSOR_WE_IGNORE_THIS_ONE;
> > > > >
> > > > > pad =3D media_pad_remote_pad_first(&entity->pads[0]);
> > > > > if (!pad)
> > > > >    return -ENOENT;
> > > > >
> > > > > if (!is_media_entity_v4l2_subdev(pad->entity))
> > > > >    return -ENOENT;
> > > > >
> > > > > if (pad->entity->function !=3D MEDIA_ENT_F_CAM_SENSOR)
> > > > >    return -ENOENT;
> > > > >
> > > >
> > > > Hi Angelo,
> > > >
> > > > Thank you for the detailed explanation :)
> > > > However, I can't make it work because in my case, seninf is connect=
ed
> > > > to an external ISP
> > > > so pad->entity->function =3D=3D MEDIA_ENT_F_PROC_VIDEO_ISP.
> > > >
> > > > How can I get the pad corresponding to the sensor?
> > >
> > > You don't have to. You can drop that check, and get the link frequenc=
y
> > > of the source subdev with v4l2_get_link_freq(), whatever it is.
> > >
> > > > > cam_subdev =3D media_entity_to_v4l2_subdev(pad->entity);
> > > > > ctl =3D v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_PIXEL_RATE)=
;
> > > >
> > > > Is this mandatory to implement V4L2_CID_PIXEL_RATE ?
> > > > Should I return an error if not found?
> > >
> > > Does SENINF need to know both the pixel rate and link frequency ?
> > > V4L2_CID_PIXEL_RATE is very ill-defined, at the moment it only makes
> > > sense as a value relative to the sensor pixel array, and doesn't real=
ly
> > > apply further down in the pipeline. What information do you need to
> > > program the SENINF ?
> >
> > Hi Laurent,
> >
> > I need to know the clock divider for the sensor
>
> Could you provide some details on how the SENINF uses that divisor ?
> What does it control, and what are the constraints ?
>

According to the datasheet,  SENINF_TG1_SEN_CK[21:16] :CLKCNT : Sensor
master clock will be ISP_clock/(CLKCNT+1) where CLKCNT >=3D 1

> > > > > /* multiplier is usually bits per pixel, divider is usually num o=
f lanes */
> > > > > link_frequency =3D v4l2_get_link_freq(cam_subdev->ctrl_handler, m=
ultiplier, divider);
> > > > > pixel_clock =3D v4l2_ctrl_g_ctrl_int64(ctl);
> > > >
> > > > How to know the sensor clock given link_frequency and pixel_clock?
> > > > Can you point me to drivers doing something similar?
> > > >
> > > > >
> > > > > ....now you know what the sensor wants, set the seninf sensor clo=
ck accordingly.
> > > > >
> > > > > Cheers
> > > > > Angelo
> > > > >
> > > > [...]
>
> --
> Regards,
>
> Laurent Pinchart

