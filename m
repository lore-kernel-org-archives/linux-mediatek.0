Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A24ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 14:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OORxkzxhRiVQmefWxx+m4EW6qDQg+UZlwTx4gGuL6fw=; b=3cGoq2AfPRtgY7PPiHimOuPVZn
	6kw2FdbsBwyfeIUeNGb5NUwfg4HF3F7IB1z5haij11Zy5gpFfBs6ROaGful0dvyZapm43cs+/qzsa
	u3RzbRZM4f59hKimOiKpw62gGPSiHAj/mSdOesfNf6SegZ7RdGONamhXyA3jSkSydVZp/3Ghwj3iZ
	jH4c4+VuXElaKut3dgUkQbI2Qa8UVCyISfKlIWTgfR4fDMdn1eMrVvrlRc4f5Ts2dsocGCGqmIaim
	prUqz95uIuT2ap6E9z1NLzIZG+UNzz8RYhPbpowO2tlXHLfl7CPcg/Qt4NhhgxIUJlsUCO3ioVLJ7
	rZXVXWmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo3so-00Do34-6W; Thu, 27 Oct 2022 14:29:22 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo3sb-00DnzK-IA; Thu, 27 Oct 2022 14:29:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id y16so2447087wrt.12;
        Thu, 27 Oct 2022 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OORxkzxhRiVQmefWxx+m4EW6qDQg+UZlwTx4gGuL6fw=;
        b=Gt0hsXy6IhM2Xz0cAy2sjDP+ep236BBJmDfYxoU/L7NmYRMzmrVfTGk9k9rg7DzUZe
         5OKZfZC/Qp29fi9lOanXpwri3qHpEX3NoMPYsyJxWGt1Oxu0Mijugabh2dikNHmgg31H
         mftu9bhfPodB+rmzOe+K8r/blOOo6pSkS8vOSty7OWEKRxgXZV+16TGTsZJqE6hQH4CS
         nLdkCzxYZcDJ19j+kdx3Cmey8Qav+vqN4V6NNihCKyuVSOoA94arzK2CqZVntzKNoQWO
         R6ammiHS+W3a9DUA1F16QklQfjvO3Sky+psFPJ3Ow4f+0qpAVQLOM1t7YSxfNDT/rTDN
         +fkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OORxkzxhRiVQmefWxx+m4EW6qDQg+UZlwTx4gGuL6fw=;
        b=Y8MDdvziiIJ/xhiIarQ1k1K8JqpCRuglrq/MepvpOpY0Qtg7r2OWvK5biEyQeQeopj
         3PAn10kTAVHs0a/EPXEhvd/Fv8FmovdpdfohjgPsgQS5BnT2GFLxjFFY4fBZDiG1LEN9
         9Pin6VP/FYiw++mlRb8TVYcjGYznl60NNDUaUknEQWNIqdzY6CFlk2ZowFMxGfQNTB2z
         69eXWVWToSjtagGASDuMIprfcs09XmlnB28AmLou10I9Wy/VlauQc2m51+cu+3oTCxeE
         N3es2AZ2WhJmMKhxgN2dNcCuGDYXB/j+WV0o9aKm4WIl2uuwQlI4SCAezBtsYwgy9mmF
         DggA==
X-Gm-Message-State: ACrzQf11C7/HwIw/w+42vQBFjVKZOy9zrjuetGFOngJmB0D+k0t7LKI+
	nzP0ClvmcPAhaHcx1ys/+X7W8dPs8KEyi02sHWY=
X-Google-Smtp-Source: AMsMyM4SLiiSPLbOG0e5gD9YKxgRMhvjNQlF8UG9tcl/GwkgO8DmNw1JoTOlvStoJz9H8B7i2QQVyA8WZmGhDa6Z7VQ=
X-Received: by 2002:a05:6000:2aa:b0:231:ac4f:196d with SMTP id
 l10-20020a05600002aa00b00231ac4f196dmr30922773wry.121.1666880946500; Thu, 27
 Oct 2022 07:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <Y1aCiReTZDbPp/rS@kadam> <20221026072444.GA24881@cyhuang-hp-elitebook-840-g3.rt>
 <Y1j058PsWYj0MQrC@kadam> <CADiBU39z_h=QLF-cGztz6Wq86+rMahVb7owHNt4RpvFPFYDs3w@mail.gmail.com>
 <CADiBU38JKzq9ngiaZWTse3eMdH_fTcUCdanea7uQAU7NxZrzZg@mail.gmail.com> <Y1qOwO11z0Wvcz6O@kadam>
