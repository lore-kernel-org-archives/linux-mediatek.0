Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C99BC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 09:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wna/4wVkVyFMu9g2vI/UPztxosN0rkTf5QddysXvN+8=; b=1sxBHPCCcUUDCyxlvFW/0LmumE
	OWbvXD9zovWF6dwG07UksAuTOdVycXIuMhVEfgh1gXLBzq3HRd4zrRU83CuZ10PC5DGoLJY2DodGV
	fR2+x2UubuiuICcECEKh7tvfIREXinGy6/M0kmpazcT70IFRJE68Inw8TiuEkuKKAIFuscz/CwpTC
	pkrLmB4nO65dZP2dSBytyTkZYAwP0FIAp0CqgVFc4CrbArB0xz6PPRisdBZcFRnNl+BNH6q8GZGdX
	gmRXrZv0sZUjrxGP0U5putrjZzHnVbUzYWaJfomu0N2VVExKSw6e/Zkio8NxH7xbRQts/UHoIRce7
	SrS1AVXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnvQ-006dH8-Ie; Fri, 21 Oct 2022 09:02:44 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnv9-006d6H-Fb; Fri, 21 Oct 2022 09:02:29 +0000
Received: by mail-wr1-x42c.google.com with SMTP id w18so3794502wro.7;
        Fri, 21 Oct 2022 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wna/4wVkVyFMu9g2vI/UPztxosN0rkTf5QddysXvN+8=;
        b=Rln2YBwQTk6YJLdywdT6rm01AuQSwlVbGqdiHdf5mJyEkKk9AgzItsARcIoh53kFkh
         DrFt6CbLPSnF/6BW7m7lftN6YaUGUKVGlCRsdHEcw0MhXBJGI+UQMR/XE+tn/72Nk1qW
         2C3DGRWfCnUK+DefjWxLrJVycXXEk1q1KmOrS8aJTwvm3vmkVGUzcjreiOxKTPcrLLUP
         /FN12rqwc7RbG/B5iiuFuitDMPLkAxYRxDr2GzuYxgAjzgHlALR5e3WaCgJQ+LpDbMG2
         IIMYscldoeUvtzM2Uvc2mxYF8KmZqwLlzTOnsKV2h6761QsYZy3+XtaTbUCQnhBZEjh4
         w9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wna/4wVkVyFMu9g2vI/UPztxosN0rkTf5QddysXvN+8=;
        b=C+UJctrK/G9PQ5R9bw3yGerwWSFMxFyeZgQ5AEaOn/2T558/HxkTaQjb6XBwQakwhx
         +/NnIFsOu6CUND8S1wA0i5xRXVYI0g1UF9bo2Fnn75xmbCGBS9BLoz1yR+gIeRPuNlpK
         FNn/GubBlrM6pyg4pSk1i1HkA0JjnVdk+MtX9n7Hh+/sRIRFXl0NvLuLAv6ocCgrcnPY
         OY2HstLa4ikVNmcl/PzDDjJ3KaqW7pPK46qjixPhG0V8AdUdnXqJ9tQGWVy4suTVMQ+Y
         vZz3yw1J+5Ori7Nmi/5jPOGGkNm5LWGAM2d8PBhWi4S0lviIe67DCaMWNAE/I5ql1dMy
         R+9Q==
X-Gm-Message-State: ACrzQf03W0Yqylyezs4YsZGSVfm1IUWfWMj26eLCnukPk8TOrH7moipU
	0ky72yB/BHopl4GvggrB9y55O9bHLR7FanmgXUs=
X-Google-Smtp-Source: AMsMyM4xDa5PcrzRu8TNq1I9fdMEZxBtXL+ejziBNVWoa02NGqn0Q2MzB7yJEYDJHLqQNmSqeVqiFCarUyH29tlD4Gs=
X-Received: by 2002:a5d:4c43:0:b0:236:547f:bd3c with SMTP id
 n3-20020a5d4c43000000b00236547fbd3cmr1251650wrt.380.1666342944890; Fri, 21
 Oct 2022 02:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <1666318661-11777-1-git-send-email-u0084500@gmail.com> <CAHp75VeMvWycVsNPHb1cvMbtVSCiX3m9wUsZk7HkPU+e=VTb3A@mail.gmail.com>
In-Reply-To: <CAHp75VeMvWycVsNPHb1cvMbtVSCiX3m9wUsZk7HkPU+e=VTb3A@mail.gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Fri, 21 Oct 2022 17:02:13 +0800
Message-ID: <CADiBU3_m1gDgZxyo53UNvDP8P5LpFgpV+mBbw9+_epYuXimqWA@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: mt6370: Add the out-of-bound check to prevent the
 null pointer
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: lee@kernel.org, matthias.bgg@gmail.com, chiaen_wu@richtek.com, 
	cy_huang@richtek.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_020227_592263_6E65BA56 
X-CRM114-Status: GOOD (  16.42  )
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
=8821=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:34=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Fri, Oct 21, 2022 at 5:17 AM cy_huang <u0084500@gmail.com> wrote:
> >
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > This potential risk could happen at regmap_raw_read() or
> > regmap_raw_write() when accessing the over-bound register address.
> >
> > For testing, I try to reproduce it with a testing attribute file.
> > Below's the issue trace log.
>
> It looks like you randomly cut the trace.
> It's not what I meant and documentation suggests.
>
I checked the submitting-patch.rst.
To satisfy the requirement for 70-75 chars per line, I only keep the
important log.

May I ask what you mean for the 'trim'?
Is it 'Still keep 70-75 per line and cut the characters that's over
the limit to the next line"?

> > [41.314358] pc : i2c_smbus_xfer+0x58/0x120
> > [41.314371] lr : i2c_smbus_read_i2c_block_data+0x74/0xc0
> > [41.399677] Call trace:
> > [41.402153]  i2c_smbus_xfer+0x58/0x120
> > [41.405956]  i2c_smbus_read_i2c_block_data+0x74/0xc0
> > [41.410991]  mt6370_regmap_read+0x40/0x60 [mt6370]
> > [41.415855]  _regmap_raw_read+0xe4/0x278
> > [41.419834]  regmap_raw_read+0xec/0x240
> > [41.423721]  rg_bound_show+0xb0/0x120 [mt6370]
> > [41.428226]  dev_attr_show+0x3c/0x80
> > [41.431851]  sysfs_kf_seq_show+0xc4/0x150
> > [41.435916]  kernfs_seq_show+0x48/0x60
> > [41.439718]  seq_read_iter+0x11c/0x450
> > [41.443519]  kernfs_fop_read_iter+0x124/0x1c0
> > [41.447937]  vfs_read+0x1a8/0x288
> > [41.451296]  ksys_read+0x74/0x100
> > [41.454654]  __arm64_sys_read+0x24/0x30
> > [41.458541]  invoke_syscall+0x54/0x118
> > [41.462344]  el0_svc_common.constprop.4+0x94/0x128
> > [41.467202]  do_el0_svc+0x3c/0xd0
> > [41.470562]  el0_svc+0x20/0x60
> > [41.473658]  el0t_64_sync_handler+0x94/0xb8
> > [41.477899]  el0t_64_sync+0x15c/0x160
> > [41.481614] Code: 54000388 f9401262 aa1303e0 52800041 (f9400042)
> > [41.487793] ---[ end trace 0000000000000000 ]---
>
> ...
>
> > If there's still something improper, please kindly correct me.
>
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#ba=
cktraces-in-commit-messages
>
> --
> With Best Regards,
> Andy Shevchenko

