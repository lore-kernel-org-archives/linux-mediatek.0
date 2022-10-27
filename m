Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA22C38A2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 02:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5QwCsBsQ9rxaiWZoCnkId+Sbas3jW64rpNqbI07GYs=; b=QLtJj6IYEPgC4I0OWEfjK44wL7
	upvXmjpH7tcjhaFrFgMPH3Y0XlP44JRa6ZMKycJ6IDzdHnb8vHW9aPHTioTkXkNk7RYxvvL/lcjrz
	PBYGpC5FrGcPuF0oSUk9QXiXNdbi9GTTTryn2QEoxUC5RW0SOSee6vA/1W5n3n7SDnZT2R8vBqbj/
	D19rbmkBxvt84PeUcb3J2KouoOc0kIpIHn83a7SAodqKbQcqFK92rTsKcrnD4mudBALTr1MGVv7fp
	O7RSemSWrAoUoTuCTUAMZpxGzduVFMB/fHFEFNNr78Z44f7UTSb3ToX+z1trhNi6lyoql3VJU3ysy
	8yVoiQRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onsBn-00BXsQ-7a; Thu, 27 Oct 2022 02:00:11 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onsBc-00BXqy-Jb; Thu, 27 Oct 2022 02:00:02 +0000
Received: by mail-wr1-x42c.google.com with SMTP id l14so22230962wrw.2;
        Wed, 26 Oct 2022 18:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5QwCsBsQ9rxaiWZoCnkId+Sbas3jW64rpNqbI07GYs=;
        b=R/A2YVA1zZ+iOJAicaFSBvejxTm9ZbiCzqf2f765kMJtxBG5OtP4I+LCQwrwDU2ozh
         RjtgI7p4b/DmmH3vOxI2+Jbu5tDhJ3XGbBQHbl+sBP18ShInha2r/VY4VTIh22r2qFf6
         R7D739EtqG9rdBGRcvK0/tRbZQw/gp4eYVRjEwA009ce2GErea+Ul6xR6cfQvk3tPPCA
         UvFRG+RnIcnWKr1dXDc9lsO9tSfKcGlOB9Y/wskJTNbSqm0aQjnOwDInTsiE+HR1GHCv
         rd3p1e3vFoM/YMWK6LJForl4rklm+jiEJaVVoBoC+fgw/G4qMT3pV9MxX+j4SrxcJ39h
         W9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5QwCsBsQ9rxaiWZoCnkId+Sbas3jW64rpNqbI07GYs=;
        b=7QtvhT7dF2bIugyQGTKP8kaG093tjH0HlpLjB3TZYjsZV+F6sC/q1IHT+eIds/8Z2N
         Qz2gMzL/v2E4/qbSWX44064qF4ehrKtNRYr6ofgbb64SrnR1ghIRuFPh5JDi2BRNoo5S
         rqBc0dCWiGRymb69e0LY+DvUZEsCo/I7NmNtJYe7/QYqkDCuIMXi275SFh+oB9NPXs33
         MsXRMC5yHfaMPP+vAbBvXQ5DuMCALkoXPB8cepc+XAY6wg4R2Zp8MKGXh6NCvKe+Jbx3
         BF9vzmm9xUG3i5Gpe6YgIn6oaGX1zgtLgwljRK6KClvz99RihK/R6uCjpk+srFQfBRed
         jn/g==
X-Gm-Message-State: ACrzQf1AuLuLl9Dj4GrKBIBnQj6LcPBl2wFQ3K49c84wkV0x9BngGvF1
	Hl8s2K1d70YT3vMNT8ho67WS84tBONJRh/rAJAWXvu1HhxU=
X-Google-Smtp-Source: AMsMyM5m9w2fnMET9O2I/2czFqyKE19N4YcMLhy5KV6X/u8QmGbc2YG4dYZjbEsxCI4GdHGVMbDIVLmgvK4OlGjENsw=
X-Received: by 2002:a5d:58d9:0:b0:236:5b81:2c99 with SMTP id
 o25-20020a5d58d9000000b002365b812c99mr18155363wrf.494.1666835998201; Wed, 26
 Oct 2022 18:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <Y1aCiReTZDbPp/rS@kadam> <20221026072444.GA24881@cyhuang-hp-elitebook-840-g3.rt>
 <Y1j058PsWYj0MQrC@kadam> <CADiBU39z_h=QLF-cGztz6Wq86+rMahVb7owHNt4RpvFPFYDs3w@mail.gmail.com>
In-Reply-To: <CADiBU39z_h=QLF-cGztz6Wq86+rMahVb7owHNt4RpvFPFYDs3w@mail.gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Thu, 27 Oct 2022 09:59:46 +0800
Message-ID: <CADiBU38JKzq9ngiaZWTse3eMdH_fTcUCdanea7uQAU7NxZrzZg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20221026_190000_665890_FA0CC071 
X-CRM114-Status: GOOD (  22.83  )
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

ChiYuan Huang <u0084500@gmail.com> =E6=96=BC 2022=E5=B9=B410=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Dan Carpenter <dan.carpenter@oracle.com> =E6=96=BC 2022=E5=B9=B410=E6=9C=
=8826=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:51=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >
> > On Wed, Oct 26, 2022 at 03:24:48PM +0800, ChiYuan Huang wrote:
> > > 2) normal register access with negative length
> > > Unable to handle kernel paging request at virtual address ffffffc009c=
efff2
> > > pc : __memcpy+0x1dc/0x260
> > > lr : _regmap_raw_write_impl+0x6d4/0x828
> > > Call trace:
> > >  __memcpy+0x1dc/0x260
> > >  _regmap_raw_write+0xb4/0x130a
> > >  regmap_raw_write+0x74/0xb0
> > >
> > >
> > > After applying the patch, the first case is cleared.
> > > But for the case 2, the root cause is not the mt6370_regmap_write() s=
ize
> > > check. It's in __memcpy() before mt6370_regmap_write().
> > >
> > > I'm wondering 'is it reasonable to give the negative value as the siz=
e?'
> > >
> >
> > Thanks for testing!
> >
> > I'm not sure I understand exactly which code you're talking about.
> > Could you just create a diff with the check for negative just so I can
> > understand where the issue is?  We can re-work it into a proper patch
> > from there.
> >
> Here.
> https://elixir.bootlin.com/linux/v6.1-rc2/source/drivers/base/regmap/regm=
ap.c#L1860
>
> From my experiment, I try to access 0x00 reg for size (-1).
> Testing code is like as below
> regmap_raw_write(regmap, 0, &val, -1);
>
> That's why I think if the size check is needed, it may put into
> regmap_raw_write() like as regmap_raw_read().
>
It seems c99 already  said size_t is an unsigned integer type.
My experiment for (-1) size is not reasonable.
(-1) means it will be converted as the UINT_MAX or ULONG_MAX.
This will cause any unknown error like as memory violation or stack
protection,...etc.

let's check whether the negative size is reasonable or not.
If this case dost not exist, to keep the boundary check is enough.
> > regards,
> > dan carpenter
> >

