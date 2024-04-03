Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF5CCD128A
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 13:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfJ432sdibD0Lka67Qj4+39whrzSunQCkb9XAcwEVWQ=; b=NPFGxJml3/cE14mw0VHLlxSmyY
	16xyu6wzv6wcp4Tr5iwH5mxPQVrNRyJ20Fr/R0SmxXx4cbiI00PJu1uFr+znjwbYibYtpCSj+ov3n
	hFCDGBor+jLfF/PvdifnftQHT/hAlWGsJ8PPNwrBmNCgyVMpCS8DUhH0UuEWhlDRtvJD/EXuYEMIn
	b/KM3pTahegqr7TxX1OnT7mXnd4UtaiFC4qZzsPXJHIPDRc59RJDGqAuW1FBQwvDcwi/fAy1tqW9O
	263Gz9y4SxYx2l/0I/QqmHZETaUDiKtraz8M3BABCB3J8MF1Tm9S5v0h23vzMdrqx+nGWE5REFBCe
	kq+OPysA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0kI-0000000GEUK-0mYW;
	Wed, 03 Apr 2024 13:33:42 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0kC-0000000GERm-3Wnx;
	Wed, 03 Apr 2024 13:33:38 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5a4f608432bso3990221eaf.2;
        Wed, 03 Apr 2024 06:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712151215; x=1712756015; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UfJ432sdibD0Lka67Qj4+39whrzSunQCkb9XAcwEVWQ=;
        b=ThBTOpns8YaLJf6pChW3WVdxrIi+QFt0XaKXDRNjU4xbpimIRfLMOauW0J45p7jTUW
         5cmpwo0J0TI6xH0TXV2TjQIe0+RKhj1GagIFMM2IOBs24fJchWeStOe34Urmgem8x3E6
         cph1gDY4acR8pjYqKh5uSUC084wvwYBn+aqtHWF5IomnFbQvNSHT8AflZh6iuYNU9yN+
         3URQNKniVqQT4I1HU3tfWFwsx7kH8XA7A4zBclVIbcHs0HxRVyhP4LsEQ2kkUxxLpDQh
         xmAbEB9qDgELEDjKu+tScUe/cIAbr/2oSBx81r1PTFj0GhYtfTzA0i9DgAkl4niA2fvl
         OOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712151215; x=1712756015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UfJ432sdibD0Lka67Qj4+39whrzSunQCkb9XAcwEVWQ=;
        b=Ioic9GsTFdaxt7Pj/EuL5B7uhVgoH0NWzUfV/L+78JdjjSgMjXAggOleWs2c5RdprW
         Q2k+EIujIfDjRN0iSHXZBnMA7b+0+bV2QiTpcYjKe8eAY6Hn8e03UzJ3NehhFaBSrjVl
         qTlgvFUHoIElhY3tiH2hUHW38VgsjV7DqkNBOe1yqg2NmhWX4lxnnRygAtNQp5+/obzn
         7IOrYLFcYRm6ErzSlJ/u/SOL/frFTYoyZab8gaFJPx4BGnURt6K5SbVSE4GkhZtFpDNJ
         hFMQx89Ed+98+c3/uUDtt5aH6ACWgi4Sf/uPYG+rYJQWYOKG5gUvzlo8DgwWT6zNeN5p
         Rerg==
X-Forwarded-Encrypted: i=1; AJvYcCVoAQ+cCxLXn+2ZkpWDLhgWzZhnVvRPnMceIK/o20jum18FCp4JzWgldKSuKj2cjMQkgWbRdXNwHWwBybhgyBl2mauA/TwIlJ9BpCMk8UMt7pLoBGqpyqjOXzbhK14mdXDFNE8pGQrR0kWk/bhYdsVCVF+5VGEEDPrpSUo018LgeWzH6P7V8yQEnO5BBqlbkFfnBCiz98wSaY9qEnd4WN7QNVDal4iW7tRYgLyNiFEvnPAE3S93dtLnS2Go/8LATF/lPJ5s+HwyOgQ+zzgtqArZArz6Y0HqyGFJ+FBVloL45V30
X-Gm-Message-State: AOJu0YzgURUVuc4iPKhzTLkwbuIex1BXWygdG0cphJqqJzKDv7pZGbMK
	JnsJ9OYaJEdyJPWSW/7bnk/VFTlMA73KJojVdLoxrC2jOTc1QQ+gHppqj/yVTlKl2y4ZbQ9Fx2b
	3cqoknc4okTOgBKEYqThkJzw9rP0=
