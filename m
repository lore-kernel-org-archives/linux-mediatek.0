Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A5DC25B6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 22:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYkYcPfrdjdF13EUZZ4eE7TIV+DAr//+SL8WC077uOs=; b=r8YF6b1Fit0dKghhSoTjimrluk
	R+QF/MDSUNZdGgcyYpvpcHlL2V21bdDRCF1xpqRm+O5YIYZhVGhebC7lhfjxqRICy7inJv1+OLXk5
	C5Oe/A2wXxNzB8xxGHPc4LZcNkrbMjeo0fWnuCbJsbSyqkmwGg8jouwHALbARxiQulyNpLmDYvzBA
	0gX3gN9nEIr5J72qmtzeodsEQk7glhktjzbknmGoKpAJ6lq8OLxVxUBlnLZWmVby1m04LzjueChFQ
	+fGJh9P0A4YVrK6+IB57+Hd7QV3UslJr3lg8rZEwefeVsky3vCvvjy7poE8befzm1ysjh3TQqKqH/
	jXXBXrGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8YU-00FEEb-35;
	Thu, 26 Oct 2023 22:10:18 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8YS-00FEDH-03
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Oct 2023 22:10:17 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-53b32dca0bfso2929990a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Oct 2023 15:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698358212; x=1698963012; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYkYcPfrdjdF13EUZZ4eE7TIV+DAr//+SL8WC077uOs=;
        b=sfot58+U/uwwFNxaYqnO13Jg+BzVaWpFwIBlmg0x1for2fnBTjmtLwZ6gz25QAeBoW
         ftf9EJXbsJJ22YzGCtsmfpws1gl86lFZHh95GKbUedrx4mlWpJvzsoMVlKOoNLRqbRrc
         TeWGuYcq2Ba4UrOqRf8ww+VhgruuD3jWTtum0u0ESLD14ARO18M1PSCHpLqRMDySS8zd
         4hxSHCmABktr9xp8Pe/hGxUGMIDazuOawTKpwOiDDi5YlxQNIIWVHmeBENczYdu9yUTy
         H1Hsj6rSUOzC+thcI4FojF4IFky/0WiL4MoyVfwGKfZhdPHSQnjPSs0Y7dNJ0nBo4OQK
         DiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698358212; x=1698963012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYkYcPfrdjdF13EUZZ4eE7TIV+DAr//+SL8WC077uOs=;
        b=qeXgBMibVklgq43WPykX7IvAwzXaEqOm/KP4y3smeK8jGupH6zGLxeeFPCgJnQQzKp
         CsibRrFee51IcT0Q0AeJOn+FkGLaNQcUlmUnDUqPvO5X/AEsOcm2XrC0i1bRX7fNJKbZ
         B7QeYrhsCCT/IT5WXYkV3BQFCmOqQVjZQ1a3fpQvCqok1qQXEhgHrN4MU+ZzwvDaI9Th
         ilpTgq6yk1cyAzLxiZCCJwgIbSHiEX12j9/DngvNs1fBAqHH6Y5OpVo42WJN8OPs5gmy
         PkxHXTOPTs+C92ZEGQHNpZoNnaQ7QX8gmY6azb13wunDHNSo+wj/lX4D94huP9Fuyi+0
         HcoA==
X-Gm-Message-State: AOJu0YzxeChBbsXGDrnl0DcyRdBX49CTEArcEC1Ua1Qdb4dXgT5kKCpZ
	g/1bOyCa3TpxyYWUZ31E6NMKW8lGDUPWIKV02g+fOQ==
X-Google-Smtp-Source: AGHT+IHuRGkSLp8NehiD60eytlHzZjcZDIT/jEslbKqr0KO3Wpe3LN4KZHOprmb19kQBB0q3jCL/Ej5UEDw1oqFqc4o=
X-Received: by 2002:a50:fa83:0:b0:52a:38c3:1b4b with SMTP id
 w3-20020a50fa83000000b0052a38c31b4bmr1216507edr.15.1698358211957; Thu, 26 Oct
 2023 15:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231026-ethtool_puts_impl-v2-0-0d67cbdd0538@google.com>
 <20231026-ethtool_puts_impl-v2-1-0d67cbdd0538@google.com> <20231026220248.blgf7kgt5fkkbg7f@skbuf>
