Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D829C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 May 2022 05:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=seLNkYMP/cACBHp8+ePkLIeHSAlyi00Spc4+F99ZSHU=; b=Ob3E4kAaH5qSWS
	39pR5X8A0j7ow52gVIMGfadUMGPMlTCdJtNANSM9QtqfqabQBY34sTdJ8ply+6+sjomNMFfthQUSO
	zDqtRTUyHBmjNIpdpuG8r0zOKe70O1Z338FLp051qLYn2rPDIu9jDwXjwPmLLRwrC53qWV8FwsQG4
	QIcvtnimtCxauOxsuwr/50EPj55RBF9SgYQLKUrNQAn6VtA1iR1PEbQ9jSbXKFBypvThhdLroUq4s
	/KxVLhG0PZrI2RmFLxQq8+1f7wcW4enwTwJ3jHuL8vxIB1V/q4X1pmxSLZi7Uaf6RGZgg9dJd2FuD
	P3qyZNnzr04lLxnDOvtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvBPD-003JAX-2o; Sun, 29 May 2022 05:23:59 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvBP9-003J9r-18; Sun, 29 May 2022 05:23:56 +0000
Received: by mail-pg1-x531.google.com with SMTP id e66so7380585pgc.8;
        Sat, 28 May 2022 22:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T5XFxBmhA+Yi1gVGr5oW1G0EspvBXVIjAMsTMV065mY=;
        b=QAWpoJZCKF7T0vZBtphN+2DNdtfi3T0OkcWuaFphp80JM9vAtF4y2pvAepLlAC3Zrn
         bFZ7dYpki1E/vErAHcAz4YEQP0FYC5C+IxoMCAHqRUWMw12OTSyjPA9B9gyTz5YIc9S3
         0p0XpJdYR81NYPyyvA3kI3zjHjEbgV/tYPAMzBeJzxXvvI4F/BxnbSNdQtemE3RHLTKb
         kP22NG3oqYJwQ7LO4Wyy3WLcU5aZEtjjXOIqwnwW88Mq5vw8tKxzQn7SQ+o9i298opNG
         JuK6WMVKufc0UFEQkQxin0s2eTdicputubLMaLGPkY2I8gE3++c0Ses4UPiXpHsaHNyk
         5S2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T5XFxBmhA+Yi1gVGr5oW1G0EspvBXVIjAMsTMV065mY=;
        b=eIJkITVDw0SJj15LvJRqgu5Z6hU/bk+OTzf2pCwuTPcpxXZepfVuOPCzHKH3MZVaTe
         b07DIJBqf2Tg+aww35jchD1QAwF4kZk+S8xlpAb6/y0q6uWuehycIja/O5LhvWeJzEHs
         rRQMtW8jTmI1DJ10TQGTmSOyoCpFrPcNVCrYzwkxuCzIY2ZdJOMlpu8lYmFESvmxfTPl
         YQX4BHuRj6hKCAJkIXSrjSTqX1q9udjQHkUoTzL5C9BlobvZ3jY/8qiDRb/1CU7L+PVW
         hNyWDpagpZV7Ij+vB6GmUpt0bORwCaf1h/Oef5j4DHMDTUt33Ky0eb2ixtT5rQYg+R4s
         ZuwQ==
X-Gm-Message-State: AOAM532P2eSsyG51sTeQ81ky4iZTTplYuul+94ey5ZrGjsS3oFzonsJI
	Owy6zfKJ26199HMxY2guChc=
X-Google-Smtp-Source: ABdhPJwGHmvbTI1lv9t0UPg5Z2nY7WeVEoA3G10fVVPpkiSXwhqJRCAulrJUSFmKdTYgXLRNALmXuA==
X-Received: by 2002:a05:6a00:10d3:b0:4fe:5d:75c8 with SMTP id d19-20020a056a0010d300b004fe005d75c8mr50898462pfu.6.1653801833255;
        Sat, 28 May 2022 22:23:53 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:781a:4ab0:a93b:176b])
        by smtp.gmail.com with ESMTPSA id q6-20020a170902f78600b001635c9e7f77sm6541632pln.57.2022.05.28.22.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 22:23:51 -0700 (PDT)
Date: Sat, 28 May 2022 22:23:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 1/2] Input: mt6779-keypad - fix hardware code
 mapping
Message-ID: <YpMDZORAlHmg/x/0@google.com>
References: <20220513151845.2802795-1-mkorpershoek@baylibre.com>
 <20220513151845.2802795-2-mkorpershoek@baylibre.com>
 <YoHf6Z4HTfh4Y+bn@google.com>
 <874k1qkk7n.fsf@baylibre.com>
 <4a7bcbfb-12da-0e3f-8732-ecc53046a4ff@collabora.com>
 <Yosex9/a7OTuC6ZK@google.com>
 <87y1yq91on.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y1yq91on.fsf@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220528_222355_120138_EFA7B93E 
X-CRM114-Status: GOOD (  60.64  )
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