In-Reply-To: <Y1qOwO11z0Wvcz6O@kadam>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Thu, 27 Oct 2022 22:28:54 +0800
Message-ID: <CADiBU39d4xykc3sXH8ZSM3pe-urbjqvcNf+k5BbORnzXMcpeng@mail.gmail.com>
Subject: Re: [PATCH resend] mfd: mt6370: add bounds checking to
 regmap_read/write functions
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lee Jones <lee@kernel.org>, ChiYuan Huang <cy_huang@richtek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_072909_642411_E184404E 
X-CRM114-Status: GOOD (  29.39  )
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

Dan Carpenter <dan.carpenter@oracle.com> =E6=96=BC 2022=E5=B9=B410=E6=9C=88=
27=E6=97=A5 =E9=80=B1=E5=9B=9B =E6=99=9A=E4=B8=8A9:59=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> On Thu, Oct 27, 2022 at 09:59:46AM +0800, ChiYuan Huang wrote:
> > ChiYuan Huang <u0084500@gmail.com> =E6=96=BC 2022=E5=B9=B410=E6=9C=8826=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:05=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > >
> > > Dan Carpenter <dan.carpenter@oracle.com> =E6=96=BC 2022=E5=B9=B410=E6=
=9C=8826=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:51=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > > >
> > > > On Wed, Oct 26, 2022 at 03:24:48PM +0800, ChiYuan Huang wrote:
> > > > > 2) normal register access with negative length
> > > > > Unable to handle kernel paging request at virtual address ffffffc=
009cefff2
> > > > > pc : __memcpy+0x1dc/0x260
> > > > > lr : _regmap_raw_write_impl+0x6d4/0x828
> > > > > Call trace:
> > > > >  __memcpy+0x1dc/0x260
> > > > >  _regmap_raw_write+0xb4/0x130a
> > > > >  regmap_raw_write+0x74/0xb0
> > > > >
> > > > >
> > > > > After applying the patch, the first case is cleared.
> > > > > But for the case 2, the root cause is not the mt6370_regmap_write=
() size
> > > > > check. It's in __memcpy() before mt6370_regmap_write().
> > > > >
> > > > > I'm wondering 'is it reasonable to give the negative value as the=
 size?'
> > > > >
> > > >
> > > > Thanks for testing!
> > > >
> > > > I'm not sure I understand exactly which code you're talking about.
> > > > Could you just create a diff with the check for negative just so I =
can
> > > > understand where the issue is?  We can re-work it into a proper pat=
ch
> > > > from there.
> > > >
> > > Here.
> > > https://elixir.bootlin.com/linux/v6.1-rc2/source/drivers/base/regmap/=
regmap.c#L1860
> > >
> > > From my experiment, I try to access 0x00 reg for size (-1).
> > > Testing code is like as below
> > > regmap_raw_write(regmap, 0, &val, -1);
> > >
> > > That's why I think if the size check is needed, it may put into
> > > regmap_raw_write() like as regmap_raw_read().
> > >
> > It seems c99 already  said size_t is an unsigned integer type.
> > My experiment for (-1) size is not reasonable.
> > (-1) means it will be converted as the UINT_MAX or ULONG_MAX.
> > This will cause any unknown error like as memory violation or stack
> > protection,...etc.
> >
> > let's check whether the negative size is reasonable or not.
> > If this case dost not exist, to keep the boundary check is enough.
>
> I thought you were testing this from user space but it sounds like
> you're doing a unit test?
>
Yes, with the device attribute to test regmap_raw_read() and regmap_raw_wri=
te().
I think It should be the same as the usage in kernel space.
> regards,
> dan carpenter
>

