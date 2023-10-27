Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7D8C25B47
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Oct 2023 19:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzKQXsJ9PPJ95N5huUjFyALdgbkkeZmKhRTaQ99Yt+o=; b=BxGBCHdcltwnP4+dXbWHutYUwg
	5viloTJ3lvDEhHFoVp1wXujX0/EEVAPnnIdOrqbz9r5DSVWvYMEOO+hxXOo5yitWaNyuN5av8fTIl
	8FuFazF+l+A35oymqh01mHmHFGRAFrumthHSHIkqaWpyIxHZw1pxO/bkPKfk1mvHXdjAAAk5CmOdQ
	dyKpJ7gH+QbPpxS9gL7abAG4pwHBzXBeY5JzLgjwaH1Dq94hzxOWY5CEZCxyvk28hnzzCwpKGkFtf
	7HVcY2qshA3UM700VTyXbBG7Ln6RJBn1Fc+jjh33NKUZUIVFZ80jvzk9V5NtWxih96mfyzbD/MhXT
	8SxPYR/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwShW-00H8LT-0c;
	Fri, 27 Oct 2023 19:40:58 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwShS-00H8Kp-2O
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Oct 2023 19:40:56 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9c3aec5f326so747736466b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Oct 2023 12:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698435651; x=1699040451; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzKQXsJ9PPJ95N5huUjFyALdgbkkeZmKhRTaQ99Yt+o=;
        b=FKJCmDx2erucv0dCbl3fPmszEDvcQ04MD41X9QSSTiStJTdik9mpwj0DwsCKjoK+9/
         jufLiD8xVdNvUWCjlXkBK97XHLIcG0MbUGfzTknuLNTVmeVwrtz6S7cGnXMWwjHtWvwu
         jjVwAuHCwz3bFMMjcRkqB1j2hfpg5c4zgzRhmAfu8iGlzJlssDQVG9WgvZk0ZQ0j85Qo
         NydqhmI8LWwNGwREQ+2K9FCRpVDnBsvXzId64on9VjRAJ+omZ0FYgLJ2j1t73Bfbihvq
         3fi35SOu1HGV4GZ+ho9nhzA/dRJ2hrLD0/qXUv1N0SKuABWFlahNqT7a/eJ94GPR/H/9
         ORLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698435651; x=1699040451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xzKQXsJ9PPJ95N5huUjFyALdgbkkeZmKhRTaQ99Yt+o=;
        b=WUNrDJjj7mQbG0rKts80254bIgi/v0fYRdXMrQPQHxG/JEXHp9qWvslN8Jo08cJp/Z
         04E1SErA/Gv7xeJyKitPVGSAoHoMu8W26VYmqGw7Zt9D3tssxfWicyKLJ1G2UkE9fneS
         0QQwbRZ/PkohySgf9cnQaQvr1sIguGz4BUj+s1XtKXXQzX936nQuk1JPlqQjtzaB+ttp
         /BFRokoamRawiQsDooHcQ/ag/LAaPOObZ+u8efXWAcP33Ifg35Of00UiPSNgk1pJxUod
         IeAaw7zeJ+EvIcn4WYgTdDRQjzaykVmNAyf8adatcMBx3uZ1JbOwIlRGvqgKw07g8upv
         Sz9A==
X-Gm-Message-State: AOJu0YxpwOTx2NqN7KEZdzEesDnQhKJCV/YMMpm3+ow6BktxZJXyrvt6
	ICitk1q/btpWGMKH1Xztksf4qIiEWvavAXEY+9W+qw==
X-Google-Smtp-Source: AGHT+IEPfEM/trnfZm6cOr0U7cu+iGr19zJct2V4K5qR5GqFK9SelPMa/Z/9udzIJpJO7oi3U+zFq2t/7LTPw2L/vcI=
X-Received: by 2002:a17:907:2da3:b0:9c3:97d7:2c67 with SMTP id
 gt35-20020a1709072da300b009c397d72c67mr3978966ejc.25.1698435651329; Fri, 27
 Oct 2023 12:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231026-ethtool_puts_impl-v2-0-0d67cbdd0538@google.com>
 <20231026-ethtool_puts_impl-v2-2-0d67cbdd0538@google.com> <8521c712250bcffce5c71e8d2b2574de786d4572.camel@perches.com>
