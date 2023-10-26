Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31CAC25B6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 22:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YeD8ayoKI+cNQ+dfy3v3WycX2QANJHfshgC8v+Kwnbw=; b=YnvLGK2iRRLW/FitLxq0c8wYG1
	Wl3dR89qTSNdFe/rIvbyhUheCnSPesn5WkkGPYIFl7uVzmlXv81w+kWx6YPFhVogsXWPsavxWm5VT
	4m+7WWlmcWP2+UTeVC7Sf1yIEVSxwFRGuEMssopXUn2deSCgk6Xil9ldT5DzfNSZWfAIDZ5b6VnBa
	kHWtjibZt70QjIQcb4IAvyMH7WJpjsNmY8Y4BgNRHx6mQ1AvE1Jfe9wgiuLEQNmwJ7Zi/lM3R9Qzq
	1kyjxAPRNUC7m5evmz2DdJpaQ3MHrn0VIWm5PzqcWeNfAGx2gX9L39B5Rdr909uI1K5STCl/28FKy
	fzaq39dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8mv-00FFYe-28;
	Thu, 26 Oct 2023 22:25:13 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8mr-00FFXU-2e
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Oct 2023 22:25:11 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-53e08b60febso2162298a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Oct 2023 15:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698359107; x=1698963907; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeD8ayoKI+cNQ+dfy3v3WycX2QANJHfshgC8v+Kwnbw=;
        b=AQn6eB1UocUyB0khrENEioHKhb7B8HrkTGdHeV4r/aTCEaTyig0LgTgub0vH4AIhNt
         vaO+ZHrJOYikYdCREZdkbHpVUtHF0yul0Dx1ndkdE8VsXWJAtrar8qEtnu8aYKZHvaai
         +mq3vJfjpb8DMXaB20+4wDT9l8kPsmgvDnIjhWyymr/adptRA3Em41aQX5yG2sKan7OB
         ccCutZuwqnB1hJH1mJPs3ARXNGXxOUUvtoWCf73vXlqRLwMSHCeTrngLvK50YqOFOJOk
         ifxfP+pPO6/i8J3Y4L0MYwZZ3HKXbXvSUP+cdxQiXM0x/R9N/RctzGPVWRJINHs+SdQ1
         /zEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698359107; x=1698963907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeD8ayoKI+cNQ+dfy3v3WycX2QANJHfshgC8v+Kwnbw=;
        b=kg1Nd4ZI6P9eUMEglu6YUbqRQi+IRd7kO2VSS9jU0w3KfGfdGgC23jl20Uzqe7MieZ
         Rfvhf2YPsvsqnU2/S2loI/o1aNfd6kkrWXMUFmcbO8ZtbIkU+6q3nLSTvpZBO5skCehm
         21SD+tAd9Oy7QzL3C366V4cGt6fVjH6ibxcOxR5Roeh9myJbKFpBrswLr/FdKveNV8e4
         HulmnLHnIixfZJh6PF08C3oO/KkvRhKwoQ9JYIw/d6U80m1NDsW0G76B1RnTa1jPGfwK
         kWdi9H40o8HGvpfsMTZOFuOXSEemgMhbO8cv/4dfD56VQ5Ww/PAqsveDtA2+zDga/y7W
         P4Bg==
X-Gm-Message-State: AOJu0YyQMNGRQuc9GD2kpUf5iXlWhK0A7HAk8GeJu7WYnEpnSajMuoKQ
	hfXW/f4eGe9DYwfeBXVbdlBSbpwXD1uXEycV4l5s2A==
X-Google-Smtp-Source: AGHT+IEDCJBHZUfT8pOveWHXKzhM9wbznVGkZxbqGNmoGRYpA7P/cGpiYUPu1qoNnYeFP4ggNqE2H/AXW9GW4yBSvD0=
X-Received: by 2002:a17:907:928b:b0:9ae:46c7:90fe with SMTP id
 bw11-20020a170907928b00b009ae46c790femr740516ejc.72.1698359106926; Thu, 26
 Oct 2023 15:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231026-ethtool_puts_impl-v2-0-0d67cbdd0538@google.com>
 <20231026-ethtool_puts_impl-v2-2-0d67cbdd0538@google.com> <20231026221206.52oge3a5w4uxkkd5@skbuf>
In-Reply-To: <20231026221206.52oge3a5w4uxkkd5@skbuf>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 26 Oct 2023 15:24:54 -0700
Message-ID: <CAFhGd8r-u193pBk2+WWF+sHWEo5ixxEiT=fcSYiuy5W+aWDsbg@mail.gmail.com>
Subject: Re: [PATCH next v2 2/3] checkpatch: add ethtool_sprintf rules
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
X-CRM114-CacheID: sfid-20231026_152509_907673_A581055A 
X-CRM114-Status: GOOD (  24.39  )
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

On Thu, Oct 26, 2023 at 3:12=E2=80=AFPM Vladimir Oltean <olteanv@gmail.com>=
 wrote:
>
> On Thu, Oct 26, 2023 at 09:56:08PM +0000, Justin Stitt wrote:
> > Add some warnings for using ethtool_sprintf() where a simple
> > ethtool_puts() would suffice.
> >
> > The two cases are:
> >
> > 1) Use ethtool_sprintf() with just two arguments:
> > |       ethtool_sprintf(&data, driver[i].name);
> > or
> > 2) Use ethtool_sprintf() with a standalone "%s" fmt string:
> > |       ethtool_sprintf(&data, "%s", driver[i].name);
> >
> > The former may cause -Wformat-security warnings while the latter is jus=
t
> > not preferred. Both are safely in the category of warnings, not errors.
> >
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > ---
> >  scripts/checkpatch.pl | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 25fdb7fda112..22f007131337 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
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
> > +       }
> > +             }
> > +
> > +
> >  # typecasts on min/max could be min_t/max_t
> >               if ($perl_version_ok &&
> >                   defined $stat &&
> >
> > --
> > 2.42.0.820.g83a721a137-goog
> >
>
> I don't really know Perl, but does the indentation and coding style here
> conform to any rules, or is it just free-form? The rest of the script
> looks almost as you'd expect from C. This is unreadable to me.

There was some discussion here [1] but AFAICT I need to use EMACS
or configure my vim in a very particular way to get the same formatting

But yeah, look around line 7000 -- lots of this pattern matching code is
pretty hard to read. Not sure there's much to be done as far as readability
is concerned.

[1]: https://lore.kernel.org/all/137a309b313cc8a295f3affc704f0da049f233aa.c=
amel@perches.com/

Thanks
Justin

