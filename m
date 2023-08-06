Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9191AC001DE
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Aug 2023 11:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPZWtH2u7SjnBR/riBWb7bbLQE9L9HbqZdnf0YnBktM=; b=agvW7oRnMmFO4WD35pIB+9DFhX
	AegqOQ5cGh8oO/4fe7fF4+Tw+15xwLQ4TZSyhElpfuqbqk1RoHkyAe/xprDYZgz8wpYKZFIzJzftd
	H5jyMc/yjEMCCB6bsoyqr2L2rgTqYjRssRjzaUF/0X1MGhTQxr82FMDXLY9mpUiAMIIldZ588Qve/
	Ly++q7uFyXtjvkUTYvh8q0ss1R143VYQYTleTeZpC/gRZLwROPrSueuSL77kDyWjURJowMlKLE5qH
	vI+AwsLJA5ruE6PoH2izmKvoWLf6Qofiib9vBJBgFOfTMtF+fjr5qb0TGmQV+jg4f8eWl/+zSdv7J
	/VYT7Ugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSc9F-00FMB5-2j;
	Sun, 06 Aug 2023 11:42:13 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSc9A-00FM8g-0J;
	Sun, 06 Aug 2023 11:42:10 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-522ab301692so5012075a12.2;
        Sun, 06 Aug 2023 04:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691322116; x=1691926916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPZWtH2u7SjnBR/riBWb7bbLQE9L9HbqZdnf0YnBktM=;
        b=Sty5lhf/+MyIEk4hwQ9cvBMD8WViZJPDvPtKFCwKiOj31yKv1xg8RNt7qVng+uuxAB
         dF0J+R1WzMezzlkqB6H3KudnW8pfvn392k/vzmJc+BF6eMwm0XAI9JYi8u3ebjqPp4YW
         6nPWSX99BdkyZld9vm3FaE1/bmmc2r5N8d/VXv2A7o00bUBkNjopUPw/htodQjibsRtM
         IByA4tpKN5ijL6QCap/t2vppD4mGMCtkg+7Jl/4q9XFGGS2tUCtlhYEvXF7Ddqrri8pb
         rgQkzkiawXEXsCF2b6/EgR5dtx5G/51BSm3cSDohUepsNi7iKQwA9xvMfRcxifgKNO9W
         Pe0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691322116; x=1691926916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPZWtH2u7SjnBR/riBWb7bbLQE9L9HbqZdnf0YnBktM=;
        b=bslsyYzs1nJesflT52waVb01GrNfBX8Ab1ANPBOreSugokpD7EOaw/P0OMpoNt1tvY
         e8EE5dMsE/b8zJYyFNMZv+xBwOa9T6UOKCm4Cy7CzYJRpXnG6lklk+BViwXxpgWJq+MJ
         e52DCXiESKed7T5kHd5u1e9w5qNts+785FPSXr2jp6KCp/AyTO9rpzSSBxqekLVYJI5r
         0WbdW8Q8+hgfA3AwreEGd8cKxtSeVpDqBr8o1B7U5RG3XBg6hC4uxC1/JUldcFTn5h2H
         asfWQUZdJ6/mU25gfZpwP3REyz7jcmbBZLBPG7KJ2Qp8omtzRpwafPAkw+eUMdhDFm4M
         Q+fg==
X-Gm-Message-State: AOJu0Yznq4mCy4AIDuWDggc+vcQG9IIl4OXkqBaFXjPR5CDx/Yk/j38l
	kV2wA1x2OcGWgp1ieXESUf0=
X-Google-Smtp-Source: AGHT+IHjfr2mP6x5YwxDkuQ5vcpWIDj7BomvgLaOgkchjT8hDOHRAVJXim0VA8pfWmn5GNkEOKAxeQ==
X-Received: by 2002:a05:6402:74f:b0:523:1410:b611 with SMTP id p15-20020a056402074f00b005231410b611mr5851706edy.25.1691322116476;
        Sun, 06 Aug 2023 04:41:56 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id j2-20020a50ed02000000b005223e54d1edsm3785473eds.20.2023.08.06.04.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 04:41:55 -0700 (PDT)
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
Subject: Re: [PATCH v2 21/23] soc: sunxi: Explicitly include correct DT includes
Date: Sun, 06 Aug 2023 13:41:53 +0200
Message-ID: <5696647.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-21-d8de2cc88bff@kernel.org>
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
 <20230803-dt-header-cleanups-for-soc-v2-21-d8de2cc88bff@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_044208_153906_31780D33 
X-CRM114-Status: GOOD (  17.15  )
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

Dne petek, 04. avgust 2023 ob 00:43:01 CEST je Rob Herring napisal(a):
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

Applied to sunxi tree, thanks!

Best regards,
Jernej

> ---
> v2:
>  - Drop sun20i-ppu.c which moved
> ---
>  drivers/soc/sunxi/sunxi_sram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
> index 4c4864cd2342..4458b2e0562b 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -15,7 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>





