Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4BDD31A25
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jan 2026 08:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHosoKuHV6feSjRv1NWqIKDbFPd7ACn7/aQAbtdUfEs=; b=jhXOWM3/2czhiwBuP9KoRJ51fX
	5Su56Sa9zoHsGXJPf9EIEk9ZcB1zGxyGfwjq21vWUxddlaJ+DctFQS9bDd6iLyKNDnhFcXVYh4wXS
	sQBGhzKtQb4+2Y3Z2ocRVPPzTJ3nqCCYrCtrj3BwbrnjGV0hQOixjaqfn7vY+GWDWqrTyQ7Q67cB5
	1UQXt8YqWPDLgw+LNbM8SyigonU0DjpgaEtWG06y2X+3QNQBdQNnLaeI69aNqRXNvTrV8LCEDp6Mj
	oqZQCXzbFK4xufIj6U5aUbgRlcdCKmlGPYq5VH0XUHtD7Apj6LMDMUwJErNTaBi9bo8c96gXBiqQL
	Eh7WCjzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwM3-00000008MVz-0o1h;
	Wed, 14 Jan 2026 08:35:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwLy-00000008MU5-1lvm;
	Wed, 14 Jan 2026 08:35:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C81240629;
	Wed, 14 Jan 2026 08:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C85C19425;
	Wed, 14 Jan 2026 08:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768379745;
	bh=DxiGW0weUzqeG+ae5w/kEulEAA0JgRZ+wmxUHIbNego=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zn3wYT/RVmzxK7Adq94nG8mMzMm8Mq2Oype7ZkPP7gJRq7vg7PiW/4LU/KiucA7Qj
	 LA3JI3gE6AHRP3+oBm7i8XOeKO5b3NINHcpoRKeQw2yT3Wdf6wK21T3RipFCvcBVAs
	 aQ5DoaOsS6aCQQoT1IKJplhovM6KfZ2JxEj2f5DedIEzTFe7j8bM9D6FZZZU88j+nO
	 jRhUpT4iAhr8F3UFYm0bMXZShm3WxHnIqeAy8SzbIMCLvqTeoEcx9er4jAdrykpRTp
	 4TW0qqjXpoArUkRryT7hPxoYkAR9JXxFNDSOddXTtPya1Q+sqoK3ALqqweFxs+mfBM
	 OnxWHetWDUK2Q==
Date: Wed, 14 Jan 2026 09:35:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: airoha: npu: Add
 EN7581-7996 support
Message-ID: <20260114-heretic-optimal-seahorse-bb094d@quoll>
References: <20260113-airoha-npu-firmware-name-v2-0-28cb3d230206@kernel.org>
 <20260113-airoha-npu-firmware-name-v2-1-28cb3d230206@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113-airoha-npu-firmware-name-v2-1-28cb3d230206@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_003548_316115_81BBC07B 
X-CRM114-Status: GOOD (  13.51  )
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

On Tue, Jan 13, 2026 at 09:20:27AM +0100, Lorenzo Bianconi wrote:
> Introduce en7581-npu-7996 compatible string in order to enable MT76 NPU
> offloading for MT7996 (Eagle) chipset since it requires different
> binaries with respect to the ones used for MT7992 on the EN7581 SoC.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> index 59c57f58116b568092446e6cfb7b6bd3f4f47b82..96b2525527c14f60754885c1362b9603349a6353 100644
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      enum:
>        - airoha,en7581-npu
> +      - airoha,en7581-npu-7996

This does not warrant new compatible. There is some misunderstanding and
previous discussion asked you to use proper compatible, not invent fake
one for non-existing hardware.  Either you have en7996-npu or
en7581-npu. Not some mixture.


Best regards,
Krzysztof


