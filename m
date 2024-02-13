Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFABC4829A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1KH6fXAJ0ecDV0A+59qPPqUMqXNUC50ZM/bFfijbgs0=; b=Im+IDb+0slCzEs
	bdea/EE0oNmzcv9oMG3yG26DslWuLOvdOgjiMWwRinXtQsBSqsdddqTWI0ctrbLfFocxsDLditPhG
	1RRIGPip/ZU+2gVwI9IuW2Q9pBiOrPSlZB+rC6uQ7TfdwwRPAz8kF9cUgrrXbSoJ8JnkcrKc4hJHz
	kma+BuDzqiQ+T3MsfdOx5CcoUFVpAYnYyynrVAELC7Hj3C1v8ZSDB+vyCNSxMcn4Fz3RZTB8uAR2k
	tOB/z14BUUry8Il6ZqnzU3q4KLsks/n9vbVBlNh+fQlQjGutXJ8glrV9hUv0I66FW+I0SI5oro59A
	bOV1aUcdtWw1vZ8RnIhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZopM-00000008Yps-1Z9a;
	Tue, 13 Feb 2024 09:11:44 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZopI-00000008Ylr-09Iv;
	Tue, 13 Feb 2024 09:11:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707815495;
	bh=ndqYmeV6A7b8wwtcMLEgfQaIjNxznoUbQ2OiauorsUQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VFNbAmdXYnSU7RJeTXfc2p0xK2QlMFrboEiAnzkmNckehmgpiOI3z6XEJrbzSHktf
	 xpBl4hGBbpCayUB1XmPI4g2AKGvIWv/Y4QvNk+7Pc3LP25YlTWTZU7QGLmqNTVE7GQ
	 HNSvsqD13ZZ+6Dl/dxXH/2a5YF9spIMEER4Bkn2AcaUbNFUlXEh8qjdSs40tECYw3U
	 MGtzyyvZmz8NMeIAWUqI0pyEbA1bxEMWruGoaR3JwNrPt5R9iGQ6pwgDkI9myk8wF5
	 pugekqlBqMovfS34ISfgoHxi7/uch1T98U98xgqi3hOyeoQVHUtpxF1EeyHeMQckSB
	 PXuaDqUkrHkBg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1170C3782073;
	Tue, 13 Feb 2024 09:11:34 +0000 (UTC)
Message-ID: <af0bda0a-2c8c-49ea-8e62-b6674b671a2f@collabora.com>
Date: Tue, 13 Feb 2024 10:11:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: mt7986: drop invalid properties
 from ethsys
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240213053739.14387-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240213053739.14387-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_011140_242134_70E53190 
X-CRM114-Status: UNSURE (   8.06  )
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
> Mediatek ethsys controller / syscon binding doesn't allow any subnodes
> so "#address-cells" and "#size-cells" are redundant (actually:
> disallowed).
> 
> This fixes:
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: syscon@15000000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
>          from schema $id: http://devicetree.org/schemas/clock/mediatek,ethsys.yaml#
> 
> Fixes: 1f9986b258c2 ("arm64: dts: mediatek: add clock support for mt7986a")
> Cc: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



