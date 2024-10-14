Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5080ECFC500
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 08:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WCUPYBB7n5SmPGHyanXzEw8t5rMNWSSjHruVzrei3I=; b=GI9QA2rt6HMpXqpAuKe2LrvI/u
	oAdj3d0ylu3OojsC5/OC9khlyvTb5HVwGtwwrVumR2y03VnFixmAWpE9In/FKxQ95nToJqI7LmUA0
	QIvlRT5VZ49sho0gdi+8/n+UkVieemMMe1Gq84+Wl/1jG3H4WRZ8F5XlGKM4jepbQ0V6f9f0CLFOO
	UOHL7qZX/88BNZM3Q3Eic4JwZPLWSpnDpWAA15PDujXAXJUQjQ3QV9mfYXs+8RI+16zR0sMyGNaXD
	ebSZZ2QADoyxE2bsSOZvhY+GfScIpfvqNlaDz8pp1ZmJwVzhjflvAuVI2IWKiCFXKCglgtosnFIH9
	3p0gw9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0GEh-00000004E96-1PIN;
	Mon, 14 Oct 2024 08:15:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0G1Q-00000004Bc9-0fI8;
	Mon, 14 Oct 2024 08:01:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728892902;
	bh=M6TUkPMLYd41Oi3TQHyP3BZuQAAKZ7vP7NSxtsaWBls=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JkY4DTKGmxpg/SswlfsSk/9mwqCsQO3hTmq9zHkyXCS8Zn0+4LE946fyiB/C7F96i
	 TrXnTbywAcuvn1vyMXm0mNFkTtujEzurxZUzzebpqnAnfixuvGwMLyVzC45MpvJbUY
	 XVPE2qRy6PaGMTfa4WQkxb3oQtmVBtZ3nPSbL9HvY8NkA8VLUS4LP6mK+zG57bHm/D
	 UTaCbwOrIiJVJoZcsKlPCb/b3nJD0YstZghwt1hEZgZElDMpqJvd0/6xrHIEdl/IhP
	 soztR9N6QXtM3ej9fHGMd1L1UG3bxPA8swLvdO49bXoDvQpqp3P84toyUnnEzOCmKW
	 QJTHdqR8RqlnQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E54C717E10C2;
	Mon, 14 Oct 2024 10:01:41 +0200 (CEST)
Message-ID: <4c7128aa-11fb-4536-814d-138a4be87a47@collabora.com>
Date: Mon, 14 Oct 2024 10:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-2-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241011120520.140318-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_010144_382307_B1A960DA 
X-CRM114-Status: UNSURE (   8.24  )
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

Il 11/10/24 14:03, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> mediatek,pinctrl-mt6795.yaml has different node name patterns which match
> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
> has a description of the pinmux property, as well as some additional
> descriptions for some pin configuration properties. Pull those changes
> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
> preparation to combine the MT6795 document into it.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

For the sake of consistency and reducing duplication, I agree.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



