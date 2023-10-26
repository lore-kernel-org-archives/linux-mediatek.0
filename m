Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BA3C25B48
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 22:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7QyUigwL+AihRwuENBgL/lkTObabmHkjoTqFNGjpDU=; b=HLg0vby6whXjswH0JjBDkWOSsC
	nkhj7fs2jknKgKiKEhdufbUwTXSomydXxnTlXtmH+YVkMMSX9LK2ncUITCRPP3hrkZdveVbOTAAZh
	jAYYREzy0EWKsjtMtAYQuFRu1L6yXGw4HAk/o69nfmV3KvuGPuoVZnKTDzqWPZmOuDAM9KHJZudBl
	/0BX7n6/ATDPB4l9N+YrYV0YknNZ05hPWcDWGwK8eInJQAi4CeQwDLrDy1WoYKPmdPcp4a5Bddird
	HnadxrqQ2PHaUxeagM8vgjM48HaN3OOLKyGRllsEMIH0rzgdHoDh1j/1+53PviCgyzrYJ+dCEJlRN
	n80K05rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8Zu-00FEOE-21;
	Thu, 26 Oct 2023 22:11:46 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8Zs-00FENN-1K
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Oct 2023 22:11:45 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507973f3b65so2234437e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Oct 2023 15:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698358301; x=1698963101; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7QyUigwL+AihRwuENBgL/lkTObabmHkjoTqFNGjpDU=;
        b=YyZxpo4Kub8ocCZL2mjsnQ2gfVDrtDWHdso/+iVtLfGd4YO/Z3x1v3gp+DlTGmLT0v
         hFVc482Rf4iOLqzLuTW1RF6fhewmj1lmTK/t7eMree9XSOBbxGkdKT2/3Wt+b8CL6mc3
         cVk+3GMiWLkVyArdArYdP2VKdl1CXLnR7GDxoG/Aci8kzoNcUhEqZ+FWDTLt4IUQXGzH
         htWFqnHPkGFgdOqI5D0+ug1Q+pkN41jc3nDJ8aKVqEQPxu5fmGrrdbRbMHvqb3R3JJXB
         3rk4DYOg8TKf+GhzF33IBgrDrM7WNGSNU7hCsaX2tOrCRIQatgLpntdXNmAmbOKLlbUW
         NpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698358301; x=1698963101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7QyUigwL+AihRwuENBgL/lkTObabmHkjoTqFNGjpDU=;
        b=ihSVj3dCljjbovYysUjqk586Cw4Ycm0mf18fZI5sS4gbvnU09ZS9i/JdTx6SmQ8cD2
         VZ814VwPFUNtchcYy8slQHE83hZf5QxVP0lAB7WCrQkAgMtRm6A/mIe5+E25j6qcuFjs
         U4t/N6uuZcq+Mtnvxnmr+wkG+ZQpn7axp4xpKrOSyCCaoOeYQlQ8vJ0yz/QYHwDX5yJi
         f9+UB/183HkOAjXr+a4Z0tjNFhRo+bPqVAMPDWWJc3WrM3RjP1iXhjLjXNbwDjAWELRu
         EVPJ0yKgavBQvcCIC8E1UUCflBXrYdm5Ac844yFu07lbrU3qOpCEzK7D+sevaBGj95x+
         nxhQ==
X-Gm-Message-State: AOJu0Yx4HG0e2EK2ts6nFWAXkjGYdt3cvNieZbmzSsPFVkSTVt9+ZGIS
	IP3HVPB/VT0oqcWQFoWJnGhgTjzq90Cj2KQMLVCazg==
X-Google-Smtp-Source: AGHT+IHf/4g0ckl88vh8B7NAaPWRBEPuiUqA7RhSF/OaNkq65RrrqAUENIJx47f8YuoL+1dF/Uae/bzIzQfZl027bkI=
X-Received: by 2002:a19:ac0a:0:b0:4ff:a04c:8a5b with SMTP id
 g10-20020a19ac0a000000b004ffa04c8a5bmr431476lfc.47.1698358300700; Thu, 26 Oct
 2023 15:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231026-ethtool_puts_impl-v2-0-0d67cbdd0538@google.com>
 <20231026-ethtool_puts_impl-v2-1-0d67cbdd0538@google.com> <20231026220248.blgf7kgt5fkkbg7f@skbuf>
 <CAFhGd8rWOE8zGFCdjM6i8H3TP8q5BFFxMGCk0n-nmLmjHojefg@mail.gmail.com>
