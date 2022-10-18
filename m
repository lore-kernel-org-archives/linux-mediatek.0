Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CA6C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 09:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYG8GwjviBJsJFB/hec4AiXlFf1n+yo9Hen4fknZ6R4=; b=Lsg0CFaSLteSpC2M4QTwF2YTyz
	vWs6D39NcIiGJpJwIfptXzt4YHvCaTGv0KXww31l9PINqW9nHEZ0vWza9/C8i9oiBDsL6cEc5Hpdo
	Z8Wnn16T4WjBwlkvH/6JVf1QoJpq3P3WlXt9z2OzPUL74ijXqq8odB5+EpBH6aNcUD+RZyKvXYpop
	1+LWcUADPpIraWlytEsVFh9eMOyZgod25Xy4UzeU57NaQvBF0dWKqum/R36zC3p0TjQnVmmsn0h2f
	Dmww7lVdC+6TwkPwCmqVJKmuETMOUEPlsM/tmbL0woT6xnALLFvIdd4YxXRIn6ngqV7am/dHtcvM8
	v1ieCiRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjFP-005Gm5-Aq; Tue, 18 Oct 2022 09:50:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjF8-005GKq-0Y; Tue, 18 Oct 2022 09:50:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BB3EF6602338;
	Tue, 18 Oct 2022 10:50:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666086634;
	bh=17Z7x8NyEJQfidNufMuX1DWKMuBHWGn2t5LFggJCdkE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dfeGQIdBHiAwc4rmubqnJsJHdhDu2IKbM1J5vqwC+7wl0qv99FF+W+K+KS/mDlju6
	 5I82QwuM1i/L5sPMcq96hBfy/rna78EVC2ynb7LQRYVwUli6BlP+biQdf6SFVZ0lWr
	 yijeNysQFjTKKONzBpCaXFzsRn+9fhM68xmKk11s+C8e2hXm9IIIqeTbBVy9yO/1R1
	 /KMaiWZpq0dpgY5P14Rw3yjU8rL9k6akijG75JQn9wGr3QJZEXewuNLcb5x2d/6lGz
	 NjyDL6oADEaqfdo+mFBFnXAxnMFEtG/nyIby05LiXsHpD8nhR0whLh49cIlZ0+UvI/
	 +DMqiOVGI8swg==
Message-ID: <92af9496-b622-9234-d89c-d478b4c77d62@collabora.com>
Date: Tue, 18 Oct 2022 11:50:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 2/2] dt-bingdings: mmc: Mediatek: add ICE clock
Content-Language: en-US
To: Mengqi Zhang <mengqi.zhang@mediatek.com>, chaotian.jing@mediatek.com,
 ulf.hansson@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 wenbin.mei@mediatek.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221017142007.5408-1-mengqi.zhang@mediatek.com>
 <20221017142007.5408-3-mengqi.zhang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221017142007.5408-3-mengqi.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_025038_210449_ED2A90C3 
X-CRM114-Status: UNSURE (   7.75  )
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

Il 17/10/22 16:20, Mengqi Zhang ha scritto:
> Document the binding for crypto clock of the Inline Crypto Engine
> of Mediatek SoCs.
> 
> Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>

Looks good, but please fix the typo in the commit title.

Regards,
Angelo


