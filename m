Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02DBC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 14:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GGRLqveSSoITVtmAIA3G2Q4HqFh6ZOfPtGR0y+M/NkE=; b=ivdU7Rvee5CRmE
	oK58TnoOkmHaf8zSCudY7/KjrZDkjltzZGZNvnlXB2mcs0bity1LmQ8pD7p9uZeGLvkDphxAkSQ7f
	1I6dNjaiivpmWugWz2TwwNf9WgEMy3wbAybplrL/mu4o+20KexfiDfqWdtCiJfF+Jrj4gJmnEq6Ik
	Z09MQglgg9+ymYO0Ja116ITfcVGj1u/tweMsdi/0BySD3jFwbEbuXZfITII2EUBGyOEr2n0praJ/H
	EC/Fc2w9SrPcXbR+v0yFTJ7v0cT23yfICzeIA+8jBHgVzs2Tigbw08FiLe2HHkJ64jxhxSnB5pbpL
	x7RMDlpbrChmzAeCr+4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDip-001Vbo-Qu; Mon, 06 Jun 2022 14:28:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDic-001VXh-6F; Mon, 06 Jun 2022 14:28:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8B7716601E8B;
	Mon,  6 Jun 2022 15:28:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654525710;
	bh=x7xKY5UUVqxnt5695zeWx8FCmwvNi3Mq8k7CtIwGYG0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m5zy97b2177AzVbPV1k8kS6LsuZ3sO1+vG5fn7qDs+VulYToDd8FeSkekArpUCKu3
	 She6nj230USZpPYifATZ45fjSvGs7qTimZwuB9cZLwhFu6uUBA/rytH7F9SVnsoc1f
	 mdXnxdcQpb42pPHOhriV/coO/XkMeGmI6kAWY4GVDkqfPHfFpv9rvhN+cOaKolFPUf
	 O9F263uN2FCDvQ0/xWQWMdGfAA6goCvc0WkhCe+cahuagJjA76uPo1RFjWHSljF1MH
	 HOD9HWuo7sZh58TeXFdw6mOCntLJXWVfi4d60TMOTaGvdTMmOaZejLZ8vJ2Gb+DPm1
	 uNp/n72zZ/bOw==
Message-ID: <eb1c3713-b6a5-5f5a-fe22-75117b85971f@collabora.com>
Date: Mon, 6 Jun 2022 16:28:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] dt-bindings: pwm: mediatek: add pwm binding for
 MT8195
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220531114544.144785-1-fparent@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220531114544.144785-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_072834_496362_1FF5588B 
X-CRM114-Status: UNSURE (   7.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 31/05/22 13:45, Fabien Parent ha scritto:
> MT8195's PWM IP is compatible with the MT8183 PWM IP.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
