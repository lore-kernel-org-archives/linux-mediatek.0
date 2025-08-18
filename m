Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1515CA0ED1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Aug 2025 05:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfsQWtM9zlBkMaLNEqnp5wSBhlrCP40LK6Q9xsKtZy4=; b=sdp1kCIluTxbarOdfGwdkAKf7m
	Ht7F457eJYYvh/a4+5mbF67BpDvZTatwVri/Z5obVgEijuGKXR+mu8vZuO97Q+gtlhcV+PDys2dn3
	qJyLY3HkbgEP11vENzRVflaieS2p1KZWUgxCaqRnNAwmVVrPYgQ4qlmz1qg9oxpN+Jdd5bG8z9w4c
	PSnPtIe1kELnoFfY5Ve/qo9IoXpSl7lsqT0qvPI6q4CJ/nVn+I7VtOirrgq/Qz9JtZOTnmilvSq0T
	Qj2ViyKDNzvAs/Sd/6013ob1Cqji4288PXhfykGOOR75pDslogMrYoEnox0igsxG/EdlYcoYjyQ4q
	UGFHFbQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unsHB-00000006XfO-1NQZ;
	Mon, 18 Aug 2025 05:19:21 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrha-00000006UFM-0AFp
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Aug 2025 04:42:35 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-74381fdbdbeso2024542a34.2
        for <linux-mediatek@lists.infradead.org>; Sun, 17 Aug 2025 21:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755492152; x=1756096952; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfsQWtM9zlBkMaLNEqnp5wSBhlrCP40LK6Q9xsKtZy4=;
        b=ZjpbmSItgaqULnwzYwvfhTZG9uvxMMElglzTDy0ZBU5vPOCAvSn3WFp8ksM75UVoJX
         5WWnMcrCaYq+tCC7c5VVjOFPPGS8DbOn7wj39qwsmiBXgaNeNa8II1lpWD4mE8Bcdm+R
         yWVeXaOgzJJhtr34ve6FzTrB9R86SQy8VY768=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755492152; x=1756096952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfsQWtM9zlBkMaLNEqnp5wSBhlrCP40LK6Q9xsKtZy4=;
        b=KRvn2c/Udfi84CgXCII/nPsujh4LNoA4LAeGrcTCvCTd/AgfyTq3lzZlLeOUcNiBTA
         4TBvdsLNQtxsIprtmMNWbWZ0HsVjgmZznEFbers1VNUxQZZJ3ck1VKpxRiXHD7RLZWTr
         Frp/0+1AiDFdloAoGc1gN9uoN24z3B1aAzc1Lroc6JkQo3mQd8TE32tqwPPVWQnoE3/z
         nlw7v0Z5nDuF7PadayL2nwz7UwtUTat46P/ccdEut2FY3y3pqO3QR7YMzRkBc/uP8IXg
         qczJUngX0DSrowERoTVbjn3PIBrdf4sNulePIx9Ticb1htQKtfTZ0AAB0hlwWbR+p2Y2
         icrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZt1znjCVtkMJ8y1efH8R8NlE/HKiwPAhpesYlm72Hkw+0gGPEApdTAgnkkVK10uzRH0i/lM3LDd7xqqv4CA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoB9WjokX22yoZM5+GBUnwmjrwqoar8/Ckpu+uDfSSJHHJ9gpa
	aufVrnsE0VlqdyU4z6QX89+hvlZRaTM85XMg+6xSaBJ4uI2loWFH5cN18iEEGxHcPhOD64fZIxL
	VgrAhp44SUgpmXRl2hz7vrkxsbLZc5yls+kDLPmnq
X-Gm-Gg: ASbGncutU6jVZTGNaeLb5vePxF0GLKBHf/9jgPS3jE+TpXhp4TIrJQ8mUAhlgKZ++zE
	nqtWFmyBnDBdE5B7/RCr+UHL+Ueivi6nWSf1HPLoNDJGQUQlqtiQoWx+ms+AGqrvLW3f8x3aIbh
	fw8sEcsGMvHrvChsiB96sszCYyZPXVwrGveTovhiJfeUVZgQ0u6wCjX9+z7c2ozEBRIsN+oqWQQ
	THvgolgDr+8Bl7GO3q+XujpEYD4TvfR/V8=
