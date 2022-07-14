Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B01C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 09:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBLXrSfINFn+OkykEbtev0CVHfJNR4Ha91FDbpJe6vw=; b=jQpuUx8Y/ZsnNnNEmvh8WzwZQ4
	LkeTtoiWt40y6UWkrjTGxiv/Ii58dBxXTOaHjCltNg9breHw+UG9IzmX0wU7LTaYpAxDIzXxZwdoJ
	MXqHB0J9N92aDSOxmYm0ySvtDDzLnS81Hc6057tOMcFq8fcVKX26OsP8YkGXrICfAH125yP6MFU+B
	YD6dy+21kudqkCS+hSoDDYsibKpgkzziVVCob4t/NntxtrcURJeZQMwnFZdl+4yxptGoD4AigDcw6
	spte/tynRYe6P5G7Td4L1VQ7BYHraw9w74oFimT2QCoDtqBGPZS1Wa4tW+pSVW37DBfpZT4pnWFk1
	0TSTP/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBvUE-00D3Xf-A9; Thu, 14 Jul 2022 09:50:22 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBvU1-00D3Qa-0J; Thu, 14 Jul 2022 09:50:10 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id r3so2297549ybr.6;
        Thu, 14 Jul 2022 02:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UBLXrSfINFn+OkykEbtev0CVHfJNR4Ha91FDbpJe6vw=;
        b=jco1TUUJamGLBjUMKQJxmHydRs46RlrJYGVBVuXrdgoujFg+bNA+FRuqu9xySWKxm+
         iJ1MtPVhlh7NDYej/YkFvBQH1rWl4haWJzS8oJMmpCSCAzDBnx5brocoXUfXiB/uAfdM
         OFCWFOj+Wa/coQ+L/p2yRun8h9nxwhqAUhtPNkhFXDvtJQmjTfMKd8aLu5aGAQ9r4rKt
         pG3Pip2NDEZSbCM/gpswT2iVdDW8lMLvPHmzuu6unQZJ9SrI3aON/fekc5ofeaTFY0gc
         5sGqoeNtKloDBRE9yF69b0PWXyQ8T9A1xzHCn4bZ9woFCXpR/laDfNHFMvp3+dX42tLc
         fMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UBLXrSfINFn+OkykEbtev0CVHfJNR4Ha91FDbpJe6vw=;
        b=TiFPDkR8yneUs7t5VAMxKb/jkYjqvqgbf6nxx/DL5p7tdEMkf+57/fmMb+7+T96Ob3
         ak0jQg6cCq+W32IfpRbmbbDkAmExzXBVCGO1f+tw5Bzsvbr1vvDzExzcjjuhqDR7AW/U
         OizVkb8dqc0w5WwBsZCGUCyVRKfWABLDgwsbsODOrekIl4hmoXlS3KyyftWpllQaL6c9
         QheAchxflGbHug+/vqZ6dtbvHs+VdXb1vsG9JsiHFpx/sS2C9EM23mTv3iN8FaW2nJdg
         r6Yr8GW/GgCH1U6CyxYIf6dt7LX+0mypRNmts+ctgPofNZbk6bMhuH7ByBw7Kfgbrnof
         no+Q==
X-Gm-Message-State: AJIora/R2pmsM5j9jlgb8FQhZ93FHB+nfGv0wx2bdcMBYxYluqCHOTr8
	8ynpOo9RnW5+w4WpwywWCD/PVArJ1Cj2RzU5HEY=
X-Google-Smtp-Source: AGRyM1uVizFvY1JstQJgDopDPPcpsJilLyYnoZh/AYBxHpJVN7WLVW/f3jKrRS5Q3mGaEk9B3sqdSTOJVu/pQIHekz4=
X-Received: by 2002:a25:df97:0:b0:66f:6e7c:b3c0 with SMTP id
 w145-20020a25df97000000b0066f6e7cb3c0mr7544434ybg.93.1657792207178; Thu, 14
 Jul 2022 02:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com> <20220704053901.728-14-peterwu.pub@gmail.com>
 <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com>
 <CABtFH5K-2+2hbpvpq2nPE5AsznkQxZF2r3MVC64Q39DJhVuUtA@mail.gmail.com>
 <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com>
 <CABtFH5LT1Ct_9-B_XRrGwYFmL5kGS6KHR7dNVyUO5z4sTy_6oA@mail.gmail.com>
 <CAHp75VcU_9Ao2CoqiUDZHqhVOjEMZor+hctPp3YYP4HOjYLDUg@mail.gmail.com> <20220714094709.6ekfnfcf5sktiegi@maple.lan>
In-Reply-To: <20220714094709.6ekfnfcf5sktiegi@maple.lan>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Jul 2022 11:49:30 +0200
Message-ID: <CAHp75VdVSvux3HRPOj=xWXZoBdn1e=nSmWi9+BZUX69XAPcZPg@mail.gmail.com>
Subject: Re: [PATCH v4 13/13] video: backlight: mt6370: Add Mediatek MT6370 support
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Alice Chen <alice_chen@richtek.com>, 
	cy_huang <cy_huang@richtek.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_025009_097836_761F2889 
X-CRM114-Status: GOOD (  18.42  )
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

On Thu, Jul 14, 2022 at 11:47 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Thu, Jul 14, 2022 at 11:27:07AM +0200, Andy Shevchenko wrote:
> > On Thu, Jul 14, 2022 at 9:13 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> > > I have tried two methods so far, as follows
> > > -------------------------------------------------------------
> > > /*
> > >  * prop_val =  1      -->  1 steps --> b'00
> > >  * prop_val =  2 ~  4 -->  4 steps --> b'01
> > >  * prop_val =  5 ~ 16 --> 16 steps --> b'10
> > >  * prop_val = 17 ~ 64 --> 64 steps --> b'11
> > > */
> >
> > So, for 1 --> 0, for 2 --> 1, for 5 --> 2, and for 17 --> 3.
> > Now, consider x - 1:
> > 0  ( 0 ) --> 0
> > 1  (2^0) --> 1
> > 4  (2^2) --> 2
> > 16 (2^4) --> 3
> > 64 (2^6) --> ? (but let's consider that the range has been checked already)
> >
> > Since we take the lower limit, it means ffs():
> >
> >   y = (ffs(x - 1) + 1) / 2;
> >
> > Does it work for you?
>
> To be honest, for this tiny table, writing code that *doesn't* require intricate
> deciphering together with a huge comment saying what is does would probably be
> better:
>
>                 prop_val = (prop_val <=  1 ? 0 :
>                             prop_val <=  4 ? 1 :
>                             prop_val <= 16 ? 2 :
>                                              3);
>
> This would be "obviously correct" and require no comment.

Agree. It will also limit checking (and whatever needed for that).

-- 
With Best Regards,
Andy Shevchenko

