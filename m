Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF20EC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 10:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Za+SONx9FuqbfM12ClF5Cp/+gi925kNZnyxgujZpLSI=; b=V9HmvM7NKrr1IKJzsUP/3CjbeH
	J1LchycYAcvzA2sT7XphgZt8PRj4XDThlWYRgozQoueU1Gmp3XRhP4DDf7mrOQLVne8WB4ngderIB
	rsiChfY4avWD+GVl8nlA/w+NpUm/FR2zev+BlvwNPP468ViEA8zS8Zuuzb2YBqs5Y5sR3YPxkwn6w
	qR1xSmEBN1Gz+h7TQojYEztHE9JlbXr+o7YMUDZHnVUQmvqPeelL7htB24HlDvSnSFBbsdBQRSa5c
	vXPBh/jOs70uivbnZknXcTfaSGJAac4afXB+EzRh5LO4+JpuGTQakePAFTsUM0CVQf2gZ5DlGUT3b
	462Xv7DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpNi-0077Rr-PP; Fri, 21 Oct 2022 10:36:02 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpNU-0077Ny-UM; Fri, 21 Oct 2022 10:35:50 +0000
Received: by mail-qk1-x72f.google.com with SMTP id z30so1692023qkz.13;
        Fri, 21 Oct 2022 03:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Za+SONx9FuqbfM12ClF5Cp/+gi925kNZnyxgujZpLSI=;
        b=DyZpQ0C+jrknGd6nJ/f/iHuWj77lfftkQHQiuwxEiibZXV6aHOp4T/fv5lqJijDm4+
         aJvslSn2xq6g9Pc0vQaibGyyQJMXVi3Bul3byrf6mUMcQfFvrLgosbpWSXTR+ZsNecPV
         3vGvroDOVBc4cv9FINmGhOvDHTWlQA8AEd81rKjCB22jwKOGfppepRYDPmaBu9R1Dc99
         LZ+o7Wc5rC/EyEbBbZUZ45AaNB3rTnrxCLWHK1Yv/n8ZP5CVJdsSRDhlRc4t1LMikJGL
         7Fnj7Srmr0IQFvQNnCGG7cF+hE4DL4LMpmxsEJx2cgev0Dlv4i6S2JbmvvezAE7HQHGr
         W8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Za+SONx9FuqbfM12ClF5Cp/+gi925kNZnyxgujZpLSI=;
        b=xRUOFnnYnKwfuyKCMAYWlR9d1WhjAgLcBH9yxjGTgvOqOeQaZYVuX1xQKmZjs7VgjH
         JoIP0r1+GJUO876k8SdWk6WJW9H4EUtL61Vj4dE89BPN/LYvefkjzRUoNYchQ8i79xOR
         0JYfwfIiR4gqBMGy1mSWNpOPaiXUlTIusc5fT7/QP7KKYKhdn2C5T7mJhwmQU+FMNGkS
         by/FpHam/0rGBxMtM+0pOdbhBW7/Ts9v8zryEob7DbjPnzoEsGtHDWYuxDTcWKOThLBN
         nnGy1+RAg5VLB6MsDV1IlDBNVfyyiHvjIH+JDFAWfe86pTziYo3Zy0wDcAyTZjAc22gF
         T40w==
X-Gm-Message-State: ACrzQf1bs7L6wIdsdzQ2P/OvgR6XNF5fh1nDyvfThjD4/wpfUu9celp9
	oi3UZo21gsStNrPZADto4tnZGCEozHoGTKlQU7w=
X-Google-Smtp-Source: AMsMyM7+9bv0iDWdZKvVgQQO7F2TQHEZWWq8TGVAyroaBe2isT7nLForkwXnBFmQTJ9upc9nFC93UZW1bX4N/b3Ozf0=
X-Received: by 2002:a05:620a:410e:b0:6ee:b96b:a831 with SMTP id
 j14-20020a05620a410e00b006eeb96ba831mr13512410qko.734.1666348544126; Fri, 21
 Oct 2022 03:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <1666318661-11777-1-git-send-email-u0084500@gmail.com>
 <CAHp75VeMvWycVsNPHb1cvMbtVSCiX3m9wUsZk7HkPU+e=VTb3A@mail.gmail.com>
 <CADiBU3_m1gDgZxyo53UNvDP8P5LpFgpV+mBbw9+_epYuXimqWA@mail.gmail.com>
 <CAHp75VeWMSeZiq6vUo25hRdueMbeEEQuzPqR=-ROsOufK+27LQ@mail.gmail.com> <CADiBU39UF3Ez-80Xauy8qaO0iSyh-n-ZxScH+aZt3m=s3qkOjA@mail.gmail.com>
In-Reply-To: <CADiBU39UF3Ez-80Xauy8qaO0iSyh-n-ZxScH+aZt3m=s3qkOjA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 21 Oct 2022 13:35:07 +0300
Message-ID: <CAHp75VevGHnZKJvsdJ6QpWbHdhWP0VW0G71QLqRDvgk8MFeNUg@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: mt6370: Add the out-of-bound check to prevent the
 null pointer
To: ChiYuan Huang <u0084500@gmail.com>
Cc: lee@kernel.org, matthias.bgg@gmail.com, chiaen_wu@richtek.com, 
	cy_huang@richtek.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_033549_002662_C106B09A 
X-CRM114-Status: GOOD (  11.26  )
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

On Fri, Oct 21, 2022 at 12:58 PM ChiYuan Huang <u0084500@gmail.com> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B410=E6=
=9C=8821=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:14=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > On Fri, Oct 21, 2022 at 12:02 PM ChiYuan Huang <u0084500@gmail.com> wro=
te:
> > > Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B410=
=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:34=E5=AF=AB=E9=
=81=93=EF=BC=9A
> > > > On Fri, Oct 21, 2022 at 5:17 AM cy_huang <u0084500@gmail.com> wrote=
:

...

> > > > https://www.kernel.org/doc/html/latest/process/submitting-patches.h=
tml#backtraces-in-commit-messages
> >
> > Have you had a chance to read this section of the document?
> >
> OK, get it.
> Is the below text enough to express this problem?

It is you who decides, because I don't know what exact problem this
will represent.

> Ex. Testing as below (mt6370 register range from 0 to 0x1ff)
>    rg_bound_show()
>         regmap_raw_read(regmap, 0x200, &val, sizeof(val));

> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)

For example, why is this line here?

> pc : i2c_smbus_xfer+0x58/0x120
> lr : i2c_smbus_read_i2c_block_data+0x74/0xc0
> Call trace:
>  i2c_smbus_xfer+0x58/0x120
>  i2c_smbus_read_i2c_block_data+0x74/0xc0
>  mt6370_regmap_read+0x40/0x60
>  _regmap_raw_read+0xe4/0x278
>  regmap_raw_read+0xec/0x240
>  rg_bound_show+0xb0/0x120

The rule of thumb is that it's okay to shrink to ~4-5 lines (in most cases)=
.

--=20
With Best Regards,
Andy Shevchenko

