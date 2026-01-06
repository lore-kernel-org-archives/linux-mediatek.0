Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AB8CEFCE6
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jan 2026 18:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5uMBPgWqQKYiPZcHvKgmfyzuuv8hWaEwurLE79aR40=; b=XDi6ah/T/Dk2PR08dldSHuZw12
	+hU9PIIa47gGLYgxE9uu7DkzqEszHUWoYJ83tSpWsJ7EjrxcueBXto/fpQ7ACPxw5qnroo+9FYafc
	rEGNZsdo9aD6hVLxWnoW5gepPHzcDTFCVwf8RQJu2P7wa0/L3r5j2B9NfMEC/24hPiDyG4wYAQWQ7
	bBMkIMNSHubFo41E5bOi+hoVyNrE4RS51d0UDgkanHHO69WThr/S6//0KF9U3POOEpAPT3XtMmAHY
	EULw6qdS8/c8xUdTqEw0JLnPp7iuVRJfuIOVoE9CATHQvRmhn+vXZvHitYx7aJ+aKcWR6z6eOPYlm
	FdZSHH2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBtF-0000000Dgqf-0XrO;
	Tue, 06 Jan 2026 18:34:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBtD-0000000Dgps-1u3q;
	Tue, 06 Jan 2026 18:34:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DCCE6013D;
	Tue,  6 Jan 2026 18:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152C5C19423;
	Tue,  6 Jan 2026 18:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767724482;
	bh=H2v0nUt8N0vGGdbmlYiAAvAo4Pe4F33fRgeEAFY94/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tvWl1oMzdgHT/lp0TV4rEcJ8KSAX5uz4aKUNJUZM/9Fw2AhxQvWxlDCsW9dkPhYuG
	 kGtfrzLYii0Dcs1IFsDE/r35PWpspaWSHEmpmKHAfQJqfDhPXGzXN+AcQX8FhIqlLr
	 S2GlvwkqAR3eWJn5OSXGBcUlSVjtK1ySUFYR4Kgo65YrR5qEKgsHgrkkR2f7wo7gAc
	 NZkIgfrl/22DVK+m33EFyTZD7ElvUBBegC0B1jErirr8Pd+5OcPFoF8AW/bmY+Xn3F
	 +Cdh7YwsMaezrL2EGPygsauQDaw4lqwaPo/WVcRONNnDOBN1dCWVBK8U4GCSoWgqiD
	 dMz6zwvCP1HZA==
Date: Tue, 6 Jan 2026 12:34:41 -0600
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: airoha: npu: Add BA
 memory region
Message-ID: <20260106183441.GA2514063-robh@kernel.org>
References: <20260105-airoha-ba-memory-region-v1-0-5b07a737c7a7@kernel.org>
 <20260105-airoha-ba-memory-region-v1-1-5b07a737c7a7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-airoha-ba-memory-region-v1-1-5b07a737c7a7@kernel.org>
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

On Mon, Jan 05, 2026 at 10:02:56AM +0100, Lorenzo Bianconi wrote:
> Introduce Block Ack memory region used by NPU MT7996 (Eagle) offloading.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> index 59c57f58116b568092446e6cfb7b6bd3f4f47b82..b3a2b36f6a121f90acf88a07b0f1733fa6da08a8 100644
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> @@ -50,6 +50,12 @@ properties:
>            - description: NPU wlan offload RX buffers region
>            - description: NPU wlan offload TX buffers region
>            - description: NPU wlan offload TX packet identifiers region
> +      - items:
> +          - description: NPU firmware binary region
> +          - description: NPU wlan offload RX buffers region
> +          - description: NPU wlan offload TX buffers region
> +          - description: NPU wlan offload TX packet identifiers region
> +          - description: NPU wlan Block Ack buffers region

This oneOf can be simplified to just this last entry plus 'minItems: 1'. 
Sure that allows 2 or 3 entries, but nothing defines when 1, 4, or 5 
entries is valid or not.

>  
>    memory-region-names:
>      items:
> @@ -57,6 +63,7 @@ properties:
>        - const: pkt
>        - const: tx-pkt
>        - const: tx-bufid
> +      - const: ba
>  
>  required:
>    - compatible
> @@ -93,7 +100,7 @@ examples:
>                       <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
>          memory-region = <&npu_firmware>, <&npu_pkt>, <&npu_txpkt>,
> -                        <&npu_txbufid>;
> -        memory-region-names = "firmware", "pkt", "tx-pkt", "tx-bufid";
> +                        <&npu_txbufid>, <&npu_ba>;
> +        memory-region-names = "firmware", "pkt", "tx-pkt", "tx-bufid", "ba";
>        };
>      };
> 
> -- 
> 2.52.0
> 

