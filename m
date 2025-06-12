Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E540DC71136
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jun 2025 03:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wu8wKYmVXyp9b0/2rupkUxVhOmixYJXHEOoxsejcNE=; b=JKtZO3yhHxmPhWdgFZqKvza0Vb
	U8swksql0oVIat8gKP0zIxyC54xlvojudBZgrtaWFUVJ71twH6zp8JSa4pDp2K+cuTbIZTgG0Y4D4
	2f5ohQkahc1djK3xqY8o9hIZUsYaQdEiAFoyhrgxJsIe+GIEn2sTml5sMgKkbDgxjDPuZxT02eDbV
	Me67EVA1VmZh2/EY+uh4BwVPr+bhw2INPQyH0awcoahX7V3q373ZjLfgjuJeL1cwxYBSaMTkBRcua
	gaCptgtxhQvdTNSPZRIUJESucnLNMqdyMZO8SUO6SCJ+sV+2RDNvjCwuvZdRQ39Gd0ue8tmifado2
	Koicj+Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPYVn-0000000C3lG-1Wgy;
	Thu, 12 Jun 2025 03:21:55 +0000
Received: from bg1.exmail.qq.com ([114.132.58.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPYBF-0000000C252-2LPs;
	Thu, 12 Jun 2025 03:00:43 +0000
X-QQ-mid: esmtpgz14t1749697213t65c22161
X-QQ-Originating-IP: IF1P/oCMu5+Z6gtoOhY0chVmlDO4Lfc/wt6ay8GGmZA=
Received: from [192.168.125.115] ( [113.104.142.205])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 12 Jun 2025 11:00:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7120148681061884487
Message-ID: <E9D57DC946595F4F+762b7c45-ba5f-4bba-86d3-4eeea7643157@linux.starfivetech.com>
Date: Thu, 12 Jun 2025 11:00:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] pinctrl: Constify static 'pinctrl_desc'
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
 <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
Content-Language: en-US
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.starfivetech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: OKhYnE1LzMsBzv/t9HEoVP+6QePgrk9pe9zN6qpycVoYzxPmQvClUHvo
	WOT71QKrvHx4S9YGx5chEJWX1oHJbuwyeTWzLkS619Y1N+7lOtOO9lFbwp5Ii40ypRI6xTR
	d8NBY+rKCqBgYnpnF9TkEiMVKdZ1OAdfnJzE9oWAnw4P03AFYOoBiBBUk6bpXa26HpjFhG/
	M1KiLcxmjc2BdpFAQW5rQYmMLrkc44taK77SCZtQYBwDIlYwBCWx8FyoL7+iCirKZnxYKzw
	qhq10wY1xxHtF7By/zfKknV/TwaMPwsqW5pHSO5XlkEw0EzZOPjZGZg/AAQGKvPyp00ki5R
	sK5AbguHuaI3ViQJ/C78bkYtMbYxJQ9pvkyUbm3D6mp1BOkl1ja8+BaYYoQXf6SSRwBx6DH
	0OoTHr/YoP0eBXfayZoN8a2Rc2GXaCOdNI4bc0Ko2vR+/KIYMVbgfR2ytVusrjeGjStNfFN
	3VzZ3+UUivF6HLmoFtzwa8yrtjt9UdTWoEmVBX1e9C7PK5bvZMxFqJu8in2E/asEVI4swek
	slL6KR2KUXWhhAR2afung1+A0xFFbFa1pGHTs69M/Koi+aOkTUBAMrELv0zZt5FEhnPs9kD
	2RGkcPyGr9P1Q4OLoYywlsn1jGbzpgzNClHS3d8z4PIiyRzMfcpyjlG6o9DKbYdjBgMzQ6+
	CCd71rUirVpoJoHmkIEOaj8PJXf8AWhCN8O/mhKFWbqaOFUXai07VHjiG4SPtPmrAr5eHly
	Y7IRsC/hv92m4D2PPT1HoW6Ea4cqzUxqH/HnLNWlslzprk/3D/C6sIudtvzmBEnpmRT+u9w
	yG21Kt5y4c76WZJKti0nkLc4GNzkvFpnl2S0vM8jElKQspfo4vxFtEzFOv2iC27YlvVKokY
	k6pC0lIAbWaChK7vbHSNvGayNVE5KMXH8aLsxk//BbhScLD9fST61iAKtA21rx9NS1NnccF
	3Cb+AI5v3DTaVch44meC2mlas/yQhw+6Wj/eHVqaOM6ctXNOP5yhPXwxI
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_200041_963988_D342EB6F 
X-CRM114-Status: GOOD (  12.44  )
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

On 6/11/2025 2:13 PM, Krzysztof Kozlowski wrote:
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
> 
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pinctrl/berlin/berlin.c                    | 2 +-
>  drivers/pinctrl/cirrus/pinctrl-cs42l43.c           | 2 +-
>  drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2 +-
>  drivers/pinctrl/pinctrl-artpec6.c                  | 2 +-
>  drivers/pinctrl/pinctrl-bm1880.c                   | 2 +-
>  drivers/pinctrl/pinctrl-k210.c                     | 2 +-
>  drivers/pinctrl/pinctrl-lpc18xx.c                  | 2 +-
>  drivers/pinctrl/pinctrl-mlxbf3.c                   | 2 +-
>  drivers/pinctrl/pinctrl-tb10x.c                    | 2 +-
>  drivers/pinctrl/pinctrl-zynq.c                     | 2 +-
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 2 +-
>  11 files changed, 11 insertions(+), 11 deletions(-)
> 
...
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> index 27f99183d994dccb92aac81ca42228bdb9225e87..aeaa0ded7c1e5ee7f9c5e4113bfd208fb844ba7d 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> @@ -898,7 +898,7 @@ static const struct pinconf_ops starfive_pinconf_ops = {
>  	.is_generic = true,
>  };
>  
> -static struct pinctrl_desc starfive_desc = {
> +static const struct pinctrl_desc starfive_desc = {
>  	.name = DRIVER_NAME,
>  	.pins = starfive_pins,
>  	.npins = ARRAY_SIZE(starfive_pins),
> 

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal


