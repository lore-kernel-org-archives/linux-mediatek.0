Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF61C44501
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 10:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCTx17wOXoSbh93d1nOySUjX5aqWVloXjDFkDCfXZQQ=; b=DBIcpGgkam9klHcrXjZLJtIMHU
	NYkUPnMUcboPq6vF2AtVVWJ9bL4xcP6CBpz7TrUt2natsWrN/n0SnyUSDUataeUEeBeI6vRsNYrS9
	ja8Owj5KYx+xs1FgB64D8SkCCY0y3gHc9xMM5cecinlmksTtckGRCARoEy/S77+tCn2AnIQ8tSll0
	7Qz7Vex65i0H6IRazxCZxJz//md3MhXO4CDzD4dCWKB+JcSOiApSgNDtc9/ITfWcmEgsi+TBuxS8S
	Ymz1u3TI0oWPsvq8pUrJQRc8UxFwgMRZ+ngFUmbFCsfZIL7aFgoZ0QZ0XO/8AT2aFjmS+OboDeNSz
	LrwVN0NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwjl-0000000EQgw-0ZP0;
	Wed, 15 Jul 2026 10:21:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwjc-0000000EQcI-3hDA;
	Wed, 15 Jul 2026 10:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784110858;
	bh=3FwLa5zsloA6Hhg4Nl9W7+NaqnQkEcA6Piv/oWChUT8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K3bpOxnxiKgkkCAT4J7iPHccJYDPBV6/9YZo2rzUbBxutVbg35tXvA4J+tjmfnk9e
	 rtUYlBAh6HxombKRnoeSMWvjnuYJxJvM/2X5J6KSlI8ojgjLfAMNqAL1Msr8ifGEiD
	 qKYegtq79xHXz42qT0LwBuE6WyEnPOS0Ciy7VeOTOJzds8G7ODXTLQ3LA9kgJny+Py
	 UZxigipC83j+hMPNLo2YVHXdQrpcM5HJXevez6Oz8D5wC6HPlJa6ODJqmuFkQ4oFOz
	 B8LP/tK42uS6aMXaBexFPztiT0UDEhQ2NJXpcmzO2VyE5IaZtpKO1snQwmIWa7PEk2
	 3zCwhaZInVvEg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9ADF117E019E;
	Wed, 15 Jul 2026 12:20:57 +0200 (CEST)
Message-ID: <e882211e-0bcc-4dc4-8168-9eee30444ca9@collabora.com>
Date: Wed, 15 Jul 2026 12:20:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: soc: mediatek: pwrap: add mt6572
To: rva333@protonmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com>
 <20260714-6572-pwrap-v1-1-d8e5a39cf7ef@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260714-6572-pwrap-v1-1-d8e5a39cf7ef@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_032101_082251_4FEA0487 
X-CRM114-Status: GOOD (  12.63  )
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

On 7/14/26 14:42, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a compatible string for the mt6572 SoC.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> index e7c4a3984c60..a3cf11153fba 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> @@ -31,6 +31,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt2701-pwrap
> +              - mediatek,mt6572-pwrap
>                 - mediatek,mt6765-pwrap
>                 - mediatek,mt6779-pwrap
>                 - mediatek,mt6795-pwrap
> 


-- 
AngeloGioacchino Del Regno
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

