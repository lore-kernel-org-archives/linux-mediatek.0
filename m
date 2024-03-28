Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AC5CD11DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 19:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIYRUJlYf8k4Ww5l6bxXyNzs1Z7gSD0K+4rAhlyLzPk=; b=Xb1RC2O1j1HZK3WZ2PJd9fzDET
	co+kPj0n7gmx9VLc41WU86Z+GTtPqyj8zOm6SOUwiP6aCt+U9W7h2CbIZdQ2QydEUie9V+59tG//y
	PRdksKyWhm4sRGNONfsJ8DnTFBkGCUVd8J+g+MV1yYcvsmwixRrr4PtGtmRbbl6LytRWxvXEFH8nz
	eZThxxiQb/f3mDOMFTOr3+76rajROD4XGSUuH8ix+ny0g/xv5hs4pi+xenxHn8K983dVj7PSULyNJ
	KZdUk0zah6TYrzgTEW4wOEKDsfwUkq54mqBJKk5vYvCslT2W+Z3gaCOgkkWu1KsSw3zmFdzHD6ezS
	kcjUWglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvdI-0000000FQli-1HNb;
	Thu, 28 Mar 2024 19:41:52 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvd2-0000000FQhC-0wHt;
	Thu, 28 Mar 2024 19:41:47 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-4d47000f875so504702e0c.2;
        Thu, 28 Mar 2024 12:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711654894; x=1712259694; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WIYRUJlYf8k4Ww5l6bxXyNzs1Z7gSD0K+4rAhlyLzPk=;
        b=KO2Q/VfGtLY6kRXTnGxdFJWVeagjWveFB/rFDg76dSWOtSTFk6zN9QGU5qCj2BV2mb
         s2CilDbzIyd+obEVxr1AgK3J3ziSRiSVnGlHbn+m9C2iiDmpBDNtbR7kPQhevbgpu6uY
         P7PaHRMOfTeLfpNOgHCP3Z3Lh3HLU5zh5H9nn6UH6ovby6jlPu17tq0Y5i7z8a4zhfAV
         aAr6WOEHeDNMXLRISCdxnjj74M39cAf/iuiOrnEHvHsUmDErvfro3LrA0wMfo2qec85I
         hj5/yJE6uuHPpeU9oWib0FnHu5HpGnHYvPBfns9hXFmOTtkqz5RSl6dLOBdsb7Z92ggx
         JePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711654894; x=1712259694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIYRUJlYf8k4Ww5l6bxXyNzs1Z7gSD0K+4rAhlyLzPk=;
        b=vofRtCpLpr5zzCRkeK2P1sLJrNeIc71i3FBG1XaIVXjKsrKmskQpbLM08iiS+cpLqM
         9UgL77r6E7xOhGhugk6/mlWUrV9KcKK/NkRtPmfHVSIUkPSghqXvgSgg9ihrvQZUNR06
         FCV1/xt2FORb/BzAsSkOOZ2EO2Koopkv7egqblmq7GHXja7oOXZp0keVBoxnXMgHHyhI
         ep+H5je3BLjNxwjdF5YykSWIbqWmQ1AeWVhC5VH3H7CnCbtfABJ0g60A7WMmnd/8TgpI
         hDUHKsjnd1iuuef7H5cwSK6b1qSCRvsw5oa6c8DePcSKP9WH26I6JLwErKKmHuyjG1Jh
         BsRw==
X-Forwarded-Encrypted: i=1; AJvYcCVtdM2PXTqNUAIWtztGnmDgYirs6Zk/V/bWqNuxAFtoQVn6G45mCmWqNqciP7/mjsPJr615tj2kgLsVlrBF6GznaKWH8rnGUMgBkhxToPiJWnC2f9HAZUI5kukB/EOmSQ+imak76PFaoQtOXPo8np4bDlQDgwlh2rJOZ0BCZxtwb55eN7Wuxaz/GUgk0NEthQEIpEriJii1hQsv8EG/LAJmMb06YP8SX99c001TqrmLOPzwXItdafmj8BByFuA/L+wxFxTurX5kFDYVrtzXKlEnvKJmF8OkeKihfKFG2saDGtQH
X-Gm-Message-State: AOJu0YxgDskPd6/0CSVZvA0e8brH4JvdJXxkauoi06Li4h5MrgvIatOW
	0Q4FW9BDz/qqY02jIgE9aAX6nEtYRjHM3u1T1FzO03hw8kguh1K28Oj7DjUU/RaEQtaHnBfQaLd
	N78Ey06Ma0TT1YeDwuR+q0UwQwiI=
X-Google-Smtp-Source: AGHT+IF7RrkP6jmtYq8PnUCxuTgzt2Qt4CTC9MlCAHIq165hbFM88DzkJJ/z4aTnoTdb1soUmIZQWdyI4gYKg4Ogr2U=
X-Received: by 2002:a1f:ebc2:0:b0:4d3:43f8:8541 with SMTP id
 j185-20020a1febc2000000b004d343f88541mr348710vkh.1.1711654893631; Thu, 28 Mar
 2024 12:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com> <ZgRePyo2zC4A1Fp4@mail.minyard.net>
 <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com> <ZgXDmx1HvujsMYAR@mail.minyard.net>
In-Reply-To: <ZgXDmx1HvujsMYAR@mail.minyard.net>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 12:41:22 -0700
Message-ID: <CAOMdWS+nB5EENp_Vb=k1j77nrch5JgbZP2XYPJ2ieTja14zB0w@mail.gmail.com>
Subject: Re: [PATCH 6/9] ipmi: Convert from tasklet to BH workqueue
To: minyard@acm.org
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
	stern@rowland.harvard.edu, oneukum@suse.com, 
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-s390@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_124145_111495_B401F888 
X-CRM114-Status: GOOD (  18.43  )
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

> > > I believe that work queues items are execute single-threaded for a work
> > > queue, so this should be good.  I need to test this, though.  It may be
> > > that an IPMI device can have its own work queue; it may not be important
> > > to run it in bh context.
> >
> >   Fair point. Could you please let me know once you have had a chance to test
> > these changes. Meanwhile, I will work on RFC wherein IPMI will have its own
> > workqueue.
> >
> >  Thanks for taking time out to review.
>
> After looking and thinking about it a bit, a BH context is still
> probably the best for this.
>
> I have tested this patch under load and various scenarios and it seems
> to work ok.  So:
>
> Tested-by: Corey Minyard <cminyard@mvista.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
>
> Or I can take this into my tree.
>
> -corey

 Thank you very much. I think it should be okay for you to carry it into
your tree.

- Allen

