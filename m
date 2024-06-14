Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBA9C27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 10:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lEx+5wwN9fBLZNltFTgu34oXR2RNqSzay2NOoaIOLs=; b=y4v0WCVYlAcu1J3MfVXihpdE6c
	IFFwxMPpM63d7lNLBOiIAC4a3PvimU9LtWsu4yVI+g7LhxmWcWCd0amfoJsnQ/JcVO+LnY+pJQFXK
	NZYdDRYMubWoP72dATg2imW5H4vLCQMOFVQUBixfd5AfK3EVlVsuSJnh3Xod0hvE0zDjw78IsdLTj
	6EvTxO4Cx8/7TDyFceBn3+ys6OFi6nW69MO0EoDvuTcBAIxAWZIgnxPtO6c9TaeOCSQSmSVfLaRV3
	hjYLFqJkei6rQSGSr97EW6g0viEd+ylzddtFCqA7zhAxUjREQLLa8gGQxS/tDR5/piOUbQD2xCP7v
	uQhQFwAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI4KI-00000002Tjm-3pXh;
	Fri, 14 Jun 2024 10:38:34 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI4KF-00000002TiT-0tdf
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 10:38:32 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-57a30dbdb7fso3004339a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 03:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718361508; x=1718966308; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lEx+5wwN9fBLZNltFTgu34oXR2RNqSzay2NOoaIOLs=;
        b=XkHD6NrbGMG4QAdU6MVlHEdt3MKlde/gwMXmqyILkE48GNvv1sKBVWLu/7+IrfuIWg
         OExCUd6oF+mBHbMHDazo8ajvswhkV4H1sfYd58FgwNG7YUi1Q0yiR8K5oKVYTEcvVjlw
         LwuJElepBrREOy0/TaTuJ2V481hDueK9D4j6LGjFRYZaSOu6ngyZdQFWwxDKFWtfM1lc
         B/gqrur1X0Rja0sFdW2Z0d9ZVAwjf2ISiXRaIR9HSKACwZTw0jvPemtIer3xxCwDqjwv
         uzeE9AaqkTEy9FOShRFos2CH/41I3/UaJ2p7Dthj+33NIaYDvuL+haKX2JnppUwtBzjW
         ifyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718361508; x=1718966308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lEx+5wwN9fBLZNltFTgu34oXR2RNqSzay2NOoaIOLs=;
        b=nK51S9z2/FUqiF7zG0HcF4t7oOihzhXSSBsjd7C4qTngvTB7G+iUXZfOKU5LpGbAQm
         lACmGe707Kr/2vUjjgvqrT3OLNSE6i01GQEXf2tGM8V6Cl0iqKkdnRg5N5mfWlZWTflE
         XetYw9aMbT64nw4ZQAxdPEnEI581u2mdGDixMnsVEA/MhqY3NinGBunnJFj5kQl9AMQs
         2uBUAMIDox175XPBouCNPfGU194qYyZ3DpFb8OPSef5cd3Qel1Ew9UuZHp69Q+8Em6zq
         1A4hjc7+UED+zi4ypAeRl9KHvgt5QIbH1Ir8COp8I5D5jT2vYDJLQVIBgdaT2/U42ru0
         ZyPg==
X-Forwarded-Encrypted: i=1; AJvYcCV/gThLZ6IzQs32PHFxPUIBgsBRUfGJ53uJVMjX0Gw/fDjcHDp383CDpTuXRIJzuyW1GUJfQB/mbufFu05OQOW3VA35pmqALSbLkjXL1hPQahVA
X-Gm-Message-State: AOJu0YyYXpf27moPaTbyc6C1eHGD+NY9sC6yQ0khm/vUq0bbMjj7LVl1
	gaQZsvWzcdjMnlbJilUnNsufcjl/Xi+IFhMaQ9hE5jl22Tn6LZWEXyrK0jobqMMIsLsgjYIoD1H
	eItgwfk0cMHclJUoNgAXGv1UctMUSqh8/Vlbtvg==
X-Google-Smtp-Source: AGHT+IG6jcyBZObUWctTNk2L0XtXOwkk2+zrzjA/HUVBoU8DzbjLvKPo6VWfCt3UnQlMuaZ2eeI5BtTF1vwgfTlOAfE=
X-Received: by 2002:a17:906:2709:b0:a6f:4ebd:31a3 with SMTP id
 a640c23a62f3a-a6f60cefe94mr178307866b.14.1718361507464; Fri, 14 Jun 2024
 03:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-4-jstephan@baylibre.com> <3c2bee40-3792-409c-b42f-f8b013ff641c@collabora.com>
 <CAEHHSvaT_U+HNzWQUoK9EuqGuqEd11+Lu0CLz_rL7uQf0Q5isw@mail.gmail.com> <53838e76-bfa4-41f5-a015-a37472e98991@collabora.com>
