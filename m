Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5214D15DA9
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 15:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AdFRkNAvEgHJtRHQkn5y4p8DMSF6pEFAOr9euy3k6w=; b=HwFww5Z2Zc7lfGj6A3Ys7d7wYY
	DHYa9gotFox4a2nD3Skqp9lUKGcPP9XmpWl7XVgbfN9KpI/g81sqweA15pbc5+uMfrFgEKbJ0wBER
	gGho/0bb1QrZJlVWWtNerdd3WRcHsfGbwKn/9XzAODEmDXf3lnx4Gy1yLEruxFkWq4MHwFBmQXQP2
	XTlX/saoZr6gEQWRNeoZRys4pomdf9euOvdiG7kw6R/a57zw00tIjzboWByb5c0l7Zt8Zpqws4F7P
	cMr9Hg/G73Lv1Caak3d0P2NRKQe2V6slZaWr/GgbrUm9bI5q/OTUnx4H3+0eH2kVGdfHo5ByL+FDN
	4xP7x81w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2u84-00000007kdF-1vdE;
	Mon, 21 Oct 2024 15:15:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sgL-00000007Skj-0HOG;
	Mon, 21 Oct 2024 13:42:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729518167;
	bh=Za6fLfK25amxq3Nz44P1bfUEcNWw7mIDffdQ9UHQBmo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XiRQxA/98stToIctCScBhq4wjm1jI8k11l2JY5BcQloRhNwHw/PKkvDPSSwPe5rMZ
	 ryi5L39HLCzhDokJ8Cjmv4+Fi0HLD0+XF91yTSgLHQEeOGNM9zX36TY2GccEehPSNP
	 k9gaBjQxeHsWR0roFq/iAxhQGUb6u+AeK0V4u4O4gVy2JTeyONiVyh9IBFfzG01GkK
	 NDWi3A7X9IdkJ+xsbh86GcoYaYtFR1V4gsbici27U7ta/DxkyEzkIthbDis+6GUCqW
	 pahIcyVIW4wKKcLrn/9RpWKRyB2IXQ/6uG33dmvR93o7pkuNLQHnhbvMEWmMwCQqXY
	 fKHBfy1qQ9W6g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C2DBF17E3619;
	Mon, 21 Oct 2024 15:42:46 +0200 (CEST)
Message-ID: <88d41ba5-e6a8-44c9-bbdb-4ed43fd8ea32@collabora.com>
Date: Mon, 21 Oct 2024 15:42:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
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
References: <20241018-en7581-pinctrl-v8-0-b676b966a1d1@kernel.org>
 <20241018-en7581-pinctrl-v8-2-b676b966a1d1@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241018-en7581-pinctrl-v8-2-b676b966a1d1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_064249_459161_B48351DC 
X-CRM114-Status: UNSURE (   5.92  )
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

Il 18/10/24 15:19, Lorenzo Bianconi ha scritto:
> Introduce device-tree binding documentation for Airoha EN7581 pinctrl
> controller.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


