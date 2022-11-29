Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A270C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 08:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecJ/d90r+/KcLpvTLY7sH2Hmfwbj7Q2dA10JEo2iUWE=; b=AqLN7hGUqIygUjnchU7nEDY+vN
	kdJLcsiiSEofCals4SzywIjHTBZGOEEzVZxpJkO/XCiijZLsH2iFoEZlNaq0Vki7x4UOpyR86jIj5
	06FDZPURqhdI+DDTo4bx4IBjCeldGyziKLYG4vGwuVWI+xzcH8vxlSM+CY+Uuce+C6FvsrwRwl/r6
	jLMLnXuH24VoJcVZvKaPgp746PAKWflW+OvJiELdykTnzd99Jy8kY08j7JowZ7Br9TX1HqqoJR3+6
	XJkxdqhpO0VIqC3K5axuRhMNC98yOBWRzM43fFYJedcPWvG4zR1MlA5qtIO4kRPa8RM70b0G2M7JC
	MjknEFxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozw0N-007MuF-On; Tue, 29 Nov 2022 08:30:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozw0C-007MqP-B1; Tue, 29 Nov 2022 08:30:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 973A766023A1;
	Tue, 29 Nov 2022 08:29:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669710600;
	bh=XnYqiFVLP4BtH3oXv8+Wi85TZoEBQEB4dmv9jhrnXLo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GnSd9BQuynt5Ll+SAJX0Wv2Wp5gdL5erByXb769tHIfyJ6b7loqfpKNyFpYU87J9y
	 /1Kfpa1zrUYHneQ93OPXC+Gxi2VmChmkr5Hex92ruzEzJJxe0arVP96XSuJS8tHNGk
	 uXsl44HT6vYEOIxQxSQ8hT83Zdxw94bYxMaib4VIvueYMldCnqGuWeWNaRCBSZXt0g
	 O9OJ6Vlke/xa7JT45ic9W+QZNOT0YAyZDHGV+kgZ9AyX4q80TI+kLargPaa4if4xV1
	 wpiszhZuihW+JxoPLtcFarfp87jtsU/164769C2xCn0JKq2vnm0I4kXUxw+NnITV2R
	 AuRpb2dmD6/hA==
Message-ID: <e30a76e7-3bb7-5e19-2bc1-ab8a0c67d73e@collabora.com>
Date: Tue, 29 Nov 2022 09:29:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 3/7] dt-bindings: pinctrl: mediatek,mt65xx: Deprecate
 pins-are-numbered
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 krzysztof.kozlowski@linaro.org, matthias.bgg@gmail.com,
 khilman@baylibre.com, linux-gpio@vger.kernel.org, linus.walleij@linaro.org
References: <20221129023401.278780-1-bero@baylibre.com>
 <20221129023401.278780-4-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221129023401.278780-4-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_003004_613404_5C5EC49E 
X-CRM114-Status: UNSURE (   7.25  )
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

Il 29/11/22 03:33, Bernhard Rosenkränzer ha scritto:
> Make pins-are-numbered optional and deprecate it
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



