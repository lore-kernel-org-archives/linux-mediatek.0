Return-Path: <SRS0=ckIt=DZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3180DC433DF
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 17:17:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B09802223F
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 17:17:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CuiI2epQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WvemCXb+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B09802223F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5DzaG2AI8ZKKLFTYTsRqPUi+zaHLotX8Arq/HLGICGQ=; b=CuiI2epQz9rN1J4mEDQ83LHIW
	hn7x4SkIPG8P8lhHoC7qic2WxeNqWPBRaydBtwsQrc48onj7aBETSN1JbTTk07MOot5XZpqDM+Vkt
	L1IbLpdSLV0nAt+Frqw0o4+Ryb+5Atxb6QRKqf684PnNJHu3AL+eLFivBY5DJNlxPaH2m3qJzgXfc
	lqRa0pBF1LnSMZwxNtW7IiEPwLgPdHm5wBGBi0zQdlInI4LMXwZF4I5tFqQucL/HL8ksGESGEt7qe
	djekJ+glbBoL2KfurSNdoyY1EJD02IjVLIeAH/HMDFNSlrl1b0Vhr3dC633YikQFbXb/LA6ls2I4L
	rmVCEc4Wg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUCIp-0005hF-EF; Sun, 18 Oct 2020 17:17:03 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUCIn-0005gD-Ie
 for linux-mediatek@lists.infradead.org; Sun, 18 Oct 2020 17:17:02 +0000
Received: by mail-io1-xd43.google.com with SMTP id b8so10195165ioh.11
 for <linux-mediatek@lists.infradead.org>; Sun, 18 Oct 2020 10:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XWtLc/tNEdINtzZjjThWS6Vpo7qgkp7EiP1jjZAyPlM=;
 b=WvemCXb+CWug9wB16mmYK5NYVzodouwwv6s6swcEKrBZ7Ve5tL2yeO74JIep4OqVFo
 g93heqyMzpjhBxjrwF5anOltXs8XKNky4QZXjls8v5/I8g81B+SFdEwlcmhOqFjp1S4h
 d2Ivvf8Vc31y6sLyJcRV6pLHQpIjZQfkJlN/W3S7k8/arbYqGau1rApB5UjgCybQb9O8
 vsKO/LlmpirEuaU8ep7BaySvAvlbKpI36Buur3UjR3crHkow6bZEHKVPr9qbvkajWCuF
 eCd1ko3rX0dES8eTPmxe3bHXCDwekM/yK1zefpDoPexSNdigdHpd0ff5Y/s0cOd/E9sb
 wwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XWtLc/tNEdINtzZjjThWS6Vpo7qgkp7EiP1jjZAyPlM=;
 b=pdONbN8ana4QGgaSVkNuEsX+EPYLaha5VzJIDzn80In5llBRepiDIGE229YK7eKqgh
 I0EoD8a+ktKDC5BfzPQ6Sze/BWGC+fos8qJcjP5UC0YK8TPB7FSJSQOHZMROIr5gQDkH
 dGsdcJvcgOM+yxY5zacUk3aMTdLEWB4AH/PPDX+/yBt1X2IsDfk7ZlOw3rU2N9ucRQ25
 MoP7ulp1LttuBQnX/SjcBTZr1gLXHfUyejI5JX7rOK03JszGcAGmt48QvbkxQBeZTpOM
 90DG0tbUrt6h10kZa/JpDpK6JvcIPSJWbdAGdAq/hFq9zMUaueZr54FQvbvh4kTKd8b0
 LXzA==
X-Gm-Message-State: AOAM533KHGqKLiDcNtc0qyUOzsVVHweHo5ZI0PdD1muw2BxYz3Ph3WFI
 HcuaKi84ApvLIFjZdzA/fl46XaCsyDWKpjtc3EDFAg==
X-Google-Smtp-Source: ABdhPJySpPX6QHf8ywX5RJ59cJxtxN4flpJfHh60Dbv2+K/D4L/YTKvNUh1kczQNHlWM2AMorORa3eoSTXALlwNfhsY=
X-Received: by 2002:a5e:c112:: with SMTP id v18mr8532136iol.195.1603041419699; 
 Sun, 18 Oct 2020 10:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201012194618.2170970-1-fparent@baylibre.com>
 <61fe6278-a628-820c-6bbd-eeac51b1e7c3@gmail.com>
 <20201018110738.36e3de38@archlinux>
In-Reply-To: <20201018110738.36e3de38@archlinux>
From: Fabien Parent <fparent@baylibre.com>
Date: Sun, 18 Oct 2020 19:16:49 +0200
Message-ID: <CAOwMV_xxfJqUieArCE-dDS-fy65vGQhcbMwsGqrTFs4-XA0p2Q@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: mediatek: fix unset field
To: Jonathan Cameron <jic23@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_131701_626529_34E12CA1 
X-CRM114-Status: GOOD (  21.60  )
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
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, chun-hung.wu@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 pmeerw@pmeerw.net, knaack.h@gmx.de, Matthias Brugger <matthias.bgg@gmail.com>,
 alexandru.ardelean@analog.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jonathan,

On Sun, Oct 18, 2020 at 12:07 PM Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Tue, 13 Oct 2020 17:37:12 +0200
> Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
> > On 12/10/2020 21:46, Fabien Parent wrote:
> > > dev_comp field is used in a couple of places but it is never set. This
> > > results in kernel oops when dereferencing a NULL pointer. Set the
> > > `dev_comp` field correctly in the probe function.
> > >
> > > Fixes: 6d97024dce23 ("iio: adc: mediatek: mt6577-auxadc, add mt6765 support")
> > >
> > > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> >
> > Ouch.
> >
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> >
> > > ---
> > >   drivers/iio/adc/mt6577_auxadc.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> > > index ac415cb089cd..7bd48377cd79 100644
> > > --- a/drivers/iio/adc/mt6577_auxadc.c
> > > +++ b/drivers/iio/adc/mt6577_auxadc.c
> > > @@ -276,6 +276,8 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
> > >             goto err_disable_clk;
> > >     }
> > >
> > > +   adc_dev->dev_comp = of_device_get_match_data(&pdev->dev);
> > > +
>
> Could we switch this to device_get_match_data(&pdev->dev)?
>
> Whilst is unlikely this driver will used in a platform using ACPI, there
> is nothing inside the driver itself preventing this (which is good as no
> reason to do so!)   My main motivation for this is to reduce the chances
> of cut and paste of the of_* functions in future driver.
>
> Also switch the headers to linux/property.h and linux/mod_devicetable.h
> to more tightly reflect what we are using in the driver.

I applied these changes in v2.

>
> Thanks,
>
> Jonathan
>
> > >     mutex_init(&adc_dev->lock);
> > >
> > >     mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
> > >
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
