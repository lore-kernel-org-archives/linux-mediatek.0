Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA491C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 09:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wWJl4rDiuH5JLzrxXhcY0GDYlDFiTU7+WZXFl8o3AY=; b=ZeRwmxSwN0VZgSTnpOLrRg5Rd7
	LnEYDXTEyScbkSBAH6zWnk9DU1kpEYLQ0J7rvLjTevBa7C14A6wR5Z7IZ/RKcYOYc7J5f3YuKOl0a
	oNEQsjGT9zy0ICbrBi/WoqoduLa4pIeae7A94b/oPna9Fp7s/jAFQgw9LUzQd5G5jDnX1dZWTVy3X
	ssM9xu3lp0Y8go8Fi1Yvgh5g+szCd6y0pGEbiNWfiCLy0hl/jOzcKqO5KTF88qp5F9jTfIFcMLySC
	SOus45xdbUHsiLcga8orDeRz7D1gmQA3h6LovGHBhLlPIXOtqdeuFLCVIkVhRSu9W47alTgsActoT
	qLDEF9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzUl-003xwa-12;
	Wed, 05 Apr 2023 09:31:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzUh-003xuM-29;
	Wed, 05 Apr 2023 09:31:56 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5020066031AD;
	Wed,  5 Apr 2023 10:31:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680687112;
	bh=1v+Dt06wXLxLkRrvZe75hH+NO5Dfwp4+k7N71NcKmR4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L2yMdEwEpr0yHWlEWI2mRKIzoq8oGMxnatgpO1bp2lTCfWlwH02Zx0ltFfzBhgVrP
	 If+ZyiDsKfqjiNZPnlapF9XHexqIAt4Nc6EEztMHYTRlb3M4uUzdcka8Kl6QBnm1p1
	 rvGPgAHuzFBT4vXLzFlt19vx+oigj9E+mwM1hpk2knIKtt4RC+9c3IAlNV7EGaQ/3D
	 JEndJ8Jrw+TXpCnNzzxNL10U2I4OrpVNzkk3GH6FIavv2Upw7A7zSTXok0eBIqQlFJ
	 5bPrd2FGN2nbqrzHmFlPeRHWbngoa4yXgttD4bp6FfVyHyzfPw8WPeMcJ0OoTnT05o
	 dpnbWvSvOJpzw==
Message-ID: <ee893222-38b9-899a-58c2-71e16fbb963f@collabora.com>
Date: Wed, 5 Apr 2023 11:31:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 2/3] dt-bindings: pinctrl: mediatek: deprecate custom
 bias pull properties for mt8365
Content-Language: en-US
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
 <20230327-cleanup-pinctrl-binding-v3-2-6f56d5c7a8de@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230327-cleanup-pinctrl-binding-v3-2-6f56d5c7a8de@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_023155_833142_D5FA1690 
X-CRM114-Status: UNSURE (   8.40  )
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
> In order to be more generic, "mediatek,pull-up-adv" and
> "mediatek,pull-down-adv" should be deprecated. Use "bias-pull-up" and
> "bias-pull-down" instead.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