X-Google-Smtp-Source: AGHT+IF/RhLz2fIw1VbTnK6kOfNHtaBYI/Gt5l9e8XL0REmA8tvh4RTpWjRQOCaWMMFqwIexvepYVZNLyvLCWG85f6w=
X-Received: by 2002:a05:6830:3148:b0:727:3439:5bdf with SMTP id
 46e09a7af769-7439bab7241mr4262682a34.13.1755492152672; Sun, 17 Aug 2025
 21:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <c8a64686-f1a2-44f1-9d13-fd5b4f923e0f@molgen.mpg.de> <CAAOTY_8vLqU30L3+ijYJPLrioRsUwVwJAeumtVYfRJ9e5tjp4A@mail.gmail.com>
In-Reply-To: <CAAOTY_8vLqU30L3+ijYJPLrioRsUwVwJAeumtVYfRJ9e5tjp4A@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 18 Aug 2025 12:42:21 +0800
X-Gm-Features: Ac12FXz5rMxf27QySQIDZc7iDa9NZ942iMQjso7rsmfG9duoC6kvEJjFLzERuyU
Message-ID: <CAEXTbpd=-mB-n1EVb4Y7RDxkJ86b-HrFWyErgTE_FYoViZRdpw@mail.gmail.com>
Subject: Re: MT8183: Only maximum resolution 1280x720?
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_214234_096573_2470AD08 
X-CRM114-Status: GOOD (  22.36  )
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

Hi CK and Paul,

On Mon, Aug 18, 2025 at 12:39=E2=80=AFPM Chun-Kuang Hu <chunkuang.hu@kernel=
.org> wrote:
>
> Paul Menzel <pmenzel@molgen.mpg.de> =E6=96=BC 2025=E5=B9=B45=E6=9C=8825=
=E6=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=882:01=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >
> > Dear Linux folks,
> >
> >
> > On the older MT8183 device Lenovo IdeaPad Duet Chromebook, running
> > ChromeOS with their Linux 5.10.x, connecting a 1920x1080 Dell monitor t=
o
> > a USB-C adapter using HDMI, only the resolution of 1280x720 is
> > configured, although the adapter also support 1920x1080. It happens wit=
h
> > all adapters, for example, LMP USB-C mini Dock [1].
> >
> > I reported it to the Chromium OS issue tracker [1], and the last commen=
t is:
> >
> > > It seems the display pipeline for the internal display (DSI) has
> > > higher clock rate. Also, the resolution support depends on the
> > > refresh rate as well, so the claimed 2400x1080 might only work on
> > > lower refresh rate.
> > >
> > > For the external display, the display modes are mostly rejected by
> > > the pre-defined max_clock_khz in mtk_dpi.c:
> > > https://elixir.bootlin.com/linux/v6.11.4/source/drivers/gpu/drm/media=
tek/mtk_dpi.c#L940
> >
> > Can you confirm this? The font rendering seems not so good in the lower
> > resolution, and strangely, playing movies these seem to be rendered in
> > higher resolution (or the monitor or hardware does a good job in
> > up-scaling).
>
> 8183 max_clock_khz is defined in patch [3] by Rex, but this is a
> prepare patch for mt8192 [4].
> I'm not sure that Rex has test it for mt8183.
> Maybe you could try to enlarge 8183 max_clock_khz and see.

I found the internal discussion about this (back in 2018), and the
owner had confirmed MT8183 DPI only supports up to 100Mhz. They also
clearly stated that 1080p@60 is not supported by MT8183.
>
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/drivers/gpu/drm/mediatek/mtk_dpi.c?h=3Dv6.17-rc1&id=3D44b07120291c4b7a=
6722ccb7149f6b9d938cf5a2
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/drivers/gpu/drm/mediatek/mtk_dpi.c?h=3Dv6.17-rc1&id=3D38eaef2dca4ec8df=
b9ea84d9dde0f76da5c8caaa
>
> Regards,
> CK
>
> >
> >
> > Kind regards,
> >
> > Paul
> >
> >
> > [1]: https://lmp-adapter.com/product/lmp-usb-c-mini-dock/
> > [2]: https://issuetracker.google.com/issues/295666708

Regards,
Pin-yen

