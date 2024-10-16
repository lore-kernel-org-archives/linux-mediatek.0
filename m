Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AE3D1AD43
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 10:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ih3ly1FQg1lIrqrp8kMx0CPxL9jTZmbg1cIqz0aDosU=; b=NwqfdjcMdv48ycXyFh8OHWFnym
	6YbjNYE3bCQh3BlxcKZmXsrhlJmBlfzY2qCUrhHpB3eTCk43S69+YfuN633rj5TCnWxIZ8HleXUQN
	rDYdggEZnsiBBhIPLEddbyA0xhuwxAtJy17kaJlniSsDm/8+OUbVjMOniyUy3eB+8Oc7nEyX7/4k6
	G4GhFMIkqAL2i9087uEPJs6EA/BfsYPHtflrZqiGYSNDe2TVRra9WgOuZFi2v72Ajz35XoJ4S9Xlz
	L972FZdvtIiAjPdI6z5mcnAsSNwMeX7I1kN0Cqe+nd10572wmuRwSdn0nCG2LYH9m1hF7/YOoRfgY
	4hEtFuiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t11SF-0000000BUH2-0RkA;
	Wed, 16 Oct 2024 10:40:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t11EJ-0000000BQzJ-1SxO;
	Wed, 16 Oct 2024 10:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729074369;
	bh=UH6An7zktsxQ7GL3P6sIPgkfAT+XZCHpUixfpH1byNE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DCiZLUuqPZZCn21ZLZ3BXmll/WogG9s/QHGn1ZD0+5xiBeF/rCTvsBSAX86VW97+Y
	 +KkpVd2Etfmx8PxYt7IHMNzOOmg4pL16vLAVP2N6FRQKHBGavQzNG+MZWkhGGEA2at
	 BXENq2qegMMaD2ALl+rUxpD7cTqosJHXOev+L4YwMnPrtIZUgHbGJOEUC0JMl4WHsA
	 3n/3cEewZ9BSotSyKClL1Ol6PViVLIr9MSQIhmkCmL5AkVYUiSruKme59U++CYJRTe
	 eP4uKovDnM1wwqQOtk+a4ybnvtXFe+YhLO06NtLgUylg/N2V7JK360ZtWECPMGiZ3h
	 zszXmAWSxxtqQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C734417E1003;
	Wed, 16 Oct 2024 12:26:08 +0200 (CEST)
Message-ID: <3dfc6d8c-a816-4ae1-b3e7-d948734960be@collabora.com>
Date: Wed, 16 Oct 2024 12:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] dt-bindings: mfd: Add support for Airoha EN7581
 GPIO System Controller
To: Lorenzo Bianconi <lorenzo@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com,
 linux-pwm@vger.kernel.org
References: <20241016-en7581-pinctrl-v7-0-4ff611f263a7@kernel.org>
 <20241016-en7581-pinctrl-v7-4-4ff611f263a7@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241016-en7581-pinctrl-v7-4-4ff611f263a7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_032612_071984_62EB8970 
X-CRM114-Status: UNSURE (   7.91  )
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

Il 16/10/24 12:07, Lorenzo Bianconi ha scritto:
> From: Christian Marangi <ansuelsmth@gmail.com>
> 
> Add support for Airoha EN7581 GPIO System Controller which provide a
> register map for controlling the GPIO, pinctrl and PWM of the SoC via
> dedicated pinctrl and pwm child nodes.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



