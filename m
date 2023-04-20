Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7B1C77B72
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 07:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ECGa+3IhFRmmKf6p6L/324rL1GxL4/zIcbMxuB51NA=; b=f53h9HQaRQBTxrPtKjN25Mb0Kh
	39wjfTDQPP1Tc79nphBarqmPTo9JwjWdzf40Ph8GBa2SH3xqiSDDHJPJUeoGVPMcdHKEwGm3TCYI1
	8y/zK/7y2MWafKq4AINbteUZR0rKhMw5X6r21YKdTF5DCqoAYV0ZTgNeIpAhYTYMylDhL7836UA04
	1HYyHhvygJsdriUV5W+jLKXSkXrKlMiN+KzcyJ/X83dNRMtLHYWToqum9ljArnWMxGx7vaBINcoz/
	wwhWjcLqeRDNd2+vp+l8r3NrSpBxWUUAMjN2UsV15Jlst9DaEAg1Y1PAsPpEDHTuzTXRuhz59mHie
	PYAg09gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppOum-007Iff-2z;
	Thu, 20 Apr 2023 07:41:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppOui-007IeL-2p;
	Thu, 20 Apr 2023 07:41:10 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 08AA76603247;
	Thu, 20 Apr 2023 08:41:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681976462;
	bh=ljXoAdBmIUPdNXHRwFIbmt6dA6QYtvMs1UZA2w/MBog=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=WuZeRsf3VfimvtYBQmzvqpDoQNfE0Dh+yJF34mJhdpjP1x2/BKApTThdGKmcmWhUE
	 AcV6NliCbr6+zmXqT+Qjjdf4V468C3/EZIZa5Y7rSiiwg6e3jlx7zyJv3eeTXQ+h9e
	 g8+TE4aWnm3Q2vphxrvRFfoqW47Wd0BazCoOn/Juai+f+p0pYumNik5TGICGlBTDR9
	 HZFMUF68llVAj3/Fgn66LlQwjN84f6/1gJiOtfkaBXhezRNAaGFKOvQAgJxBZ3W0wD
	 76Z0WT4fAYuG7I7n7GYyQSmCobOsKBlAEX8S/AxedsOqghZAwK4YGc7TOiJM2bXHLA
	 XR8SSSqV3FMUg==
Message-ID: <f2cea4f4-121b-2c8e-3cc9-fbe524d95749@collabora.com>
Date: Thu, 20 Apr 2023 09:40:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: mediatek: add WED RX
 binding for MT7981 eth driver
To: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <cover.1681930898.git.daniel@makrotopia.org>
 <e970078a937c39067d5733ddafb64d0eb56ac474.1681930898.git.daniel@makrotopia.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <e970078a937c39067d5733ddafb64d0eb56ac474.1681930898.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_004109_129434_B6BDA5B9 
X-CRM114-Status: GOOD (  13.17  )
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

Il 19/04/23 21:04, Daniel Golle ha scritto:
> Add compatible string for mediatek,mt7981-wed as MT7981 also supports
> RX WED just like MT7986, but needs a different firmware file.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml    | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> index 5c223cb063d48..2c5e04c9adcc8 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
> @@ -21,6 +21,7 @@ properties:
>         - enum:
>             - mediatek,mt7622-wed
>             - mediatek,mt7986-wed
> +          - mediatek,mt7981-wed

Please, keep entries ordered. 7891 goes before 7986.

Cheers,
Angelo


