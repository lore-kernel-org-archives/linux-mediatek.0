Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF7CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FobMThXxNtSsNU6W8Q2DH9YVk3oYz9k+axtZL8HlkM=; b=1Yy1yNhs5xbGyBkuZWE7fXXWWk
	7i5moXZ/AN4Qxhp0wi/bqV19ddKj+yi0xU2ocOORSFE+3pPfU3OjSSGe5MIeSBqWhtfDd9caB542w
	Kom04X7vFuL+lslcmzuYkuC/8XQHdr6YfKEY4C4cHdfl/kyTScr4S58SpCiGF5po/4oy1x5hrZSoK
	ckNevLtg5TN61JjjwfwUGuFQn/kNjMcod2V76T66z4wwtud0isYbStl+TG5KR/2hVFqdQ5pJFnTas
	z8/M85IAiT/YHY6bikmVn6u4gS9dvhtnpSjDw6ZRDjaYXW84glVEWHpl8xjE2UQFVlSfdXSoAtA70
	+N07FvAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtd3-0072hU-Ag; Mon, 25 Jul 2022 08:39:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtcl-0072Qq-KT; Mon, 25 Jul 2022 08:39:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0577766015E7;
	Mon, 25 Jul 2022 09:39:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658738373;
	bh=ojpTXZTQJqDfEMFXIHLgukOi8M5NtPDHqx0YNvu4X4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TvNY0IfDDfipUKcc1jXZRjpHzoa3j4G/O1NkQ4sgngOH2OUuZoa8DAA9KnmF/Meg0
	 Ikb6dW4HTsdZN/wc+djjkvYK7CqJwnVvmLuys0agsNns+iUXI3yqRQyyItE4GK5om8
	 CebdaW8fzwoz0RXkGi9r+RailDOmb2GITE1G7d358w1SYqArLOlyjKmBIL1SMQjjqC
	 LbJ29g0bRnUkNpK7JDp4AuaU34EiG8YEQIx5W95sJH5FCrbTDw0EsrvQkVdYccpmDV
	 wIdK/zCmtq61WqVXju9Jb6rUKXsMm+lpJFAw9SDVZbwaN33sXh7L++nOzk6S9W5oEP
	 qBMLpOu12stEw==
Message-ID: <5856610d-510f-46dc-63b2-79e571956a7c@collabora.com>
Date: Mon, 25 Jul 2022 10:39:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: dts: mt8173-oak: Switch to SMC watchdog
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Evan Benn <evanbenn@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220725082447.2613231-1-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220725082447.2613231-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_013935_835220_938864CF 
X-CRM114-Status: GOOD (  18.63  )
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

Il 25/07/22 10:24, Pin-yen Lin ha scritto:
> Switch to SMC watchdog because we need direct control of HW watchdog
> registers from kernel. The corresponding firmware was uploaded in
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.
> 

There's a fundamental issue with this change, I think.

What happens if we run this devicetree on a device that does *not* have
the new(er) firmware?

The kernel *shall not* get broken when running on devices that are running
on older firmware, especially because that's what was initially supported
and what is working right now.

For this reason, I think that we should get some code around that checks
if the SMC watchdog is supported and, if not, resort to MMIO wdog.

Regards,
Angelo


> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index a2aef5aa67c1..2d1c776740a5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -528,10 +528,8 @@ power-domain@MT8173_POWER_DOMAIN_MFG {
>   			};
>   		};
>   
> -		watchdog: watchdog@10007000 {
> -			compatible = "mediatek,mt8173-wdt",
> -				     "mediatek,mt6589-wdt";
> -			reg = <0 0x10007000 0 0x100>;
> +		watchdog {
> +			compatible = "arm,smc-wdt";
>   		};
>   
>   		timer: timer@10008000 {
> 



