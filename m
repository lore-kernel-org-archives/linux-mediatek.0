Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D1CC6FA8E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 15:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRmbflmcIOk/cLM32F9mDGREanPdiq+JQrqHpGqZCV0=; b=RdL1tSb9gq8jdCL7ulJWuUUv8P
	FAvvqZ61MGme5j9XtHDwZfsSIm3n1fcwcTzu/O+UbXyr1PSoCzwxR3hGXHFKkfDLYGkpTQpFx5/wl
	1l/CHVdvV/+VGzrgaivn3AY2+Q90LY7/c7SfbBCDmV2sJrFhHzGP+/Dh7+NwdnuVV7DF/ielg16+b
	A15yjf5O9BqtorRe8Lkd/6s+0DX0hjL7qSnrwUjv1oXnF11+/jm8MD4P0hnDcVOVh+YmFoipK1uiL
	nA9CTqIYAzX3L4SCwN8fhK1sTHhrf7NNO/9B13G9VemnruLB2i2AStrJZ2CpJwXpgAbp5ogsgSBr6
	zLhQlRog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXkeq-002cCL-O6; Thu, 02 Mar 2023 15:15:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXkeZ-002c65-1h; Thu, 02 Mar 2023 15:15:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B2C886602F90;
	Thu,  2 Mar 2023 15:15:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677770128;
	bh=XV5YGRZl9Mppuq8eKn/eaIf87XWA0/iCyRlIetkTC2k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dMc+k7hnvJ48+V2RlrYCycZRmICvsxNCAZV5N1tN5vG1ofhV4hlx3sxwp7UtI0LQQ
	 dEyelrOEdcV3RNxjiGRw1sca7U3N4ovbpmB2c7G1tf09tj6hYafrvBW/pm9EmhYq9E
	 GWZxqzNCbW0BtAqdgBGciTOFQfyrAe2G766aMs3Lz6wAwoEhMHDwy/fn475qHMql9p
	 2IJIvy/cz7YYE2pEy6gJudtye9APa5szBJHYoPbQeCO5nT1bfzhuT7jNeHOyq/s70B
	 DlgLNuNJm3kAq9UGmgzPwZSNgl4MF43+J7/gaQzut6ISyczgZwxmHP6OqUHDzdv6fB
	 TiyZbwodmDMpA==
Message-ID: <a0913c20-81ac-6221-6bad-ad611d7aeff2@collabora.com>
Date: Thu, 2 Mar 2023 16:15:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: reset: Add binding for MediaTek MT6735
 TOPRGU/WDT
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
 <20230302124015.75546-2-y.oudjana@protonmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230302124015.75546-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_071531_264259_681EEC31 
X-CRM114-Status: UNSURE (   8.27  )
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

Il 02/03/23 13:40, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add a DT binding for the MT6735 top reset generation unit/watchdog timer.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


