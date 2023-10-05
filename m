Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C32E9270D
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Oct 2023 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68bjcUX5hs6+inYPf70/vLT8wlDEox6QRQHbzrWGlAc=; b=dFnPBShb/flGtnnR8zbRSiyUPc
	yhGDtTz1fAMXv9r0A8I88Vy60/TDWsPhRVdvrHa/lt7r76h3eSa7DL5csJ5oki++D2VNLXfT9Gb4P
	PcA/pnPIoqPCPZMPORGdN4OSehBdjSD23z+jdxbnkwja47otkFsHij0IIcvB20bZOv3BMyiBRkNBF
	GrVs4QsGuqvFcpUx7n29B0fcdry776RPgWzZvdp5ve/zU2rxxjbi5968NcWt24IOW7q8qgEKxfAVy
	LGSMjFzrdt9BC87+MzRmbVW3GJYW18CluKsqS0U7Seyr+rjmw3RcpDVSCzgb0d1GM70vANvk5WGYT
	OO+BSJGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoQVn-003vME-2Y;
	Thu, 05 Oct 2023 15:43:39 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoQVg-003vJC-1t
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Oct 2023 15:43:36 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99de884ad25so209327566b.3
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Oct 2023 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696520607; x=1697125407; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68bjcUX5hs6+inYPf70/vLT8wlDEox6QRQHbzrWGlAc=;
        b=MdWqqmiiD+4SOBfTMpQ3KzcPd3+Ci5G1MW/zgZmVd0vJy44Qwsgo/5DaUmIrULO0hZ
         7rr4P8m7AujZsWr7jrK7vqYqNmzXjO+A4lSBAxhRODwVJxifPIe63d1i/VV3poYuvmMy
         UG893YAzSW/OMej2dVBFtDm+eT16GpAC8amHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696520607; x=1697125407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68bjcUX5hs6+inYPf70/vLT8wlDEox6QRQHbzrWGlAc=;
        b=eD+hbx529/izUYlgJFxoP5rO3N0tPcjJ/iMYcgkbZ5ZtYU5M45KEIMucBB8vQKE/dE
         h5PgvJvKGmTsH2PnQev/9xlQPVC2qFsTdCT1cJ+ZqZko68Jr/jqaBXy20/YOJRn9md+G
         GPAGRMre00JZhd0UhC2iHPNd+1rskKDW7yweXvolzmom/uq9SjIHp9YMR9qyMOOYADF7
         WkD8fJYQEAsAKFZfK7LDZJ/jv1FbefEF/Ix8IqnnsN2J2CNewm7cHDVH4pYRA8fIJlMh
         zWbIG3jG9ES4678q31c2ZUiSuij3N85gZKnxVb54DAk8z0qXsF0f1Tn4ICvr95LcMCMi
         +lwQ==
X-Gm-Message-State: AOJu0Yxq39RNEVSRG8c7GLFWLse/4YfWWfdeWLVBHryfg/Pn7fHHil8m
	G9EJg7QhdmExmdTFyusZLwOKDlZsJBY9pcOk1/YSULtq
X-Google-Smtp-Source: AGHT+IGmGfmjCecfRTiETP//RDsVLZdGe1YV/Q80ZDP485CsorpuGT9t4hFPsA3myQgBbSXHW4pusw==
X-Received: by 2002:a17:906:5188:b0:9b2:d554:da15 with SMTP id y8-20020a170906518800b009b2d554da15mr5247603ejk.38.1696520606695;
        Thu, 05 Oct 2023 08:43:26 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id fi10-20020a170906da0a00b009ad8796a6aesm1383495ejb.56.2023.10.05.08.43.26
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 08:43:26 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-537f07dfe8eso11855a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Oct 2023 08:43:26 -0700 (PDT)
X-Received: by 2002:a05:600c:3414:b0:3f4:fb7:48d4 with SMTP id
 y20-20020a05600c341400b003f40fb748d4mr61209wmp.3.1696520112451; Thu, 05 Oct
 2023 08:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231002094526.1.Ie8f760213053e3d11592f892b30912dbac6b8b48@changeid>
 <ZRr8r7XMoyDKaitd@FVFF77S0Q05N.cambridge.arm.com> <CAD=FV=UeeL9uycVeKpOm+eDm3xHrOnKi2frt6a1qFG1HX9yEUg@mail.gmail.com>
 <ZRwJKBZaYwF1rrur@FVFF77S0Q05N> <CAD=FV=WASz1uvTgwsu3H3cTr3smHk+E_XNUVnjoPpttwv095rQ@mail.gmail.com>
 <ZRxCCZxZWCG0NBur@FVFF77S0Q05N> <CAD=FV=Xk-OMKQPXxU9Z9HOcWwUxxrmLZ4vD0u5ouZRW_zDFDPg@mail.gmail.com>
 <ZR03liCodnTQWs7s@FVFF77S0Q05N> <86jzs2ofqs.wl-maz@kernel.org>
 <CAD=FV=XasZR6dhKBjpbYfby4F1Nu_bsq1m_HP+NpufjsJi0COg@mail.gmail.com> <ZR6Pjk_3gpx1K3pF@FVFF77S0Q05N>