X-Google-Smtp-Source: AGHT+IFsoYFg4TPJZ/xBylk5B9Nfa55HU119ldFLC4g550cJsZKKSI+Id/ONzGwerMZ8W2tZHWzr/Kf097BxBvAdyL0=
X-Received: by 2002:a05:6808:181d:b0:3c5:d426:9b87 with SMTP id
 bh29-20020a056808181d00b003c5d4269b87mr1074785oib.23.1712151214780; Wed, 03
 Apr 2024 06:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-8-apais@linux.microsoft.com> <ea4ac7a3-13ae-4d22-a3d9-fcb7d9e8d751@linux.ibm.com>
In-Reply-To: <ea4ac7a3-13ae-4d22-a3d9-fcb7d9e8d751@linux.ibm.com>
From: Allen <allen.lkml@gmail.com>
Date: Wed, 3 Apr 2024 06:33:23 -0700
Message-ID: <CAOMdWS+wH9qZ_08nVSQV1sY0C=uHMC+3NmPuFjwKzBFCgMa7MQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] s390: Convert from tasklet to BH workqueue
To: Alexandra Winter <wintera@linux.ibm.com>
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
X-CRM114-CacheID: sfid-20240403_063337_093630_9CD57E9C 
X-CRM114-Status: GOOD (  19.34  )
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
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > ---
> >  drivers/s390/block/dasd.c              | 42 ++++++++++++------------
> >  drivers/s390/block/dasd_int.h          | 10 +++---
> >  drivers/s390/char/con3270.c            | 27 ++++++++--------
> >  drivers/s390/crypto/ap_bus.c           | 24 +++++++-------
> >  drivers/s390/crypto/ap_bus.h           |  2 +-
> >  drivers/s390/crypto/zcrypt_msgtype50.c |  2 +-
> >  drivers/s390/crypto/zcrypt_msgtype6.c  |  4 +--
> >  drivers/s390/net/ctcm_fsms.c           |  4 +--
> >  drivers/s390/net/ctcm_main.c           | 15 ++++-----
> >  drivers/s390/net/ctcm_main.h           |  5 +--
> >  drivers/s390/net/ctcm_mpc.c            | 12 +++----
> >  drivers/s390/net/ctcm_mpc.h            |  7 ++--
> >  drivers/s390/net/lcs.c                 | 26 +++++++--------
> >  drivers/s390/net/lcs.h                 |  2 +-
> >  drivers/s390/net/qeth_core_main.c      |  2 +-
> >  drivers/s390/scsi/zfcp_qdio.c          | 45 +++++++++++++-------------
> >  drivers/s390/scsi/zfcp_qdio.h          |  9 +++---
> >  17 files changed, 117 insertions(+), 121 deletions(-)
> >
>
>
> We're looking into the best way to test this.
>
> For drivers/s390/net/ctcm* and drivers/s390/net/lcs*:
> Acked-by: Alexandra Winter <wintera@linux.ibm.com>

 Thank you very much.

>
>
> [...]
> > diff --git a/drivers/s390/net/qeth_core_main.c b/drivers/s390/net/qeth_core_main.c
> > index a0cce6872075..10ea95abc753 100644
> > --- a/drivers/s390/net/qeth_core_main.c
> > +++ b/drivers/s390/net/qeth_core_main.c
> > @@ -2911,7 +2911,7 @@ static int qeth_init_input_buffer(struct qeth_card *card,
> >       }
> >
> >       /*
> > -      * since the buffer is accessed only from the input_tasklet
> > +      * since the buffer is accessed only from the input_work
> >        * there shouldn't be a need to synchronize; also, since we use
> >        * the QETH_IN_BUF_REQUEUE_THRESHOLD we should never run  out off
> >        * buffers
>
> I propose to delete the whole comment block. There have been many changes and
> I don't think it is helpful for the current qeth driver.


 Sure, I will have it fixed in v2.

- Allen

