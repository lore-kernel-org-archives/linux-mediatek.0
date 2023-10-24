Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52577C07545
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 09:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/jCMaxif9mFYboBiQeQm5GiVENhVJu2n8d3vXJCTPQ=; b=2Ld3Hhw9lT8lBFwEbD2btUpe3y
	feTB2fbwdxqwphAtxQHxgkBuPZGo6x2MPkkOb2j1gm2P+61mMerJxd4rRb7Ge/sep04ke2oWhD83I
	clLbbEjHaXWFp26KFZHnq6hM0GQHL7nQnIg9PeOKzmWpEjTmyXRqPs8xnwZrE5M6Wfb3pR3hDXxi0
	1dJSHS3EaNrLNYvJXhjyevrOsS4BVNFBxNXI7B3RAfTleSTaCG6LorKQJQhpzs8dcRHEDgnlF1kCq
	EE4n848todGZZ7/UwywBXmXIxvRZsoRJ0jHaG4zbEBGlfz6eaHxHRI13w0Ks3TUWjZKmOoWKZDHST
	2h+EmseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDWt-009HZX-1U;
	Tue, 24 Oct 2023 09:16:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDWp-009HXy-1r;
	Tue, 24 Oct 2023 09:16:49 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 950EF66072F6;
	Tue, 24 Oct 2023 10:16:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698139004;
	bh=r0vyK6t+hqH4TTC1qIrFumbx19aWI5+c+iBrveLsLsI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L27CSkz4NL1hcSujYkcmuxOWxtewf0FMmpdPgtsFlKACf+LH4JSaWsYAZAB6xF11e
	 wO+d0hN+bI+tTGLYkT/ycX2vOYVIztV6FvTPqiqCqsoVv7+KJckIcopaGTkMTCL2YK
	 WNB8LYod3UYtvXEuayB3fRCHrRigXFzF5y9S1dgqeEunYC1TV38zK893FZy8UePVwX
	 gVa9ltO4XwxzjWf6SthT27ZgBcA2CWKr+yPU0qMMbBxbVESb6RARuDdeltZ4qFXs/r
	 JX+ze8AvL0ltGj+hcXakQeDQOGMeiVr6ycFBnT/e1ArVay/V6py/cxWLg3PxH5CME2
	 BH5aYLuCC3lxw==
Message-ID: <1b1c1c78-4ac0-46bb-9986-00ea1d07b527@collabora.com>
Date: Tue, 24 Oct 2023 11:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] dt-bindings: pwm: add binding for mt8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Xinlei Lee <xinlei.lee@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-12-5c860ed5c33b@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023-display-support-v1-12-5c860ed5c33b@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_021647_743358_AB4A8838 
X-CRM114-Status: GOOD (  14.18  )
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

Il 23/10/23 16:40, Alexandre Mergnat ha scritto:
> Display PWM for MT8365 is compatible with MT8183. Then, add MT8365 binding
> along with MT8183 SoC.

MT8365's Display PWM controller IP is the same as MT8183: blah blah blah :-)
because saying that it is compatible doesn't mean that it is the same...

That's a nitpick anyway, but whatever - you'll still have to send a v2 of
this series, so you have an easy chance to edit the commit description of
this one.

Nitpicks apart...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index efe0cacf55b7..e4069bcbf8d5 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -32,6 +32,7 @@ properties:
>                 - mediatek,mt8188-disp-pwm
>                 - mediatek,mt8192-disp-pwm
>                 - mediatek,mt8195-disp-pwm
> +              - mediatek,mt8365-disp-pwm
>             - const: mediatek,mt8183-disp-pwm
>   
>     reg:
> 



