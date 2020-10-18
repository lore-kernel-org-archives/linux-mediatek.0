Return-Path: <SRS0=ckIt=DZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CD3C433E7
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 10:07:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FAE721582
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 10:07:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1jXQb2SP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pufOCh9L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FAE721582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bT+nEHrwK3zkJYxItjk78j0XQku0f+z1NyWAAKGkQQA=; b=1jXQb2SPzVLiRzBDOBsT/v8Rz
	71Fl+NLBnXb3Lr/Gg5ReUWuCT6r+HOq++0hA3ApUmxxN/Q6R1EZUR4zIn3fNOaRmehUaB8w755NOc
	MUHdaP3lKORE6cLHZ4MtC05vs4lyUwPgqP18OvdMPV1UsJbgXsjYAxIJDVxwppnoIMDV5YojZvV+h
	3JQ8JqbQcR+9QfBi+xP+gzzw6M40v2MN3zCo04kO6Qfqmcn6GSWtqh971GDFnx81JAcbT7jEBXAfk
	xLyzVEZD4SeKHPoy0Ox9N6OkcKR5ApuVkD8bMLSnZgZj4+NRKM21UFP80lL1bmRQaSai6waudfRg/
	kSfjihUJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kU5bM-00082R-GE; Sun, 18 Oct 2020 10:07:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kU5bI-00080j-3j; Sun, 18 Oct 2020 10:07:41 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0993621582;
 Sun, 18 Oct 2020 10:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603015658;
 bh=wIiA9KBDcc136KGq4f/BMgcBH20BwV1jX2a9QCEH+uw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pufOCh9Lhfwp+boIkjf7lnup05nEyglSaMVcpi5nrWVcWPlxyt06Z25c4wqDjPtSw
 WtwAA6D2IC66P5MMXjRxtebomvVCyPopbAFurz76ZrsTJRy3UGj5EbdX1tMxeW6jlt
 3jI75MAxOjA0D9BBP0MsArqiEtXRYK/yDIlNUY+4=
Date: Sun, 18 Oct 2020 11:07:38 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] iio: adc: mediatek: fix unset field
Message-ID: <20201018110738.36e3de38@archlinux>
In-Reply-To: <61fe6278-a628-820c-6bbd-eeac51b1e7c3@gmail.com>
References: <20201012194618.2170970-1-fparent@baylibre.com>
 <61fe6278-a628-820c-6bbd-eeac51b1e7c3@gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_060740_239420_5E279C16 
X-CRM114-Status: GOOD (  21.16  )
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
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 alexandru.ardelean@analog.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 13 Oct 2020 17:37:12 +0200
Matthias Brugger <matthias.bgg@gmail.com> wrote:

> On 12/10/2020 21:46, Fabien Parent wrote:
> > dev_comp field is used in a couple of places but it is never set. This
> > results in kernel oops when dereferencing a NULL pointer. Set the
> > `dev_comp` field correctly in the probe function.
> > 
> > Fixes: 6d97024dce23 ("iio: adc: mediatek: mt6577-auxadc, add mt6765 support")
> > 
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>  
> 
> Ouch.
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> > ---
> >   drivers/iio/adc/mt6577_auxadc.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> > index ac415cb089cd..7bd48377cd79 100644
> > --- a/drivers/iio/adc/mt6577_auxadc.c
> > +++ b/drivers/iio/adc/mt6577_auxadc.c
> > @@ -276,6 +276,8 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
> >   		goto err_disable_clk;
> >   	}
> >   
> > +	adc_dev->dev_comp = of_device_get_match_data(&pdev->dev);
> > +

Could we switch this to device_get_match_data(&pdev->dev)?

Whilst is unlikely this driver will used in a platform using ACPI, there
is nothing inside the driver itself preventing this (which is good as no
reason to do so!)   My main motivation for this is to reduce the chances
of cut and paste of the of_* functions in future driver.

Also switch the headers to linux/property.h and linux/mod_devicetable.h 
to more tightly reflect what we are using in the driver.

Thanks,

Jonathan

> >   	mutex_init(&adc_dev->lock);
> >   
> >   	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
> >   


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
