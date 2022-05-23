Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F830C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 08:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQC7kIKw2708E8GcLQmD7aD/gMOb1ZSI17m9sYl+kWo=; b=wbXD7IU4G6Caq4
	etEMx3/WVjE8wBEI1WsNTtto6zCn1cpX2jsK+7m912+09QM3zmN2ZQ1MebLdRsy6gq/JJJYPLT04u
	CsvWoX5RR9ZrqRVVYcjD0TXzgCIybnSmKvcpqDuBj9n+3iGEpSURMmoNG6fraLCLG86vchGRJ6Gtm
	DEeoH8cWhBv+lie+6fRUl/i61yaMQ6OHOHAHjMnkWgNvnHyZsCyLIsa8Tfzn32t3Ux/Y129Z0Sbtq
	kdSTJ0QTSIRxAK5SgM4qXJIYGfZj+JOuxG6eMX8vdYz7KiJw9eSFAyCl+WwJaSwHSEUPSjY1T1ZoK
	vK/mEoPV01uw94d5/kVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3rJ-002c7T-LG; Mon, 23 May 2022 08:56:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2p9-002A7b-PE; Mon, 23 May 2022 07:49:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=V+esiB0EBSG8dOJHRbOX36eLypWwW10L3M7nK7Ft+JA=; b=fA7VARNPNjrHn1PsqTczDTGN1l
 AsiddLqIffaHO/QjDME76SxoHtHIbVkZz6esEIMN/VUB+ZFQ67yfWys5HZ0ORJILtu0cq95iba06f
 VriHnJvHDeyhLJKwcHEW/1Dmo3nBctw3KGG1i2SOMdNzQS1iVjGSkTt5vePU7ApzPm/47K+wuURrm
 m+Ho+dBdvzhUWamav3m/j8H/HlaDedKnJ84G9z97hV3pygz7L+OwaaBSfOHr90NOnBP4lS/u/eUTW
 3CcBg7v8BPB7wHOp/47PRvOpfq19yYbnJBzqc+6ClG0wN//k6EymA7mTbBK8MC2htBB9sHnuof6R1
 LhS4LyDw==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt0ru-000rzI-Nd; Mon, 23 May 2022 05:44:41 +0000
Received: by mail-pj1-x1034.google.com with SMTP id gg20so13050785pjb.1;
 Sun, 22 May 2022 22:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=V+esiB0EBSG8dOJHRbOX36eLypWwW10L3M7nK7Ft+JA=;
 b=LqWsFoEhEtXJ03wP/CUlkiR2MMLHq9MdzTMrsCEsLAQKdHKeXsVfUj3PsYC9pmAQXR
 DoUWCY4o8SqL4E1YOw7ASXbHe5nHHyBIqVMHaIHq5y5qnNErHsJj3tI5lekMLR79O52B
 TBCLlo94cF7d5mzPOHPI4OUL37J/Zq6Bm6LHAG/XKDRuPXXPnuzl8aNEVPUKlZUlKg8v
 l88you7k8V6dkm9HIB1wErtuBDzTM+e/zpU8KBOkk23R7FdvMxiKMobK8oe/4LmNAbPQ
 9ssDVfmfmcG71IfTL9NJ6vumoBwbr3bcfjEEV3xcNluHiLnWnoSMFounR8tQrsn1usAW
 780A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V+esiB0EBSG8dOJHRbOX36eLypWwW10L3M7nK7Ft+JA=;
 b=v0bQCWy1trsLekiAz1SW3dXxfKcyRPFnK2hzxbUU3++yMeZ1PFlivPrrtm3jHsa2rI
 vEZ245u/mpH+qsjuYIzhh5Z9+yhONX8f5pd9+ZsZ2sq/oPas0VAPOkAKHOPSpM0X/+ck
 a+YGQTtngOlnICh56fdmniELvH5FpCTG2GvYVjeWLqumjHk3QEQaM7F/LjxOjl0HNGoX
 umcBUMAngZtMt/SZzH7x7oJkxdpCnIy5YeLWw5n0asat19ldc3bLXBLiq/s4LWZajSZo
 eHWc7I7FvBRF/M7M6Ou7PsMAMB8p0n077mAzDIz2xN8tZ0pijvyUxIVUXbZNUuj75Apm
 mglw==
X-Gm-Message-State: AOAM530WGNaFQMxVcWzXfzC0dIZppgAAJITCjAosUnGqYfGJlyjFS+8a
 HvCBRbfF4Wt2cM07kFHodhQ=
