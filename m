Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36A3C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 12:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xw9owQO3ke8d+y01UUou/ic5P0UC0KrCWnrceDha0Ug=; b=VmLobhlKFzVXsAuEZCCHj8hEsa
	GhToQd36JxM3SaXPMPIDE3K62+xWwH2zf8KvzYzBiRyAEwip+cnqjA2AP1t4eqCVQGPS76rrnNtqq
	qJbpAb4YT54kzn1wLBsFDh+8QeMXYuUrML1vUQrUzegbh/bah62MPGWVntA1vJrAxtBm+3ank9JiA
	ygS+OaOArFDiBNVLiUstMj4uh0HhvZsyIs8un5VCDUJMLZU/+0JnKvpr6tglf9E4/5Y0nn1XjCf1K
	t6bKGoR/lPh97C3HzXVLzfT8NSrFw/vscjtfZSC/v7XNaERE9KrKFMACFEFNCSvRwOdB3KwNBM3z4
	yohXjqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYPmj-0000000BIUg-0zr8;
	Mon, 29 Jul 2024 12:47:29 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYPm0-0000000BIGD-3VSa
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jul 2024 12:46:46 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5a2a90243c9so4420132a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jul 2024 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722257202; x=1722862002; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xw9owQO3ke8d+y01UUou/ic5P0UC0KrCWnrceDha0Ug=;
        b=3JhX01iywZSADOp/rLWB4FzeZ0WowY22jKNFlh0SmCGMH3LpFu1OTCv2Nl6d0VH2Gk
         UqMkDzDXVRYl2OdOpEo7fGitmpKmiQof4R/Pgl30Z15wF//X4qpuFjOsaq/iq+lEUm3U
         ZdJfs98U/kzjJmxkMGj50dsKdF754nYPDyuEKViTYeNXfLHtvkoDj5kw1KrKqyZzpHst
         f7+WVC/i9DYxNG3kzbqy9nEJbwkEeONaf+UjYtSs7Ux1WkvAF24RE6AWSZd36HjzspTh
         GmBTJnCIhaF1w8RZCf2VR9C3zXEcLC13mMpYk3YpK9hIBeLyzz9b8pNYc3fxQ9VllGqd
         AW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722257202; x=1722862002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xw9owQO3ke8d+y01UUou/ic5P0UC0KrCWnrceDha0Ug=;
        b=FwLHNsIMR7hOrNEPTibYDUFOvUP4qiXRF6qoA+3oA8DSvZFgUXL/Rb5hFgoG41sSLr
         PExjHewTsMcPgRGxCJI9Lu6+K+dxA69vPRUWDmu5gPNQHUggsF30LbjMAyHdBMlQD+CQ
         It0lYVpjhWSfIXOvv9g9/QqeHhIovcTgUmC2e6fCubv0DQf2Li7/cTDxld481YnEv/Cm
         wp3pUBvsfGgrM93LptjJNy5RgoHnqs5LJvuBorJAMkbI9qyOxBLCrySsy5dYpqUztSnO
         t/2grsV/JCuz44HQiDfQk7vpBiV/oJqm2tPquAK1nfVPjHf5AsDNi7GSjXXDA+TihI74
         QmDA==
X-Forwarded-Encrypted: i=1; AJvYcCWVu4vLI6MfSGlBtNJX9dxFitM51rTZTM8l3VXUJTH/kqrusGilEAuhH/oeHbGkNmXtTzrPdqa88VmOwTjQFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTGqW+w5FTTQYVRySXNeQjmbjckkGyi/UPYTEgRY/N895BwFmf
	LCfUPiElF1wBhUVoLiPE/v4qQOInmr+X5Zxd03jfsiGHjUHRmCfJSwxhPcHQEqHs+LyXHzzzpGG
	sXtGSRJYWfeFwjRCr1mEfe+nb7KeYZ3eaIC/feg==
X-Google-Smtp-Source: AGHT+IHinY1JfNv/mvpMM5Yfya33RSJgmSSwyZAu9jSx+bnpuWuKGvwHZZBD/MV0VUfT3CqvD4NAwzRkoPIdWhAyZ+w=
X-Received: by 2002:a17:907:2d86:b0:a77:b0a4:7d88 with SMTP id
 a640c23a62f3a-a7d3fdb79e8mr659217566b.10.1722257202254; Mon, 29 Jul 2024
 05:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
 <20240704-add-mtk-isp-3-0-support-v5-3-bfccccc5ec21@baylibre.com> <647738c5c776a9ec07615e67094c4141fdf051eb.camel@mediatek.com>
In-Reply-To: <647738c5c776a9ec07615e67094c4141fdf051eb.camel@mediatek.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 29 Jul 2024 14:46:29 +0200
Message-ID: <CAEHHSvYqT5-s57FijOf+SfLYF4znjaseazxiY-07jVHs09iK6Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, =?UTF-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	=?UTF-8?B?TG91aXMgS3VvICjpg63lvrflr6cp?= <louis.kuo@mediatek.com>, 
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_054644_974598_D59A914F 
X-CRM114-Status: GOOD (  24.68  )
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

Le jeu. 18 juil. 2024 =C3=A0 04:44, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck=
.hu@mediatek.com> a =C3=A9crit :
>
> Hi, Julien:
>
> On Thu, 2024-07-04 at 15:36 +0200, Julien Stephan wrote:
> >
> > External email : Please do not click links or open attachments until yo=
u have verified the sender or the content.
> >  From: Louis Kuo <louis.kuo@mediatek.com>
> >
> > This will add the mediatek ISP3.0 seninf (sensor interface) driver foun=
d
> > on several Mediatek SoCs such as the mt8365.
> >
> > Then seninf module has 4 physical CSI-2 inputs. Depending on the soc th=
ey
> > may not be all connected.
> >
> > Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
>
> [snip]
>
> > +static const struct mtk_seninf_conf seninf_8365_conf =3D {
> > +.model =3D "mtk-camsys-3.0",
> > +.nb_inputs =3D 4,
> > +.nb_muxes =3D 6,
> > +.nb_outputs =3D 4,
> > +};
> > +
>
> I think you should directly define these value as symbols because now
> only support one SoC.
>
> #define MODEL     "mtk-camsys-3.0"
> #define INPUT_NR  4
> #define MUTEX_NR  6
> #define OUTPUT_NR 4
>
> Because we don't know which SoC would be upstream later, maybe the next
> SoC would be
>
> static const struct mtk_seninf_conf seninf_83xx_conf =3D {
>         .model =3D "mtk-camsys-3.0",
>         .nb_inputs =3D 4,
>         .nb_muxes =3D 6,
>         .nb_outputs =3D 4,
>         .support_xxx =3D true;
> };
>
> then model, nb_inputs, nb_muxes, and nb_outputs has no difference, so
> it's not necessary to define them as variable. So define them as
> constant now, and when next SoC upstream, then we know which one would
> be variable.
>

Hi CK,

Thank you for your feedback on this series.
We already discussed this in an early version of the series (see
https://lore.kernel.org/all/2dd412f0-86cb-3ae0-305d-0e8192b9128a@collabora.=
com/).
I also discussed with internal teams in Mediatek about the folder
architecture. If this is not a red flag for you, I 'll let it as is.

I will fix other comments you did and that I forgot to add in previous vers=
ions.

Cheers
Julien

> Regards,
> CK
>
>
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

