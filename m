Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6C3C25B79
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 14:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBD5fZbJKASRGqCVJjwjF0/sBlA3tJ1is50PhfAuexQ=; b=gVzQuEVcQ2K4Z0WkMIC0yRt+aw
	+bc9kOLY+hGqSqAQowE1Nk9ra8wkVWpQ6sszG0Hs5IX84ISl88cCATTCPBWmaeD38GZ/yiwgNlX2B
	4Y+z5YOZCXrXiwU8IlVZACW6cFQ9qEwfsn4YV4e89wI6IGkXn5D0f4oy8uHgWVRayOcU31nLGsRAd
	ESm6RGantwKU+GJULYcux9ter/qCTz5dBufIZoB5Wz9ObKL5vte+NYy4yQj/nj9sNchxbYCslGJau
	lC+lXbWARv7/4ed7dA/2pMmZn8KIZN9Z55ivhlwYuwPdTTgVtD9qVeZ/O4zV3DJlBzKr3nKPiXhzQ
	Wny0ttcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBbJe-0000000FMeb-1cRk;
	Mon, 27 May 2024 14:27:11 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBbJD-0000000FMKS-0kaT;
	Mon, 27 May 2024 14:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716819939; x=1717424739; i=markus.elfring@web.de;
	bh=WBD5fZbJKASRGqCVJjwjF0/sBlA3tJ1is50PhfAuexQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=vX3VhVktvAsC3VEpXA8voazwMQsxjS3krCXirqMDaKAZ3hS5dLEBLJJcYH/CnQUD
	 LX884yPHk6T2CjcYkXrEWl3j7h+qjsuQr6krfiSjSbT9o7hELP6R1MOL3ePslfGIM
	 nUn+Cno9/WCN6Qt7tnw9wJkEH43RGHNxZEMJFx1wgs5oyZoUK9bL3MJfGys243Jnt
	 RWe1fGAwlia3NmWKjA9buWb62mNSN4PEffNKdBdV4ee2XJY9EETUDzwTlBNTo8KlT
	 kv2IvCfd4sTrUVWvA5STc6LBECDk34micjPSbDUs3ES7nw1m899uLKkS35frEPwr4
	 gv2XA0CeWBiz5oCAtw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mtgyj-1sV3WP3CJT-017EBc; Mon, 27
 May 2024 16:25:38 +0200
Message-ID: <96beb071-ec2c-475f-8fa2-d519a1b1dc28@web.de>
Date: Mon, 27 May 2024 16:25:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peng Fan <peng.fan@nxp.com>, soc@kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chester Lin <chester62515@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Damien Le Moal <dlemoal@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Hal Feng <hal.feng@starfivetech.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Jacky Bai <ping.bai@nxp.com>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Joel Stanley <joel@jms.id.au>, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Orson Zhai
 <orsonzhai@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
 imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, kernel@pengutronix.de,
 Peng Fan <peng.fan@oss.nxp.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20240504-pinctrl-cleanup-v2-4-26c5f2dc1181@nxp.com>
Subject: Re: [PATCH v2 04/20] pinctrl: starfive: Use scope based of_node_put()
 cleanups
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240504-pinctrl-cleanup-v2-4-26c5f2dc1181@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+RyPoq5wWT0ZiaKtbHEM7oUjpYEVZsaQY6N7Y3GqAcCCbvu/2JH
 u2A1o9G2LZb7XdHLU3H69K/ZAgfhJvU9jxdpYiqAnNWG9BA1SqA6BdADoQmnmuaRrP6fAil
 8Vj3+benFoPx5AOFPUxJJt7XUQwXd4D4fxOV2u0S4nMX3GZIShaRs493PFfPvepvyAbRCtv
 sA0TyVvmVIL0Nk6+KE4zA==
