Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8549AECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nz56SQYOElDr6tgYoSw4BnarbG3R8gKBXr5uUfsq8ho=; b=RKs+QslAobvewPdDDTCgqjpHpV
	Xtd98B4VeqOXQk5WCLIuuak3F3NGTLY6ZHYLrMkmlQgFX4r0D9L3h+QBWxMQr/vnfIXpNi09d96HK
	f3Gm9ddnsUqzJHaZCPv2NawU+ww4LZ5Zkh+Vvq8jn/KOdINA6Bsk6hcD/h/uZ/anDN4WXJv/VEEcp
	g5kCwTC4t9A4ojymWmglgcqZk/fv9YH6XjNxTBnFHEF0GdE1paO8ZO+ivB1q2oLO58k+YrxyIsb2M
	KXvY5p+dxFqCXFMZX5xJCxvyGB6H7M7kSseCUpufqHQmMlHa10c7ULG3pU85ZQB5mAoGD2fuGdGdn
	b6TqH2Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaufJ-009lQo-1N; Wed, 21 Sep 2022 08:01:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oauf3-009lLt-MZ; Wed, 21 Sep 2022 08:00:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8A2926601F3F;
	Wed, 21 Sep 2022 09:00:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663747248;
	bh=+67XwHwwwVr9Zy9Tqbi6F11v6db9RC2DSdJJb+2KAFg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dpDnNOEO+DMIu1yXKQmnHpntygMwx1e12LaxutdYdaimetWWIwy7foz7wDU40z3vM
	 Nd3lG58+67iMOvxcchRHkDSstgnRgy1JPghhFsNNCP5XWH0YLwJZ/NJrJcM5wln0KE
	 Fwqf9Hyx8WX0301IWn670STkn+waoXjhec1qNgnKimhxbTwOAIMcdkjkRRpex1wSbh
	 qr4/n7LWVig9ZommdUMWzieQGpzMJQLgCDbNinI34cuS4kKZTRzQ2jWXtea+zokkrx
	 3EcQCYKBwOjZ6/VR9LALPixyXTfon+fXR28vkjdGGIjqBusyOXjREvBdgralwVQfJi
	 W59s+B3omIdaw==
Message-ID: <66aa53cf-25ed-fc08-f92f-6a0aae48f2e7@collabora.com>
Date: Wed, 21 Sep 2022 10:00:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v5 2/4] thermal: mediatek: control buffer enablement
 tweaks
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Amit Kucheria <amitk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>, linux-pm@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Kao <michael.kao@mediatek.com>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220920-i350-thermal-up-v5-0-123bc852d199@baylibre.com>
 <20220920-i350-thermal-up-v5-2-123bc852d199@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220920-i350-thermal-up-v5-2-123bc852d199@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_010049_890436_F765CAEF 
X-CRM114-Status: GOOD (  11.14  )
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

Il 20/09/22 17:03, Amjad Ouled-Ameur ha scritto:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> Add logic in order to be able to turn on the control buffer on MT8365.
> This change now allows to have control buffer support for MTK_THERMAL_V1,
> and it allows to define the register offset, and mask used to enable it.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



