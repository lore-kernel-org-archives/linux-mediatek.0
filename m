Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F517C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 10:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ss0uTaTdZp3DaN6/DsqZWgLEgceO+pZ6s67L1L6r0xM=; b=BpnsgTlcnIFA89PZQgMLQhAJCs
	chG7GLFgkH9JI+p7mLAoZNj8ZoNQljKXraECyiOfxAuwAnn8QaWe1KRnfiAVT1OLvyXD4BiMmFkpy
	bPf2Sfj1NYJWr23L0eXEi/Z7wWF+pk86/MZ8+KXrveooUYooR04YJ4NMvDAIgUAB63F/xLsh0GBmi
	lZ5aHR70i0hvpW+y92kiEqKvOXwb1s6fN1sewnWCSwmxX/GtAdc8PskURyNNqGb/vgBa5fATBeZLt
	DQj1Dnp+9cCQW5pxh2JYgMBPwjMJa7peURlgSrpO2uUwQYYdqCm/bfKeaIAClXb4SS5xpMtzMC+bZ
	8ZGvLbOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBu0z-00000000DHU-2q5y;
	Tue, 28 May 2024 10:25:09 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBu0i-00000000D5g-3oFQ;
	Tue, 28 May 2024 10:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716891891;
	bh=3ozJkRbRnqcBMiG82KQYzYUrYBmNg5J09V7+FZcUdyI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s8mN3T2RTRaFj0NmkozsR2LG+4RPMKanCLADbo180l85bH6IVkqVCCiswIW65g6Ui
	 rSi7D36NVMhui/P3AyoWRH3maXdhhxQ4y+cDCGswrkBk4dlXEO1jEEKile8xcG9ry/
	 qh8vmsrNhzBusjCZwZPY9zZz7B3EXjr0hWm+vgJcE6k5aGXCIqVle0kvM3wDDLBMlJ
	 lIa4pro8b1wvBw/Y919SkmeM12EsmrRGCvkl8xLVWpcciu7DXj0CobA2khLLQzNB4p
	 700lTsL5iRaQX1dyzbhswDTid3cYyAKMsjTpOw9xZZb91ZR7riyilJ/Vgl6z2Q0eps
	 4fX8t5IxwM4TQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A61BE3782160;
	Tue, 28 May 2024 10:24:50 +0000 (UTC)
Message-ID: <f1d85b54-f0d6-4274-923c-2ad31eab2b19@collabora.com>
Date: Tue, 28 May 2024 12:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] dt-bindings: mailbox: Add property for CMDQ secure
 driver
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240525230810.24623-1-jason-jh.lin@mediatek.com>
 <20240525230810.24623-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240525230810.24623-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_032453_164310_48FDE66C 
X-CRM114-Status: GOOD (  22.54  )
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

Il 26/05/24 01:08, Jason-JH.Lin ha scritto:
> 1. Add mboxes property to define a GCE loopping thread as a secure IRQ
> handler.
> The CMDQ secure driver requests a mbox channel and sends a looping
> command to the GCE thread. The looping command will wait for a secure
> packet done event signal from secure world and then jump back to the
> first instuction. Each time it waits for an event, it notifies the
> CMDQ driver to perform the same action as the IRQ handler.
> 
> 2. Add gce-events property from gce-props.yaml to define a
> secure packet done signal in secure world.
> There are 1024 events IDs for GCE to use to execute instructions in
> the specific event happened. These events could be signaled by HW or SW
> and their value would be different in different SoC because of HW event
> IDs distribution range from 0 to 1023.
> If we set a static event ID: 855 for mt8188, it might be conflict the
> event ID original set in mt8195.
> So we define an event ID that will be set when GCE runs to the end of
> secure cmdq packet in the secure world.
> 
> This can reduce the latency of software communication between normal
> world and secure world. In addition, we can also remove the complex
> logic after the secure packet done in the secure world.
> 

Hello Jason,

Is this looping thread SoC specific, board specific or firmware specific?

Thanks,
Angelo

> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> index cef9d7601398..6e5e848d61d9 100644
> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> @@ -49,6 +49,10 @@ properties:
>       items:
>         - const: gce
>   
> +  mboxes:
> +    items:
> +      - description: GCE looping thread as a secure IRQ handler
> +
>   required:
>     - compatible
>     - "#mbox-cells"
> @@ -57,6 +61,8 @@ required:
>     - clocks
>   
>   allOf:
> +  - $ref: /schemas/mailbox/mediatek,gce-props.yaml#
> +
>     - if:
>         not:
>           properties:
> @@ -67,7 +73,7 @@ allOf:
>         required:
>           - clock-names
>   
> -additionalProperties: false
> +unevaluatedProperties: false
>   
>   examples:
>     - |




