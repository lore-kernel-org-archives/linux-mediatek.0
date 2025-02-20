Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D18EC021B1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2025 16:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iy42YFU6jentWFs1mE8VaXNI+bWG449CqizPCx1ja0Q=; b=GuC3p3RWznkoxSjM17GEC7+edq
	A0FZ+j6H8Y39xfcvx6ufBvSqAKs2pS7VmyKDvoRI4vlKyLzblM5K0YOIatlvvJRQlZVfJeHMy/YQ8
	6WKxdM8wcckCkt9EeOeighk0JpjxvrDYxUBl2Wx2dD9LHAlKXaZe0MmsR8JeAjIAt0zxJdR+CumN8
	FRPvOrp8qeo9qVOqcjdAnmgUCN2S+FRXX2lWc9xX4xtotaYpQbkph8eCtnTSK6zQXJ/4Nrm3qxQxk
	Fazv9OnhQu3HyVpO3K201129C3rTK9zxnxrFp7MRDEKAVzvHXr+qS6pClhhEWaeNMvnXTMluagItq
	5W9vDSyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl90W-00000001jht-0iw0;
	Thu, 20 Feb 2025 16:02:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8uB-00000001hoA-3rJ1;
	Thu, 20 Feb 2025 15:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740066962;
	bh=Dd68mWyJibumUB8TwEojxnqCXZ3BFmtso9EvwgpCMTQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gvRfdxP1yjGqu7HQ7lttCRdMEE4nZ8PLonPHC5dan9B3mNW1GnHKIiDLkkjIj2v3g
	 KHypzBBQk2cW9FHUWtjDzw4ryElrN1yujKOACsgkVW4B/QXOmrUs+LQ2BYG7Nli+hP
	 O0K8W5n7G0IjxbxqSTYZ5XTCki04ysZiEtImkwyPARnqBIyobzZTex7ihtm7UrZYIC
	 dgLhEjpr1FJs3EU81c5mxE81nm5/f+Ux4GfhYn9TGYAyIV/J6FDRpD8aNOLVWuJ+Bo
	 A2j0WrGnX2umT9I3mFst3Ft6at+hoj4OMwnJV4mHWTPhnaZolCe5GyrsLCg/MWIV9A
	 siui4kJs6qApQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E4F617E0E95;
	Thu, 20 Feb 2025 16:56:01 +0100 (CET)
Message-ID: <ae34efcd-4fe1-4e45-a1e1-0744138a84b9@collabora.com>
Date: Thu, 20 Feb 2025 16:56:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: mtu3: Add ports property
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chris-qj chen <chris-qj.chen@mediatek.com>
References: <20250220142230.2530583-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250220142230.2530583-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_075604_118076_A7E56FCB 
X-CRM114-Status: GOOD (  11.81  )
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

Il 20/02/25 15:22, Macpaul Lin ha scritto:
> Define the ports property in the mediatek,mtu3 device tree binding schema.
> Include definitions for port@0 and port@1, specifying their roles as
> High Speed (HS) and Super Speed (SS) data buses, respectively.
> 
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Some SoCs do have SuperSpeed peripheral mode, so for this commit

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../devicetree/bindings/usb/mediatek,mtu3.yaml       | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> index d4e187c78a0b..21fc6bbe954f 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> @@ -155,6 +155,18 @@ properties:
>         property is used. See graph.txt
>       $ref: /schemas/graph.yaml#/properties/port
>   
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: High Speed (HS) data bus.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Super Speed (SS) data bus.
> +
>     enable-manual-drd:
>       $ref: /schemas/types.yaml#/definitions/flag
>       description:



