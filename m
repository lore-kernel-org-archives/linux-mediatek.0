Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F67FD063C
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 06:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zvEX0IAkMa6oXnGfx3rdipMmH1BF7wL9zhJ+aTV/NY=; b=nCWUBYiAGR4PmlMiu/M7A9x60y
	iJLV8Y4kqkamGeRE0X1kcQ6QAUMm8a5HkRM1+0PwHC5XVsD+LAK9ttj7d0gKIOLRGwCA1uF+Lo3yO
	Nu+zl8FAsksLTi8g0gOcK3+nMwd9m5pvtigqyRnmf9WZidfhnziNH3U8Dj9z4mPtZjhwQR/4ffLLj
	mc22Epg6/n8ymlBxDi7DhH9RCqhW4ws5Qium03aM1l/X4qVVGiy5VpmctQ1Y7CO+Jiou9Xr6O86qS
	d6A6YCyqN8P4/wOcm1Wz0eUClqhBaHNaZX5QEotURaYlJd/NvnL7fP4IjsgwxV1xKGD49V+AfItBA
	WGwjI88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DPk-0000000AxJl-3j3g;
	Wed, 11 Mar 2026 06:51:28 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DPi-0000000AxIi-3QJh
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 06:51:27 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48534237460so37733865e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 23:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773211884; x=1773816684; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7zvEX0IAkMa6oXnGfx3rdipMmH1BF7wL9zhJ+aTV/NY=;
        b=lg/uRwd0+XT/yoFMs1uG69Y9zljo3OS1kU6wBEP+FFy+Zuxi3yCSx8u0odCAw8BPEe
         Ud6mk9U3o7e4LtmCBh2kVJSK/QlRaJCMFctNCzD3OEu1ZxLf8g1fLVvX/8TX+qwMofnT
         5amM6h+9oYHtvRCu+Hqh0Colm3iy3GIjMWtNTJr8xJNyhFrULtY9frPH11Z/FE/40FXP
         4Lw7TU+2JMtlzJ9sDTyuuCUCAZPNfLyiWMyArkfZg6hvOE2RdPnzjNuvwwiRbj3/aHKl
         S3P+ARtmJC/36UlwfORbKyYcFaYp2Dc299lJ/N/0TbN0nwqN433txYuMv2zVgR/fFyOG
         7efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773211884; x=1773816684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zvEX0IAkMa6oXnGfx3rdipMmH1BF7wL9zhJ+aTV/NY=;
        b=gK21u12yeeVDVZYV3pAFh5UIm80+pWMaVelg5dqJ4m0Re3WNTkMj7FDwdEJNNmXQV6
         baGEhT0PM+0CSwCdPvNEoNJA5ppNXGipmBxVXd964GFst+f6Ypg1oTzFRRL5T8RTHct1
         w1ZT8O268UkjFbvAjH9rD9J1UDdApp99Si7ig/waDcXddz8TAG0Vn5ztlH5Y7QjP+h2Y
         UoHCSvmFH27uYXc0F7u9uLIlrxtUBUXogHRmLRiabE+iBkYSQJXtBr9DevgQg3eqzyWZ
         WCjHWqEkU37T1lyliQa96nnUMCawYYtkKsRRgtIZzX9EL0mHboulm3MhIbpwxQV/fsKc
         ZIBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaCnGLEVQDZxLcdTfSStAY0gTLxDspTwH8bUK8DMmhWTsu5nlVqaQrnU7630jBvz7DMLT+c6fGkcFDzXpjvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywff0XyTQ1RyXdH8h4mMSUHP2SFDI27aaQICnFHS473aKU8H8Pt
	lnBfWxkdLrmRLGEvwWkYZtW9crk7cLfkzewi1TyWigar6/2/b6bePZ2NfOm+AjlNQSE=
X-Gm-Gg: ATEYQzyEMoRHOwbqyPfsh72l8yiKtxXSg8wADQkxP+Fd0Pt0f9NsBiNHd4xRy0TG2IP
	dTfEhpMjqlc/Ow4fIM1gMMVc1wygZW3qfTa17w1vc7ZmHF8kKXMLxDj9w/Pu/4Z9QKPorx0AEow
	LJpOtwEgDXzM6vYiEvI9emH5PUwW6F3NU33UIZ/560r8Ix93PmeG1W2RWZuZtDFtoFW016rjPBq
	KEvIfyLtQl2JUXLMX39YjUOZvSBwOPalXjl63/ZmfMWACe57z9kH119n1cPs7CsvEDelIqt+mOf
	6mz9HViH74uEn9dh0Iy2ji1FyE2DnlBtqHw1lZwyBSerVMimM1SVeW4mopSZ3kxZP/pf77sAQgo
	ygw+bX+az8px6pFVfnzBb2udMFIkGKIYYcpXe4bG8Ams9VUucH4Mrp2VDgGdcXYkPPrLzUlqF4P
	VBbaZOvZ4tgUD5w4I5RhTOIoN/lrgI
X-Received: by 2002:a05:600c:1383:b0:485:2fe9:3375 with SMTP id 5b1f17b1804b1-4854b0bff59mr23795475e9.15.1773211884113;
        Tue, 10 Mar 2026 23:51:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f820a2f1sm4090148f8f.30.2026.03.10.23.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:51:23 -0700 (PDT)
Date: Wed, 11 Mar 2026 09:51:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org,
	m.tretter@pengutronix.de, mchehab@kernel.org,
	p.zabel@pengutronix.de, tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
	kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org, ribalda@chromium.org,
	straube.linux@gmail.com, lukagejak5@gmail.com,
	ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org,
	mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH 1/7] staging: greybus: simplify cleanup using __free
Message-ID: <abEQ6HA0CGGCyV1B@stanley.mountain>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-2-sanjayembedded@gmail.com>
 <abCIBPZzZBfMoOtm@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abCIBPZzZBfMoOtm@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_235126_891229_A1FA976F 
X-CRM114-Status: GOOD (  13.28  )
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

On Tue, Mar 10, 2026 at 11:07:16PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 11, 2026 at 01:35:07AM +0530, Sanjay Chitroda wrote:
> 
> > Replace manual cleanup logic with __free attribute from cleanup.h. This
> > removes explicit kfree() calls and simplifies the error handling paths.
> > 
> > No functional change intended for kmalloc().
> 
> ...
> 
> > +	struct gb_camera_configure_streams_request *req __free(kfree) =
> > +	    kmalloc(req_size, GFP_KERNEL);
> > +	struct gb_camera_configure_streams_response *resp __free(kfree) =
> > +	    kmalloc(resp_size, GFP_KERNEL);
> >  	if (!req || !resp) {
> 
> Now this check should be done in a better way.
> 

Yeah, two if statements, right?  Drop the curly braces at a minimum.

> > -		kfree(req);
> > -		kfree(resp);
> >  		return -ENOMEM;
> >  	}
> >  
> 
> >  done_skip_pm_put:
> >  	mutex_unlock(&gcam->mutex);
> 
> To complete this, one may add a prerequisite to use guard()() first.
> 

I don't think we're encouraging people to re-write existing staging
code to use cleanup.h magic...  It's unclear if I have to review these
patches or if they're auto NAKed because we're not doing the conversions.

regards,
dan carpenter


