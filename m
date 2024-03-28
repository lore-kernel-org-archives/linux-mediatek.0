Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65128CD1283
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 17:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nG7pFQ9K9R/mz80FNkdLLBY0bbfjalJJC6HLc51WLAE=; b=MyjpgTaBRyh6clAnpInNUrbVWv
	lQ3sdB5gxeqQfpDctzjviy+2KuB+VL3u29ehwQHuZgn0KOYOJyOYc8wv3CRhNjnSmE1dbiRr01NMR
	8lzgSnpjATYbxhbJ/SRW0M9cbmTKhKzPMoYJW7BuRhYFrpdanRTh/xvusT//DNAE0L8/O8aJs6DKW
	8Fqnk9aKGDOdwMgmnlyaawXQSMi4N8KZPFHwMYfAr8HKxH2IzVkR1h77aaSRbKXc/c7LkxFDz0Dhu
	j87FXZ0+gfLh3/r2df6j9+mozcO6n9/wVVrtLdVzLqnN311t98J0aPy75L3nCl1HmNJaiQBh3uqk+
	zLFcRwRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptxK-0000000F2yA-3enA;
	Thu, 28 Mar 2024 17:54:26 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptxE-0000000F2uw-3VsH;
	Thu, 28 Mar 2024 17:54:22 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-476573535f9so444412137.3;
        Thu, 28 Mar 2024 10:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711648458; x=1712253258; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nG7pFQ9K9R/mz80FNkdLLBY0bbfjalJJC6HLc51WLAE=;
        b=FbHye3F8+P3NF4hBA0RjbXnRK0/EWE0n+n29PWxGARLCrp36+51uryhi1sn4XMAb4N
         R+dGA3CbF98RnvrtT205+22vSEqr1NfcTY8qxC8dDbYf0q0brrwwJh/8qo0NCOmrNha1
         6wxPVkC3o9NSI2BG65PLTs+Ta87ol42vT0uS+q9IxTy7RMEDqSXjND8fi2iT5qMiDSdB
         d8UQD9U+2Sp/KoTLByitFn1rX1Axfa4FJ8z7Ph7Q2aa7HfVHD/ATOJBhQRtrhev1+VkS
         I2aJBNoA2r/jGRYLfFeaIgyEkwKm4VTL77i4Cd/AwPfaxK0u/+037dYhZMtI1Rvk2sB+
         lwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711648458; x=1712253258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nG7pFQ9K9R/mz80FNkdLLBY0bbfjalJJC6HLc51WLAE=;
        b=w0YBHDyBhAM9j7UW6CMAaUViWLeImsleecU3SEsQG+g1b+F2ZCSyAR6NSRF5yktM/N
         cBG+50iLO9llwjssqZzRg35gwZFRiqoMdTb4WURMSnqTg4OKZ41LuTlQ0wWIi81+/qrV
         Hb082NXeiKOm61H000dg90h25lVC7s+Nu95X1m5DxNytr7kNm0lBQsnPp70rEw7BZBaH
         XGoAbjlQ/R9ZzP9BmrqaWh6yNb6LeO9XixgJF8BmQYqapNAePv0OpoixMCmweWfK2a0I
         ZoIJOk6pLvAlw+blumEzBXqIed9JQjPjj/tT2a9c1nm2jcp7b0gu53+b+cNyZ+/BzcHJ
         N1yg==
