Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41F8C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 07:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQUyYnkfD/QphPAhvZx7MKv0769amG9itPpYbqF4pAg=; b=KWyo6hq5Yv++fKgPa2hN3nnxoN
	HTIRpB+QfhYNQDIxF97BBSH7Pyv/oDdieg7c8QV3GvrWIIPreIzu9JisRvXp9XcF+MCwmvNO1Py1t
	/e3N30Pzj22DEvOIjSXS4fvalPXlgbtXSvF2mga6Rgz0D41BnnqZ5+yDJHTWau1usNSHRhwR5aa7e
	zxkNiIGoLthf6fbjUHsXZVrOUcFhLrQqeyjXCeqwGql4Gofqw+yGAJRWypPSqaVvGhZnQBqMpbQJL
	mAvX8VNM9yeCMOr4xFzqQJSu7JTKw0NdZjUiqdA5n4/B2zEVLeYq43ny/pwt0N0oDOfMXXltFOFyn
	X7D3O2MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onaTe-008MDy-5T; Wed, 26 Oct 2022 07:05:26 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onaTQ-008MBL-8C; Wed, 26 Oct 2022 07:05:16 +0000
Received: by mail-wm1-x32f.google.com with SMTP id v130-20020a1cac88000000b003bcde03bd44so780427wme.5;
        Wed, 26 Oct 2022 00:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQUyYnkfD/QphPAhvZx7MKv0769amG9itPpYbqF4pAg=;
        b=qWl7iB7LmbYBsmiX/9/8KvoCoJKf1FBBDgoMyja/yFA/2kloeRbdOx+lTsehp+1xE/
         JjW4RdhwYefgJ30e7ZNhJYflZDRgkBtMFEqItkbKfvWOPSkCnaZhS0ZjJ6glzS/to6M6
         3TfsfLPB53AJrNDOm2gBL04x1qu2IHJJT/AIVP4pGx7Y3xULtbwHFE3B3d1pwgdtDsS3
         ILAB8k2YLQoILmJPqrDeNZNk0O1op4H1u7NsZ7QZy0tIGk5tnxLJWAL+m551aLxu1PWc
         /Ky4ak4ThxXs5SyOGK57yu94EgeYfIpbsQ3JeVzG57ZLorCPk2lXUw9BwxisJJPYfCLS
         XzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQUyYnkfD/QphPAhvZx7MKv0769amG9itPpYbqF4pAg=;
        b=fzG8OamIU4Z2bCut5vQGdUYqDb2tjX0D5cWWKiwcan2ffWwLx6RsC7ptSxMf3FIqNj
         5FQ35UNkSSFy0k4hXJzccE+79X8Mq/Z1c7Fu4Zeuzsbd5cf95QkIwu0Hb0o/ZSZZtz+a
         7dfvSYWGFMTs7X4Z++H9yfRGiIS8zs55ILh4s6IRaviR7YbXdI24b+ToMzkkyZMi/Ccs
         J4PCJ52VUrLLLw7WyGUlq8Kr30oV+J7Kg9P9yvRTgHp8G/NVyiuEfWrkfAq4JoK/YS2l
         JaQo/jWWcVuhE5z7ecqlOt+86Pl0Cju8rcaU7WmRPMPrTyq8aKfOMp1hiarAEClCq5hj
         wstQ==
X-Gm-Message-State: ACrzQf2l94VXmjQV26uNw+pNfNIaDgQHQdgYmbYyWij55hsM7qHksj4N
	/EDnlej+JNm5y69IzV10TGTBIh6Q4R2ruNIU71U=
X-Google-Smtp-Source: AMsMyM5C9NLr2Kz1+vKkOOJ10yx17T4xwIKTzoLig0Zw9Z44q8yI20nka6ZVPN9VHFsB21O4aWfFUz+j7o/G73EyP7U=
X-Received: by 2002:a05:600c:1990:b0:3c9:a5e8:addb with SMTP id
 t16-20020a05600c199000b003c9a5e8addbmr1273615wmq.140.1666767909354; Wed, 26
 Oct 2022 00:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <1666318661-11777-1-git-send-email-u0084500@gmail.com>
 <CAHp75VeMvWycVsNPHb1cvMbtVSCiX3m9wUsZk7HkPU+e=VTb3A@mail.gmail.com>
 <CADiBU3_m1gDgZxyo53UNvDP8P5LpFgpV+mBbw9+_epYuXimqWA@mail.gmail.com>
 <CAHp75VeWMSeZiq6vUo25hRdueMbeEEQuzPqR=-ROsOufK+27LQ@mail.gmail.com>
 <CADiBU39UF3Ez-80Xauy8qaO0iSyh-n-ZxScH+aZt3m=s3qkOjA@mail.gmail.com> <CAHp75VevGHnZKJvsdJ6QpWbHdhWP0VW0G71QLqRDvgk8MFeNUg@mail.gmail.com>
In-Reply-To: <CAHp75VevGHnZKJvsdJ6QpWbHdhWP0VW0G71QLqRDvgk8MFeNUg@mail.gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Wed, 26 Oct 2022 15:04:57 +0800
Message-ID: <CADiBU39pRnrTuCM4OEFpLwEP9c86aJz2L6+G7yFm22i+7Gt8pw@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: mt6370: Add the out-of-bound check to prevent the
 null pointer
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: lee@kernel.org, matthias.bgg@gmail.com, chiaen_wu@richtek.com, 
	cy_huang@richtek.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_000512_311362_2727E1C2 
X-CRM114-Status: GOOD (  14.99  )
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

Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B410=E6=9C=
=8821=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:35=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Fri, Oct 21, 2022 at 12:58 PM ChiYuan Huang <u0084500@gmail.com> wrote=
:
> > Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B410=
=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:14=E5=AF=AB=E9=
=81=93=EF=BC=9A
> > > On Fri, Oct 21, 2022 at 12:02 PM ChiYuan Huang <u0084500@gmail.com> w=
rote:
> > > > Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B4=
10=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:34=E5=AF=AB=
=E9=81=93=EF=BC=9A
> > > > > On Fri, Oct 21, 2022 at 5:17 AM cy_huang <u0084500@gmail.com> wro=
te:
>
> ...
>
> > > > > https://www.kernel.org/doc/html/latest/process/submitting-patches=
.html#backtraces-in-commit-messages
> > >
> > > Have you had a chance to read this section of the document?
> > >
> > OK, get it.
> > Is the below text enough to express this problem?
>
> It is you who decides, because I don't know what exact problem this
> will represent.
>
> > Ex. Testing as below (mt6370 register range from 0 to 0x1ff)
> >    rg_bound_show()
> >         regmap_raw_read(regmap, 0x200, &val, sizeof(val));
>
> > pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
>
> For example, why is this line here?
>
> > pc : i2c_smbus_xfer+0x58/0x120
> > lr : i2c_smbus_read_i2c_block_data+0x74/0xc0
> > Call trace:
> >  i2c_smbus_xfer+0x58/0x120
> >  i2c_smbus_read_i2c_block_data+0x74/0xc0
> >  mt6370_regmap_read+0x40/0x60
> >  _regmap_raw_read+0xe4/0x278
> >  regmap_raw_read+0xec/0x240
> >  rg_bound_show+0xb0/0x120
>
> The rule of thumb is that it's okay to shrink to ~4-5 lines (in most case=
s).
>

At first, I start this thread due to  the original thread seems stopped
Since it already restarted, please forget this one.
Just follow the restaed thread for the discussion.
https://lore.kernel.org/all/Y1aCiReTZDbPp%2FrS@kadam/

> --
> With Best Regards,
> Andy Shevchenko

