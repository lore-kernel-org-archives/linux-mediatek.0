Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CEEC48260
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 09:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ra8WD5K0VnvhN8xSfSomMxJuokDvv4rOWUUdvEyX8/M=; b=oFHkE3zZQnI6d0DFE/1VP1wNJh
	8dWJrRECd2x040YTU1b89YzK3uVQ6hJGxPMnj6aMLoUWoHmRci7J3kkThxLx5bPotNmpGFjoeDMd7
	BOJN7qHSSDh0hE2xs1WegUzLGomFGlCryGIHxmYgz61AIt+3zUKqMO0q+AyGXWH/lbeZU/gWLciBf
	3nDPzQs0++yNQxGBvef8NFohfNfcKM+U2/zRmyZ69XQayva9EGsnYsW08j6X35tcjyScr89yZG3wT
	m7Mt1XNXXWWQtjHAo0/00qT2lCdbx6Z5bWDnnsCh5NeVtHmRPnZz5gGdJ+HVqX7lOp2hT9zcxvPR+
	WYXFIwxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzsR-00000009nkF-2ktt;
	Mon, 19 Feb 2024 09:23:55 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzsO-00000009nig-2ncX;
	Mon, 19 Feb 2024 09:23:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708334631;
	bh=UNsW7w0/prR9kEhx1s+cnIpM0a+lTKIVqrn9LfPCP0k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IipeBgPi2Q3alaj6bk4wzwdIqZ1Hiq+F9wD9hfBZkeNBxaZFLlI4qoNZDdWRpu78O
	 oqSRPWF/IiymNW8hkstukElxe+zdWXeJEI9ChW2DSJXgollH2k661a3Em7iD052EIb
	 poytKQ+o9Bn3ap8yXP8/d+VVJose5jutlvmDYhxPZfQuhSxKVxsmDnD8flSIj524xI
	 xIRBame5zjen3wMdosL36LZzZ2ALIy7izGU44BxFd8q4v1o9FFRzsKw4gopcc+rWrh
	 pbo+QauykbEB9ODMDpCcVo7PmiVY7R2gCUjOFmp9YnFK23owWbntq7G7C/IDdLMr9B
	 UWO9BgSwxbASQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5A7EB3781123;
	Mon, 19 Feb 2024 09:23:50 +0000 (UTC)
Message-ID: <ed3530f0-227a-47f2-938c-28eba90dd6eb@collabora.com>
Date: Mon, 19 Feb 2024 10:23:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: mediatek: add Kontron
 3.5"-SBC-i1200
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240219084456.1075445-1-mwalle@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240219084456.1075445-1-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_012352_878576_4C6BA302 
X-CRM114-Status: GOOD (  15.15  )
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

Il 19/02/24 09:44, Michael Walle ha scritto:
> Add the compatible string for the Kontron 3.5"-SBC-i1200 single board
> computer.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
> v2:
>   - convert enum to const as there is only one specific board
> 
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 09f9ffd3ff7b..add167d8b8da 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -357,6 +357,11 @@ properties:
>                 - radxa,nio-12l
>             - const: mediatek,mt8395
>             - const: mediatek,mt8195
> +      - description: Kontron 3.5"-SBC-i1200
> +        items:
> +          - const: kontron,3-5-sbc-i1200
> +          - const: mediatek,mt8395
> +          - const: mediatek,mt8195
>         - items:
>             - enum:
>                 - mediatek,mt8516-pumpkin

I understand that you took inspiration from the Google Chromebooks entries, but
those are separated only because they've got "a bunch of revisions".

For machines that don't have a billion compatible strings, I would suggest to
add the compatible under a single big entry: like this, the binding is (imo) a
bit more readable .. and cleaner.

Eventually, the machine name is in the devicetree so we're not losing any kind
of information anyway... :-)

       - items:
           - enum:
               - kontron,3-5-sbc-i1200
               - mediatek,mt8395-evk
               - radxa,nio-12l
           - const: mediatek,mt8395
           - const: mediatek,mt8195

Cheers,
Angelo

