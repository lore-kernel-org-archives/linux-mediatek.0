Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACACEC54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 10:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AczrgRS/Ourjm2uMrczvD90vCL50TI2W022L6tIMsc=; b=t+pBdOloIc6+vr4+IsTAPlFCEk
	UibMQ/hQB6M7fu2pimWDDONs3spw4FLPwRxzwzShNUWImhrlCqTTn98H0A8SPXplg3lYltkxqxlP0
	Jg3pcOCTCfqOQ3UdS6K5g19b7BEwVhdLlOj2ST6qNNhQxkB4oWKAimP3GfGnS499qsFupbTJEBebb
	inlqaCdRAqh2zP+hjiPFxvaZW1IbfiTAVB4vFlDN7LGbpScviqKH87gduJyRvN9KskpchIGYq6MoO
	nByPOKiDslHxkHeax9x7sCCuMDSDu9OgMe3NSnOaPGjbjRPmwXGmKOiDa0+mDMngbRKC2hitIEw4E
	d/B3JCbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAA7-000000088XA-0unt;
	Mon, 18 Mar 2024 10:24:11 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA9x-000000088Rv-1RgG;
	Mon, 18 Mar 2024 10:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710757439;
	bh=epH7fThYZdzezDriuik2qS8wOnir6pPihC9rc071D6A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xtuQVgaFTToXo9a3kjdvcWIZa34cagLpTEoKZWxxwWK+7bXuQoyhLMuAGm/CDeOx5
	 kVqGD5Phr5/nOk0FXEzwYUYk/20/G0CNiuvbYGXwlYwr0l9QaO0LPGCjfEOzlNKPOp
	 8gnWGf0EjDK1sJNOj0BwjMwG/Q1ZXo32WTsEdOoKT2AwBoS0BUJ0KC0d0ifiNe9ARg
	 k5XQMBBx+zTJPm/f3ssNrSw6WkO2HKGR5bCpCoPer4YI0V9TewW0Gw5HoC9ECW1Fjs
	 mgnev1bb3pZtsXpsmmGTERF5LWaTQQGhD36j2SAmjab9bLoYl9F+MqiPgR8cvZlNqV
	 mqZA4OYA1tgPQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 22128378203E;
	Mon, 18 Mar 2024 10:23:59 +0000 (UTC)
Message-ID: <88f9c771-f42e-4345-8811-ed123a0f1fe7@collabora.com>
Date: Mon, 18 Mar 2024 11:23:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] arm64: dts: mediatek: mt7622: fix IR nodename
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240317221050.18595-1-zajec5@gmail.com>
 <20240317221050.18595-3-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240317221050.18595-3-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_032401_557105_9FAA400B 
X-CRM114-Status: UNSURE (   5.66  )
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

Il 17/03/24 23:10, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Fix following validation error:
> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: cir@10009000: $nodename:0: 'cir@10009000' does not match '^ir(-receiver)?(@[a-f0-9]+)?$'
>          from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
> 
> Fixes: ae457b7679c4 ("arm64: dts: mt7622: add SoC and peripheral related device nodes")
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



