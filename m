Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174D7C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 16:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmljBxLjijPPRFlX5mO8wqHeqzDYN0rcYWjJkP07F34=; b=RstYmvMA+DHzC2hUzDvCjelkSN
	upn12SMPemn4Bg7+l2G9tmB6SGlVf7oOKZj+NAIR3wEfLPDqdxKpSQMW6w1pIxt/8bkh87fJTLfdA
	CevjBic9oqU0VpcyjxsNGSdsvbmmKcJWbIIQJt2msw9vB55lq5TlkDvHvZeMcm/OsGiox4JnA6+nc
	VUHAOF6UjMucuSSWaaMycn2ek0pQsXltaTGGKUYvLiRUiSwkL0iRF6wB9zepa+caWWLMJKi6ayKXF
	pZF49yt6jDCdH5wI6vExNp34f274jgodQmGC9FinDg2oqx43H4a8iyDUhCv1hPuwJUN5WeWquGi9g
	tz9JUSQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q42L9-00Eaxi-2v;
	Tue, 30 May 2023 16:36:55 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q42L6-00Eaw1-3D
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 16:36:54 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-774924b7c4dso345424539f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 09:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685464609; x=1688056609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmljBxLjijPPRFlX5mO8wqHeqzDYN0rcYWjJkP07F34=;
        b=Q3fCEgo6ee8C0yqU75pmQFn1e0meUnO4bOKNQXsgA/naV/EsIoRwh+U086HoV+Ik22
         eP8CBhOZo5mQA2W33iLZIoPmziv2jZfLQb9BIaI38WhF2ZEYpcGTLB9KY1QjwFcyAfUR
         QkVdyX1Eo4PcP/ia6TfEag07rgRjztFllSuC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685464609; x=1688056609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmljBxLjijPPRFlX5mO8wqHeqzDYN0rcYWjJkP07F34=;
        b=PZHo787gpp+2P1uIivJZul8B8jcTh290XvKAMlAtYy6SxNSVnCSqr4BwVeg3gKoy+S
         mdbQcF6WJ71WUFIpiKLsdJqRluZ1N+wRjuGLOFIhIJk2W1nFpvvlgYTPwYE+AmeppZV2
         MK0csV8TjqSDjSBzLBHbJwleS7xoQxwByeCXpMvQ3NKKnLRfQWAJN3sYymNMeRgnm+Hs
         w8EI4oGc2pGgUCc44bMLmdUuhJ9Ezb4EGxjIdxTZkjzcduteSTU5lj9hgNXlytDUN1d7
         OlDyjcEFUPhGQcT5VDQRt9XkKguPHlZ7S32yK1RDukOor7ffarslBtzfmgKh/LnjtdzS
         mM5g==
X-Gm-Message-State: AC+VfDzwr9GvghSFOeVEwJeO5GXi7oQKIgrLD2NIVgm3MVMjRwr8LEbr
	OxvTEu0lB81o02ublAu8NbjJlaiVadjAdKuJYzc=
X-Google-Smtp-Source: ACHHUZ5y0em9dUadoKQ18zxK9ddQ9/PJ8+ujnqvq7IIECQz2nl38zybdgGdcMn7sgRrIzcQ+A9cSKw==
X-Received: by 2002:a92:d410:0:b0:33b:4d0c:e947 with SMTP id q16-20020a92d410000000b0033b4d0ce947mr172326ilm.0.1685464609599;
        Tue, 30 May 2023 09:36:49 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id x18-20020a92cc92000000b0032f8a284f99sm2566012ilo.20.2023.05.30.09.36.47
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 09:36:47 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-33b398f2ab8so2175ab.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 09:36:47 -0700 (PDT)
X-Received: by 2002:a05:6e02:1d1e:b0:33b:4a8c:2147 with SMTP id
 i30-20020a056e021d1e00b0033b4a8c2147mr183809ila.8.1685464606562; Tue, 30 May
 2023 09:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230515131353.v2.cover@dianders> <20230515131353.v2.2.I88dc0a0eb1d9d537de61604cd8994ecc55c0cac1@changeid>
 <CAMuHMdWM_t7uQqkesM3fnSK7THrmLszA7U54==A0-98xPH90Bw@mail.gmail.com> <868rd6cfsy.wl-maz@kernel.org>
In-Reply-To: <868rd6cfsy.wl-maz@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 May 2023 09:36:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbD3jPuy=eqnrsTyQpq89PFW12+fy_YufcEirJ9CYt1Q@mail.gmail.com>
Message-ID: <CAD=FV=XbD3jPuy=eqnrsTyQpq89PFW12+fy_YufcEirJ9CYt1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] irqchip/gic-v3: Disable pseudo NMIs on Mediatek
 devices w/ firmware issues
