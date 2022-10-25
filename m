Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF68CC38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 12:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L99+tUMkR2CW+QplJ2zzCCZTyjxg1Pl4F6T91OclVog=; b=w3ao5PM6boTBc0994dzR6Nx/ym
	tWfpkeNY164oN0LWCQJdELVkD+Fo7fugkW7FatBnnV5R7AMtvnELGpbHAWEuSxcchSXzxEV1MjDkj
	Ffk6gsr9A67zCkH4pn+Vamhv2dE1ks34dn0G8PF16beFdIy08wCowonTolkTDhWp5YlCZWKjAKwLM
	R+suAucqAe/AoW5PR8hEAem3SkWiI0ADs66AjQl5zd8iEgAWwvHXvQR2/ngq2vZpcoVEKXFjNRi4B
	jN5Ngru+3xhz53Le4PdC6ejXGOSrdJYMLcOvYdyR1ruR+Ib1ZRg4i9O8sehzqwSh9JWMMvXT6MR2V
	oo0e6vOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onIo6-0057sy-Ra; Tue, 25 Oct 2022 12:13:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onInv-0057qX-U9; Tue, 25 Oct 2022 12:13:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DADE46602319;
	Tue, 25 Oct 2022 13:13:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666699989;
	bh=V5vR6tFJk/ZT4RHAKfHFB8pFtjxpIqRPWBt7oLYvccI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eZHwfh6PCcjVNZ6qg7zfvUWBXt3G7cyPp0wpOiiodk/Qi/s/jauEeXSNRGbt7f5FP
	 Ccns2R2UAoh4wohieaIQEr+jk5Ew8dpwvq/svysJsGASD2ejzoqLY6qQRKduArhTlV
	 D+dsoY59iYlYTzi8jZnmCoh73eqqqf6x4/xIP4FwqM1+4ahQJTvWPQH33VwcMLdPvy
	 +VtY4mwfeqwnVlmCGWugIUcPpzBNgN2XxrMxj19FT3OBOPl7OUzcr3BH/fAh8hMCKs
	 fL8HUQO+KJaX3n4HNEq9PnxZgO8uTZr+P+EadulFNirjG5jsbC/NNOrGiBR2nij/Qk
	 DdRQoOkLDFurA==
Message-ID: <e5de6069-39f7-c938-d271-ccb4cb384333@collabora.com>
Date: Tue, 25 Oct 2022 14:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 4/6] arm64: dts: mt8183: drop drv-type from mmc-node
Content-Language: en-US
To: "Frank Wunderlich (linux)" <linux@fw-web.de>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Sam Shih <Sam.Shih@mediatek.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
References: <20221025074238.18136-1-linux@fw-web.de>
 <20221025074238.18136-5-linux@fw-web.de>
 <3b366319-5257-a536-4dba-919cb5fdf477@collabora.com>
 <5ccd67c45c9f384296bfd1f19dd019a1@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <5ccd67c45c9f384296bfd1f19dd019a1@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_051312_130857_C606E561 
X-CRM114-Status: UNSURE (   9.38  )
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

Il 25/10/22 13:33, Frank Wunderlich (linux) ha scritto:
> Am 2022-10-25 12:52, schrieb AngeloGioacchino Del Regno:
>> Il 25/10/22 09:42, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> This property is not defined in binding and driver.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>
>> This commit needs a Fixes tag :-)
> 
> i hope it is ok adding it here instead of resend full series...
> 
> Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")
> 
> regards Frank

Please send a v5 with the appropriate Fixes tags.

Regards,
Angelo

