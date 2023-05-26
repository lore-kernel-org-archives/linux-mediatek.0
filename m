Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0363BC77B7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 08:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3yO4p0LxmojGe77H32bf7t1Be4ND093QAacxBdv4+A=; b=jwxt7J+6n8xrkXD0BT5zyNu96v
	qPmEpZ6NHXpZVsQ0Qro4xYIprxLW9bs3+ZsznNlqVSm0u5Z30WiFiqBODr6NS7KNdIMb0hiHCOKll
	QLcLLWphhbQjhaKsuj8Yd+syplX0YVAfmDBzQESoH7ZgU2Yf517Utcu0b15fPvS36lyBBMwxw2WXj
	I62ZDfiuZkdoAmLz4OYYlYOMDwrmwTv059MS6mvYQsugWd9t/Ip2X4D+imYCqgOnDopQ6o6JwCpth
	UgOUgomgYie50Qeod0bMaaQ7n0/KJcG8zTYxxtV5Bx+3K1GLpJdi6ybjGF9T8KjaYAi13yajck1k2
	pjSpW6mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2SqI-001c5x-2E;
	Fri, 26 May 2023 08:30:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2SqF-001c2a-20;
	Fri, 26 May 2023 08:30:32 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8F4076606E83;
	Fri, 26 May 2023 09:30:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685089818;
	bh=gg3PXZMm/8qSIeSloKT4Q2tmhI1GwPnD9NTPJMDIL0Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ul4aYUWqkAaDION+dPRYmOTTBp5YFpvXXgyq8i27Rc6zJGXSjE8nTF3T6QlgArrv5
	 XAmtQM35alw/+N0CB2yodcSSG0SFqvv2nfFLB1AqaHUvdUJxSzHiM2cgnnxOLgq/Ol
	 hNa1bz9lMwy7CkGX4pjdaQhbmcUAz3D2vpV9usC2GKWRgR11ZV/cUtttBohJdbpTRM
	 1uAHsEa9ivaVeBvNnDYLpN9xdeFrDX6+ZinR8aAsXSOSxbmPp3KCWFidy1qdgkj1RY
	 sCG9BDkziPRXRGbl1RJb+V+a4kyy6xo0ftJoU9UcxiclAXHpGu/gYLozjGKoHBLgAp
	 iEpcqklNY/k1g==
Message-ID: <f3f7df94-74f1-dd41-00d7-0ab4fa2e4d61@collabora.com>
Date: Fri, 26 May 2023 10:30:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: replace unusable
 clock
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230517-fix-clk-index-v2-0-1b686cefcb7e@baylibre.com>
 <20230517-fix-clk-index-v2-1-1b686cefcb7e@baylibre.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230517-fix-clk-index-v2-1-1b686cefcb7e@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_013031_814124_E32DA92F 
X-CRM114-Status: GOOD (  18.05  )
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

Il 25/05/23 16:50, Alexandre Mergnat ha scritto:
> The “mcu_pm_bclk_ck_cg” clock is used by co-processors and should not be
> added to the kernel driver, otherwise the CPU just halt and the board is
> rebooted by the wathdog.
> 
> Instead, add the "aes_top0_bclk_ck_cg" missing clock to prevent
> re-shuffling index and then preserve the ABI.

It's still a breakage. Besides, have you tried to add it as CLK_IS_CRITICAL? :-)

Cheers,
Angelo

> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   include/dt-bindings/clock/mediatek,mt8365-clk.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/mediatek,mt8365-clk.h b/include/dt-bindings/clock/mediatek,mt8365-clk.h
> index f9aff1775810..0a841e7cc1c3 100644
> --- a/include/dt-bindings/clock/mediatek,mt8365-clk.h
> +++ b/include/dt-bindings/clock/mediatek,mt8365-clk.h
> @@ -199,7 +199,7 @@
>   #define CLK_IFR_PWRAP_TMR		46
>   #define CLK_IFR_PWRAP_SPI		47
>   #define CLK_IFR_PWRAP_SYS		48
> -#define CLK_IFR_MCU_PM_BK		49
> +#define CLK_IFR_AES_TOP0_BK		49
>   #define CLK_IFR_IRRX_26M		50
>   #define CLK_IFR_IRRX_32K		51
>   #define CLK_IFR_I2C0_AXI		52
> 