In-Reply-To: <53838e76-bfa4-41f5-a015-a37472e98991@collabora.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 14 Jun 2024 12:38:15 +0200
Message-ID: <CAEHHSvaRqZM9c8oD05WKkhOHdjKLBkR6tXp2Q1b8OMiDxDsDhQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>, 
	Florian Sylvestre <fsylvestre@baylibre.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andy Hsieh <andy.hsieh@mediatek.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-media@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Paul Elder <paul.elder@ideasonboard.com>, 
	Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_033831_282297_EA3E05CF 
X-CRM114-Status: GOOD (  26.51  )
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

Le mer. 12 juin 2024 =C3=A0 10:06, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> Il 10/06/24 16:39, Julien Stephan ha scritto:
[...]
> >>
> >>> +     writel(0x10001, input->base + SENINF_TG1_SEN_CK);
> >>
> >> Unroll this one... this is the TG1 sensor clock divider.
> >>
> >> CLKFL GENMASK(5, 0)
> >> CLKRS GENMASK(13, 8)
> >> CLKCNT GENMASK(21,16)
> >>
> >> Like this, I don't get what you're trying to set, because you're using=
 a fixed
> >> sensor clock rate, meaning that only a handful of camera sensors will =
be usable.
> >>
> >> Is this 8Mhz? 16? 24? what? :-)
> >>
> >> Two hints:
> >>    - sensor_clk =3D clk_get_rate(isp_clk) / (tg1_sen_ck_clkcnt + 1);
> >>    - int mtk_seninf_set_sensor_clk(u8 rate_mhz);
> >>
> >> Please :-)
> >
> > Hi Angelo,
> >
> > I think I get your point about not hardcoding the sensor rate, but I
> > am not sure how to use
> > a mtk_seninf_set_sensor_clk(u8 rate_mhz); function.
> >
> > Where would it be called? How is it exposed to the user?
> >
>
> As for where: setup, streaming start, resolution change (which may be cov=
ered
> by streaming start anyway, as a change should be calling stop->start anyw=
ay).
>
> And for the how is it exposed to the user - well, depends what you mean f=
or user,
> but it's all standard V4L2 API :-)
>
> Last but not least, I can give you another hint....
>
> struct media_entity *entity =3D (something_here);
> struct media_pad *mpad;
> struct v4l2_subdev *cam_subdev;
> struct v4l2_ctrl *ctl;
> s64 link_frequency, pixel_clock;
>
> if (entity->pads[0].flags & MEDIA_PAD_FL_SINK)
>     return -E_NOT_A_CAMERA_SENSOR_WE_IGNORE_THIS_ONE;
>
> pad =3D media_pad_remote_pad_first(&entity->pads[0]);
> if (!pad)
>    return -ENOENT;
>
> if (!is_media_entity_v4l2_subdev(pad->entity))
>    return -ENOENT;
>
> if (pad->entity->function !=3D MEDIA_ENT_F_CAM_SENSOR)
>    return -ENOENT;
>

Hi Angelo,

Thank you for the detailed explanation :)
However, I can't make it work because in my case, seninf is connected
to an external ISP
so pad->entity->function =3D=3D MEDIA_ENT_F_PROC_VIDEO_ISP.

How can I get the pad corresponding to the sensor?


> cam_subdev =3D media_entity_to_v4l2_subdev(pad->entity);
> ctl =3D v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
>

Is this mandatory to implement V4L2_CID_PIXEL_RATE ?
Should I return an error if not found?

> /* multiplier is usually bits per pixel, divider is usually num of lanes =
*/
> link_frequency =3D v4l2_get_link_freq(cam_subdev->ctrl_handler, multiplie=
r, divider);
> pixel_clock =3D v4l2_ctrl_g_ctrl_int64(ctl);
>

How to know the sensor clock given link_frequency and pixel_clock?
Can you point me to drivers doing something similar?

Cheers,
Julien
>
> ....now you know what the sensor wants, set the seninf sensor clock accor=
dingly.
>
> Cheers
> Angelo
>
[...]

Cheers
Julien