In-Reply-To: <20231026220248.blgf7kgt5fkkbg7f@skbuf>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 26 Oct 2023 15:09:59 -0700
Message-ID: <CAFhGd8rWOE8zGFCdjM6i8H3TP8q5BFFxMGCk0n-nmLmjHojefg@mail.gmail.com>
Subject: Re: [PATCH next v2 1/3] ethtool: Implement ethtool_puts()
To: Vladimir Oltean <olteanv@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shay Agroskin <shayagr@amazon.com>, 
	Arthur Kiyanovski <akiyano@amazon.com>, David Arinzon <darinzon@amazon.com>, Noam Dagan <ndagan@amazon.com>, 
	Saeed Bishara <saeedb@amazon.com>, Rasesh Mody <rmody@marvell.com>, 
	Sudarsana Kalluru <skalluru@marvell.com>, GR-Linux-NIC-Dev@marvell.com, 
	Dimitris Michailidis <dmichail@fungible.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, 
	Salil Mehta <salil.mehta@huawei.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Louis Peens <louis.peens@corigine.com>, 
	Shannon Nelson <shannon.nelson@amd.com>, Brett Creeley <brett.creeley@amd.com>, drivers@pensando.io, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ronak Doshi <doshir@vmware.com>, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Daniel Golle <daniel@makrotopia.org>, Landen Chao <Landen.Chao@mediatek.com>, 
	DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Lars Povlsen <lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
	intel-wired-lan@lists.osuosl.org, oss-drivers@corigine.com, 
	linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_151016_060760_74E88293 
X-CRM114-Status: GOOD (  25.24  )
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

On Thu, Oct 26, 2023 at 3:02=E2=80=AFPM Vladimir Oltean <olteanv@gmail.com>=
 wrote:
>
> Hi Justin,
>
> On Thu, Oct 26, 2023 at 09:56:07PM +0000, Justin Stitt wrote:
> > Use strscpy() to implement ethtool_puts().
> >
> > Functionally the same as ethtool_sprintf() when it's used with two
> > arguments or with just "%s" format specifier.
> >
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > ---
> >  include/linux/ethtool.h | 34 +++++++++++++++++++++++-----------
> >  net/ethtool/ioctl.c     |  7 +++++++
> >  2 files changed, 30 insertions(+), 11 deletions(-)
> >
> > diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
> > index 226a36ed5aa1..7129dd2e227c 100644
> > --- a/include/linux/ethtool.h
> > +++ b/include/linux/ethtool.h
> > @@ -1053,22 +1053,34 @@ static inline int ethtool_mm_frag_size_min_to_a=
dd(u32 val_min, u32 *val_add,
> >   */
> >  extern __printf(2, 3) void ethtool_sprintf(u8 **data, const char *fmt,=
 ...);
> >
> > +/**
> > + * ethtool_puts - Write string to ethtool string data
> > + * @data: Pointer to start of string to update
> > + * @str: String to write
> > + *
> > + * Write string to data. Update data to point at start of next
> > + * string.
> > + *
> > + * Prefer this function to ethtool_sprintf() when given only
> > + * two arguments or if @fmt is just "%s".
> > + */
> > +extern void ethtool_puts(u8 **data, const char *str);
> > +
> >  /* Link mode to forced speed capabilities maps */
> >  struct ethtool_forced_speed_map {
> > -     u32             speed;
> > +     u32 speed;
> >       __ETHTOOL_DECLARE_LINK_MODE_MASK(caps);
> >
> > -     const u32       *cap_arr;
> > -     u32             arr_size;
> > +     const u32 *cap_arr;
> > +     u32 arr_size;
> >  };
> >
> > -#define ETHTOOL_FORCED_SPEED_MAP(prefix, value)                       =
       \
> > -{                                                                    \
> > -     .speed          =3D SPEED_##value,                               =
 \
> > -     .cap_arr        =3D prefix##_##value,                            =
 \
> > -     .arr_size       =3D ARRAY_SIZE(prefix##_##value),                =
 \
> > -}
> > +#define ETHTOOL_FORCED_SPEED_MAP(prefix, value)                      \
> > +     {                                                            \
> > +             .speed =3D SPEED_##value, .cap_arr =3D prefix##_##value, =
\
> > +             .arr_size =3D ARRAY_SIZE(prefix##_##value),            \
> > +     }
> >
> > -void
> > -ethtool_forced_speed_maps_init(struct ethtool_forced_speed_map *maps, =
u32 size);
> > +void ethtool_forced_speed_maps_init(struct ethtool_forced_speed_map *m=
aps,
> > +                                 u32 size);
> >  #endif /* _LINUX_ETHTOOL_H */
>
> Maybe this is due to an incorrect rebase conflict resolution, but you
> shouldn't have touched any of the ethtool force speed maps.

Ah, I did have a conflict and resolved by simply moving the hunks
out of each other's way. Trivial resolution.

Should I undo this? I want my patch against next since it's targeting
some stuff in-flight over there. BUT, I also want ethtool_puts() to be
directly below ethtool_sprintf() in the source code. What to do?

>
> Please wait for at least 24 hours to pass before posting a new version,
> to allow for more comments to come in.

Ok :)

Thanks
Justin

