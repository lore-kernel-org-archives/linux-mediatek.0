Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B84C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 06:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjXXoiGccUqxLYUdnokgXylMd73VyQyt5TPZ25Bym3E=; b=WyqdXVakrAy/3Q
	GE7/BttjbVPCcC1GkG+HGYGQM6Ex9NzDyKV3hmkr7j15w+RjJmx0+Xj8GcSTOBPnyzHLPe3lsYUy1
	euY2AmOwcYleyiTPazxbhS2A0inM6FNPUqsQjoH9FOJ1l4udivPW+YdK0KAwUfgDPMcpkjU5f7A9F
	1iP91y7uYw2owH0rMD0idz07GxzsiSypVMGWPNn98o8SAeddigIXjNPbt00+GIfNohRXlAUOHoK7g
	FZR/3QyU9yYrXVlKixmwsMzE4yudEUPVG0vBfevslXmNy+JP4hszbEUIN1A2Rqc+/DmVV8shhdPOv
	U8ajinKBOzkn9EDJUtDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrDbq-00HW99-1y; Wed, 18 May 2022 06:56:38 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrDbb-00HW56-P0
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 06:56:26 +0000
Received: by mail-wr1-x42d.google.com with SMTP id h14so1253464wrc.6
 for <linux-mediatek@lists.infradead.org>; Tue, 17 May 2022 23:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=CQIReHnD+6J/f9DYUtohMgFS79x6Zc0p2l4WD6IBG7c=;
 b=KyJCyCdZX/CgAvmTt7yYHwAt8cwO+kY+mY1Q9hSekfZAEuaZm4EtJijZqVNc2O63c4
 h9pACHHzz2ZLJ/YQnc2e5gMLpvwkjM0ipMcB+3VM6Etb704T5hLWiUbKYzNgGM47CvID
 qmhWCsdy/0g3axEBFScsaWFI1wZrdcZ438b3WkaFg6Ht7Mse1GKnG+mUnqe3ZFy/UEzl
 MvkXJgNfg8ryjQpyc5Ba26iyuCQz75kKZ++SOmNTPKrr0I3nwteVmSJZOmcg6jxaIyQl
 NdkcYaDDvblu1CdZz4hE4BHZmKzk/SFSKRC80p4HOrfaf2tjDRqzjlzokEM3TnaLbJSR
 VpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=CQIReHnD+6J/f9DYUtohMgFS79x6Zc0p2l4WD6IBG7c=;
 b=VIpnsyXxlG8qfDDjU/+laPx6GDmritQb9bQU0bVJdoesAofVagNU8a+g4QwmQRkNyn
 KHRikEjCMFtNj3rFEvwdfWJgF5RHa4Z4mck/GDjdVWcZ5itz+BBXNGonAsscb5+n8/7L
 qykkfWxing27TSnwxgS0Vz8vwRCaUXOTUH/bJqMFjmsGaHFifsguL6Gf/vuSlcR6opw4
 9gwKp6tWB2E1CvrKiyoNPTxTJu/UVOnfvaIOhmRje3/oGgc4ScXUlNDtB1y16AXuPzoe
 bif0WFp3I2Rpz1KtRGsDLrnDLP0ow+1xJDaNs17FB9o066/zRgL/x6g0m0PI+xHWr6lh
 kO4w==
X-Gm-Message-State: AOAM532PSAN6UUulMWM6ulgkRHICZjbJ3SxJTsmgXi6KgqPjFeRHKd8O
 ZyzRTDMPUyCBcf62LfeE7gxhrg==
X-Google-Smtp-Source: ABdhPJxqFJWFFJAZOCXntQD4XGLErH8Sgri/Wrkfkvpk99R2ty4HwuD52N1klwypW+CMYx+ticzBqg==
X-Received: by 2002:a5d:448d:0:b0:20d:744:7663 with SMTP id
 j13-20020a5d448d000000b0020d07447663mr12747395wrq.654.1652856980810; 
 Tue, 17 May 2022 23:56:20 -0700 (PDT)
Received: from localhost (laubervilliers-656-1-151-143.w92-154.abo.wanadoo.fr.
 [92.154.18.143]) by smtp.gmail.com with ESMTPSA id
 m7-20020adfa3c7000000b0020c5253d8cesm1097175wrb.26.2022.05.17.23.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 23:56:20 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Kevin Hilman
 <khilman@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 1/2] Input: mt6779-keypad - fix hardware code
 mapping
In-Reply-To: <4a7bcbfb-12da-0e3f-8732-ecc53046a4ff@collabora.com>
References: <20220513151845.2802795-1-mkorpershoek@baylibre.com>
 <20220513151845.2802795-2-mkorpershoek@baylibre.com>
 <YoHf6Z4HTfh4Y+bn@google.com> <874k1qkk7n.fsf@baylibre.com>
 <4a7bcbfb-12da-0e3f-8732-ecc53046a4ff@collabora.com>
Date: Wed, 18 May 2022 08:56:19 +0200
Message-ID: <87bkvve3cc.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_235624_101922_B0215A88 
X-CRM114-Status: GOOD (  25.90  )
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

On Mon, May 16, 2022 at 13:06, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> Il 16/05/22 09:30, Mattijs Korpershoek ha scritto:
>> Hi Dmitry,
>> 
>> Thank you for your review,
>> 
>> On dim., mai 15, 2022 at 22:23, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>> 
>>> On Fri, May 13, 2022 at 05:18:44PM +0200, Mattijs Korpershoek wrote:
>>>> In mt6779_keypad_irq_handler(), we
>>>> 1. Read a hardware code from KPD_MEM1 -> KPD_MEM5
>>>> 2. Use that hardware code to compute columns/rows for the standard
>>>>     keyboard matrix.
>>>>
>>>> According to the (non-public) datasheet, the
>>>> map between the hardware code and the cols/rows is:
>>>>
>>>>          |(0)  |(1)  |(2)
>>>>      ----*-----*-----*-----
>>>>          |     |     |
>>>>          |(9)  |(10) |(11)
>>>>      ----*-----*-----*-----
>>>>          |     |     |
>>>>          |(18) |(19) |(20)
>>>>      ----*-----*-----*-----
>>>>          |     |     |
>>>>
>>>> This brings us to another formula:
>>>> -> row = code / 9;
>>>> -> col = code % 3;
>>>
>>> What if there are more than 3 columns?
>> That's not supported, in hardware, according to the datasheet.
>> 
>> The datasheet I have states that "The interface of MT6763 only supports
>> 3*3 single or 2*2 double, but internal ASIC still detects keys in the
>> manner of 8*8 single, and 3*3 double. The registers and key codes still
>> follows the legacy naming".
>> 
>> Should I add another patch in this series to add that limitation in the
>> probe? There are no checks done in the probe() right now.
>> 
>
> I've just checked a downstream kernel for MT6795 and that one looks like
> being fully compatible with this driver as well... and as far as downstream
> is concerned, apparently, mt6735, 6739, 6755, 6757, 6758, 6763, 6771, 6775
> all have the same register layout and the downstream driver for these is
> always the very same one...
Thank you for taking the time to check in your downstream kernels, I
really appreciate it.

>
> ...so, I don't think that there's currently any SoC that supports more than
> three columns. Besides, a fast check shows that MT8195 also has the same.
> At this point, I'd say that assuming that there are 3 columns, nor less, not
> more, is just fine.
>
> To stay on the safe side, though, perhaps add a comment explaining that
> this driver works on that assumption? ..but that's clear, anyway, if you
> actually read the code.
>
>  From my perspective, this commit is good to go.
I will keep as is for v2 series and apply your review tag. thanks again !

>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
