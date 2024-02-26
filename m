Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED0DC54E49
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 08:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKsIiNTxKMkAPSXgrOozd+3ExiL3qHY75tKWlAbWsWo=; b=B0N0IoUZydpRPTQwvwd0BvCGkz
	JDxwwlF/szxpXop3L2ywVffQk/tsI7hGIEF11K9AzOZo0RqsNmsITKM785Sb/mCtZhwUHVfmxPoLv
	8VFEPyHlaPunRNXilE5MWPiKNuh6R6p8pCz3aGYZGpeEJrhxT+0Y0QgcgY8azhjgxWlYRt3Ts3kxb
	9rJYM908W+eShgOjCg/jjm4gFoBcYZYFqpThFRsXvf5HVTUf0vm/9iNrcceC4K+m0qJz4HpOK5pNf
	VGsmeAoUDx0EEo2qt2VQBJunm5xBV79Ux+8Q/0KT22o3pNPSa+YTPj5tKUFKQgenEpT2z8eanq88e
	g+7zM/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWmv-0000000HAfe-3eTd;
	Mon, 26 Feb 2024 08:56:41 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWmp-0000000HAbQ-3EXf;
	Mon, 26 Feb 2024 08:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708937794;
	bh=NtluJuvOx4HWb8QYTDVkRwb3/l9Jxvrl3zQKPftAdX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1GZ852FNOMnr/PS0M0RdA4DNl2DVu0NYwUjbmRcrgfff5YshOTxkSKY2zYA4GouuZ
	 es/4h7tohQjegewUxeHx1JpC6WBEPT5hAUKvzQd2a4k4THNfyXsANv8FrcMTEfKGWl
	 CiZ1KrBlrEXKpL/zZZJagNlB765etcchPShYmkGMfLwPbL2+C80k4KyqbMuwuAne1z
	 m63StaV6/JofaEcUCPnBtA14i3MrzInzyPqsFPEb8VbuvE7ej/eguKFHsPZO6VgtD/
	 1uBgXzelU/H2gBKGgt+ciIGEWA50gc+yR5mOeoFEi+WZWML5bNaR1y85I+SeufRgZl
	 m8G+WtvW7uazg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0B6973781183;
	Mon, 26 Feb 2024 08:56:32 +0000 (UTC)
Message-ID: <70cda6ba-b6d4-4343-9afd-2a1978150f84@collabora.com>
Date: Mon, 26 Feb 2024 09:56:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/4] arm64: dts: mediatek: mt7981: add pinctrl
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240223101709.30072-1-zajec5@gmail.com>
 <20240223101709.30072-4-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240223101709.30072-4-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_005635_967977_A088DF65 
X-CRM114-Status: UNSURE (   6.43  )
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

Il 23/02/24 11:17, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7981 contains on-SoC PIN controller that is also a GPIO provider.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