In-Reply-To: <8521c712250bcffce5c71e8d2b2574de786d4572.camel@perches.com>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 27 Oct 2023 12:40:39 -0700
Message-ID: <CAFhGd8p9ytqbRuqgWmKe=zCg7Nhft0NMvbuuEyjAQHNAcBedaQ@mail.gmail.com>
Subject: Re: [PATCH next v2 2/3] checkpatch: add ethtool_sprintf rules
To: Joe Perches <joe@perches.com>
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
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Andy Whitcroft <apw@canonical.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	=?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
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
X-CRM114-CacheID: sfid-20231027_124054_883750_C4820D03 
X-CRM114-Status: GOOD (  20.89  )
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

On Thu, Oct 26, 2023 at 3:39=E2=80=AFPM Joe Perches <joe@perches.com> wrote=
:
>
> On Thu, 2023-10-26 at 21:56 +0000, Justin Stitt wrote:
> > Add some warnings for using ethtool_sprintf() where a simple
> > ethtool_puts() would suffice.
> []
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -7011,6 +7011,25 @@ sub process {
> >                            "Prefer strscpy, strscpy_pad, or __nonstring=
 over strncpy - see: https://github.com/KSPP/linux/issues/90\n" . $herecurr=
);
> >               }
> >
> > +# ethtool_sprintf uses that should likely be ethtool_puts
> > +             if ($line =3D~ /\bethtool_sprintf\s*\(\s*$FuncArg\s*,\s*$=
FuncArg\s*\)/) {
> > +                     if(WARN("ETHTOOL_SPRINTF",
> > +                        "Prefer ethtool_puts over ethtool_sprintf with=
 only two arguments\n" . $herecurr) &&
> > +         $fix) {
> > +         $fixed[$fixlinenr] =3D~ s/ethtool_sprintf\s*\(/ethtool_puts\(=
/;
> > +       }
> > +             }
> > +
> > +             # use $rawline because $line loses %s via sanitization an=
d thus we can't match against it.
> > +             if ($rawline =3D~ /\bethtool_sprintf\s*\(\s*$FuncArg\s*,\=
s*\"\%s\"\s*,\s*$FuncArg\s*\)/) {
> > +                     if(WARN("ETHTOOL_SPRINTF",
> > +                        "Prefer ethtool_puts over ethtool_sprintf with=
 standalone \"%s\" specifier\n" . $herecurr) &&
> > +         $fix) {
> > +         $fixed[$fixlinenr] =3D~ s/ethtool_sprintf\s*\(\s*(.*?),.*?,(.=
*?)\)/ethtool_puts\($1,$2)/;
>
> Thanks, but:
>
> This fix wouldn't work if the first argument was itself a function
> with multiple arguments.
>
> And this is whitespace formatted incorrectly.
>
> It:
>
> o needs a space after if
> o needs a space after the comma in the fix
> o needs to use the appropriate amount and tabs for indentation
> o needs alignment to open parentheses
> o the backslashes are not required in the fix block
>
> Do you want me to push what I wrote in the link below?
> https://lore.kernel.org/lkml/7eec92d9e72d28e7b5202f41b02a383eb28ddd26.cam=
el@perches.com/

Ah, I didn't see you provided a diff in previous thread.

Yeah you can push it but it's not really a standalone so perhaps I'll
just steal the diff and
wrap into v3?

>
> > +       }
> > +             }
> > +
> > +
> >  # typecasts on min/max could be min_t/max_t
> >               if ($perl_version_ok &&
> >                   defined $stat &&
> >
>

Thanks
Justin

