Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824C3D1AD46
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 10:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnfvp6vTI7+KAOQWxc4ooVofR6+qDYYPeSw3mrype14=; b=pKGynp5TAGu8UV4WUO9K4sK2vv
	F+fQnhXtA8Dw+RQAMyIK08OSmwROD+m5HGmqhKrHCMaRZnNIGznz0pWRi88BvF2kpSpHRN/N2NmHC
	U9++5E3LEmPNzPT0UiRZdNey2rYyVJq7x1JXf0D3jTROve7OXwqRYCfRE4AVe2GpoQK/6fZW0HzQ0
	1Frlgoqm/ZjKGc2L6++Al5Kz50K/4WpJBQl6uUSNM5HcV3T+YkbWOYmlaJFOHRvge7MFzrMtoR3eX
	JSTUDTIXnFQrX5aEuHPov7uFuoq84ql+snDdja5kFdVY3a8bsE4mCThMBBnSWZNJb98/x3YhMi5eI
	K/vKMvzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t11V3-0000000BUlu-1rXk;
	Wed, 16 Oct 2024 10:43:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t11Fj-0000000BRT6-0m5I;
	Wed, 16 Oct 2024 10:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729074457;
	bh=md6N/XQGzlUgrB8oUbFlx4cVulC8rjoqYcCGd7LBoRQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JsWfXgOWmZ0+VTUeT9qZFbbnRMZv3r/mQcpNmMgwaKcb7xmhFovuvwtz+hl2psPNm
	 tAbwaDwCxEwkGNqS6zc8/xPA8oZd7frUmiebwXJBD+N2YDznuE0zW1yeSjot0JF5AH
	 x5m4UA5ui8ttORQAdhM2zKU2q7R9AWDVR4UoMcQ0e14e3+HacsvL8M+w4I5lB03GFa
	 Y6C7yr5ILsAx0CRk4QE+WOOLGAg58rtWBMX1zqrv03CsTamvRuS3WPIUpyw1KRCIne
	 BstHvKZoHDWww7mKJSR8/LEHQE0GZlZ2Vb9yT6gTg+1Nw117mNGS9IXc4rCMxxZs3O
	 x8OPNyKQZdAkg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0878F17E1003;
	Wed, 16 Oct 2024 12:27:36 +0200 (CEST)
Message-ID: <3a70c755-3a33-48ff-842b-c24a6a37bbd0@collabora.com>
Date: Wed, 16 Oct 2024 12:27:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] pinctrl: airoha: Add support for EN7581 SoC
To: Lorenzo Bianconi <lorenzo@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com,
 linux-pwm@vger.kernel.org
References: <20241016-en7581-pinctrl-v7-0-4ff611f263a7@kernel.org>
 <20241016-en7581-pinctrl-v7-5-4ff611f263a7@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241016-en7581-pinctrl-v7-5-4ff611f263a7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_032739_421185_1E573DDD 
X-CRM114-Status: UNSURE (   7.93  )
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

Il 16/10/24 12:07, Lorenzo Bianconi ha scritto:
> Introduce pinctrl driver for EN7581 SoC. Current EN7581 pinctrl driver
> supports the following functionalities:
> - pin multiplexing
> - pin pull-up, pull-down, open-drain, current strength,
>    {input,output}_enable, output_{low,high}
> - gpio controller
> - irq controller
> 
> Tested-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Co-developed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