UI-OutboundReport: notjunk:1;M01:P0:31oKYLNiYt8=;Hxns51jU3fPbLxYZhS6Zxy9O8BL
 qcSJkc+8tI81FYEgYUDEjPFyxO5CsD0G4Yr1KM0HiJM1RAdO+budqXdzmwIJQJO5p6Qgg2nVe
 YKgM7j5yLFrWsSzyaik+NFTvY+PW6VUe11QHVHkDricbyYHE5P9qzbTg86+yeRiFSOOQZksg9
 Xdrs6r2eTX9AowMfEJqKIKNofU6TcDdmBmEh2hd5cMEugRlaO/xU/ubiYD/XRmfkiGEw2Tk9X
 NW8zaQg81GL2PPwft4f4poEafCoYwl+CIrmPHqURH/2YArZiC4UDm9VTu3lTVR8WSADgs2juL
 WzjmfuF3Nb/H8VSJqqzY977EL7BYu0JfjXhqczsj/AJHIU8x7U9FkHQwVLD+/aW9Q5b/a9OPw
 LI1zUhjAqpzjkl9ILHME5dfhA7gkD4YfqDP0iVyWu+VnmZh/pblaybHt4rD5ZI5OfaaxJKTej
 VGs+IMuQBrMttXj/4DWsuAy6tL2ASvq9ajbc+W4PfJFRO8eiyAiXlRr8A1ilG3Wwi2usEs8x0
 pyhK5u8Ye84ZDNXC0xiObkf3AMdCBhIc+0OAJbS7S/lr4Wa88XoId5G8Ib9v3q3Danb/+yyUK
 5YECHUaogBhuwKJTAPf6awFWX25sWIKFsuMiL9bOP098OSKsVamHNvrpo4VNiI2KTPlO3jYMF
 m4zC6H3fMiyTT6q5AwrZQbBuPo5FStw2mq46jULp/VkrI2I5mP81da+ZdY2nuNi0JHqnAsXYb
 nCNKXCaTB/N8hkFz1ZJ6BaXlj9tzCbHQ/4RlK/pJC38X/hUvhfMryOHSpF+68/zEebizBSnT2
 Xmop5HdbEWKcl91rEpyYcoeHY0XK5F3NVihbciHAlOag4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_072644_227595_5AF20FA8 
X-CRM114-Status: GOOD (  10.41  )
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

> Use scope based of_node_put() cleanup to simplify code.

I see opportunities to improve affected function implementations another b=
it.


=E2=80=A6
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
=E2=80=A6
> @@ -543,18 +540,18 @@ static int starfive_dt_node_to_map(struct pinctrl_=
dev *pctldev,
>  			pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  			if (!pins) {
>  				ret =3D -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
>
>  			pinmux =3D devm_kcalloc(dev, npins, sizeof(*pinmux), GFP_KERNEL);
>  			if (!pinmux) {
>  				ret =3D -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
=E2=80=A6
> @@ -623,8 +620,6 @@ static int starfive_dt_node_to_map(struct pinctrl_de=
v *pctldev,
>  	mutex_unlock(&sfp->mutex);
>  	return 0;
>
> -put_child:
> -	of_node_put(child);
>  free_map:
>  	pinctrl_utils_free_map(pctldev, map, nmaps);
>  	mutex_unlock(&sfp->mutex);
=E2=80=A6
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
=E2=80=A6
> @@ -175,18 +175,18 @@ static int jh7110_dt_node_to_map(struct pinctrl_de=
v *pctldev,
>  		pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  		if (!pins) {
>  			ret =3D -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		pinmux =3D devm_kcalloc(dev, npins, sizeof(*pinmux), GFP_KERNEL);
>  		if (!pinmux) {
>  			ret =3D -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
=E2=80=A6
> @@ -233,8 +233,6 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev =
*pctldev,
>  	*num_maps =3D nmaps;
>  	return 0;
>
> -put_child:
> -	of_node_put(child);
>  free_map:
>  	pinctrl_utils_free_map(pctldev, map, nmaps);
>  	mutex_unlock(&sfp->mutex);


1. Exception handling is repeated a few times also according to memory all=
ocation failures.
   How do you think about to use a corresponding label like =E2=80=9Ce_nom=
em=E2=80=9D
   so that another bit of duplicate source code can be avoided?
   https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a=
+goto+chain+when+leaving+a+function+on+error+when+using+and+releasing+reso=
urces

2. Will development interests grow for the usage of a statement like =E2=
=80=9Cguard(mutex)(&sfp->mutex);=E2=80=9D?


Regards,
Markus

