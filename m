Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31556C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 12:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYDEIQksW8zQ45WbeyUEVn5ldQ4luRyFOVVyheFSkHo=; b=FmjJN1oOjpiiH+IoFyIIQ9Wrfd
	5RMTPKLuvKgw2d7XGzVuhFxspmqcQtyPYah2ek3qXwj/IHk6z8XbDqiHfqeXZsaXymP1uFYhz2rEH
	5dNHA1piBnLngANvnqQMwfZBcqAZQ29IBE70A6ZUx2vgzhLzj4R5KNfh64tA228sXk9AU0r8ZHc/S
	mjdMQzecdVfaKhMmPlqMGfT3crYMCHeMMPE93sLDNRBpk8S5T9sf+rHPHDJ4cBTnIS2Oxaq7gxV8N
	xxv52g5EiONAsJI6BG/QtqrhqQ3lkYMcyEeiAybC0c1DEQatnnFwd9Lw2Oqcn6uBvAG2Xm3DFao4b
	xZ2VSdgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdCn-0000000B2fE-3EFF;
	Tue, 02 Apr 2024 12:25:33 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdCj-0000000B2co-1ml3
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 12:25:31 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-dd10ebcd702so4738369276.2
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Apr 2024 05:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712060727; x=1712665527; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYDEIQksW8zQ45WbeyUEVn5ldQ4luRyFOVVyheFSkHo=;
        b=z6urLKOivvOt8R73V0DdXKcZdzAGLMJ8HWiGB3gbTIKvuM0NcdypDBeFtjn9Kc2N3U
         LB/MF3Vx671XWNJTP5mGlT+kuDhJkLhreC0wSyGkGNkv12cVzstOcga4Ax1k3aQ+RCrW
         RmuirjfkFUOLaijwJV3PqEbY9XUTF1ZaaIdseAer9rkAW6Ecwe+0ubT9e/Xy37QIgpcp
         SznwplqTWi/7dRdwf1hjvHaNa3j5/wf2Ef1Hp3e98zWos2QWl9hAeI2t9wl2Ceb/F9hT
         Xt0j4sSSKZ/62qKGpIGQ+ffvvlPgqkYDC5SeFvuLo4CLCF3ok1TXufKPP+9KnEMeDpJo
         uAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712060727; x=1712665527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYDEIQksW8zQ45WbeyUEVn5ldQ4luRyFOVVyheFSkHo=;
        b=oKOE0Z+iE1dlHEavTTdwVWEfA/x9zUTWlWPdEDzQCLyTh+DjFd6wCZZ1oW6ltneTQG
         IFaNNRUfOJt5dTNpfdLa+TeestjBUsgmTRpdziADf8z0JNwbizHhTc/vFFaI22qCQZl/
         /5AgZ1kI5ZFdST9vGbx0ADs4VwNjJSARE/ZacbvS5uPH/eS3Jlmf6FNLIWXKxou2BBOv
         lCP2FW9cLtX4MXC6/T7ApyKv55WiRi9znrbaDkcyFoMgP+NVoGipn6eAs9U5jpXDxEy9
         wxzcf3ZfKPPJkI7kByRJatk7nTYEFpI5tzzLd4FG6UQ/6EGWJijAKazPoh5uVz7uU/OZ
         b9Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXeeKbBxV0b6b4H4TVNKlRCeX/cqMW5ldBiIf9pThLCkQBc8FDr2pqnlA6HJTlPZp8fUoYzDw92k0p2zUsrAorpi5W4QqnC73Zv6PPvu0mR7AGc
X-Gm-Message-State: AOJu0Ywzy/yVBCTAelOusUZu1wm2DzEQcpgrDhTZeapZ8K3/zC8ko+dZ
	xp8CAMSH7PgSCCJHDdD3e5gBLullxuqGTqypGu2E7zF9Az09P7j3dIkjp41FXRNWmj1kxGMkac5
	CgOU9vm+/nWK0881PoEQBpV6lTHYfn3t7k759Qg==
X-Google-Smtp-Source: AGHT+IFUrSspS0uEXi4Mtdf0lWq2f6Bt6/664idaePnQ5n7gs/Aofr4lkRbBJPYECBaOux5ZgxpPBc0T/C/GsKmHDRA=
X-Received: by 2002:a5b:104:0:b0:dcc:ec02:38b0 with SMTP id
 4-20020a5b0104000000b00dccec0238b0mr8733778ybx.64.1712060727251; Tue, 02 Apr
 2024 05:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com> <20240327160314.9982-3-apais@linux.microsoft.com>
In-Reply-To: <20240327160314.9982-3-apais@linux.microsoft.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Apr 2024 14:25:15 +0200
Message-ID: <CACRpkdaSBGe0EFm1gK-7qPK4e6T2H1dxFXjhJqO2hWCm1-bNdA@mail.gmail.com>
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
To: Allen Pais <apais@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, tj@kernel.org, keescook@chromium.org, 
	vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev, 
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
	patrice.chotard@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com, 
	peter.ujfalusi@gmail.com, kys@microsoft.com, haiyangz@microsoft.com, 
	wei.liu@kernel.org, decui@microsoft.com, jassisinghbrar@gmail.com, 
	mchehab@kernel.org, maintainers@bluecherrydvr.com, 
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
X-CRM114-CacheID: sfid-20240402_052530_412346_C85A58EA 
X-CRM114-Status: GOOD (  12.08  )
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

Hi Allen,

thanks for your patch!

On Wed, Mar 27, 2024 at 5:03=E2=80=AFPM Allen Pais <apais@linux.microsoft.c=
om> wrote:

> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
>
> This patch converts drivers/dma/* from tasklet to BH workqueue.
>
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
(...)
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
(...)
>         if (d40c->pending_tx)
> -               tasklet_schedule(&d40c->tasklet);
> +               queue_work(system_bh_wq, &d40c->work);

Why is "my" driver not allowed to use system_bh_highpri_wq?

I can't see the reasoning between some drivers using system_bh_wq
and others being highpri?

Given the DMA usecase I would expect them all to be high prio.

Yours,
Linus Walleij

