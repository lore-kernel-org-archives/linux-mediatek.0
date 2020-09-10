Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353B9C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 11:35:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8682C2078B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 11:35:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WjYTBsRQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rW+wPK6u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8682C2078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LlonSpwDI1wsRoHpVnP3AkNj6KezGI4B9rcdOZ/5nUk=; b=WjYTBsRQPYugkEgeMCku/YAHR
	125xuZoOY/1hGNi6KMbvuXpDkP2tLuHAlkDAFTpWBUbw9GUL/4PjcTwcGlkm53XugAAjTgmWEWAXF
	Q4O+nkuxxF5bZR2glLZSr6q9a8lzhvojg2TQvs1LKJmBWnx0HA3ZPNYs5meqkpoT6A/ew1uZOzFOS
	J7n1SZSd9wOUtRiMaihsJ8GN2qHQAqmVpb950ffZB7OSTi4GZxpyqo4GrJe67DMg04eIUFGnl83IV
	IGHXDrdzIstvyfiLs3X5YK8FQjK/Ld+peS5sWYaLeveHW+Y2Npze6+yMntuu3Ik3qp1NmQ0Ekit1X
	x8huYATFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGKrF-0006T1-U9; Thu, 10 Sep 2020 11:35:17 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGKrC-0006SL-08; Thu, 10 Sep 2020 11:35:15 +0000
Received: by mail-pf1-x441.google.com with SMTP id c196so4604121pfc.0;
 Thu, 10 Sep 2020 04:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OAIIi6uo3XgXFJ7QsLwLusqGAN4H6rcenY71bNI/1l8=;
 b=rW+wPK6uNUbrUcprGE+bQuCpqDWnZ0VJbYkiOw/LceoiimtmO+K5zGaJ8VH0fntmp+
 60B98AoB2KqakAI4TCQ0uZ4WWLuPJehYgr5Srs+vOTsO7s8hRxHwTPM9ARbWajgphq2B
 eWF9fHapKu16Jsi6TEfaoFS4dpvFBS9QK41CJGk+o7RlAABDvo/dM9b4B650BS9FLS4p
 yMJaz5yYQL0WEuCDL8GAudTrpDIShQA3TuQLtjqRDVN0d9IrSXJcdxiN51NAOtaJEQnw
 oxKzVKa1VyeWniKn9nW3b/8r4kUc1kNt9Z6dWm93DAtQAozF65v8SL+LPP/lanfG6nC1
 uJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OAIIi6uo3XgXFJ7QsLwLusqGAN4H6rcenY71bNI/1l8=;
 b=oebBMv2VOL5bq6OVEjmsl4J9wktraaDk4xmrvLcmb3RfqhMlMZ82+CdcwZqG2UOa7U
 7dcnWQmPJnLXul7BIi22HREru9J2ElrIkPPtRj2YYzW8Fv+9FgmDW/9OP6afuZE6+9Jq
 i20oK6PnTd674zlGtGjEaSYfKhsrIhCuBqQn0W/isB7oCXQh01TzPUKpQSAGxHORuBFb
 qjzhgXHO5FgE6Un64JdklDsDNS1RjXYLHR8C5nnURHqg82VK3FJoJPkAVCtZhRRP3AJd
 yeMR6XDOFEgXO5oVTcaqfTN4VoGFRaNI3YnU0X/vJ+U9/sCyDGdzTphBlmAi6acX28mh
 hOfg==
X-Gm-Message-State: AOAM530Z39SS4ViY2mnwfZ1r0EKl+jxQTSelvJVbma+wQCdDQGieHW+i
 I2w4hiLV2wVXyywGqJ2vfMzHts27X6x+6+870AA=
X-Google-Smtp-Source: ABdhPJyA7xJQIZk5VHdsH5jeJ1GijVp07O14SJTxho9owohQ9HM6j6M0zAQbtOSB3XzQ6HyGQ+uJhc1FwEQ8T7FSZbs=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr4042041pgj.74.1599737711469; 
 Thu, 10 Sep 2020 04:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <CAHp75VdLDvoQicP1nLnjOiit6qjaw9n7+LuJ-J3MtaoHUOa_2g@mail.gmail.com>
 <CAE+NS35FETQ9ASJeYP=Sa8dm7ohRBcdAwUioCAnHPY2TiD4pNA@mail.gmail.com>
 <20200910081814.GB28357@amd>
In-Reply-To: <20200910081814.GB28357@amd>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Sep 2020 14:34:54 +0300
Message-ID: <CAHp75Vds75jP47Fy78gxrg05J-CYQ7yD_EiDqizKkcW5rHL_RA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To: Pavel Machek <pavel@ucw.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_073514_106284_91F70D77 
X-CRM114-Status: GOOD (  14.27  )
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, shufan_lee@richtek.com,
 cy_huang@richtek.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gene Chen <gene.chen.richtek@gmail.com>, Wilma.Wu@mediatek.com,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2020 at 11:18 AM Pavel Machek <pavel@ucw.cz> wrote:

...

> > > > +enum {
> > > > +       MT6360_LED_ISNK1 = 0,
> > > > +       MT6360_LED_ISNK2,
> > > > +       MT6360_LED_ISNK3,
> > > > +       MT6360_LED_ISNK4,
> > > > +       MT6360_LED_FLASH1,
> > > > +       MT6360_LED_FLASH2,
> > >
> > > > +       MT6360_MAX_LEDS,
> > >
> > > No comma for terminator entry.
> > >
> >
> > ACK
>
> Actually, that comma is fine. Its absence would be fine, too.

It is slightly better not to have to prevent (theoretical) rebase or
other similar issues when a new item can go behind the terminator. In
such a case compiler can easily tell you if something is wrong.

> > > > +};

...

> > > > +static const struct of_device_id __maybe_unused mt6360_led_of_id[] = {
> > > > +       { .compatible = "mediatek,mt6360-led", },
> > >
> > > > +       {},
> > >
> > > No need comma.
> >
> > ACK
>
> It is also no hurting comma.

Same explanation. It doesn't hurt per se, but its absence might serve a purpose.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
