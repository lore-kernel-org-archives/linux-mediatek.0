Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF50C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 10:00:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67AFF20781
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 10:00:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RA9Jbsor";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgQJdDhF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67AFF20781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WpIGuOZL7uVX7j6rC67waozgSj3kP026U+KrQKuQtOs=; b=RA9JbsorQXo/e387DwjZYPKCo
	6u2MUhuVTtQVf8Oqr5IEb8msEV1MgCLBaqPpMxDJDyxmLFFm8UEFlN+rBbRFvSubjsPNLHavAh2LT
	vp/XRIn55RoVC4NqcZjuwL0lbbWz/fLFTmcNIPLG+czdBYIIUSGgQfPMQSRoCbKsUPGcapctxhAhW
	xytaDOD+n/jtp5sxeep1B1CjpWAqJPwPdmKt/idGddtOhjs6C/EAC3sdKY7JwtYBMBjsblwvGUvBA
	cnjZiw7CKgF9d1P+2rG6fWLfR86nCrvzn4aiHw9sT7mn2LEseu82zs/DW+Ia62remERsP13Flr4sU
	KnL0dUOEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6A2P-0008Ht-Cw; Thu, 13 Aug 2020 10:00:45 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6A2N-0008Gw-LO; Thu, 13 Aug 2020 10:00:44 +0000
Received: by mail-pj1-x1043.google.com with SMTP id l60so2547174pjb.3;
 Thu, 13 Aug 2020 03:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lr+XPSui9MVitN/YHK0a7wRgaRs8jhxh1g6LAoEgFFI=;
 b=mgQJdDhFJsY+4ZZX7nEd7PUwFxnI/GND9MTZddYsJCzitgcZ8MJKOwXL8SWS8NZDjY
 R3WQ0U7ZX6RWtqId3eSKxzrexiVUkm2RMXbUo5ZS1MN3yIse3C5RWZVhXDKYtP/GuldE
 mgF1hswi5xwPoWYi3izh0o7+NrQ5IYVWkka5O99Ga5km9xVUt8hYGWD0FOWJj10lyO0b
 8B1ajYPiFpCYyMoGEfYJOVJdE8b9GuCrYYoF6wwfPEJq+HWjmJLHJGB7GhGKLpDXgCtg
 cdp0MyDny9Xmw6tbbDHfgqlm6hkES9WGQrf1WUbgF4aHv7BGVPCOlR7iJy1eubUGuXiv
 tFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lr+XPSui9MVitN/YHK0a7wRgaRs8jhxh1g6LAoEgFFI=;
 b=FXCF0bBsGdpkKnNFxrx/aDqEdvm2KGxtAh2I35kZAS/nz1h4sQc/IVQQBTwSXlOIkk
 AwvfBK+Ymbf6iAJ00z8YGU092tV9niZ+SmRchMnQtIAaq5T/tGLQbtzvG47i9llHL6Kn
 lwlpemj2qysR+uZy+EwOI05saRFpg3hlPXggSqsbChcoEkc1Ery6m4vGJPuHtGdDHwLe
 QRlggrCizfNvRagEWBZgIcyLRuchx52DU2HKqSbMZ8i16V4ykwmcE8eIvKZ0cKZjPBlD
 c/+3s5h2sSCuNkioL7r+uafsAYs7HIupO33AyHPO0pZvb6GKa+F4V9wGO+GGa91ijb0Z
 c3gQ==
X-Gm-Message-State: AOAM5320taaXNeqMIQ9TaXpLY+CH7z6ug0d3jJCvQonirKqDdxpOYk8C
 bBkf31JzgqdfC39HtFlL1Fkar75S7btUgnG3cyw=
X-Google-Smtp-Source: ABdhPJz38GeLmThoezC6lraEWn1MkImxxv3Tn3zbkSqQi3x5qtMSX50ThTooPvM8JHxj3dDmc1o23Vd8TYq7Iec2SNE=
X-Received: by 2002:a17:902:d3cb:: with SMTP id
 w11mr3178004plb.255.1597312839745; 
 Thu, 13 Aug 2020 03:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200810065128.3324-3-fengping.yu@mediatek.com>
 <20200813005509.GU1665100@dtor-ws>
