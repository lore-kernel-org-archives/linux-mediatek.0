Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F64C761A6
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 07:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1SfDNd+VrFwNjaXfizqk9NcTy81e6CW019Ll/yqoek=; b=OTAeM12p0xhM4BAdI2gYkRR8nV
	Rg+1xidO+Hv3GkjkL2OxGoxhTUkpFJRIB/yNP5cY3MgjLm1cTjpV3KfRETXgH2bAo13KepaBKtiaw
	ovK5hsrPjux8KODojfFwic75nkyx9nD1IOKBImvvuign/DwAcHB+SBQ8ESNSN6t9V9spVvGf7gfWx
	0JZlsGMtG8wxbVJWKHIfbUC2crR1+vxxy3xeAlrZSY2lFOgGTdksD11XIkp1S7LhE+iEKkBhF6Xo+
	9XduiJe2+xJG447HzfM8rVTlwR4L39a6T2CH6HVsq1itkzWC1bw4zfOuHR4rTdR1G+BdovhFkc2Or
	iBUM6u0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjEMe-00ELJn-37;
	Mon, 03 Apr 2023 07:12:28 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjEMb-00ELHv-16;
	Mon, 03 Apr 2023 07:12:26 +0000
Received: by mail-oi1-x22b.google.com with SMTP id l18so20976516oic.13;
        Mon, 03 Apr 2023 00:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680505940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1SfDNd+VrFwNjaXfizqk9NcTy81e6CW019Ll/yqoek=;
        b=I0SU7OovSTU8vdPUMuMFHukYDjMWTGVJNKgkDgIZUqr7l8Cs1IUs95+Aos8M2VjWuf
         9xF2wgRZgbebJaItTe1zpLP0lNjz+K+1v3sZ/QesigYDZIBeJtvY2iAfIMgm2MJGyu0r
         +vn2KEykuWroOtsIkqN2d/o0fH8vkNc/dwX5aXgp86Hbw2WySCfeUOxO5sZGgVB7dkzU
         xS7g087xANtTyUhNiNYvKyM9WiyXvkWdInzKImt1f1JMQvwbnVVYb+CHtPvuTik4etwc
         6SeqXzJkzzH8+2zREa3/P72jXQsKrFwmU8PH80Oraz/P77iNA1Idnf5d2rm8RsZf7X5m
         422Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680505940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1SfDNd+VrFwNjaXfizqk9NcTy81e6CW019Ll/yqoek=;
        b=AxLKglzlwFz2IVNt6zcM5TGx8WR71B2p6emU5OCHzIje3mLZQfD/gNE4/X+pgRhK5w
         2sGLvgqzI8cnjlJJ0lzIYmU+yGs8G/FeddNfgGYJSB8bW/2TKzSOBzhFZqszz2AsYY9t
         b8cR1qKaTmLUZ4o3PzBWbJW35c87Lcv4WMNzMS5sYMtj93VWM69eBBE1Ai6XJWJMSwZv
         RMMZ0btXXRDkNJgspGJko4uUtvmRQKtBxrq/F86+4i/SuxxlduUerQTLeU54nkEDfjo7
         KrtsyBCY9AcE8RHWxQBlg7ik3O6jm+vs7vhN8I7QAIJftqyl6pC/SY1iDmjar5j5dGJy
         Mx8g==
X-Gm-Message-State: AAQBX9ePa/kaMUPCR0y4wrMTOXy9ETCo89oYAqeGGXzK+KUVeeylWDM+
	u6KSo0YkW2G+7opuPo3UP/QOQLpI3UCRi2egMyDj1YcP7nc=
X-Google-Smtp-Source: AKy350bEOx3+kI4bEFAmguRgGFpajFzMK1Xxy0w5PuU9zZohvNOMzY/4FC5QxTzdPtZiZxS5+G3G3MA6I0lkeSLVGUA=
X-Received: by 2002:a05:6808:3c8:b0:389:6b0e:9d94 with SMTP id
 o8-20020a05680803c800b003896b0e9d94mr4563991oie.0.1680505940475; Mon, 03 Apr
 2023 00:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <202303231145121987818@zte.com.cn> <CAMhs-H_-kQ0FGP3L1xJ=ec_xJ59a2OztMLLjEQmQfYFOEa4DfA@mail.gmail.com>
 <2e4f27f0-a4ac-4523-8f90-695a62973bd0@kili.mountain>
In-Reply-To: <2e4f27f0-a4ac-4523-8f90-695a62973bd0@kili.mountain>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 3 Apr 2023 09:12:08 +0200
Message-ID: <CAMhs-H8beY3AO83NkTM2_YYdcsqtv7Em01zqSE6wtPNdex8Dpw@mail.gmail.com>
Subject: Re: [PATCH] PCI: mt7621: Use dev_err_probe()
To: Dan Carpenter <error27@gmail.com>
Cc: ye.xingchen@zte.com.cn, lpieralisi@kernel.org, kw@linux.com, 
	robh@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_001225_377933_351678D5 
X-CRM114-Status: GOOD (  27.55  )
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

On Mon, Apr 3, 2023 at 6:50=E2=80=AFAM Dan Carpenter <error27@gmail.com> wr=
ote:
>
> On Thu, Mar 23, 2023 at 07:23:26AM +0100, Sergio Paracuellos wrote:
> > Hi,
> >
> > On Thu, Mar 23, 2023 at 4:45=E2=80=AFAM <ye.xingchen@zte.com.cn> wrote:
> > >
> > > From: Ye Xingchen <ye.xingchen@zte.com.cn>
> > >
> > > Replace the open-code with dev_err_probe() to simplify the code.
> > >
> > > Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
> > > ---
> > >  drivers/pci/controller/pcie-mt7621.c | 7 +++----
> > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/contr=
oller/pcie-mt7621.c
> > > index 63a5f4463a9f..964de0e8c6a0 100644
> > > --- a/drivers/pci/controller/pcie-mt7621.c
> > > +++ b/drivers/pci/controller/pcie-mt7621.c
> > > @@ -220,10 +220,9 @@ static int mt7621_pcie_parse_port(struct mt7621_=
pcie *pcie,
> > >         }
> > >
> > >         port->pcie_rst =3D of_reset_control_get_exclusive(node, NULL)=
;
> > > -       if (PTR_ERR(port->pcie_rst) =3D=3D -EPROBE_DEFER) {
>
> So the theory here is that -EPROBE_DEFER is recoverable but other errors
> are not so we just ignore them?  Error pointers will trigger a WARN() in
> mt7621_control_assert/deassert().
>
>
> > > --
> > > 2.25.1
> >
> > Also, this is not a probe(), so I don't see a point of using
> > dev_err_probe() here.
>
> It's a weird thing to return -EPROBE_DEFER from something which is not
> a probe function...  Someone told me I should write a Smatch check for
> it but I never got around to doing that.

I don't remember clearly why this was returned in the first instance.
I think I just took the idea from pcie-mediatek driver for arm64 SoCs
platforms here:

https://elixir.bootlin.com/linux/v6.3-rc5/source/drivers/pci/controller/pci=
e-mediatek.c#L967

Thanks,
    Sergio Paracuellos
>
> In this case, I guess the user is supposed to see the error message and
> manually fix the probe order?  The dev_err_probe() will change the error
> message into a debug message so the user will not see it and will not be
> able to fix it.  So using dev_err_probe() will break things for the
> user.
>
> regards,
> dan carpenter
>

