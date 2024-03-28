Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3627BCD1283
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 17:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOul4usuPisehHXyQcZLwgce2H6JwRccYEaJQWtP1Jo=; b=RkCnYlQas98cy3zTxCK2+F0bBx
	kaTo54EYHh9sdSWmPZ+Kh+cUloackY0bV7q0PDkW8m7/MAmAFY4HUOHw+k92+cgP9CCgMhEFn4O4u
	NU0PHRj/gbENimdJZZXpTVIMj8auasdpiaokzbpFDHJENjk321igwv7/hefFKGwslKKyjycefA4EA
	kTXm/8jO/2Geb50jBGKN/jDEuWfqU90lAsw8ouNkkdv2k1jgpjh8+FiDMa0DZiwToGri4JDbWrVum
	XidNE7PBqrfb9SycLcIbWHHlz6s+0/Q7nxyi0ESvweXlBHEypWeEn5DV+ePNwDArf3+bbW/dAaceN
	8ZczwD2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptqZ-0000000F1Ya-2Il1;
	Thu, 28 Mar 2024 17:47:27 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptqT-0000000F1U6-2Kl1;
	Thu, 28 Mar 2024 17:47:23 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-4d870fb9f5cso429458e0c.3;
        Thu, 28 Mar 2024 10:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711648038; x=1712252838; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOul4usuPisehHXyQcZLwgce2H6JwRccYEaJQWtP1Jo=;
        b=HZ5IVTmXHtivwO/6/aTl1s6o/ZOIlwBRg93/T2Y3uCW91gSPu9oqMaOxvXdcztliIO
         Qq+NyrHsYiDd9ARyM7QHD/hqlM8DiDrVqzRIg+y0A/TncfcaFvd88XJqM78qu4VKESvD
         h3mqaWTsVw4eB+E6mnPWOWusTvmzLFTORNr8yvHE1GfbiLNC7a0PXZYDD1YYUDVf0+Q+
         E+MbqEeI0RMR+x1Yh6IJwa4CMmx31qPDnu50OMdGANPP2BOIzwqLKWMLFUjE/pvBPiWL
         d1XXMflZUIGkYVd1AIqziujdynReOQioqt8Or53Wj20SdvGGCCmS1CX3c4RSgtYzPkCH
         EDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711648038; x=1712252838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOul4usuPisehHXyQcZLwgce2H6JwRccYEaJQWtP1Jo=;
        b=jfL8MisCqBtU/JxOra8hw9gxRCjHDIzePVWuvaXp1lnWEmjEEwvdV2Ji3rKFjDMvkj
         ij3VyXQZ7FtfX/YpNzYflGJ2Xcs3lzvERiVCHOLq0WagX597ZbUZNG3+n3jX0zgxBs8C
         dv3d6ITM3rrDP6W3/T9E6NZFs0FKYNUd+CiYU6aa5E6IpMnMBOGkGi8HmwLzRqG65Nhm
         KLd8L7KlB6l9aMJs3HcI4FPYmGixSBziRy+MiyEwqo44ibAEM0mv35e7k1MNV03KmBr5
         8Mcu2Z9XCP4aozd1GBkEvFNMNSfvQ4z/O1Hb3my/O387SZveTXf6hDGtiDTAevnepg+R
         Ch7A==
X-Forwarded-Encrypted: i=1; AJvYcCVUJKKprlYoadVZFeFFlquzQQhynmw5hlFELX/1684EQIxSoKQ/fSsE5EFv2TP9wO7aq3SkSaIeQD0+WZ9dc10bhNHiGWSB1sLpYfd0xTuRnVkfAyX2iTzBiqC7ZGSDpucHqUlrPwe2nBfbhEML/HQfyWBwO8jZUHG3eAd/EteKaLgM799aKMoADooUbZWbuAfQmJpVH6zThlH0UzuAqmOiM/7/2ZwRq29zPw2/KJ4Q5grolOONUEIKmJNQwvbQJiUj2kMTICnSIKfUS61mxuAV0QqiB/NoyiDyJZpVjzoiZWFy
X-Gm-Message-State: AOJu0YwjQIQB4313jhwIElBKfsMgPzhKfJgiRv8SbKYnfJQWX0bwksCF
	XDH2k7AonJUsPZXW49zNVVUQYWCm2bJ4YabSYoiKHtXnr1L9mO+qC9XVb1DL/H6yvYLUqN7lajK
	KnJx/AWCeaZNAk97UYEzeyrzpMAQ=
