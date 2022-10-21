Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726DBC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 09:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NU2NbgcaNv69sQDmmdXSiV8oJ0c/tR30K48SfUDQxJQ=; b=aBrO5VZi+SZ/e3Rcl8B3HxHJ5A
	ym8VdRgY2O3D5i0KyvW800dGXGs/E69hCUDY+Dy4f+tWRwu38v6ZK9uJaWulXmIg23fzf6vaM95di
	YXfh0WXBwfd7fZn9KlNkRFvKuynCeB4pDwFPxZx1t6Ax4z9GMCkVUF7eU7VBhtXfcRoVuQ7bq6wp9
	d9cTI3/pMi/s/FyIPYgnjT5U+aswUfrai+dnnEwpZjLrSJio6UMfth94NKiwVS8mQLe3NwfLj6eSq
	ZFYI2j1rP5ooiWqtgjYpte5aKaG3df2TsAjIWbBvLdvW8y+qaCjJqWIEo5Tjju9Dd1g3rGr98Wbop
	u0ylQRKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oloo6-006wKv-GC; Fri, 21 Oct 2022 09:59:14 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olonu-006wGA-AO; Fri, 21 Oct 2022 09:59:03 +0000
Received: by mail-wm1-x333.google.com with SMTP id l32so1838748wms.2;
        Fri, 21 Oct 2022 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NU2NbgcaNv69sQDmmdXSiV8oJ0c/tR30K48SfUDQxJQ=;
        b=YVz15Tj2qWM18F2xMT4saIjsnFSqycvVeautXKJ88W8tCdkV8fyielO/OAmoPwhFB4
         lndnlfABDK4D2BDMk989azO044wpQHfJmL2wCqOx3aSytvWA45kuC2aNbmYXaz9gxF5X
         FEx+Sis43KL28RjQPqS25t/zwCjDaBnJmAVjbu/9cHyFpbs0/1gpomyIhy/UoUmDgLql
         miFdS7R1iJeH2lTWMkfLyvCFzTODF3+kNFE5ekLV+xpyU6dAsN4vVOUMHApG8SCA+3ov
         8GEEoWcPZifkxYlFHNJ39rqFYsFuQbVn+tuagCet0f/j755Il4b8z67S5Y4fcbjLFEHX
         0yPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NU2NbgcaNv69sQDmmdXSiV8oJ0c/tR30K48SfUDQxJQ=;
        b=c12yHKrvyrSdoHxsggkvqZkJBSsmu/VGAh0P+EfV7SlVopFwEndgt776Wyj5Dii04r
         H6Qs1xV4dkyVgHJtzP1X6gHMuOQcyJMBCYmovVh1e696bBGJgJ+6mDYw81wEaSqt+GWJ
         y9wUEaqf5zVEEMRRzrz9sH/p0woec5iIzk4yq96ukEN3+NqUjsCn8OZmsPPHG7W5IQay
         1C2WI80+vZBYZ0gGVDNPD96YtjNArAS6yy9mXu2lRJGKqOM2k4Do3Rk3BOmok4gTpnxH
         R2IbxAkJ61ECZNoX1qmSex8TLp5wDCxvjLKMMX3XGt0s2u1Gbj8FYXR9FbzwBXshnA8r
         6Ryg==
X-Gm-Message-State: ACrzQf1iY39CwBl0YSPXi3EPp8S9IB4eW7/9CgKE4Nv7rpodumdJLjeE
	OVyIhE1Syt3ONXwx43L9QKXg0shJ/gVNvW1pJkY=
X-Google-Smtp-Source: AMsMyM6pGZ/KuWewpKay2Z4t7ome5Jos7xxu92d7020CUOBbNh4uXFe7dtOgDbgkJWAGNCGvSJe+2KJ7GAte93SZRx4=
X-Received: by 2002:a05:600c:5c4:b0:3c5:9a14:e5f6 with SMTP id
 p4-20020a05600c05c400b003c59a14e5f6mr12875523wmd.153.1666346332225; Fri, 21
 Oct 2022 02:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <1666318661-11777-1-git-send-email-u0084500@gmail.com>
 <CAHp75VeMvWycVsNPHb1cvMbtVSCiX3m9wUsZk7HkPU+e=VTb3A@mail.gmail.com>
 <CADiBU3_m1gDgZxyo53UNvDP8P5LpFgpV+mBbw9+_epYuXimqWA@mail.gmail.com> <CAHp75VeWMSeZiq6vUo25hRdueMbeEEQuzPqR=-ROsOufK+27LQ@mail.gmail.com>
In-Reply-To: <CAHp75VeWMSeZiq6vUo25hRdueMbeEEQuzPqR=-ROsOufK+27LQ@mail.gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Fri, 21 Oct 2022 17:58:40 +0800
Message-ID: <CADiBU39UF3Ez-80Xauy8qaO0iSyh-n-ZxScH+aZt3m=s3qkOjA@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: mt6370: Add the out-of-bound check to prevent the
 null pointer
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: lee@kernel.org, matthias.bgg@gmail.com, chiaen_wu@richtek.com, 
	cy_huang@richtek.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_025902_408442_6B61CB4A 
X-CRM114-Status: GOOD (  15.14  )
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
=8821=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:14=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Fri, Oct 21, 2022 at 12:02 PM ChiYuan Huang <u0084500@gmail.com> wrote=
:
> > Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B410=
=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:34=E5=AF=AB=E9=
=81=93=EF=BC=9A
> > > On Fri, Oct 21, 2022 at 5:17 AM cy_huang <u0084500@gmail.com> wrote:
>
> > > It looks like you randomly cut the trace.
> > > It's not what I meant and documentation suggests.
> > >
> > I checked the submitting-patch.rst.
> > To satisfy the requirement for 70-75 chars per line, I only keep the
> > important log.
> >
> > May I ask what you mean for the 'trim'?
> > Is it 'Still keep 70-75 per line and cut the characters that's over
> > the limit to the next line"?
>
> > > https://www.kernel.org/doc/html/latest/process/submitting-patches.htm=
l#backtraces-in-commit-messages
>
> Have you had a chance to read this section of the document?
>
OK, get it.
Is the below text enough to express this problem?

Ex. Testing as below (mt6370 register range from 0 to 0x1ff)
   rg_bound_show()
        regmap_raw_read(regmap, 0x200, &val, sizeof(val));

pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
pc : i2c_smbus_xfer+0x58/0x120
lr : i2c_smbus_read_i2c_block_data+0x74/0xc0
Call trace:
 i2c_smbus_xfer+0x58/0x120
 i2c_smbus_read_i2c_block_data+0x74/0xc0
 mt6370_regmap_read+0x40/0x60
 _regmap_raw_read+0xe4/0x278
 regmap_raw_read+0xec/0x240
 rg_bound_show+0xb0/0x120
> --
> With Best Regards,
> Andy Shevchenko