In-Reply-To: <CAFhGd8rWOE8zGFCdjM6i8H3TP8q5BFFxMGCk0n-nmLmjHojefg@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 26 Oct 2023 15:11:28 -0700
Message-ID: <CAFhGd8pJkdpF4BYDf_Ym-zsisAVzM06_4ba+_6Uca_2Xerp1Qg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231026_151144_470600_F1BA544D 
X-CRM114-Status: GOOD (  28.88  )
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

On Thu, Oct 26, 2023 at 3:09=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> On Thu, Oct 26, 2023 at 3:02=E2=80=AFPM Vladimir Oltean <olteanv@gmail.co=
m> wrote:
> >
> > Hi Justin,
> >
> > On Thu, Oct 26, 2023 at 09:56:07PM +0000, Justin Stitt wrote:
> > > Use strscpy() to implement ethtool_puts().
> > >
> > > Functionally the same as ethtool_sprintf() when it's used with two
> > > arguments or with just "%s" format specifier.
> > >
> > > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > > ---
> > >  include/linux/ethtool.h | 34 +++++++++++++++++++++++-----------
> > >  net/ethtool/ioctl.c     |  7 +++++++
> > >  2 files changed, 30 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
> > > index 226a36ed5aa1..7129dd2e227c 100644
> > > --- a/include/linux/ethtool.h
> > > +++ b/include/linux/ethtool.h
> > > @@ -1053,22 +1053,34 @@ static inline int ethtool_mm_frag_size_min_to=
_add(u32 val_min, u32 *val_add,
> > >   */
> > >  extern __printf(2, 3) void ethtool_sprintf(u8 **data, const char *fm=
t, ...);
> > >
> > > +/**
> > > + * ethtool_puts - Write string to ethtool string data
> > > + * @data: Pointer to start of string to update
> > > + * @str: String to write
> > > + *
> > > + * Write string to data. Update data to point at start of next
> > > + * string.
> > > + *
> > > + * Prefer this function to ethtool_sprintf() when given only
> > > + * two arguments or if @fmt is just "%s".
> > > + */
> > > +extern void ethtool_puts(u8 **data, const char *str);
> > > +
> > >  /* Link mode to forced speed capabilities maps */
> > >  struct ethtool_forced_speed_map {
> > > -     u32             speed;
> > > +     u32 speed;
> > >       __ETHTOOL_DECLARE_LINK_MODE_MASK(caps);
> > >
> > > -     const u32       *cap_arr;
> > > -     u32             arr_size;
> > > +     const u32 *cap_arr;
> > > +     u32 arr_size;
> > >  };
> > >
> > > -#define ETHTOOL_FORCED_SPEED_MAP(prefix, value)                     =
         \
> > > -{                                                                   =
 \
> > > -     .speed          =3D SPEED_##value,                             =
   \
> > > -     .cap_arr        =3D prefix##_##value,                          =
   \
> > > -     .arr_size       =3D ARRAY_SIZE(prefix##_##value),              =
   \
> > > -}
> > > +#define ETHTOOL_FORCED_SPEED_MAP(prefix, value)                     =
 \
> > > +     {                                                            \
> > > +             .speed =3D SPEED_##value, .cap_arr =3D prefix##_##value=
, \
> > > +             .arr_size =3D ARRAY_SIZE(prefix##_##value),            =
\
> > > +     }
> > >
> > > -void
> > > -ethtool_forced_speed_maps_init(struct ethtool_forced_speed_map *maps=
, u32 size);
> > > +void ethtool_forced_speed_maps_init(struct ethtool_forced_speed_map =
*maps,
> > > +                                 u32 size);
> > >  #endif /* _LINUX_ETHTOOL_H */
> >
> > Maybe this is due to an incorrect rebase conflict resolution, but you
> > shouldn't have touched any of the ethtool force speed maps.
>
> Ah, I did have a conflict and resolved by simply moving the hunks
> out of each other's way. Trivial resolution.
>
> Should I undo this? I want my patch against next since it's targeting
> some stuff in-flight over there. BUT, I also want ethtool_puts() to be
> directly below ethtool_sprintf() in the source code. What to do?

Oh, I just realized my auto formatter had a field day with that function.
I will rectify this in a new version after waiting 24hrs for comments to
trickle in as well.

>
> >
> > Please wait for at least 24 hours to pass before posting a new version,
> > to allow for more comments to come in.
>
> Ok :)
>
> Thanks
> Justin

Thanks
Justin