To: Marc Zyngier <maz@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	Eddie Huang <eddie.huang@mediatek.com>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wenst@chromium.org, 
	yidilin@chromium.org, Tinghan Shen <tinghan.shen@mediatek.com>, jwerner@chromium.org, 
	Weiyi Lu <weiyi.lu@mediatek.com>, Ben Ho <Ben.Ho@mediatek.com>, 
	Seiya Wang <seiya.wang@mediatek.com>, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_093653_034738_8A87CA86 
X-CRM114-Status: GOOD (  36.60  )
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

On Tue, May 30, 2023 at 2:46=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Tue, 30 May 2023 09:29:02 +0100,
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Douglas,
> >
> > On Mon, May 15, 2023 at 10:16=E2=80=AFPM Douglas Anderson <dianders@chr=
omium.org> wrote:
> > > Some Chromebooks with Mediatek SoCs have a problem where the firmware
> > > doesn't properly save/restore certain GICR registers. Newer
> > > Chromebooks should fix this issue and we may be able to do firmware
> > > updates for old Chromebooks. At the moment, the only known issue with
> > > these Chromebooks is that we can't enable "pseudo NMIs" since the
> > > priority register can be lost. Enabling "pseudo NMIs" on Chromebooks
> > > with the problematic firmware causes crashes and freezes.
> > >
> > > Let's detect devices with this problem and then disable "pseudo NMIs"
> > > on them. We'll detect the problem by looking for the presence of the
> > > "mediatek,broken-save-restore-fw" property in the GIC device tree
> > > node. Any devices with fixed firmware will not have this property.
> > >
> > > Our detection plan works because we never bake a Chromebook's device
> > > tree into firmware. Instead, device trees are always bundled with the
> > > kernel. We'll update the device trees of all affected Chromebooks and
> > > then we'll never enable "pseudo NMI" on a kernel that is bundled with
> > > old device trees. When a firmware update is shipped that fixes this
> > > issue it will know to patch the device tree to remove the property.
> > >
> > > In order to make this work, the quick detection mechanism of the GICv=
3
> > > code is extended to be able to look for properties in addition to
> > > looking at "compatible".
> > >
> > > Reviewed-by: Julius Werner <jwerner@chromium.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > > Changes in v2:
> > > - mediatek,gicr-save-quirk =3D> mediatek,broken-save-restore-fw
> >
> > Thanks for your patch, which is now commit 44bd78dd2b8897f5
> > ("irqchip/gic-v3: Disable pseudo NMIs on Mediatek devices w/
> > firmware issues") in v6.4-rc4.
> >
> > This causes enabling an unrelated workaround on R-Car V4H:
> >
> >     GIC: enabling workaround for GICv3: Cavium erratum 38539
> >
> > > --- a/drivers/irqchip/irq-gic-common.c
> > > +++ b/drivers/irqchip/irq-gic-common.c
> > > @@ -16,7 +16,11 @@ void gic_enable_of_quirks(const struct device_node=
 *np,
> > >                           const struct gic_quirk *quirks, void *data)
> > >  {
> > >         for (; quirks->desc; quirks++) {
> > > -               if (!of_device_is_compatible(np, quirks->compatible))
> > > +               if (quirks->compatible &&
> > > +                   !of_device_is_compatible(np, quirks->compatible))
> > > +                       continue;
> > > +               if (quirks->property &&
> > > +                   !of_property_read_bool(np, quirks->property))
> > >                         continue;
> >
> > Presumably the loop should continue if none of quirks-compatible
> > or quirks->property is set?
>
> Indeed, thanks for pointing that out. Can you give the following hack
> a go (compile tested only)?
>
> diff --git a/drivers/irqchip/irq-gic-common.c b/drivers/irqchip/irq-gic-c=
ommon.c
> index de47b51cdadb..7b591736ab58 100644
> --- a/drivers/irqchip/irq-gic-common.c
> +++ b/drivers/irqchip/irq-gic-common.c
> @@ -16,6 +16,8 @@ void gic_enable_of_quirks(const struct device_node *np,
>                           const struct gic_quirk *quirks, void *data)
>  {
>         for (; quirks->desc; quirks++) {
> +               if (!quirks->compatible && !quirks->property)
> +                       continue;

Sorry for missing this and thanks for the fix. Looks like this is
already committed, but in case it matters:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

