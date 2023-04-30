Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47C6C77B60
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Apr 2023 12:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyF1LRlQ1oKiECojoeRp0HPAq+oTkJBBxCJK5o53pd4=; b=dZgZQ3x2Iv9ECSfhIx1kdpfbt6
	99MPTUB3Vu4yOt7EzgBOCwYu+rVCg2ajTFSiek3EA7eycudeuL247doXv3W5a+sSHl5zVulremfku
	E4yn6tGSK3O9MjwwzgJRDYVPhU8hle30nw4716BgD83dGT+SynsXRvGQ3j4BAKnb6pdrtJLVSfFzM
	1qAont2rK09wJ0uTSWYYGeEN6dP3rzd600voatrn1ap7yJWihkDhMh4B5vvfXsr5zvEJ0Skst6HgL
	ZbAdnMa4p7Jd3skz5jLAAooPnKKJAnhNwXm9oNf0nNifNbUsNYfKcB8mPQDp/mas4ExrIwTnfpMzy
	i8RNF7pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pt6Ye-00EBXG-1i;
	Sun, 30 Apr 2023 12:53:40 +0000
Received: from sender3-op-o18.zoho.com ([136.143.184.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pt6Yb-00EBWI-0T;
	Sun, 30 Apr 2023 12:53:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1682859201; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bBcQznq2fDpSERjj4ibrDKZPTQ07v29w5NADsTnqHyhEIZM6OsNShf0uzL+foGc9Ex4N3srsx9uRMsR/BN5UXvYRFtevJH/jUYHfuJZ9d1PwdNOg2kO3SglJ1ZwnTi4+VucFooDtGz7uN4dprLMx7tSVwXZvtzj6TU3k56Vu1sQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1682859201; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=PyF1LRlQ1oKiECojoeRp0HPAq+oTkJBBxCJK5o53pd4=; 
	b=bru/DKsg6Qag0VMMmka691X37uAtZll7z5lujzQ3PXnuYmrsMamL1IsP5RSdZintKbdhsPbm8hly/hXyF1eWiv4DjXr+3LoXR8GtAFjHK7uRI6WpT0EQMr0jpRgfT8dSp9hLtfhmw6nkyHMfV2KTFQlqM+hV1yRA8EqPqjHMnYA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1682859201;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PyF1LRlQ1oKiECojoeRp0HPAq+oTkJBBxCJK5o53pd4=;
	b=kFzx6YZhHIE9pXmCb+9hCVIzeQmjibm+BW+4d3vErFN9r4e+NniM29dBWAorKU94
	+w/QSsBTKiVkAJkzT/0myFOXBbcFWTusTeWdckYssTliHTMbU3k4MyzYOByutEhRo8w
	EKw2TK4TbJ/e67ox/GboR4SzDC7MVSJLQSGXJUm4=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1682859200456253.51681302133647; Sun, 30 Apr 2023 05:53:20 -0700 (PDT)
Message-ID: <fd6651a8-64e4-4f22-349f-b7f796ecffcc@arinc9.com>
Date: Sun, 30 Apr 2023 15:53:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] dt-bindings: net: dsa: mediatek,mt7530: document
 MDIO-bus
Content-Language: en-US
To: David Bauer <mail@david-bauer.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230430112834.11520-1-mail@david-bauer.net>
 <20230430112834.11520-2-mail@david-bauer.net>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230430112834.11520-2-mail@david-bauer.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_055337_233423_4C661C0F 
X-CRM114-Status: GOOD (  15.21  )
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

On 30.04.2023 14:28, David Bauer wrote:
> Document the ability to add nodes for the MDIO bus connecting the
> switch-internal PHYs.
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>
> ---
>   .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index e532c6b795f4..50f8f83cc440 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -128,6 +128,12 @@ properties:
>         See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt for
>         details for the regulator setup on these boards.
>   
> +  mdio:
> +    $ref: /schemas/net/mdio.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Node for the internal MDIO bus connected to the embedded ethernet-PHYs.

Maybe saying "connected to the internal switch PHYs" would better 
explain this.

Arınç

