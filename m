Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FEAC83F3E
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 08:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PogouQ8zOghq2SBqH6uZY1+0osECjObrmYSJBBxGZmU=; b=oGuAgyJPSIqC4b7W/kkcT63LpZ
	V2esBJX2p/WAKHTKJPWXVgRZhTcfZCrKUX8MkvxAQ2+KBMJGaeEp4pIxqL1S6QeA6zdNhzKg4p1sA
	7eM8idj3XaUvyOn7gawkeJQgXdht6qZR1VuFwLrDB2b0YlPOg7YzKMJR9lhcJbDIgLzNGqbita2Em
	rrrG0vp3DXKBfqwfXRO/hucRuUwOMauPEZdBa9Ujjw8nZLyJf+of/h5iFZUO4PQQkuGCc254IVgcf
	BRwjio35WUMW0odSjpHoxD41y1uPn2kscOcLn1w/rnJYUNhaYJ69EQVtZfsmcgmfzMZoAPr8sBlSz
	JxNcib/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQzT-005UHh-0h;
	Tue, 05 Sep 2023 08:00:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQzQ-005UH4-0j;
	Tue, 05 Sep 2023 08:00:49 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CEA8F6600B9D;
	Tue,  5 Sep 2023 09:00:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693900846;
	bh=2XjBi/AufZmvXBbTSDTBYuHW7Eq3EIKYGcbUyzuBYIg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lG5wTiBnMhsuK03J3bFbkZxYoWG5c3bESzHfSG3dWWMCosmfdam4ti8fPG31P6PX9
	 AxtkwwWxGGTkDHTkaWC0MPdX+8LU8xU+3U3+Gye/XAiX6eHRqHfWVDLK4EF55IAykt
	 5lIjKJQxXj/dVk7tfnlCJmOQh8pSjmC85pH5DsObVo8McsfpswgS1RUDGBwv0GnuM5
	 jG9mZY0WivQ6dAO1oUBtFhL0Lbo9PxcIkvrfu47nt2cNg5RY95PAxegh8QaDvKYkdM
	 cKeAO78mj8gIOXXB5hgkOLpQ+XuPhPVTbv1zHLLUAMbSNEmqrksa983Hixi3K4vavQ
	 qF8CKg9++y69w==
Message-ID: <4e0c1222-5211-5515-99f1-b44b25f8ecfe@collabora.com>
Date: Tue, 5 Sep 2023 10:00:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/2] arm64: dts: mediatek: mt8195-demo: fix the memory
 size to 8GB
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, stable@vger.kernel.org
References: <20230825114623.16884-1-macpaul.lin@mediatek.com>
 <20230905034511.11232-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230905034511.11232-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_010048_425985_EB052C30 
X-CRM114-Status: GOOD (  17.59  )
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

Il 05/09/23 05:45, Macpaul Lin ha scritto:
> The onboard dram of mt8195-demo board is 8GB.
> 
> Cc: stable@vger.kernel.org      # 6.1, 6.4, 6.5
> Fixes: 6147314aeedc ("arm64: dts: mediatek: Add device-tree for MT8195 Demo board")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Changes for v2:
> Changes for v3:
>   - No change.
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> index b2485ddfd33b..ff363ab925e9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> @@ -48,7 +48,7 @@
>   
>   	memory@40000000 {
>   		device_type = "memory";
> -		reg = <0 0x40000000 0 0x80000000>;
> +		reg = <0 0x40000000 0x2 0x00000000>;

Shouldn't this get automatically filled in by the bootloader?
Usually, that's the case: if it is, then the right thing to do here
is to change this property to

		/* The bootloader will fill in the size */
		reg = <0x0 0x40000000 0x0 0x0>;

Regards,
Angelo

>   	};
>   
>   	reserved-memory {