X-Google-Smtp-Source: ABdhPJyyQ+cfxgfexa3htOxvWWsetFYRz47y02NjNOB0aSqzbEXIh5HdyuJt4/n8vLL4FQWN4tGpgg==
X-Received: by 2002:a17:90a:2809:b0:1df:35ca:2e6a with SMTP id
 e9-20020a17090a280900b001df35ca2e6amr24493051pjd.8.1653284555278; 
 Sun, 22 May 2022 22:42:35 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:d84e:5dcd:9d68:ebbf])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a170902f38200b0015eaa9797e8sm4051485ple.172.2022.05.22.22.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 22:42:34 -0700 (PDT)
Date: Sun, 22 May 2022 22:42:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 1/2] Input: mt6779-keypad - fix hardware code
 mapping
Message-ID: <Yosex9/a7OTuC6ZK@google.com>
References: <20220513151845.2802795-1-mkorpershoek@baylibre.com>
 <20220513151845.2802795-2-mkorpershoek@baylibre.com>
 <YoHf6Z4HTfh4Y+bn@google.com> <874k1qkk7n.fsf@baylibre.com>
 <4a7bcbfb-12da-0e3f-8732-ecc53046a4ff@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a7bcbfb-12da-0e3f-8732-ecc53046a4ff@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_064439_197311_1E3C3FB5 
X-CRM114-Status: GOOD (  36.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 16, 2022 at 01:06:43PM +0200, AngeloGioacchino Del Regno wrote:
> Il 16/05/22 09:30, Mattijs Korpershoek ha scritto:
> > Hi Dmitry,
> > 
> > Thank you for your review,
> > 
> > On dim., mai 15, 2022 at 22:23, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > 
> > > On Fri, May 13, 2022 at 05:18:44PM +0200, Mattijs Korpershoek wrote:
> > > > In mt6779_keypad_irq_handler(), we
> > > > 1. Read a hardware code from KPD_MEM1 -> KPD_MEM5
> > > > 2. Use that hardware code to compute columns/rows for the standard
> > > >     keyboard matrix.
> > > > 
> > > > According to the (non-public) datasheet, the
> > > > map between the hardware code and the cols/rows is:
> > > > 
> > > >          |(0)  |(1)  |(2)
> > > >      ----*-----*-----*-----
> > > >          |     |     |
> > > >          |(9)  |(10) |(11)
> > > >      ----*-----*-----*-----
> > > >          |     |     |
> > > >          |(18) |(19) |(20)
> > > >      ----*-----*-----*-----
> > > >          |     |     |
> > > > 
> > > > This brings us to another formula:
> > > > -> row = code / 9;
> > > > -> col = code % 3;
> > > 
> > > What if there are more than 3 columns?
> > That's not supported, in hardware, according to the datasheet.
> > 
> > The datasheet I have states that "The interface of MT6763 only supports
> > 3*3 single or 2*2 double, but internal ASIC still detects keys in the
> > manner of 8*8 single, and 3*3 double. The registers and key codes still
> > follows the legacy naming".
> > 
> > Should I add another patch in this series to add that limitation in the
> > probe? There are no checks done in the probe() right now.
> > 
> 
> I've just checked a downstream kernel for MT6795 and that one looks like
> being fully compatible with this driver as well... and as far as downstream
> is concerned, apparently, mt6735, 6739, 6755, 6757, 6758, 6763, 6771, 6775
> all have the same register layout and the downstream driver for these is
> always the very same one...
> 
> ...so, I don't think that there's currently any SoC that supports more than
> three columns. Besides, a fast check shows that MT8195 also has the same.
> At this point, I'd say that assuming that there are 3 columns, nor less, not
> more, is just fine.

OK, now that I looked at the datasheet I remember how it came about. The
programming (register) interface does not really care about how actual
matrix is organized, and instead has a set of bits representing keys,
from KEY0 to KEY77, arranged in 5 chunks of 15 bits split into 5 32-bit
registers. So we simply decided to use register number as row and
offset in the register as column when encoding our "matrix".

This does not match the actual keypad matrix organization, so if we want
to change this, that's fine, but then we also need to recognize that we
are skipping bits 16-31, 48-63, and so on, so to get to the right key
number we need to do something like:

	key = bit_nr / 32 * 16 + bit_nr % 32;
	row = key / 9;
	col = key % 9;

I looked at the datasheets I have and they talk about 8x8 single keypad
matrix, and 3x3 double keypad (with actual matrices either 3x3 or 2x2)
but I do not actually see this map layout that Mattijs drew  documented
anywhere though...  I also wonder if there are already existing DTSes in
the wild that will be rendered invalid by these changes. I wonder if it
would not be be better to document the existing meaning of row and
column in the driver?

Thanks.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
