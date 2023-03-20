Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48142C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 14:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sm7sDo3fvv6TiANlsZ3AMY8ikNDop64YSgc2GKdn3uU=; b=gLm9Qn8iE8Ge/A
	xVFEoqpx7NAk/6bgfVQ8AInNxY6ZVma4tuI3/LfFQYLuKdLLxgFavF5eJi03TK9zulzVHpfJIuAkA
	pDpPP7tRmfr0W7AIgVR2sdQSUkQHv+3HqeOzLtlDYhgCpTSW/tMZymgtynZIFbwI+GuTwSenF3EN8
	e9cxPdeJgPqDh63P6FBkwm+xHjrSYekLtfmo4PjnqQ+F5eSsNOdiKUeYwdW28+g12tYWc6rYgpH97
	0cM+vAIbiVIaSo6UVcmGneUhH1eGnqi1OG2Nu2KuwZmDectcDvIWewKj60L6aA+aefhlMzBh054v5
	PD1IieQ/vWr5cL8GDKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peGuZ-009PF8-06;
	Mon, 20 Mar 2023 14:54:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peGuH-009P1j-0M;
	Mon, 20 Mar 2023 14:54:42 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 88593660212C;
	Mon, 20 Mar 2023 14:54:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679324079;
	bh=T0zttm2ymvshm+c65OvefIeKvDHRU8JD2RFWN/mrI38=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DiN+KEDK0IaF5nJAS1zhNkxvBaZ3O2DyHNeTh2L9V9o5pB+HJ4lheSTVkb4XIDhe2
	 FoW0MyaUjx0DVxIWPoE0d+81/dARRMl3mZgEqR08mz7cvMnH0EQCacFCq5tsmgqe4r
	 McuWCiIEMtjIyecWcW2txgDWZ70PX5QJrmJTVcWqzPL8QmoKZfWE49b1lVTot9N5A6
	 fJT9HVABHOh1Fhym2D9q6iMfaCW/vqJpuAYCJWuX6VDAF43kcPp8JM4CIorvqgYmD0
	 zufsrOnc9KwgcxjbcRHbm/RaTtAOAIKFg55HDRnYKsSFvM/v9Izt67wcolma0ves0Z
	 GqrluiJT4CvTw==
Message-ID: <f768f6df-8e8d-4b2c-21ba-42781edda5b4@collabora.com>
Date: Mon, 20 Mar 2023 15:54:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 17/21] dt-bindings: pinctrl: mediatek: drop quotes from
 referred schemas
Content-Language: en-US
To: arinc9.unal@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
 <20230317213011.13656-18-arinc.unal@arinc9.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230317213011.13656-18-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_075441_284321_2856FBBE 
X-CRM114-Status: UNSURE (   8.20  )
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
> Drop the quotes from the referred schemas.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



