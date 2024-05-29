Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8366C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 08:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8ckO0nh5hZUFMCLu02rshxySdgkuG9xKgSdk0HaAs8=; b=ZeF0rKWV/O5sInQ27LtH0MstTA
	sUy7vlC9maAXTrU71+SyeK0gYtv5of+1fMOAuUE9sg7DJNGa72J2g5EQStpDNFfxaFTljYiY0fwkk
	F1CdwGBaNj9d/rvY2C/lOSaRL+k/MHFgMWmK9dkb2Afr87ajzsUF/XjSRenrdLWk3E8WjFD/Yu8P/
	Kly8YYqhRWl2/FuqAdpRAY4kL+B2e6dR0eD8OI6crNr5ZawhS+1VQpKtNN0tt7nzAstBNBhabAIP4
	s3DcXhrO0JrJgUrzpGSAbqLulUhViiwS+M7J3XE33zOSGnw/adu4BVbtCfaK52ph6YIKu/qqa5xHj
	vfAJaVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEbZ-00000003Mze-0i3z;
	Wed, 29 May 2024 08:24:17 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEbT-00000003MuT-16BL;
	Wed, 29 May 2024 08:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716971049;
	bh=T0goSHfjzYTHwb4NAbEKcB9/JQYf1677w+bj+dFoZLE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ERMZTvdfimF8/X3wkcB15TuUxOemNHd321eP/duA9X49MSdM90SrYu59NOtRQBhx/
	 h+5YEpmcgLp/iXxCmGynv1TQt0lswL3P6bUOqzTXjwBOQ2ZCnPpgQifCcVI48nUvFp
	 gLNZtshghS/uILvED+9tC8OlEPAKOBzpnl+eYYkRiXSF4jERAUr/8RXxl2XFxbSxpn
	 LRfUC4wzm+vsrCojZOUpVobBVP7hJK1dMRgcTplffdtdPfxokDsULMew9eUwKmObrI
	 tvzenzUjK69rQm64YqcGQDIFgDasUxecKSSzlB+qfpMo2sk4wIhzA1sYdnEu652CxY
	 6lUfmNPUK1YEA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8472B378000A;
	Wed, 29 May 2024 08:24:08 +0000 (UTC)
Message-ID: <358b6488-3f7c-4378-a811-175b6c77290f@collabora.com>
Date: Wed, 29 May 2024 10:24:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] pinctrl: mediatek: Convert to use func member
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Daniel Golle <daniel@makrotopia.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mips@vger.kernel.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
References: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
 <20240528194951.1489887-11-andy.shevchenko@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240528194951.1489887-11-andy.shevchenko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_012411_690992_37B34F3F 
X-CRM114-Status: UNSURE (   6.79  )
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

Il 28/05/24 21:45, Andy Shevchenko ha scritto:
> Convert drivers to use func member embedded in struct function_desc,
> because other members will be removed to avoid duplication and
> desynchronisation of the generic pin function description.
> 
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

pinctrl: mediatek: moore: Convert to use func member

Then,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



