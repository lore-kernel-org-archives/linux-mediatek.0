Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B35C27C4F
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jun 2024 09:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzFx8jzdK5dNmXwmGQGRSAmpcATI1xLvdLGTgrmc4nk=; b=LW1UZG2E0t2Rg5VUk4Em2yRgm0
	/ZmMp/ifw5/GedZ/eqQn47hcUvrMhc5hDyJc+7objJ01rBCnl/IARFBQJHq9qLl7YMB7YgxZvpaNv
	tGmQmGOO0HpvglAQxEgRMrePXpJWvwS3N0+XIChac/J/jAc+5os6QA0z6kAhubkfYmJ3QfuGgoVNN
	KE5plztGlBUxqsPLS2icqgp0HTIUfAaoKlOzqjcgEm1GfiWNylY/gwBmRDaRBjW4N8k0hiZpgESCo
	6E746W0jFK+YY7U90+p1GetCjBSujtOvr7oEfD1AAtPp7FxaYk+Vj0k/LMdJ24inFURSTIKyrQv7Q
	YvxLLzxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIPsi-000000058uQ-2EcL;
	Sat, 15 Jun 2024 09:39:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIPsd-000000058td-2Lds;
	Sat, 15 Jun 2024 09:39:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B779460B6E;
	Sat, 15 Jun 2024 09:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD748C116B1;
	Sat, 15 Jun 2024 09:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718444366;
	bh=VnEJAKlueI1gVsR28BDxfyG4IIsWQe276Q/5t4EIwiI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=adP+eWpDAo3ogc3xH8HvRct3q4nGLVjHAQ+9XYoAyKbLksW+2M3hkGFxC97c9ABf1
	 YmMoJtp2km315ipyKHOLATXYYZsYNXv0LBpLXx0CCbQp2pD2sNmjKGiOClSvLMlQxm
	 3iHgUUw0llAYnMR09VjsZszMwB7dRh/oUrQgKtwqoB7JlvTdozUe8OqvlrJbzdzGpr
	 jEbeTI+55alP5cIoJnqAMMMR4ZVknYcX9Vab0xQBRtKdksziTmG2fKYQ9cr9Nm0MHb
	 EBscKmOnnmeNQe0XTINhhBy/c0EvSg205h7v4vgr62ka0KBIIJMbso2EvfR47SJHCb
	 tidPZob6oHU1Q==
Message-ID: <003b73f2-3b5d-40b7-a87c-2fc937e81bcd@kernel.org>
Date: Sat, 15 Jun 2024 11:39:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/22] dt-bindings: thermal: samsung,exynos: specify cells
To: Alim Akhtar <alim.akhtar@samsung.com>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>,
 'Daniel Lezcano' <daniel.lezcano@linaro.org>,
 'Zhang Rui' <rui.zhang@intel.com>, 'Lukasz Luba' <lukasz.luba@arm.com>,
 'Rob Herring' <robh@kernel.org>, 'Conor Dooley' <conor+dt@kernel.org>,
 'Guillaume La Roque' <glaroque@baylibre.com>,
 'Krzysztof Kozlowski' <krzk+dt@kernel.org>,
 'Vasily Khoruzhick' <anarsoul@gmail.com>, 'Chen-Yu Tsai' <wens@csie.org>,
 'Jernej Skrabec' <jernej.skrabec@gmail.com>,
 'Samuel Holland' <samuel@sholland.org>, 'Shawn Guo' <shawnguo@kernel.org>,
 'Sascha Hauer' <s.hauer@pengutronix.de>,
 'Pengutronix Kernel Team' <kernel@pengutronix.de>,
 'Fabio Estevam' <festevam@gmail.com>, 'Anson Huang' <Anson.Huang@nxp.com>,
 'Thierry Reding' <thierry.reding@gmail.com>,
 'Jonathan Hunter' <jonathanh@nvidia.com>,
 'Dmitry Baryshkov' <dmitry.baryshkov@linaro.org>,
 'Amit Kucheria' <amitk@kernel.org>,
 =?UTF-8?Q?=27Niklas_S=C3=B6derlund=27?= <niklas.soderlund@ragnatech.se>,
 'Heiko Stuebner' <heiko@sntech.de>, 'Biju Das' <biju.das.jz@bp.renesas.com>,
 'Orson Zhai' <orsonzhai@gmail.com>,
 'Baolin Wang' <baolin.wang@linux.alibaba.com>,
 'Chunyan Zhang' <zhang.lyra@gmail.com>,
 'Alexandre Torgue' <alexandre.torgue@foss.st.com>,
 'Pascal Paillet' <p.paillet@foss.st.com>, 'Keerthy' <j-keerthy@ti.com>,
 'Broadcom internal kernel review list'
 <bcm-kernel-feedback-list@broadcom.com>,
 'Florian Fainelli' <florian.fainelli@broadcom.com>,
 'Scott Branden' <sbranden@broadcom.com>,
 'zhanghongchen' <zhanghongchen@loongson.cn>,
 'Matthias Brugger' <matthias.bgg@gmail.com>,
 'AngeloGioacchino Del Regno' <angelogioacchino.delregno@collabora.com>,
 'Bjorn Andersson' <andersson@kernel.org>,
 'Geert Uytterhoeven' <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 'Florian Fainelli' <f.fainelli@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 cpgs@samsung.com
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <CGME20240614094638epcas5p115d52130f45e130652b6f1d946358d19@epcas5p1.samsung.com>
 <20240614-dt-bindings-thermal-allof-v1-1-30b25a6ae24e@linaro.org>
 <1891546521.01718433481489.JavaMail.epsvc@epcpadp4>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <1891546521.01718433481489.JavaMail.epsvc@epcpadp4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240615_023927_844034_ED447123 
X-CRM114-Status: UNSURE (   9.78  )
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

On 14/06/2024 16:29, Alim Akhtar wrote:
> Hi Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Friday, June 14, 2024 3:16 PM
>> To: Daniel Lezcano <daniel.lezcano@linaro.org
> .stormreply.com;
>> Subject: [PATCH 01/22] dt-bindings: thermal: samsung,exynos: specify cells
>>
>> All Samsung Exynos SoCs Thermal Management Units have only one sensor, so
>> make '#thermal-sensor-cells' fixed at 0.
>>
> This is not entirely true, there are SoCs which have multiple temp sensors.
> It is true that currently only one sensor support is added though.

All supported by mainline. Others do not exist now :)

> 
> So we can leave this as is or you suggest to make it to support only one sensor
> (to match the current DT support), and later (in near future) change it again to
> match what HW actually support?

Yes, different devices can have different value (and bindings).
Best regards,
Krzysztof


