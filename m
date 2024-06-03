Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6CAC27C4F
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 07:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z0kBzR2MAi9EQIOjTEqMoJ4eeJzYNO0WModtzOfxXag=; b=nJ2VtHLXOqdIwOa+3ujwtUxPh4
	dDMylcLsHpnzL8egtZUPXK6KXy7IHFl2Bm43/BhftjsFVllHhc/KCw+GXpWuE1/mo2x1EzZkUjkST
	iUD6ewOeHAqwE4M7x1y2SRHwLUm4WTF4f+RjCGD75Xa0blX7xZ1L6h2gr7z5XMbF5IFttwDkkT1bj
	pQVZR3hVLiODECE9+pD0qQfQ0OFms401zM4VTsSWTIBhh7EyOaFIfRucCbUd038QIbr1fKI1m3jBF
	6xRhRhN/L0P66q95O/Ly9DmilWwfCr6i7r/VL/+iaVAexUJKJNlbA2XWH71Dt8y0HgMsSLj/TALOg
	b03SDp+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2GN-0000000Fuwc-0LQX;
	Mon, 03 Jun 2024 07:37:51 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2GH-0000000Fupz-3tDd;
	Mon, 03 Jun 2024 07:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717400260;
	bh=y+Onjw/NgOT42Z8CqCca/qc73nEWr1sKa2IiCJCVm5I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J+NxhO1ia4PXJzDdchChedROoV348Na0shJxbYU9xaf5V4+V0s3PAtQMNMII0Nrzg
	 n5J2lgCYG5icjj/1JTsMVTW6uPqZWKIrt7aBxOunzCAD5Bz9wvom7gLWJDdiD3WWV7
	 76ZrfYpeSGNVMvaWm8QPeR0e/Yx2Yr8/ZUMNS9gx0umztSsIQKO4DzBhQZk6wH6FIQ
	 Yqt5YLS+C0HNoZcIDzTZftbvwlygnRvf9Kju+jL/9zvbbKtxx5ZRsdPs1ULl3+1AMc
	 r/D31ts6g6OqxwBfuaM2PeIeGgxM0xc/uNrzEN/bc0XtOAMZSNUUByln4EBjzZ/J0J
	 rZFevfjjW5DZg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CBB8A3782190;
	Mon,  3 Jun 2024 07:37:38 +0000 (UTC)
Message-ID: <ed191114-0259-4de9-8e32-6718fd5e6747@collabora.com>
Date: Mon, 3 Jun 2024 09:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add OpenWrt
To: Linus Walleij <linus.walleij@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 openwrt-devel@lists.openwrt.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
References: <20240527115933.7396-1-zajec5@gmail.com>
 <20240527115933.7396-2-zajec5@gmail.com>
 <CACRpkda-egxVtP8Tan9T_EfQX6ekqQDf3LaVUu0by7aWY1Qmag@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CACRpkda-egxVtP8Tan9T_EfQX6ekqQDf3LaVUu0by7aWY1Qmag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_003746_172787_230D6E70 
X-CRM114-Status: UNSURE (   8.69  )
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

Il 29/05/24 09:42, Linus Walleij ha scritto:
> On Mon, May 27, 2024 at 2:00 PM Rafał Miłecki <zajec5@gmail.com> wrote:
> 
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> OpenWrt project (with the help of MediaTek and Banana Pi) has produced
>> its very first own hardware. It needs its own prefix.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 

Hello,

I'm not sure about who should pick this particular patch - should I pick it into
the MediaTek tree, or...?

Cheers,
Angelo


