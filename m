Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CFDC761AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 13:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ftdxb9SWWdFGwROmtzuCJ4q2v5BwP+BWqDWWDIpUyK8=; b=4pzNUbHS6WO2nLQGyHzcs1wR8i
	lhM3PjcD2M2wnuJJuV+khcFEAtUmN3rvAqOPocnmPPsOmB/HkUh1JAxkkwa0/mfzLDbc7bcxBbDKn
	hHcTkmT1R+PSHVqyv5L7IFNNW09Rpxd4QKbX+tHv+YL7o4tJV9MsCTIWxZ32rukdp/7VdZDOaRjWc
	yEU+DIHl4r8hgxH1E3P8t0iDkEy8sRvQM/u1OQUax+NVR+RKUj3ac9pRny5nOF2nZS3q+qkE7fQx8
	pDU5aQ3UiHPyEq4TPUPk1r2YTU6Bji/RuLoEbGHPSnDK2jQE4mXW+brRratOmwT3ArkEDEqQAJ6oA
	VmDVZvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph9aJ-00EdfH-1L;
	Tue, 28 Mar 2023 13:41:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph9aF-00Edd2-1S;
	Tue, 28 Mar 2023 13:41:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3D5286603152;
	Tue, 28 Mar 2023 14:41:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680010911;
	bh=mdZaeHtWUcUws+H6KHaUGd/J+/ss4cO3a1++cudlA0E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LZG/eBD8utsG50ZHCgvDv2s5UltJ6GMYEzujJ260sZbFSgxCRB/ndUNYo8UTgpOOL
	 5Cc4T7oYgSQBhbd/KU+xGIwgwNj+ikhxH1KEL/jyD5KGCnGwEjxK/dL/gkCM1YcCiu
	 z0/ido9OaQyUi2aogP5cMgAurotCLPcr4+ay34Pen7CFJViiovacmbEuNv74jRn7Zs
	 OX2nx2h9AG/TjxUkH/3fPUP5eZZ/+lS71Uvmw8cG7Qiyc1TxhAbGXarYODvSfaG8vK
	 /NemcTJ5C6JSYBnZuN76G1gsJd7dWSklXXKPbk5+rRkfI6kLgYDUolu+Xanq10LbL3
	 KizIBlytgiuNg==
Message-ID: <334089fd-f0e8-bf63-5100-d8632c478ccc@collabora.com>
Date: Tue, 28 Mar 2023 15:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mediatek: deprecate custom
 drive strength property
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230327-cleanup-pinctrl-binding-v1-0-b695e32e4f2e@baylibre.com>
 <20230327-cleanup-pinctrl-binding-v1-1-b695e32e4f2e@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230327-cleanup-pinctrl-binding-v1-1-b695e32e4f2e@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_064155_621782_EBA234CC 
X-CRM114-Status: GOOD (  17.53  )
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

Il 28/03/23 15:06, Alexandre Mergnat ha scritto:
> Deprecate mediatek,drive-strength-adv which shall not exist, that was an
> unnecessary property that leaked upstream from downstream kernels and
> there's no reason to use it.
> 
> The generic property drive-strength-microamp should be used instead.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   .../devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml      | 8 ++++++--
>   .../devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml      | 6 +++++-
>   2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
> index c30cd0d010dd..b82a066b91ec 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml

Thanks for doing MT8183!!!

> @@ -110,8 +110,13 @@ patternProperties:
>             drive-strength:

..snip..

> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> index 4b96884a1afc..347f533776ba 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> @@ -91,8 +91,13 @@ patternProperties:
>   
>             input-schmitt-disable: true
>   
> +          drive-strength-microamp:
> +            enum: [125, 250, 500, 1000]
> +
>             mediatek,drive-strength-adv:
> +            deprecated: true

In the case of MT8365, since there's *no* devicetree using this property, *at all*,
I think you can even just entirely remove this block, as that should not be
considered an ABI breakage in that case.

Krzysztof, can you please confirm?

Cheers!
Angelo

