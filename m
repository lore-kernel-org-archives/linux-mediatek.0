Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F52EC48260
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2CxPEEOF6zO67prbU4Nuf7jM2gATkw5ZPLWpmmG07A=; b=IPH6CzExD229D2
	e8XMrxeRvchhpMcvbSlL/KnRpUKTOeA7hn8bof2CQfdN6w5QM4tfI2Ak5XPig7V1qrz7uWalVU61o
	TMGG5t3ZzEyiamfkt594d0s3wVjYGd85qdCuegMqASgzsQTG4rxtj+rQCEv1vfpWT/L4w81sjwA4C
	5pxbDF5ZZPnLIuFcI2CwcRMuJqJ29XvMKmbjfSdJ+7NleHXG8Z5FpM8XmtmANl4XF6WEfDjgqJ9Ws
	z1vv9u4//ZUyLmgUl1lS3MLXzVuD8Agwm5suaGR5eSKg29ZFCi57LhvaXkgUlyR/OnLKLUbKr1GED
	/1HCgKIb6SlmNKyLI77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZopM-00000008Yq9-3Qlf;
	Tue, 13 Feb 2024 09:11:44 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZopI-00000008Ylf-09GT;
	Tue, 13 Feb 2024 09:11:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707815493;
	bh=ZRya2IRpTo+isAm8zeDAAsRcDE8ZzmojpAFzkmjK+ks=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rj6WYGWgWju7e9ovPFwW7Nj9Al7gHaylI9V6PT98Z8dRe53A3pZlUiXSnhnQIg2lL
	 8Fv2KTa23hdJjRn1x516OW/7LMpWYXU2oCx6Ou6E+X0e9+k1aJN822KroQKxbRMNBV
	 V1ECW9ecAB7wMDeqLRrA7gNDggc/nc6SDSfoVpgvn0pCfD0OXWusxcyxpTYnaHk01z
	 s1ZBQsIytP89tnrWTLrbNkOQdf7wmaksGXesZrZBU60JhiEW0dlwTJSI982GlkQqYR
	 vHUtgkzBHrdNJPjSsrOUnxxOXSrU2x5sj4o/J4fwyUXRH0ys52+X7jSOHR0h8hyrXf
	 uqF5zIPR3FOcg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8FECC3782043;
	Tue, 13 Feb 2024 09:11:32 +0000 (UTC)
Message-ID: <ff6d841f-6eb8-449c-91cd-63e4958bf4eb@collabora.com>
Date: Tue, 13 Feb 2024 10:11:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: mt7986: drop "#reset-cells"
 from Ethernet controller
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240213053739.14387-1-zajec5@gmail.com>
 <20240213053739.14387-2-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240213053739.14387-2-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_011140_237463_BB04AB18 
X-CRM114-Status: UNSURE (   6.77  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 13/02/24 06:37, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Ethernet block doesn't include or act as a reset controller.
> Documentation also doesn't document "#reset-cells" for it.
> 
> This fixes:
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: ethernet@15100000: Unevaluated properties are not allowed ('#reset-cells' was unexpected)
>          from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
> 
> Fixes: 082ff36bd5c0 ("arm64: dts: mediatek: mt7986: introduce ethernet nodes")
> Cc: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



