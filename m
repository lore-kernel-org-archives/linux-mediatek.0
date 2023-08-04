Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F7CC001DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BM5R+rkSeL9WIp21l2emysOOucIRf/CjafaqigjE3ns=; b=xyJ0U2DFsh5XGqIzFkTX82hO1d
	Qo5bE/KpRkwS60xtfp8U+Y7c/5sgbobRsb+3boKNuki9NHM24G4CCUh1cGAuCLLZ52zLIopb7MyGM
	7ecESM7WCnpUZgbQaAaw3zHyzxoTp/9iHddlV2Vo7BqzIBcZvjocGKqoQS2/w5hD/kz/jCJhUwR6p
	PTW+nsoxWg0OupYAyYnnCoSoHDCmnCeUIdQCbU8d/kYDhlnk/pYJxbLpDkhOt6A5+HS2PWvvdkHqj
	3gF+9Dh5T+8zD5QlwLvfG/5u/XhiHY/H/2QSP73AwE9NgaR92yhn/vpUNS6TP0OWc/esGTpwLPAkw
	tZ2lLvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRvwi-00Cbze-22;
	Fri, 04 Aug 2023 14:38:28 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRvwe-00Cbyb-2f;
	Fri, 04 Aug 2023 14:38:26 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe4b45a336so4463165e9.1;
        Fri, 04 Aug 2023 07:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691159895; x=1691764695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BM5R+rkSeL9WIp21l2emysOOucIRf/CjafaqigjE3ns=;
        b=P52o47d9dHG1aUMZwk0pd23gUMU1gSEcAaorjtm0PUBSc4CTskirX886xdzRJezLg6
         M4MtQIA6juxB9+sFPFH3EPWi9hMPTVDd1wwyWh3PmXuu1po0m+repmiBQFo72mEPoUaF
         CKzmuVyB06487jxO3URnO0OYZ2cjQP/ZYPY+Ly4YmQO1h8Ul1MwxJiS6CzfTEpBkUg4D
         GvHC2AtRasiPCNfOkLFtYCr2iYrhUrXdaNuwr9xpfY5akGkjLPDtWAHv3doGspA8ZqzA
         BVho52Djxf/ClpbDDROl0ciKQJHwoe5ELFkv+xQsoTFDKnytt8GlFd+Ntd6Geakv25p/
         LA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691159895; x=1691764695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BM5R+rkSeL9WIp21l2emysOOucIRf/CjafaqigjE3ns=;
        b=F6r+jxmTG9wKNBIe1qfqm7c+2db32oKYeol4ZwO+bmIQFr+3PVNQr8xGkUqNgzPzNL
         HfOCnxRrZIRkeUfgkFnA2oRmcSiQW1qd6Oac3xvoRkVN+AaYJJ4t0/gnhGoJu5Itq/Mm
         a8ZtXWeQIdqdGlMeEBbwgE8xQ458ZiSAzpEYkkFI098tVzazsTsm0nB9qNpZmMHMsPp+
         pdb0OCzpWF4/9eQls/Ob7SuPen/nv7Ea6oa7nPVyF3CcSAkXD5pZ6bbBM7xS1y96Jn12
         J8gt9aYin16CWgw0wg24/dF/XRJwJRtF+bC7FhVKN4KRzEoY+AOyHRD7UNhQsoqM66My
         sM9Q==
X-Gm-Message-State: AOJu0YxSIv7I8tw/DTUngixzvu1aQ/yNmQ/ZLEr/POoibFKy+QWoWRo1
	q7RqKwvriJaKd4t3XechIcs=
X-Google-Smtp-Source: AGHT+IFR8gDqjRYqyXRMOxF0JJDJ3mrxElW64dDSszEM8SNr/lPevhKIntH0L12mO9e2OcoWVt3KOw==
X-Received: by 2002:a1c:7c05:0:b0:3fb:e4ce:cc65 with SMTP id x5-20020a1c7c05000000b003fbe4cecc65mr1591896wmc.25.1691159894687;
        Fri, 04 Aug 2023 07:38:14 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id f9-20020a7bc8c9000000b003fba92fad35sm6833727wml.26.2023.08.04.07.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 07:38:14 -0700 (PDT)
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
Date: Fri, 04 Aug 2023 16:38:11 +0200
Message-ID: <2690872.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-21-d8de2cc88bff@kernel.org>
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
 <20230803-dt-header-cleanups-for-soc-v2-21-d8de2cc88bff@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_073824_867266_8F430ECD 
X-CRM114-Status: GOOD (  18.40  )
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

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Should I take this through sunxi tree?

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





