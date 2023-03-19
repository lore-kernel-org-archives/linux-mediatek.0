Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE8BC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 21:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xVIksZcR76edI4z8mmPrpSpOfu0/pVV80WudQ/Vavs=; b=SPC6gB9Umnp5UF6p8Flblf2O9I
	B+vZrxbZy5Np469f6gQ5lbCbHGBH0k8dm/UBhxm8grYdVHngn7Wzx0q/fpjG2fPCYaQAUYdKZeHUK
	q96q6L13VjZPiIh37IEIcC2mhE/JKFene/d7bIHLqybULn/mHY88Lf/x9GMSxGMX+U/qVqS8HXvOu
	ZJoZvi9Uy1wyPHOhR/f1qKyLn7fOwMy6n5Ws03HYne8UD8uB1u8e028LAogMHaHAYfMKPtdodlXLB
	LbKJT/HkQrHul/W23xEFirXB/alJAVnpgAOQzrd2IgnU+8tr4MU3vV7TqXrcOvdBV2j0rt8p5Yx0C
	hnEVHM7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe0SR-007TDm-2a;
	Sun, 19 Mar 2023 21:20:51 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe0SO-007TCI-0R
	for linux-mediatek@lists.infradead.org;
	Sun, 19 Mar 2023 21:20:49 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5418d54d77bso192458887b3.12
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Mar 2023 14:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679260846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xVIksZcR76edI4z8mmPrpSpOfu0/pVV80WudQ/Vavs=;
        b=yxYOpG1BTRH8mP4CO9pabOiIVp8JZr5VwAuFO8HU6vbaqpTxWmCE4iIgG/OVL1bC1K
         h3LhfvJ9Emngr37qgSs4y3135OyBRvx5CQrGOhqBQ1h52Thw6LlPUCXerXAafRWoy3r/
         FDFDT9ERbcJkGc+2G4eLkbvA5KcKtQ6KYbmnVg4lq1vniUExZ2sFYpXbvCD7hKDVMLon
         QLx20N80Tf488Dgbj44gJ9XeDYP2w0y+6+La+/a0ASo0Dh+zkjSg2/P4RcnR2PKoZR8Z
         jdQ+VbU+0FFOQcGsff14UjVnV15EfKcDuX6yib3W9b/IG0H6KARxUCDOXylMZHreZLWk
         0npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679260846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xVIksZcR76edI4z8mmPrpSpOfu0/pVV80WudQ/Vavs=;
        b=AgJfSY0CBl0Sbnj4LOwsucf6MyVT86N4OfG3mkkjYFlfntQ7VwKAtv8fPREcO0wXNx
         KqsEre/blpxnOpGdJHKyexzoXAqAorpFdOXu24nXrP/Ji+3jdjA6pOoRI4Wb7ulsarnH
         68spMzn3Av/2QjQFcFc8FqJzMWR2C3WR6eTaJUJ8ZwhvKcoKc9iVP79FG8A93khzEpP1
         7nGZy8tSTyN94+VBkgtKWdo7vq2DsjhHGuXdF0HHX404Oj6N1pePIvrrkixO4BkYZhPS
         3R8gxBL5/qdxoMwAh8lzTIx1jnLTxwLKPdzbPVNEs7pnwNTEuRQ/j9A+/QImvEWh0blw
         RNYg==
X-Gm-Message-State: AO0yUKXiz1XSVhG1kQ4LHO+W3MtCEQ9eNcZLOELW+Qk5A5vOcG5vSyOM
	08JaJ3x1RcqPE9Gd0scuylgFLdj0duXmtSStB3dR/Q==
X-Google-Smtp-Source: AK7set/4tcKb2KcMcmhkFSECkX9UEXl6Q7CPyM6DmVWY/gBDswc6Du79KNPC9UhC3cNpQzNAw1FAAnNdRAYmdab1914=
X-Received: by 2002:a81:ae5f:0:b0:532:e887:2c23 with SMTP id
 g31-20020a81ae5f000000b00532e8872c23mr9029129ywk.9.1679260846054; Sun, 19 Mar
 2023 14:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230319115925.1317654-1-sensor1010@163.com>
In-Reply-To: <20230319115925.1317654-1-sensor1010@163.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 19 Mar 2023 22:20:35 +0100
Message-ID: <CACRpkdbxSNCKNfous7h2dBQ_AW9KS9qyxPfPxOO=3PMDsDxcng@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/gpio : Remove redundant platform_set_drvdata().
To: Lizhe <sensor1010@163.com>
Cc: brgl@bgdev.pl, geert+renesas@glider.be, info@metux.net, rjui@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com, 
	sbranden@broadcom.com, shc_work@mail.ru, j-keerthy@ti.com, 
	hoan@os.amperecomputing.com, fancer.lancer@gmail.com, orsonzhai@gmail.com, 
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, kaloz@openwrt.org, khalasa@piap.pl, 
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
X-CRM114-CacheID: sfid-20230319_142048_172048_54BDEB23 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

On Sun, Mar 19, 2023 at 1:02=E2=80=AFPM Lizhe <sensor1010@163.com> wrote:

> platform_set_drvdata() is redundant in these functions.
> the purpose of calling this function is to place data
> in *driver_data. but the data is not retrieved in these
> functions
>
> Signed-off-by: Lizhe <sensor1010@163.com>

You have to also ascertain that the data is not used elsewhere
like in some callbacks or even in other drivers in some odd cases.

Yours,
Linus Walleij