X-Forwarded-Encrypted: i=1; AJvYcCWagZifg2FP9h6xW9BUGwDQGmogylAfUB+ATiqoKxZnjF8+DtSATR0yklgbCuR5ja2td0LoY1hENxady8Iz7vBOgQoRtWnC4WlBzx++GuFTWJjULwgrBmxdxjLBNI43fBcmAxBtnh1dtoC2Su9h7KbwCKDE61OyVs4uZFj3U5ir1HSSdaPXk1vTKCJhTDniofV1PqHjCSfzfHttbAp3exHpaS6G3NNEYLtFhTRl5dkbWQb7azkzyHY+9DzodrErAGoeo8qbIZdBVl3H97GIiA+HwX6FjYbatXw5dG/Gq0o90cnm
X-Gm-Message-State: AOJu0Yxe4HZkL5G9A2xbd1kEqt1fo+upAmR+96ogd8E6CcKvLpX4Q9ND
	tDWgVLfWUN0x36KBEP3hJ35upcuDTKQAkIbTzxG3kGLswl9XMh5HrN3qA3XGPpb1M3sJBEs5D3d
	BLYHKvR8oiIz6nkuoJL4HN1xJeIQ=
X-Google-Smtp-Source: AGHT+IGBQCwISe8ItG/2YCXarhKnEHlwL8nEFQuoDJ++KAY35MV4NPvZiqYz3quZfRGkQvsUcmc8+OZbNMhL2JCbvQY=
X-Received: by 2002:a67:b64d:0:b0:476:fc98:c73e with SMTP id
 e13-20020a67b64d000000b00476fc98c73emr4018043vsm.34.1711648458714; Thu, 28
 Mar 2024 10:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-5-apais@linux.microsoft.com> <42c445b4-a156-4c43-bf98-bd2a9ac7a4fa@rowland.harvard.edu>
In-Reply-To: <42c445b4-a156-4c43-bf98-bd2a9ac7a4fa@rowland.harvard.edu>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 10:54:07 -0700
Message-ID: <CAOMdWS+4T7rw577q9iW_oin8bbVF4m6Mpx-L2riqno5QX_L=WQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] USB: Convert from tasklet to BH workqueue
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org, tj@kernel.org, 
	keescook@chromium.org, vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev, 
	florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, 
	paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com, 
	manivannan.sadhasivam@linaro.org, vireshk@kernel.org, Frank.Li@nxp.com, 
	leoyang.li@nxp.com, zw@zh-kernel.org, wangzhou1@hisilicon.com, 
	haijie1@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, afaerber@suse.de, 
	logang@deltatee.com, daniel@zonque.org, haojian.zhuang@gmail.com, 
	robert.jarzmik@free.fr, andersson@kernel.org, konrad.dybcio@linaro.org, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	patrice.chotard@foss.st.com, linus.walleij@linaro.org, wens@csie.org, 
	jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, 
	jassisinghbrar@gmail.com, mchehab@kernel.org, maintainers@bluecherrydvr.com, 
	aubin.constans@microchip.com, ulf.hansson@linaro.org, manuel.lauss@gmail.com, 
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, brucechang@via.com.tw, 
	HaraldWelte@viatech.com, pierre@ossman.eu, duncan.sands@free.fr, 
	oneukum@suse.com, openipmi-developer@lists.sourceforge.net, 
	dmaengine@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-s390@vger.kernel.org, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_105420_952941_F74F4F91 
X-CRM114-Status: GOOD (  14.40  )
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

> >
> > This patch converts drivers/infiniband/* from tasklet to BH workqueue.
> >
> > Based on the work done by Tejun Heo <tj@kernel.org>
> > Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> >
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > ---
>
> > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > index c0e005670d67..88d8e1c366cd 100644
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
>
> > @@ -1662,10 +1663,9 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
> >       usb_put_urb(urb);
> >  }
> >
> > -static void usb_giveback_urb_bh(struct work_struct *work)
> > +static void usb_giveback_urb_bh(struct work_struct *t)
> >  {
> > -     struct giveback_urb_bh *bh =
> > -             container_of(work, struct giveback_urb_bh, bh);
> > +     struct giveback_urb_bh *bh = from_work(bh, t, bh);
> >       struct list_head local_list;
> >
> >       spin_lock_irq(&bh->lock);
>
> Is there any reason for this apparently pointless change of a local
> variable's name?

 No, it was done just to keep things consistent across the kernel.
I can revert it back to *work if you'd prefer.

Thanks.

>
> Alan Stern
>


-- 
       - Allen

