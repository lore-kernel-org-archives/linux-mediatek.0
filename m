Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A17C7619A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 10:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEHX2H3FPvonaNoZg4d3ZXKZZZCxjwbRPNv3Abil3kY=; b=CEWIR5Wfd7h6WTMIMyTU15T8Fb
	+6huNG0oyMCeqP0qy808Kw9fhjBXtAN6u65/I0COwKNLtQ1qlVdw1t7ZQjDiIjBV++9PFKzNuwzrK
	mKCcIt3dc+0D6mvy/gdL9GGWr+yT4b6liJ8RUlJ7585EVHbCuYRPgQBJBCWnif7ZBQa8U+a6arjqs
	1CHeNEKpNhQUqBQ+uzyO3LTCkYF3KHW2usoujSD9j2ShANCKMLu9nIyC4YtHMCtoz7d4I+FhYon3g
	24RH2klsmlwphMh7WyZDIfos1ggk010YiKHL/Sby4WjcchRTAbyzwZpbTkhhfoJPD1if15TtQOd2N
	BfYYSamQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peCUn-008aY5-16;
	Mon, 20 Mar 2023 10:12:05 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peCUj-008aWM-2L;
	Mon, 20 Mar 2023 10:12:02 +0000
Received: by mail-qk1-x72c.google.com with SMTP id o1so543650qkh.7;
        Mon, 20 Mar 2023 03:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679307115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEHX2H3FPvonaNoZg4d3ZXKZZZCxjwbRPNv3Abil3kY=;
        b=pGRG8DR8czC6mIySn8c+XY/QyPsxNJby0FDmm6hU8zH3srOc1pzYmcAtzW++zTsVST
         oIKxOe+AVWw3Q/vF2tZU81xD0VZuk+6u66OpAtC8p6jZyD8wmZhAZSJFOAuerqDP/Vo7
         TBo9jbf5dZR5AvNjqQ8y4q31DORWt/TGC1jexEA460NOlL8vYpwY1zSiFzLLTZMDoQuI
         2IZbSZnw6mQl4D81ehGAV4TERB7EvlqTNvfy4Mr9ntcUMQjf2WYyzSa68Nbzy2ZU3Koa
         P3KZ1aMChHLD6su7o5vLa3LQ+d2V6OaFKe2DagbmdM9TKAlM4Ol7RHA3UY53SbomsUy8
         z5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679307115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEHX2H3FPvonaNoZg4d3ZXKZZZCxjwbRPNv3Abil3kY=;
        b=6GgjpyB71T8MdoHNLk91pJQAEFz9Yi/dCVkZeQfasS2Jei5aL/XZyTLjetbK2U2Y9D
         C7fX07V80VVHL25/nylzw0rx9x/yJXyh99NweDHd0Qj2mOkYbopFV9qgmq3fWFeTqqgt
         UbE3H7JYxQLQ11jdH11SUWk0R5Vhlyd+9XJf2LsATaGeiO0pV2oDR8HbbFDOZLJfGRyQ
         BnYzbhWBuyuJsVDpiKfamEJXziEekG7AtTfyITKiQZNuuWojgrMT9KIRG6uZwLUf6cyZ
         T9skM+99PjRxpIfM4jWRtefEMV8PLtxCEx24bPvkms5tXtFZdRXJyUQOM4f3VrBr2NMJ
         y1Fg==
X-Gm-Message-State: AO0yUKX9xqeEX3ldgolZS/HaspsMddBw/Ookhwo0ryTc6FZcLksyVD10
	ngM+l3C/uYfHVOuA/8CVlCancYQ1a7SRPqiKpUM=
X-Google-Smtp-Source: AK7set/7f2o3MXyyuIp0oW2dzmomSD1AeJIwa/bkGf1KaepstcBoZ2oGQTq2OW/QrKdEOrRxx9NAQwjPPU8J1KTvGK8=
X-Received: by 2002:a37:e119:0:b0:746:3c7f:7524 with SMTP id
 c25-20020a37e119000000b007463c7f7524mr2618315qkm.14.1679307115447; Mon, 20
 Mar 2023 03:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230319115925.1317654-1-sensor1010@163.com> <CAHp75Vf9kwhbZaGjZeN5Jq0Wr_yJtDdj9N48-3o79AMORqmS3w@mail.gmail.com>
In-Reply-To: <CAHp75Vf9kwhbZaGjZeN5Jq0Wr_yJtDdj9N48-3o79AMORqmS3w@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 20 Mar 2023 12:11:19 +0200
Message-ID: <CAHp75VeLoMPtTU8TCuPjXD_YTY-_V-TmVJYeZiBB_BPqh8EVrQ@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/gpio : Remove redundant platform_set_drvdata().
To: Lizhe <sensor1010@163.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, geert+renesas@glider.be, 
	info@metux.net, rjui@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	f.fainelli@gmail.com, sbranden@broadcom.com, shc_work@mail.ru, 
	j-keerthy@ti.com, hoan@os.amperecomputing.com, fancer.lancer@gmail.com, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-imx@nxp.com, kaloz@openwrt.org, khalasa@piap.pl, 
	keguang.zhang@gmail.com, daniel@thingy.jp, romain.perier@gmail.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, 
	grygorii.strashko@ti.com, ssantosh@kernel.org, khilman@kernel.org, 
	mani@kernel.org, ludovic.desroches@microchip.com, andy@kernel.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, jonathanh@nvidia.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, michal.simek@xilinx.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_031201_763215_6715F9CD 
X-CRM114-Status: GOOD (  12.05  )
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

On Mon, Mar 20, 2023 at 12:10=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sun, Mar 19, 2023 at 2:01=E2=80=AFPM Lizhe <sensor1010@163.com> wrote:
> >
> > platform_set_drvdata() is redundant in these functions.
> > the purpose of calling this function is to place data
> > in *driver_data. but the data is not retrieved in these
> > functions
>
> You need to:
> 1) split the series on per driver basis (not all of the drivers are
> going thru the same subsystem);

s/subsystem/tree/

> 2) improve English grammar and style in your commit message;
> 3) carefully explain in the cover letter your methods of finding the
> places you think need to be improved.
>
> Before that it's a waste of time to look at your contributions.


--=20
With Best Regards,
Andy Shevchenko