On Tue, May 24, 2022 at 09:21:28PM +0200, Mattijs Korpershoek wrote:
> On dim., mai 22, 2022 at 22:42, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> 
> > On Mon, May 16, 2022 at 01:06:43PM +0200, AngeloGioacchino Del Regno wrote:
> >> Il 16/05/22 09:30, Mattijs Korpershoek ha scritto:
> >> > Hi Dmitry,
> >> > 
> >> > Thank you for your review,
> >> > 
> >> > On dim., mai 15, 2022 at 22:23, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >> > 
> >> > > On Fri, May 13, 2022 at 05:18:44PM +0200, Mattijs Korpershoek wrote:
> >> > > > In mt6779_keypad_irq_handler(), we
> >> > > > 1. Read a hardware code from KPD_MEM1 -> KPD_MEM5
> >> > > > 2. Use that hardware code to compute columns/rows for the standard
> >> > > >     keyboard matrix.
> >> > > > 
> >> > > > According to the (non-public) datasheet, the
> >> > > > map between the hardware code and the cols/rows is:
> >> > > > 
> >> > > >          |(0)  |(1)  |(2)
> >> > > >      ----*-----*-----*-----
> >> > > >          |     |     |
> >> > > >          |(9)  |(10) |(11)
> >> > > >      ----*-----*-----*-----
> >> > > >          |     |     |
> >> > > >          |(18) |(19) |(20)
> >> > > >      ----*-----*-----*-----
> >> > > >          |     |     |
> >> > > > 
> >> > > > This brings us to another formula:
> >> > > > -> row = code / 9;
> >> > > > -> col = code % 3;
> >> > > 
> >> > > What if there are more than 3 columns?
> >> > That's not supported, in hardware, according to the datasheet.
> >> > 
> >> > The datasheet I have states that "The interface of MT6763 only supports
> >> > 3*3 single or 2*2 double, but internal ASIC still detects keys in the
> >> > manner of 8*8 single, and 3*3 double. The registers and key codes still
> >> > follows the legacy naming".
> >> > 
> >> > Should I add another patch in this series to add that limitation in the
> >> > probe? There are no checks done in the probe() right now.
> >> > 
> >> 
> >> I've just checked a downstream kernel for MT6795 and that one looks like
> >> being fully compatible with this driver as well... and as far as downstream
> >> is concerned, apparently, mt6735, 6739, 6755, 6757, 6758, 6763, 6771, 6775
> >> all have the same register layout and the downstream driver for these is
> >> always the very same one...
> >> 
> >> ...so, I don't think that there's currently any SoC that supports more than
> >> three columns. Besides, a fast check shows that MT8195 also has the same.
> >> At this point, I'd say that assuming that there are 3 columns, nor less, not
> >> more, is just fine.
> >
> > OK, now that I looked at the datasheet I remember how it came about. The
> > programming (register) interface does not really care about how actual
> > matrix is organized, and instead has a set of bits representing keys,
> > from KEY0 to KEY77, arranged in 5 chunks of 15 bits split into 5 32-bit
> > registers. So we simply decided to use register number as row and
> > offset in the register as column when encoding our "matrix".
> 
> That's correct and that's a good way to phrase it.
> I will add that in the commit message.
> 
> >
> > This does not match the actual keypad matrix organization, so if we want
> > to change this, that's fine, but then we also need to recognize that we
> > are skipping bits 16-31, 48-63, and so on, so to get to the right key
> > number we need to do something like:
> >
> > 	key = bit_nr / 32 * 16 + bit_nr % 32;
> > 	row = key / 9;
> > 	col = key % 9;
> 
> I would prefer to have the driver's matrix_keypad (build in probe()) to
> match the actual hardware. To me this seems easier to understand for
> people familiar with the hardware.
> 
> I've also tested the above snippet and it matches my expectations.
> 
> >
> > I looked at the datasheets I have and they talk about 8x8 single keypad
> > matrix, and 3x3 double keypad (with actual matrices either 3x3 or 2x2)
> 
> Indeed. I plan to send out double keypad support for this driver since
> that's actually needed for mt8183-pumpkin as well.
> It's already in our mtk-v5.10[1] integration tree but I have not submitted
> it yet.
> I planned to send this a separate series to avoid burdening / have
> smaller chunks to review. If that was a mistake, please let me know.
> 
> > but I do not actually see this map layout that Mattijs drew  documented
> 
> The map layout that I draw is not directly copied from the datasheet.
> It's a "translation" of the following table:
> 
> | hardware key code | col0 | col1 | col2|
> | ----------------- | -----| ---- | --- |
> | row0              | 0    | 1    | 2   |
> | row1              | 9    | 10   | 11  |
> | row2              | 18   | 19   | 20  |
> 
> It seems that caused more confusion than actual useful information,
> sorry about that.
> 
> > anywhere though...  I also wonder if there are already existing DTSes in
> > the wild that will be rendered invalid by these changes. I wonder if it
> > would not be be better to document the existing meaning of row and
> > column in the driver?
> 
> The concern for "DTSes in the wild" that will break is a valid point.
> I'm not aware of any of those. Most vendor trees i've seen don't use
> this driver at all. I hope that will change at some point.
> 
> In the end. I'd prefer to have the driver's keypad matrix match
> the actual hardware. Right now we can have a 5x32 matrix which seems
> absurd. Having at most an 8x8 is more reasonable.
> 
> I'd like to send v3 with just fixing the row/column suggestion in
> mt6779_keypad_irq_handler() that Dmitry suggested.
> 
> Would that work Dmitry?

OK, let's do that. Although I'd be curious to see the double keypad
patches as according to the datasheets I saw the translation is
different for those.

Thanks.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
