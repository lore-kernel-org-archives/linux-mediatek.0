Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A11CEF148
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 10:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugZtMaqu+bRgJs63AM45Nwxrd4YQfIMLUIRJYeVhLeg=; b=YtIM8HoKXr56oSQLudY+HG0FB3
	3kBT+T/mej2aRJCopvWiIV3zz6x6JbMc2zcYrMC67GcWTzRDy48Duzp6plAJa6WVdz+tMB9NdiXKr
	8DYxBRY8fDdHGW/drsq0WjkWItYA1AxzPnY4azo/Gj+EI8B/00/k1OFGjMfg0lkLzrQNlRQcix/df
	I8J8dU4j0c07ldgKEqyK6PLQKpk7GNvBgG4mxdlk2TgWe80aUYPYMwHMa5BYX4Sihu2FxE3dI7D7k
	zX3d7SiWmf2UtkxgEACxZCLH0lUpEMf7jt9a2otMWZVWIqPFVS8NQ7t/S4HZWv8d0VEpPci8gkBZ4
	O9O9x3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy75x-00000005PSK-2Yqi;
	Tue, 08 Oct 2024 10:05:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy74K-00000005P1E-0MTY;
	Tue, 08 Oct 2024 10:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728381830;
	bh=LQrj1zggaNLKMpZXWCrJ2XjfNdHhKO+CPf6FzPfAKjY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YBVL4locCVsVO56W7zsJrV9FuvAcowHX1uHU5kTM4E2F+TXgCEHnFEvj7A72yBC30
	 Yi7BAXtxBNYUUfqdDSTpvZOYHO/Ep5OSAuvNOrFIk9vRBvyGyC+is1cg1hmNjAop94
	 4uuC9DgUzq9etp00N0y9CfFjTk7yTTDTF6NggjN9KKjXajEM/iwa6UU3w3Qy8c3xbB
	 vcGC1rgMwpwQI9UzeRgIHRRq1U1mSgKEoQeZF5BwSXdrEpQvzL8R5vT+gL4YUt6Xn/
	 77BFxsz7FFTrHcoSes+gu3xO8CzvwRIykEU2hWuB4yQGJSfVyZpXy+a+F0datmC0QO
	 neNqeJQuHQAyw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E75317E120E;
	Tue,  8 Oct 2024 12:03:50 +0200 (CEST)
Message-ID: <bf94c1f2-235b-42c3-8e8f-5e96d970d548@collabora.com>
Date: Tue, 8 Oct 2024 12:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: mediatek: mt7623: fix IR nodename
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-media@vger.kernel.org
References: <20240617094634.23173-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240617094634.23173-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_030352_290969_0E06CA0C 
X-CRM114-Status: UNSURE (   6.29  )
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

Il 17/06/24 11:46, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Fix following validation error:
> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: cir@10013000: $nodename:0: 'cir@10013000' does not match '^ir(-receiver)?(@[a-f0-9]+)?$'
>          from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
> 
> Fixes: 91044f38dae7 ("arm: dts: mt7623: add ir nodes to the mt7623.dtsi file")
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