X-Google-Smtp-Source: AGHT+IHhsrATdsPlGDNfn/hR7BQXc3o4d86Rd7NcYHBOy9LUQjNRQoJ0rDqs8OMJuSA4Qyiba22Ugt9rz6m/+ouyIBc=
X-Received: by 2002:a67:f7c6:0:b0:476:fbbb:14bc with SMTP id
 a6-20020a67f7c6000000b00476fbbb14bcmr3836850vsp.30.1711648038557; Thu, 28 Mar
 2024 10:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com> <9c31b697-3d80-407a-82b3-cfbb19fafb31@arm.com>
In-Reply-To: <9c31b697-3d80-407a-82b3-cfbb19fafb31@arm.com>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 10:47:06 -0700
Message-ID: <CAOMdWSL9GUkoOOX4LNwMOV24-8xnmFKep15xj8NnmnBss-RYAQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
To: Christian Loehle <christian.loehle@arm.com>
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_104721_702469_46500B7A 
X-CRM114-Status: GOOD (  16.02  )
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

On Thu, Mar 28, 2024 at 3:16=E2=80=AFAM Christian Loehle
<christian.loehle@arm.com> wrote:
>
> On 27/03/2024 16:03, Allen Pais wrote:
> > The only generic interface to execute asynchronously in the BH context =
is
> > tasklet; however, it's marked deprecated and has some design flaws. To
> > replace tasklets, BH workqueue support was recently added. A BH workque=
ue
> > behaves similarly to regular workqueues except that the queued work ite=
ms
> > are executed in the BH context.
> >
> > This patch converts drivers/infiniband/* from tasklet to BH workqueue.
> s/infiniband/mmc

Will fix it in v2.
> >
> > Based on the work done by Tejun Heo <tj@kernel.org>
> > Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6=
.10
> >
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > ---
> >  drivers/mmc/host/atmel-mci.c                  | 35 ++++-----
> >  drivers/mmc/host/au1xmmc.c                    | 37 ++++-----
> >  drivers/mmc/host/cb710-mmc.c                  | 15 ++--
> >  drivers/mmc/host/cb710-mmc.h                  |  3 +-
> >  drivers/mmc/host/dw_mmc.c                     | 25 ++++---
> >  drivers/mmc/host/dw_mmc.h                     |  9 ++-
> For dw_mmc:
> Performance numbers look good FWIW.
> for i in $(seq 0 5); do echo performance > /sys/devices/system/cpu/cpu$i/=
cpufreq/scaling_governor; done
> for i in $(seq 0 4); do fio --name=3Dtest --rw=3Drandread --bs=3D4k --run=
time=3D30 --time_based --filename=3D/dev/mmcblk1 --minimal --numjobs=3D6 --=
iodepth=3D32 --group_reporting | awk -F ";" '{print $8}'; sleep 30; done
> Baseline:
> 1758
> 1773
> 1619
> 1835
> 1639
> to:
> 1743
> 1643
> 1860
> 1638
> 1872
> (I'd call that equivalent).
> This is on a RK3399.
> I would prefer most of the naming to change from "work" to "workqueue" in=
 the driver
> code.
> Apart from that:
> Reviewed-by: Christian Loehle <christian.loehle@arm.com>
> Tested-by: Christian Loehle <christian.loehle@arm.com>

 Thank you very much for testing and the review. Will have your
concerns addressed in v2.

- Allen

