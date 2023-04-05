Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C5EC76188
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 09:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hR3aVUwJLtIaL41am4A9dSlcXuyoHb7snbfT6M/iQE0=; b=Vgk6iMjaLHSUkefsKTFBYnLH3x
	5RdHqLikKYXPk5aDcNK4UHLhjQeCDAOqf1El6ew8pbGED6FJeQTLlqnAyruCYe8NWBht6f6xAwzNc
	ZO0BunP8NWbtJtIBYdQvHY8VnX8pRgt3IiPipVZvt6b+IEdnSBVjVbxmrqEroHFyy93a63ezks60j
	Qifa3nNyyCKvFmI93DG+1tpMIKrcPWDvSPScKSsMkWZkrkfzn15+feCZPqiM3BUTeZL957eLNeOwJ
	FwWl/3RX5MYG/WUbPzzE6Z+/XPnggrs+dx6k8i6xIENDwthVryGU1XxR5E64Bl7iFlCDprVl6jC3N
	IcM1C4TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzUd-003xu1-2F;
	Wed, 05 Apr 2023 09:31:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzUZ-003xsF-1s;
	Wed, 05 Apr 2023 09:31:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E64EC66031AA;
	Wed,  5 Apr 2023 10:31:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680687103;
	bh=IjuIU51gMW8XlICzxXyr4QkGEAFe1hN1h63Bv5o1B0c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KHey3j7LPMg8VocJKU9Q1MyxKI/W6U2D7gUC0OE8uJxqRFErk2f+iB3oz39dEqsyo
	 xDGR+tTHrdWXOD61d6G/HjZC4nl+gi3WcjmVqU8bGUD1SBhTtT6QJpWjWQixesVBkZ
	 JR6N9x5NZE3ST+cPKwuZXUxYIxlLw6zOMAFvIMcy2vR+470DZgYJsou+aiNMuVQhRV
	 HLGzORmIh9+FOf3PlD4t1y8Q2LQoQtNlqSl1HDkb60FuwVYV/USuqlpf8eglQd/rEB
	 c7fMluUSrFZW5iDHVbfJhYOVVc13M1/Xs0t0sdSr+61BKGthWRub6uF3dlZ2ewITPx
	 zxZSlZ1gcZhZg==
Message-ID: <a244d54e-c5b7-2305-3662-ad434ec50856@collabora.com>
Date: Wed, 5 Apr 2023 11:31:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: mediatek: deprecate custom
 drive strength property
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230327-cleanup-pinctrl-binding-v3-0-6f56d5c7a8de@baylibre.com>
 <20230327-cleanup-pinctrl-binding-v3-1-6f56d5c7a8de@baylibre.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230327-cleanup-pinctrl-binding-v3-1-6f56d5c7a8de@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_023147_829560_02D24C33 
X-CRM114-Status: UNSURE (   9.29  )
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

Il 04/04/23 18:29, Alexandre Mergnat ha scritto:
> Deprecate mediatek,drive-strength-adv which shall not exist, that was an
> unnecessary property that leaked upstream from downstream kernels and
> there's no reason to use it.
> 
> The generic property drive-strength-microamp should be used instead.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



