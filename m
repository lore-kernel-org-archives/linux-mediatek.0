Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B51FCD5BD5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 07:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HjBhWTNxskz5X2CLtMNr+VdyQoJFDfIFcwUvlKadqY=; b=Q2bhk7Ivm/SlDp
	PWaFTdzUOecTcgP6WL44avNMY+nfwCwIw8kOHGAr9THE7JHFlMlNTtBanQ2Qh21XJOBGQts3RM4Vl
	zUALEyYnEt1TxBx4p1J2g3NoMt8onywjjs/gcEwN9TL+Ez+f5/GDQPaJUq9h1YfgK/2/+9oZoRPUd
	anZcmQX+H/UfkXaizxuGNMs+TQ8o+Vx5ZEQf1Mf7/b2HJnt8k27sp4tSILckBY6L80NdeUzPOTtzr
	oCuEeIgFtlT+ZmDPmP2qbZnq/cQkrrJylCa2iJhSjtDIpxOnQd/+YdCiqLeaq3n595IY9Cz3zyq5K
	Jlk9+R0AW7RRIsWpnrKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEXS-005PvS-0y;
	Thu, 21 Sep 2023 07:55:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEXO-005Pt3-2b;
	Thu, 21 Sep 2023 07:55:52 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D52BE66072BD;
	Thu, 21 Sep 2023 08:55:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695282949;
	bh=WiT2aa8Rhk3aS7e7dZ1mtGJrKI4vTo0qji3osRdEPc4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zhmj7ZlENxigYQSiBMNrhhDc3znNJb6e3KXnfU9zYJCvR6zs4dSBACc7Ck1CvAzbi
	 6hQx5bcxvlG4do+a2qAwpSzXiNcQT5ZJGHgGDCPaCasLDRqMVVSXU8CUybcobIsyCJ
	 2YlAo+iObbdEFviGeos7ADDrGmcuzZi5h5c6TLc8ZLdX0b/tmfuu+0mee7gIMv+7IW
	 x6A7Kvc+NnFHqigaVBGfAFbQy5SEFsHdcQF0NCbJ+9w6pt3KXfwgrvg7y2bY8xSnQ+
	 VHG6xP02c5eBfzU4n8qoi7LViqLAmfNcN7fhP09ASdjF7eCv2B+FZrzg1CTPTgryG4
	 8wiGhfzQ8wxTQ==
Message-ID: <31fbdae8-d41c-358b-c8ea-6ee31b158dfd@collabora.com>
Date: Thu, 21 Sep 2023 09:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 2/4] dt-bindings: thermal: mediatek: Add LVTS thermal
 sensors for mt7988
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230920175001.47563-1-linux@fw-web.de>
 <20230920175001.47563-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230920175001.47563-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_005550_975863_2E275AFD 
X-CRM114-Status: GOOD (  15.07  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/09/23 19:49, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add sensor constants for MT7988.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> v2:
> - new patch (moved from driver code to binding header)
> - give sensors more meaningful names
> ---
>   include/dt-bindings/thermal/mediatek,lvts-thermal.h | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> index 8fa5a46675c4..8c1fdc18cf34 100644
> --- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> +++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> @@ -7,6 +7,15 @@
>   #ifndef __MEDIATEK_LVTS_DT_H
>   #define __MEDIATEK_LVTS_DT_H
>   
> +#define MT7988_CPU_0		0
> +#define MT7988_CPU_1		1
> +#define MT7988_ETH2P5G_0	2
> +#define MT7988_ETH2P5G_1	3
> +#define MT7988_TOPS_0		4
> +#define MT7988_TOPS_1		5
> +#define MT7988_ETHWARP_0	6
> +#define MT7988_ETHWARP_1	7
> +
>   #define MT8195_MCU_BIG_CPU0     0
>   #define MT8195_MCU_BIG_CPU1     1
>   #define MT8195_MCU_BIG_CPU2     2


