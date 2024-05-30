Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3331BC25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 09:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGMwHJfbR6KN66cOCzvPakSNZMqVFdC7Cgpk+vCA7NU=; b=evAluTgB14iTyJNFo62kolRYPC
	mkEpSfwWTf4DkWtdU7IcoFnBNj+zn0BeDSyjDVWa3h7Awq98xsgOq8BxBA/W2oknKAmYHZ7hctBCW
	gmAtLgbOFxB++/t5oGH+2GFpBDMxEugOkzgHPkH7jCDjjK5wIf4Qy70qG8nXvWDK/rT0CI4JsB9/0
	znOywUPg0H0Dkg7F/QzjU4a1NE8DzqFeu8Ee3N9vVxnQvwax9+WmZIhv/1lfmRS5umCWQNxaB3yre
	TXkF4v+aJfx8Sfj1n5KnrwEiPw8RRIN9GbNtldZhvRhsg6IQ2pKVjpiiRY80omlgqSCRD/ff+2x5y
	3UJFSVYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcRP-00000006taA-2RxG;
	Thu, 30 May 2024 09:51:23 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcRL-00000006tZN-1ZDC;
	Thu, 30 May 2024 09:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1717062629; x=1717667429; i=markus.elfring@web.de;
	bh=uGMwHJfbR6KN66cOCzvPakSNZMqVFdC7Cgpk+vCA7NU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FlSR5xpj0FwtI8Z4GKDMQU3Nhu5ZfvJviwuRU8NZndL5/xWt0EE2dTOJdBGoeSDo
	 LB7FZoTWJXrEgfmN6lHYotmaShyHS/ociG83v0mF5eXtFriEQ3POTCzGiKudrKhPo
	 UglvM56WR2wXW7zcO4NR3tY6YikitMWPs1WYbmktUQkMWRPg+dAHhiXXLdorNb0Pw
	 Un4Roya5qOhFSsPRtQuYIonTvM7PDyH/rzErBGgKSwzIemOhWiI/1QKEDdX4FylQL
	 S/aV+YfRStP55LLDYAed37kyu53eguzgV3FaO8YjmKBgzV/acf2sSBNZ2P75pX1xe
	 AlTy4xk7JBLUJAIiuQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7Nmq-1s78Fk3P7U-007qlG; Thu, 30
 May 2024 11:50:29 +0200
Message-ID: <1f40d455-556e-4ba8-96dd-40b49f8cc3b7@web.de>
Date: Thu, 30 May 2024 11:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 18/20] pinctrl: freescale: mxs: Fix refcount of child
To: Peng Fan <peng.fan@nxp.com>, "soc@kernel.org" <soc@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chester Lin <chester62515@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Damien Le Moal <dlemoal@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Ghennadi Procopciuc (OSS)" <ghennadi.procopciuc@oss.nxp.com>,
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
References: <20240504-pinctrl-cleanup-v2-18-26c5f2dc1181@nxp.com>
 <aa58efd3-b502-4bed-8c84-e5d78da23fbe@web.de>
 <DU0PR04MB941783DEB48C73844CD3FDBF88F32@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <DU0PR04MB941783DEB48C73844CD3FDBF88F32@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+9Sp/meKw0sduwAvDpnilsXgvJB1VMszgePIGFouh74/8BPNPek
 PjdNmsNPyDIWLfKqIeJp80WBjOJ/GbIPBtZvK5DVSrAiydESz/tNusBgmD1eCCt+0wj2/g3
 bLAlYWJFLgxwtXUegWBLf4w8TAl+SErBcYs5UybkzZDCd+YCQICjCbGRmQ3ndcbJaK/+Zja
 dXgiIgA5yXHJDlsq5zxhg==
UI-OutboundReport: notjunk:1;M01:P0:0o0nmcb2n00=;0b+JEcSPacD3BoJZi33agACUzf+
 Y1yzW3rrPdLmejQWpOdqOmdJ2D62kKb+BZJi3OwiI+VsRTqFk+kBMl156D/0a4aulIHNuPylZ
 V29wMrssOvOtouKSK7eGs4Di/N5G2OR+LdJZLZV1D5PDDXa8XKSuH/dfGRWz0BL2vZ7xUkKzt
 srsyJEYZNLhovnf3nCBTJSumyBBhD/JYrLx4HCV9oP52veU/Vnx4ZAouhqduUkF124TRneb6s
 rIP4S6X96+Erw1tqQ3Rfy+vHCsZgE5dL1cmVEyPSicByBTSTtJQ1mILqcXk7SYawW0zqXR0K1
 lW2SGjYoHB1N6paa90lUc7ROZqsjYEc4qzfEVwfvpxCsnCKTpePmHVYSGblrUPMvsLu6EKV4Q
 aOvRNsJ9lbvR5QW6nbqLwZsEs63A/OxFA08BAxP7nfCFqIem0q8FtGmSkOTB5CUwDf0eiBEw0
 527B96/6A0qPpbARQop1FuiGqZT3wfMhMSjgmWv92s38TdOsVCEd1G9nb4kyORkGE7wZ23iZ2
 RZw9HZufC/cqdnzza+ONPRo/ipdOVcVG+tQhCdJCUzl1/Czg7MMSxfkBZIXxP84+iHBYeSqk7
 4J7E65IezrupJRW/fELUsOeJBideLezZz2hBU/PSzqRxF45znS2nKPyybjuHWi0m915ZBKt1p
 ZmBLNgKBOV0wC/danVuQd+fTH6Day0zltu/bbwg0Q0Jt/AK3CFRRcksTsHWgvdXYAVq6a5lAr
 pBRY8wYzwo0PzUbqeVdNjxC18B7392fNByYo7H89FcB9OXFskRbLiQujR88/6kDWCBHlZnGwA
 WNJcLkxVjBqulzo1dQBwqHG3+yPBubmiiTgeFAoeJgpQ0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_025119_719719_E90EC779 
X-CRM114-Status: UNSURE (   6.71  )
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

>> How do you think about to use the summary phrase =E2=80=9CFix reference=
 counting
>> for children in mxs_pinctrl_probe_dt()=E2=80=9D?
>
> Thanks for reviewing. I have no plan to rework this series for non-accep=
ted patches.
=E2=80=A6

Will development interests grow to take patch review concerns better into =
account
so that commit messages can be improved another bit?

Regards,
Markus

