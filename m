Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4CC606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k4hc0Sd6;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BBePDjYT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QzNSZ0iFhRlTWtyDOwGZYClX/oRnKCvUibKarAhFQB8=; b=k4hc0Sd6zRF65l
	IRfR1Uy9WV5V6HDMhm/Hmhh3RHHiT84voyRdeB3Du5BeHnA9ruR4IVhFxfPbBlxTu3+H/+Wuw7miE
	N/boy/gDDMwjFWiGwW1MbvVKY8sGOyn2be+AXop0ipADVYkjeTVpGICvoRGtwA8Nor/0Uj8691gZt
	rsSFiEcWhFcqF+TZmNGv8jk40vl/pwuBAQJ8McjYTcwTOjKPLQKbUhR/10xGVBXi2ByE2fcv9Fyoc
	7048/O7BFXo6tTloJS/4upsAy/lclXQMQw5C2J0Agf7lCuli9GuwxkLMIrKZTV+We1ER/7I9cjc1d
	OkFJrr1RbchrrBNx4b3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQzo-00000002uNc-0a1M;
	Mon, 23 Nov 2026 10:10:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQzk-00000002uLi-1e99;
	Mon, 23 Nov 2026 10:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795428593;
	bh=dNcePiAUgVfMdRA+1roMRiVaEzWyrtTb8Npu/FK/EqY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BBePDjYTm0dnzUEMQr71rXFyP6MEJNcQCEHXVkw+Y+2PQzAUn64znCBUpQ9mg6Mpu
	 dhAobMTj0w62AYUcNRJt06xPjX65TlHXbUDYzBlBXTVrIkavKW2w4e+KiJ3PerXLuN
	 Hb3qwOPAWaMKgfqUtPbw2yHYOsod19W46F8NOLQDZGoTamlm4gtKZ8Zybzsi8m2brb
	 LCO24l9X5yzZZoFZsiz/B/FZQutp25a6WYXxTDEZivbrwlMeSnOHjHiV2FSVM1Nm1f
	 O0b/2h9yaVSaxXm0MviW9R9SbPssuMWCixe/JZLTc+rdKeXlnkATT3FTgKkyrCRARN
	 SiOj3NT1LKw+Q==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 274FC17E021B;
	Mon, 23 Nov 2026 11:09:53 +0100 (CET)
Message-ID: <05e5b03e-16f7-4e5b-b6ad-f946b2560ccf@collabora.com>
Date: Mon, 23 Nov 2026 11:09:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: mediatek: mt7629: move clock counts out of DT
 bindings
To: Chuanhong Guo <gch981213@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
 <20261120-b4-mt7629-rtc-v2-1-cd877cd496ae@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261120-b4-mt7629-rtc-v2-1-cd877cd496ae@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_020957_083647_8388AA19 
X-CRM114-Status: GOOD (  13.78  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/20/26 15:41, Chuanhong Guo wrote:
> The clock counts used by clk-mt7629.c size the clock provider arrays.
> They are driver implementation details rather than clock IDs used by
> device tree consumers.
> 
> Move CLK_TOP_NR_CLK, CLK_INFRA_NR_CLK, CLK_PERI_NR_CLK and
> CLK_APMIXED_NR_CLK into the driver. Keep their values and all clock IDs
> unchanged.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

If you migrate clk-mt7629 to mtk_clk_simple_{probe,remove}, you will realize that
the CLK_xxxx_NR_CLK definitions are completely useless, and you'll be able to
remove those.

Check other MediaTek clock drivers about how to migrate.

In any case, NR_CLK is always the same as ARRAY_SIZE(that_clock_array)....

Cheers,
Angelo

> ---
>   drivers/clk/mediatek/clk-mt7629.c      | 5 +++++
>   include/dt-bindings/clock/mt7629-clk.h | 4 ----
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
> index e154771b1b8b..517c43b19f18 100644
> --- a/drivers/clk/mediatek/clk-mt7629.c
> +++ b/drivers/clk/mediatek/clk-mt7629.c
> @@ -17,6 +17,11 @@
>   
>   #include <dt-bindings/clock/mt7629-clk.h>
>   
> +#define CLK_TOP_NR_CLK		108
> +#define CLK_INFRA_NR_CLK		6
> +#define CLK_PERI_NR_CLK		22
> +#define CLK_APMIXED_NR_CLK		7
> +
>   #define MT7629_PLL_FMAX		(2500UL * MHZ)
>   #define CON0_MT7629_RST_BAR	BIT(24)
>   
> diff --git a/include/dt-bindings/clock/mt7629-clk.h b/include/dt-bindings/clock/mt7629-clk.h
> index ad8e6d7f0154..cff9a02e8302 100644
> --- a/include/dt-bindings/clock/mt7629-clk.h
> +++ b/include/dt-bindings/clock/mt7629-clk.h
> @@ -115,7 +115,6 @@
>   #define CLK_TOP_CRYPTO_SEL		105
>   #define CLK_TOP_SGMII_REF_1_SEL		106
>   #define CLK_TOP_10M_SEL			107
> -#define CLK_TOP_NR_CLK			108
>   
>   /* INFRACFG */
>   #define CLK_INFRA_MUX1_SEL		0
> @@ -124,7 +123,6 @@
>   #define CLK_INFRA_DEVAPC_PD		3
>   #define CLK_INFRA_APXGPT_PD		4
>   #define CLK_INFRA_SEJ_PD		5
> -#define CLK_INFRA_NR_CLK		6
>   
>   /* PERICFG */
>   #define CLK_PERIBUS_SEL			0
> @@ -149,7 +147,6 @@
>   #define CLK_PERI_NFI_PD			19
>   #define CLK_PERI_NFIECC_PD		20
>   #define CLK_PERI_FLASH_PD		21
> -#define CLK_PERI_NR_CLK			22
>   
>   /* APMIXEDSYS */
>   #define CLK_APMIXED_ARMPLL		0
> @@ -159,7 +156,6 @@
>   #define CLK_APMIXED_ETH2PLL		4
>   #define CLK_APMIXED_SGMIPLL		5
>   #define CLK_APMIXED_MAIN_CORE_EN	6
> -#define CLK_APMIXED_NR_CLK		7
>   
>   /* SSUSBSYS */
>   #define CLK_SSUSB_U2_PHY_1P_EN		0
> 

