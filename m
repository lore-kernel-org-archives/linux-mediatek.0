Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6E8CAC5A7
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 08:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pJczWKPYx48PqC1/2gWgesawuE/PCSWC3IvHh49AdM=; b=mid4PtFcYWhJxKbOm04eXVzqot
	S/EftiaGmIMb14lu9KukOlcDW8CshpDPE9tRekfVo2cHlgpG8ZkxueU2aPyiSnXWLNYFR/S48vY1/
	seduVX+5iPAuCzoIO4Ts5qVtPxyDpNnkExEI7F6rroPbARIjHFSzYC5qHdO7L9+x+vQw9dklooTxV
	PWZMTXXFkAzw9AYJZY/SKFP54zvPmKNCwAokZ7mV6SBW0Nj2+vrcIf4RkEC3YaF4Csj7IA2m8K1Bb
	X8XI0kQoORm+ovfTzCyHkydXLs+49FifUuAsTkxZQzZzBB/HCf1EALTWXpVU/ldbzNpdhB9PEEA69
	McZ17foA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1KzH-0000000Fu8b-10XG;
	Wed, 24 Sep 2025 08:36:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1KzD-0000000Fu76-2vTv;
	Wed, 24 Sep 2025 08:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758702985;
	bh=y2emJ3dCkKOLxXAImQ9Iunq9nqId75ZvptZuFpfKlP8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=dIkiCsN69Gm3Y/Um2he7IcoInbgW3QKztEMubZde4HWmm7utmioP5m/xdywfOcUGh
	 5iAdf8YHvgMw79jfB31uUbH4Nq7qSd8+xLLvaZro1Df1l/FA+zdlUbFz/WoEzstHKq
	 QZKTQkJy+FWNR0A1AlWET2e7JuOy+KxpH0nmR+vougchQ9tthRqSqwurhmpCpb2W6T
	 iNXp01B9k0cZ+g/DlxScCYqYSPUzDMc3kZO5kpmCbM87BFLZO7ofrIqYehWe5oHVyv
	 r9tINJhRLh7J8hGhh3Mm+tKy3phxIWnQqsZ2rcDXWz1/qTmUDts19e0cNIunvgb107
	 p8lHC524+Od8A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E85017E0C21;
	Wed, 24 Sep 2025 10:36:25 +0200 (CEST)
Message-ID: <5613a7f0-c624-46ca-9c65-1b48b4e3e3bd@collabora.com>
Date: Wed, 24 Sep 2025 10:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: PCI: mediatek-gen3: Add support for
 Airoha AN7583
To: Christian Marangi <ansuelsmth@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, upstream@airoha.com
References: <20250923190711.23304-1-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250923190711.23304-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_013627_893053_B3368595 
X-CRM114-Status: GOOD (  13.78  )
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

Il 23/09/25 21:06, Christian Marangi ha scritto:
> Introduce Airoha AN7583 SoC compatible in mediatek-gen3 PCIe controller
> binding.
> 
> This differ from the Airoha EN7581 SoC by the fact that only one Gen3
> PCIe controller is present on the SoC.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
> Changes v2:
> - Fix alphabetical order
> 
>   .../bindings/pci/mediatek-pcie-gen3.yaml      | 21 +++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 0278845701ce..1ca9594a9739 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -58,6 +58,7 @@ properties:
>             - const: mediatek,mt8196-pcie
>         - const: mediatek,mt8192-pcie
>         - const: mediatek,mt8196-pcie
> +      - const: airoha,an7583-pcie-gen3

In the previous review, I also asked you to change the compatible string to be
consistent with the others.

airoha,an7583-pcie

Regards,
Angelo

>         - const: airoha,en7581-pcie
>   