In-Reply-To: <20200813005509.GU1665100@dtor-ws>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 13 Aug 2020 13:00:24 +0300
Message-ID: <CAHp75VfKckoK4facC3nMDLLUYUtd5Y66+E5xgkVpVYfyTTa9Hg@mail.gmail.com>
Subject: Re: [PATCH v17 2/3] drivers: input: keyboard: Add mtk keypad driver
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_060043_731360_AB9946B7 
X-CRM114-Status: GOOD (  23.18  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-input <linux-input@vger.kernel.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Fengping Yu <fengping.yu@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 13, 2020 at 3:57 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Mon, Aug 10, 2020 at 02:51:28PM +0800, Fengping Yu wrote:
> > From: "fengping.yu" <fengping.yu@mediatek.com>
> >
> > This patch adds matrix keypad support for Mediatek SoCs.

...

> > +static irqreturn_t kpd_irq_handler(int irq, void *dev_id)
> > +{
> > +     struct mtk_keypad *keypad = dev_id;
> > +     unsigned short *keycode = keypad->input_dev->keycode;
> > +     DECLARE_BITMAP(new_state, MTK_KPD_NUM_BITS);
> > +     DECLARE_BITMAP(change, MTK_KPD_NUM_BITS);
> > +     int bit_nr;
> > +     int pressed;
> > +     unsigned short code;
> > +
> > +     regmap_bulk_read(keypad->regmap, MTK_KPD_MEM,
> > +                     new_state, MTK_KPD_NUM_MEMS);
> > +
> > +     bitmap_xor(change, new_state, keypad->keymap_state, MTK_KPD_NUM_BITS);
> > +
> > +     for_each_set_bit(bit_nr, change, MTK_KPD_NUM_BITS) {
>
> Should we be explicit:
>
>                 if (bit_nr % 32 >= 16) // or "if ((bit_nr / 16) % 2)"
>                         continue;
>
> so that we sure we do not trip over garbage (if any) in the unused
> bits?

Shouldn't we rather rely on the fact that bitmap API explicitly takes
a bit number as an argument. What garbage are you thinking of?
If you are talking about gaps, then probably existing
for_each_set_clump8() or free size analogue (not yet in upstream,
though) should be used instead?

> > +             /* 1: not pressed, 0: pressed */
> > +             pressed = !test_bit(bit_nr, new_state);
> > +             dev_dbg(&keypad->input_dev->dev, "%s",
> > +                     pressed ? "pressed" : "released");
> > +
> > +             /* 32bit register only use low 16bit as keypad mem register */
> > +             code = keycode[bit_nr - 16 * (BITS_TO_U32(bit_nr) - 1)];
>
> This will give index of 16 for (0,0).

I was also puzzled by this in one of the review rounds, but I don't
remember what was the explanation.

> Is this what we want? Hmm, this is
> all weird... I think we need:
>
>                 row = bit_nr / 32;
>                 col = bit_nr % 32;
>                 if (col > 15)
>                         continue;
>
>                 // set row_shift in probe() as:
>                 // keypad_data->row_shift =
>                 //              get_count_order(keypad_data->n_cols);
>                 code = keycode[MATRIX_SCAN_CODE(row, col,
>                                                 keypad_data->row_shift)];
>
> This will properly unpack the keymap built by
> matrix_keypad_build_keymap().
>
> > +
> > +             input_report_key(keypad->input_dev, code, pressed);
> > +             input_sync(keypad->input_dev);
> > +
> > +             dev_dbg(&keypad->input_dev->dev,
> > +                     "report Linux keycode = %d\n", code);
> > +     }
> > +
> > +     bitmap_copy(keypad->keymap_state, new_state, MTK_KPD_NUM_BITS);
> > +
> > +     return IRQ_HANDLED;
> > +}

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
