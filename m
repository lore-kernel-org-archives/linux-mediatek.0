Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77414C7EE29
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 09:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WSkehpACbIBkuvPEqFsXs2d/6yWL321TN10hmtC+Jg=; b=hTbBgQORd9LVpCil+ozZUtl9Qy
	h/8JHTHyylSt4fUyjQUmU2c0DD7HkgZOAccPi5oZucXnP/3kc0k7Cvzvd+stZPW33IKCjEUfl8mbJ
	en9RI5XU+gNhml/REl02fggaepAxv+BOCFqr8h5QXOWbqlFqb11vMgcs6XurwiIKu7Akd3hDB6BLI
	N6sbfw4MoKpRcX+FLw2zYf29Kp44FT2T8PMBL+lEfOOg26LX/aH1idWVcYuSyHuyaYwWOpIkBsrBo
	+d7zV/oIBfKpsbHz/0oOQaVlkOk/HjTs5tj1yBaAIeDA3pPmi6L6PIRIz04uGK13wX+B3eAeEkEwy
	IPDrP7mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3w7z-00DHO2-0F;
	Tue, 30 May 2023 09:58:55 +0000
Received: from mail-yw1-f181.google.com ([209.85.128.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3w7v-00DHMV-2x;
	Tue, 30 May 2023 09:58:53 +0000
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-565a022ef06so59548127b3.3;
        Tue, 30 May 2023 02:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685440728; x=1688032728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WSkehpACbIBkuvPEqFsXs2d/6yWL321TN10hmtC+Jg=;
        b=FJCrni5r0t/DhdRuneo8tF24NoBaVshIBtv0C7DpjyHQm6pwVPFPE7C8BvQB6gDc3T
         WDQWBOzn2MkBlTfUibkL5Br897ZvU3Ai664Zf3oW7/++heuhLqcTjYbBl789sO0z+pJy
         1kRGAHF50KvcqFskJg6eAo7gPoMV6DdAVlN7nbujFl4mbqM6HpetOCjEvT5RlY6bFoPd
         uyREy5YOxBbapbU5C2MG5i5Xjl/AE+4uDRIxa+yRA9QIStvdaTi5yHqbihmM01Q3gg8N
         PcW6A55ZX9ZA+4h0zDa180Zkn08K1hH27MObgvq9M20qU3Br7MMvl4FsFkxWjfL1IHTe
         2M/w==
X-Gm-Message-State: AC+VfDzYn+UCUGi4LigeGbEzBR2royp25c6ZGX7WIMAkOjgJIcYtX2qS
	yDOwugOpCy5lrSGF1voN3QkSSbsKlbcpfg==
X-Google-Smtp-Source: ACHHUZ6hqrvNAp6dnFDqGLYdxaQ+aB39fNnEwywx6+rdo7BorrBB7Of3otft0OcLk2LK+CHz3OCOEw==
X-Received: by 2002:a81:8607:0:b0:568:98b8:9c2f with SMTP id w7-20020a818607000000b0056898b89c2fmr1492119ywf.46.1685440727925;
        Tue, 30 May 2023 02:58:47 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id e6-20020a81e946000000b0054f80928ea4sm4239807ywm.140.2023.05.30.02.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 02:58:47 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-565a022ef06so59547717b3.3;
        Tue, 30 May 2023 02:58:47 -0700 (PDT)
X-Received: by 2002:a25:1585:0:b0:b9e:7ec8:5d45 with SMTP id
 127-20020a251585000000b00b9e7ec85d45mr1954396ybv.55.1685440727022; Tue, 30
 May 2023 02:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230515131353.v2.cover@dianders> <20230515131353.v2.2.I88dc0a0eb1d9d537de61604cd8994ecc55c0cac1@changeid>
 <CAMuHMdWM_t7uQqkesM3fnSK7THrmLszA7U54==A0-98xPH90Bw@mail.gmail.com> <868rd6cfsy.wl-maz@kernel.org>
In-Reply-To: <868rd6cfsy.wl-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 May 2023 11:58:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6E9JR9A1LxzXMWS8o06L7hawQ9e20=ysjeviv+EOrtA@mail.gmail.com>
Message-ID: <CAMuHMdW6E9JR9A1LxzXMWS8o06L7hawQ9e20=ysjeviv+EOrtA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] irqchip/gic-v3: Disable pseudo NMIs on Mediatek
 devices w/ firmware issues
To: Marc Zyngier <maz@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, 
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
X-CRM114-CacheID: sfid-20230530_025851_952439_D71321F6 
X-CRM114-Status: GOOD (  42.65  )
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

Hi Marc,

On Tue, May 30, 2023 at 11:46=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
> On Tue, 30 May 2023 09:29:02 +0100,
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
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
>                 if (quirks->compatible &&
>                     !of_device_is_compatible(np, quirks->compatible))
>                         continue;
>
> If that works for you, I'll queue it ASAP.

Thanks, that fixes the issue for me on Renesas White-Hawk (R-Car V4H).
No regressions on Koelsch (R-Car M2-W) and Salvator-XS (R-Car H3 ES2.0).
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

