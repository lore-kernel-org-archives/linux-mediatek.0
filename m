Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358E6C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 19:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUct/82ZzJYoId4uQpyLnXW8CpRtqtjF90BwOBq+j0o=; b=ORbCD49KXFHqph/cg0mpwQKSez
	RrA1ZwlZL/Uv/1HqSpOtUZ6SPIyuc1cUkarDn7PlEAE70uCDuk4edUYkDa+eJj4kpWkndiQMfe2e0
	vBvtmHJCr2Jm/y6s3+jCnMmkAUVA5XUG5rh1MkRj358rmJYmtMSqfG4yqmXZG0xF0talMIr9AUwAX
	hh0PyCX23NLiaBX4sLCiUsnq2+HfrijL5WPB0i0Fa74dB1SVkTq/prEStDZX3AU9cwRAVTGX2lU07
	hyB93cWnPDRN/SvCteqhQQPPnsa9PLpwjM47+vATUyO1KJDk90OKp1rCDrf5eH2uG0zHYv59Nj3kL
	9ARpF8Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS0A2-00D5IZ-1d;
	Fri, 04 Aug 2023 19:08:30 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS09x-00D5Gw-2C;
	Fri, 04 Aug 2023 19:08:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbc63c2e84so24153815e9.3;
        Fri, 04 Aug 2023 12:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691176103; x=1691780903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUct/82ZzJYoId4uQpyLnXW8CpRtqtjF90BwOBq+j0o=;
        b=Sw0i87+1TNyjnpxDcQG2yBq3mmDztmoLnSIvDewEdu7MsRTVLhilD7q5AKtBLX6bCP
         elMoZXCrptU3/c0hUjL82BhwCUtuwD234IiW92vDvJchvI9yWOV7n3ucy+Kx7L537UpN
         ipmvlloMQL3eFNqO481bhW999WW4XvMDm6ak4OyD64Rpj8BB6hwXU8YfbYPNYGs75uOd
         /SYwTd7gX9E3bMqFbqOqYohdq/v+V4XPSZkY26rQAtiQgPWjeUZjGKHlAxIk49TCmKSy
         gHGT/pFVmDRTERB+/+brCukvg2dEggQozIodxVeorNa5WTQs0TY+qbw22NEndee1NBb9
         N+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691176103; x=1691780903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUct/82ZzJYoId4uQpyLnXW8CpRtqtjF90BwOBq+j0o=;
        b=DqumS91K2CGn+aVNJAZvlEGSdyrAFKuUKdm1gcaLcEul/ogWCIpiEiLqPlTO2nEnz0
         CGHlSCO+lG8xqLGqXdnNPT7jOMg4ZGZVxnWOf/2ahl5l6KP+0GOzZacaXot9rWz65Akv
         Go/DiNaAxKkBW/6oEW0iYyowl8YaOwYvcOQRtQTreE5HIOWZRSuSAdbpDQWHibnnp4b0
         nIs8WESgTro3RyTRv2N7vAyDFgcyAF22DqTLG4MyMfTlKaZ4gDsULTBOIpUsoDNWqnzO
         PRFuWVnvz5pF+DHhrhfAUda2yV7esvFdqyM+LMxxogDqPB0ksKri/gVXBcphaM/+yUao
         nuiA==
X-Gm-Message-State: AOJu0YznFRP2gm2yBbiMmnCr3ISVHXEcfy9IFxuQMMQEAw6Xf4gWClB4
	WGiOHsZJ8VHreDM6BRjLvQw=
X-Google-Smtp-Source: AGHT+IEVrZLvF9EJvd/t1u18YqhdNyGjzTlFOtuLbcjUbAk5S3X8YO69YyZ5+NC4O8tskW7xE0E92w==
X-Received: by 2002:a7b:cbd3:0:b0:3fb:c9f4:1506 with SMTP id n19-20020a7bcbd3000000b003fbc9f41506mr2400916wmi.1.1691176102471;
        Fri, 04 Aug 2023 12:08:22 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id u24-20020a05600c00d800b003fa95f328afsm7461683wmm.29.2023.08.04.12.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 12:08:22 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 Antoine Tenart <atenart@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Linus Walleij <linus.walleij@linaro.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Has him <shiraz.linux.kernel@gmail.com>,
 Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 16/23] bus: Explicitly include correct DT includes
Date: Fri, 04 Aug 2023 21:08:19 +0200
Message-ID: <2151246.irdbgypaU6@jernej-laptop>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-16-d8de2cc88bff@kernel.org>
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
 <20230803-dt-header-cleanups-for-soc-v2-16-d8de2cc88bff@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_120825_716427_48C1772E 
X-CRM114-Status: GOOD (  13.27  )
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

Dne petek, 04. avgust 2023 ob 00:42:56 CEST je Rob Herring napisal(a):
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/bus/fsl-mc/fsl-mc-bus.c | 1 +
>  drivers/bus/fsl-mc/fsl-mc-msi.c | 2 --
>  drivers/bus/hisi_lpc.c          | 2 +-
>  drivers/bus/omap_l3_smx.c       | 1 -
>  drivers/bus/simple-pm-bus.c     | 2 ++
>  drivers/bus/sunxi-rsb.c         | 2 +-

for sunxi-rsb:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/bus/ti-pwmss.c          | 2 +-




