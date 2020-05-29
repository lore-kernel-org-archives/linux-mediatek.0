Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A64AC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 10:16:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E10FD2075A
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 10:16:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fM0OFdBx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E10FD2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GeL9jsmdn8FSKTvOGMlLf8PPvIg/64FP/HMWfvq4YEo=; b=fM0OFdBxxx2ki1
	YlyDoRjymgtO+wy1CVilvwmLYmOfhUBKrsHyP7zWtfbTtovq8jOLPB9FLST86WFGqtujCLwyYBZzn
	Sh98A1mKfvTvS6vZikFCRumwY5x9cce7u2/6pyEO7K6/Cc31+xkWipGKfAWeJQzv7LbBfcsHOC6Ws
	txrDBC002gzH9L+qxXhIHm1Usx4hZRyCYdros1F2yuGvY0BwL5aC1klagr1Q8Xld72ZcXFETLMHl/
	OSbRgnKwlurkv6wmzMC00D+sa+xYK7AXnjGGquUFjOCs6cxH65A16S/NwwE74dtD5KnX7c7lgGRo6
	uYYAxsjDXNm0zCIIuSYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jec3n-0001Ix-Ec; Fri, 29 May 2020 10:16:19 +0000
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jec3k-0001HW-4t; Fri, 29 May 2020 10:16:17 +0000
Received: by mail-lj1-f193.google.com with SMTP id z18so1881452lji.12;
 Fri, 29 May 2020 03:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qb23YrFge2bev6B+pdY5MYpRbBAt1YLbxMOSUywPdHk=;
 b=QUJHk+rjfRS6Mzozco5dZQcKmlQCv3K+k7fXcHZVtkKN1OsjLSbGXLrDrMqo4kt27X
 qXJZdsrLnIIVVsbRL6iobjoaxczwLwn+tSEPQT+HkmPKEcREUWjMLoFbbvip4IFI+ps5
 f+ZC1PV27uIPZ7F9L3NftBBl6dm7Phfz9SEWFLiVu+gx9VDehV2XztHwlKSRomMolEV5
 cHZXjVrOGS+4krw/wCQ3dVoA9n4pXghfTDoSAn7832VZ+bNtDWZCnug4CDiYx7+zLs2W
 e7wLbORxEzJTKqt9n9onufO0NSrOPhZIkGSA7ejo28Ia3FTSnDRem0EaLH9FGOrYgSk9
 IfBg==
X-Gm-Message-State: AOAM531VKpvp5XfU4otPrV7fh6bPZ8cWv9naqDWS/3wzKKqynDJ79aAv
 +IE1Gh2KYZj4bZzfgn4pFXY=
X-Google-Smtp-Source: ABdhPJyb49lJcndlDqUtkrSajYOpqC0lpLBM00Du0tW1RABChW4sreguvSnQJV4+HR28+sDilaHYIw==
X-Received: by 2002:a05:651c:39b:: with SMTP id
 e27mr3886282ljp.253.1590747373144; 
 Fri, 29 May 2020 03:16:13 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id h26sm2236339lja.0.2020.05.29.03.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 03:16:12 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1jec3c-0004TR-D6; Fri, 29 May 2020 12:16:08 +0200
Date: Fri, 29 May 2020 12:16:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: Re: [PATCH 4/5] iio: light: lm3533-als: remove explicit parent
 assignment
Message-ID: <20200529101608.GC19480@localhost>
References: <20200522082208.383631-1-alexandru.ardelean@analog.com>
 <20200522082208.383631-4-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522082208.383631-4-alexandru.ardelean@analog.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_031616_190737_B6A4A29F 
X-CRM114-Status: GOOD (  14.01  )
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
Cc: milo.kim@ti.com, tomislav.denis@avl.com, dan@dlrobertson.com,
 heiko@sntech.de, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 linus.walleij@linaro.org, eajames@linux.ibm.com,
 platform-driver-x86@vger.kernel.org, paul@crapouillou.net,
 lorenzo.bianconi83@gmail.com, songqiang1304521@gmail.com,
 srinivas.pandruvada@linux.intel.com, linux-stm32@st-md-mailman.stormreply.com,
 devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org,
 khilman@baylibre.com, tduszyns@gmail.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, wens@csie.org, kgene@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, agross@kernel.org,
 linux-input@vger.kernel.org, orsonzhai@gmail.com, alexandre.torgue@st.com,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, jikos@kernel.org, vilhelm.gray@gmail.com,
 mripard@kernel.org, vz@mleia.com, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, ak@it-klinger.de, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, fabrice.gasnier@st.com,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com, rmfrfs@gmail.com,
 shawnguo@kernel.org, dmitry.torokhov@gmail.com, coproscefalo@gmail.com,
 linux-kernel@vger.kernel.org, rjui@broadcom.com, slemieux.tyco@gmail.com,
 bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com, zhang.lyra@gmail.com,
 baolin.wang7@gmail.com, ktsai@capellamicro.com, syednwaris@gmail.com,
 peda@axentia.se, jic23@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 22, 2020 at 11:22:07AM +0300, Alexandru Ardelean wrote:
> This assignment is the more peculiar of the bunch as it assigns the parent
> of the platform-device's device (i.e. pdev->dev.parent) as the IIO device's
> parent.
>
> It's unclear whether this is intentional or not.
> Hence it is in it's own patch.

Yeah, we have a few mfd drivers whose child drivers registers their
class devices directly under the parent mfd device rather than the
corresponding child platform device.

Since it's done consistently I think you need to update them all if you
really want to change this. 

And it may not be worth it since at least in theory someone could now be
relying on this topology.

> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  drivers/iio/light/lm3533-als.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
> index bc196c212881..0f380ec8d30c 100644
> --- a/drivers/iio/light/lm3533-als.c
> +++ b/drivers/iio/light/lm3533-als.c
> @@ -852,7 +852,6 @@ static int lm3533_als_probe(struct platform_device *pdev)
>  	indio_dev->channels = lm3533_als_channels;
>  	indio_dev->num_channels = ARRAY_SIZE(lm3533_als_channels);
>  	indio_dev->name = dev_name(&pdev->dev);
> -	indio_dev->dev.parent = pdev->dev.parent;
>  	indio_dev->modes = INDIO_DIRECT_MODE;
>  
>  	als = iio_priv(indio_dev);

Johan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