In-Reply-To: <ZR6Pjk_3gpx1K3pF@FVFF77S0Q05N>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Oct 2023 08:34:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VbxM-hftVKsp2JhQpnQm9u_H86rQbnucS5-x-q8j0QQA@mail.gmail.com>
Message-ID: <CAD=FV=VbxM-hftVKsp2JhQpnQm9u_H86rQbnucS5-x-q8j0QQA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: smp: Fix pseudo NMI issues w/ broken Mediatek FW
To: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
	Valentin Schneider <vschneid@redhat.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	D Scott Phillips <scott@os.amperecomputing.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Misono Tomohiro <misono.tomohiro@fujitsu.com>, 
	Peter Zijlstra <peterz@infradead.org>, Sumit Garg <sumit.garg@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_084332_633450_942DBF4D 
X-CRM114-Status: GOOD (  34.25  )
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

Hi,

On Thu, Oct 5, 2023 at 3:27=E2=80=AFAM Mark Rutland <mark.rutland@arm.com> =
wrote:
>
> On Wed, Oct 04, 2023 at 07:04:12AM -0700, Doug Anderson wrote:
> > On Wed, Oct 4, 2023 at 3:15=E2=80=AFAM Marc Zyngier <maz@kernel.org> wr=
ote:
> > >
> > > On Wed, 04 Oct 2023 10:59:50 +0100,
> > > Mark Rutland <mark.rutland@arm.com> wrote:
> > > >
> > > > Given you haven't seen any issues, I suspect those are getting rese=
t to fixed
> > > > values that happens to work out for us, but it is a bit worrisome m=
ore
> > > > generally (e.g. the LPI case above).
> > >
> > > It is likely that these SoCs don't even have an ITS.
> >
> > Right. That was what we decided [1] when Marc pointed this out earlier.
> >
> > Overall: we know that this firmware behavior is not good but we're
> > stuck with it. :( At the very least, any new devices coming out will
> > have this fixed. Presumably if old devices are working OK enough today
> > (as long as you don't enable pseudo-NMI) then they can be made to keep
> > working?
> >
> > So circling back: what patch should we actually land?
>
> For now I'd prefer we took the patch I sent in:
>
>   https://lore.kernel.org/linux-arm-kernel/ZRr8r7XMoyDKaitd@FVFF77S0Q05N.=
cambridge.arm.com/
>
> ... as that leaves us no worse than before this series, and it's pretty s=
imple.

Sounds good to me!

Catalin / Will: Please yell if there's anything you need me to do.
Otherwise I'll assume you'll pick up Mark's patch instead of my patch
#1 and then you'll pick up my patch #2.


> > As of right now only pseudo-NMI is broken, but it would be good to make=
 sure
> > that if the kernel later adds other features that would be broken on th=
is
> > hardware that it gets handled properly...
>
> Going further than the above, I think there are three options here:
>
> 1) Complete fix: depend on a working firmware, and throw this workaround =
away.
>
>    IIUC from the above, that's not something you can commit to.

Right. We've landed the fix in the firmware branch for many of the
devices that had the issue but there's a whole process (and cost
involved) in getting this actually rolled out. Each unique board needs
to kick off a FW qual. Given that nothing is actually broken today
it's hard to justify a FW qual just for this, so we're left
piggybacking on the next reason for a FW qual (if there is one).
...even if we could kick them off all instantly, though, it's always
best not to rely on a FW fix, especially if (as in this case) it's to
keep us from crashing. There'll always be some case where someone
tries to boot a new OS with an old firmware. One such case can happen
when booting recovery images on ChromeOS where the device always boots
from the Read-only (not updatable) firmware.


> 2) Partial fix: have the kernel save/restore everything.
>
>    IIUC this is unpalatable.

Yeah, Marc already NAKed it.


> 3) Partial fix: make the ARM64_HAS_GIC_PRIO_MASKING cpucap depend on the
>    absence of a "mediatek,broken-save-restore-fw" property in the DT. I b=
elieve
>    we can check that in early_enable_pseudo_nmi() or can_use_gic_prioriti=
es().
>
>    That'll avoid potential issues if/when we change the priorities used f=
or
>    pNMI (which is something I've been looking at).
>
> I'm happy with (3) if Marc is.

Yeah, that seems best to me as a long term solution, too.

-Doug

