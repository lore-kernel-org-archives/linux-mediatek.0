Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CE3C7618A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 14:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hIhCrcuIIvYAXAs+XInY4aYxBfloLtSC01x7r/5T3IA=; b=Dq7qTdzQRnixm6
	8x/5XrDwK3Bfs7nR4fwOsx0eQ8dGBZRNofR8zwa1jTh7KWLkPX7RkdfpyEUSOtfqVPArtfbLplCJl
	aOeD/zUDCNAN6XFKSxfESglpDafGThh7VClRZFRyNM1yKd+WjAuM+BVAfdJPkO1KEZD8JRhBoFhWq
	POeEedKVccuCW8CAgU144cfnWNKXghu32MMAKAhxEgGS7VZMRMEuF3k6jncYohYZAuLFFuic5uXal
	26k6x99+eEyp7kfidh3i29uA9UIPaR1wn1H24Y5rKofMzF7JcBfETytcj48GKr/NPl6c7QpEjWgWC
	CE8SwKZjlqAxtw+GmPsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peGtx-009Or8-2c;
	Mon, 20 Mar 2023 14:54:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peGtZ-009OgM-1F;
	Mon, 20 Mar 2023 14:53:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 97D1D660308E;
	Mon, 20 Mar 2023 14:53:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679324036;
	bh=YDB02KYv+O6uCPYWRowGPNFWwtu4sohwX02cVa4LFOI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bFziUYKeg51eXwppZBd+rwb317+nq73mdgQoax3v8HuThRxgQyaovJRC5550PJRO3
	 J6IarL42w2eGpOFN0Ht8qxhcEiY38iAIadr03j3TWR5eqc1+k8Le6L5qRHApP0u0yL
	 /Xv+yBKhX7x0CcFCAkDuaMKhtDA1ZaYe62+aUOIofr0oIgW1b+46Gl4tA2U8FGzZ+D
	 dytSEWmUDXQq4yqzxHUpaqhzCl60l3Y1rNApNaDebSuXbUgT4kfdQau30O/9DJrsaE
	 TlbamkBx24aTlv6LZSC8L3yRBzB+IiLZd5EzYD1psPbVN6veuhBG7Mkr+Jy9+OnvyB
	 yQf1qvao0kHXw==
Message-ID: <9ec79f3a-19b8-f9b1-4226-a2d53a99eac9@collabora.com>
Date: Mon, 20 Mar 2023 15:53:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 15/21] dt-bindings: pinctrl: {mediatek,ralink}: fix
 formatting
Content-Language: en-US
To: arinc9.unal@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
 <20230317213011.13656-16-arinc.unal@arinc9.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230317213011.13656-16-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_075357_554445_D1A825EE 
X-CRM114-Status: UNSURE (   9.48  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, Rob Herring <robh@kernel.org>, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/03/23 22:30, arinc9.unal@gmail.com ha scritto:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Change the style of description properties to plain style where there's no
> need to preserve the line endings, and vice versa.
> 
> Fix capitalisation and indentation.
> 
> Fit the schemas to 80 columns for each line.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



