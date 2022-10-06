Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC68C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 09:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nitjj1rbHKLkeGNCYmiYAz3HA6+g3skHZ39OXreF0vE=; b=ad873yM1lVGFxp9VQ5uZjc7YT9
	tO8jZd92zL2/fPcEds+SgVgm8B8lpZ+yhENcl9b4hU8zRujd/4lWWuBdulOW8O48oiwhFwXBrCdD5
	dy86jRgr34vuQ1FXhWImw0Ng6/ZjRReyPLLzUg3DjfaItt7xnlv+6kJYolEpDfL7xHHSbC1MaPuXJ
	JepyI6NbWSWz0fN8A7+tNJbatSEzGFc7thMVD18iCS3Jvf9Ic0Tnn71Y+Cf9ASf9N6smFG25mul4X
	erGx71mbr7qL5aiGtf2ak1jkhObq7ror+iDNQDXleIgQc01DPVPXlKsSK0ZIg7EIPwgeTcvMk1xTy
	r/Kb83bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMlF-000usE-Fd; Thu, 06 Oct 2022 09:01:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMl3-000ume-R5; Thu, 06 Oct 2022 09:01:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C057C66022F7;
	Thu,  6 Oct 2022 10:01:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665046892;
	bh=i/0O2Tekm5frb37+MxpZ8Gl9JZEhrRma2Kk+CGxptVo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dmlcwi/r8AkCp6UYoeDpwl/7824D2HjeMqCz6rg3o346OQvzo75Lb/zQ2P+vDI3xV
	 sc6RX02eX6aEIBUTptcCW+SLbS0WQNUL7X0W7SnyzLoEXGfnRvkbyDkUEzGjS7d+bo
	 TSJhrHHcCrlxrZPLN1bpH/tE2chkpYRY7DRfCtxKGmqrfoL2XNQoXkoLxwSlE6splg
	 ZlZ4NwpA5GRgLBfdaOtWBTXgeBKZzpC1SK8yz87b/0X7vN8weGPwT4yqv0K8US8uZN
	 uiXxUb+OELJcQ63EAAM+EiGhn8Sro2PpsZrtSQ+QAFX/eG++qngsxGnU+y4liBPh0X
	 OgHyqXz1lFUuQ==
Message-ID: <17e4cfb0-e423-9cf8-8af1-588aed4481a5@collabora.com>
Date: Thu, 6 Oct 2022 11:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 05/10] dt-bindings: pinctrl: mediatek,pinctrl-mt6795:
 Fix interrupt count
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
 <20221005174343.24240-6-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221005174343.24240-6-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_020134_036801_EE184F56 
X-CRM114-Status: GOOD (  15.88  )
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

Il 05/10/22 19:43, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The document currently states a maximum of 1 interrupt, but the DT
> has 2 specified causing a dtbs_check error. Change the limit to 2
> to pass the check and add a minimum limit.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   .../devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml   | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
> index 73ae6e11410b..483fcdc60487 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
> @@ -47,7 +47,8 @@ properties:
>   
>     interrupts:
>       description: The interrupt outputs to sysirq.
> -    maxItems: 1
> +    minItems: 2
> +    maxItems: 2
>   
>   # PIN CONFIGURATION NODES
>   patternProperties:

Nice catch.
The right thing to do is...

   interrupts:
     description: The interrupt outputs to sysirq.
     minItems: 1
       - description: EINT interrupt
       - description: EINT event_b interrupt

Cheers,
Angelo

