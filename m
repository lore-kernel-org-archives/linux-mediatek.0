Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622B4C369D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Apr 2025 15:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xkwUbEszkHOBEK2wcGSJLn69QX+/oSTxVt8BVr7zbYY=; b=dvP1DpryBMWk0K
	VbAQmy/SFLSybpbkA27wQsEwEPhsoYwhi2GD8KOK7dqYloHQFm2hiONnoQIpIVBupFfIn26G2zNYI
	pFA/6xBXpBLQxe4syzEoENaSFKtIWLXMQqzVL/nWI5SAQHW+rDZGuG1qEU+eiPNotSGeXmx9U1gAn
	gXaJBmPyQ+onbMG2dLu5oc7yBmqf1vQUtZyg2Fp71m4mCWCsaROTT1X19jh1/6gdnd9xxRQ4qw2AI
	l7weC7UmZXmNZX6qJHXKIU1eYNy1vdI3WK0t5RGNFPpSL0swuoy07g2VQuNY+1vHFaTkVjjTpugPQ
	ur2tDzLBhWxQkoWDFItQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FAz-00000007clD-1yYv;
	Tue, 22 Apr 2025 15:04:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Dh9-00000007Iu9-1v0Y;
	Tue, 22 Apr 2025 13:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745328589;
	bh=PS9A2so4Ht/r0sk6C7KPxy+lOlrbJ9bDV6SgknfZNy0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IvYnRjFWbSZamcdfKDfe1bpuO1ZOxCPLlQu1QNggSf2YBfYRvA4xgyl1IOTF104Pq
	 w/9lGvG8Dr214i+diVRHUuAkif3NeDHkW8IEx+qn1fxAPW1xLpbwhf64P5GfrahQvC
	 i+w484vblnIJYfIPSGcJ0VQGfVGyyWqVI3Z58EtVjkhgg2g6iU4m0vamPmSiw9Ptqd
	 4PKOpySmYTH0S7FR9KuOWONk1pgL32WY5W+3ntdhfFnfOVQ7oRf7ioG6o91Lv51/ct
	 E6QvUxNp+C5KXgHUJEaiVNYQeDID0IaixsrU1pn1bnW5zpnwSYfyzO0UCAr6DbsUiD
	 /OYX/TgNmfrdA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CBA9D17E0B9D;
	Tue, 22 Apr 2025 15:29:48 +0200 (CEST)
Message-ID: <e086c8aa-944d-42db-b163-023571dcc740@collabora.com>
Date: Tue, 22 Apr 2025 15:29:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw
 variants of bpi-r4
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250422132438.15735-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_062951_685115_552D6A71 
X-CRM114-Status: UNSURE (   7.08  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 22/04/25 15:24, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Sinovoip has released other variants of Bananapi-R4 board.
> The known changes affecting only the LAN SFP+ slot which is replaced
> by a 2.5G phy with optional PoE.
> 
> Just move the common parts to a new dtsi and keep differences (only
> i2c for lan-sfp) in dts.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogiaocchino.delregno@collabora.com>


