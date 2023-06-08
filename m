Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BB9C7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 14:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/v9+o3PETUM6xU13S6m7Cop5wIw3cSd3R4QB/vuDQ4=; b=G/PMV6mi1+JHex4kaaq5CP/fce
	/Tt4hXMgZu+iXAnRnhqHudCa4EEp+BS8Qk5IbuWXVTmhbdLyTveurEBDlEUCFMpjiT5l4UheeNjvc
	IA5FKhn1g7Hjo2HmYO67ovATbIYBFhv5ynJQkFZ8qfGSY/N/297pO73olv74Ich3+Sv1+Mr0VR69h
	gq5iM/CbpvUATWcreI+jQrVa98ivdCl3PUSKvfnLMIHGHXN90nRt+wf+BXk7yWFQyoHLClhR8dgM2
	H7ALINyqJ57dOoj6vHJRQyMImbGVwCGNjw4T6gU1wX/+vR2O1phBWXPR3CVNZugwH8/S5Rv61TL7o
	p1fz0OTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7GTg-009bSW-28;
	Thu, 08 Jun 2023 14:19:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7GTd-009bRm-25;
	Thu, 08 Jun 2023 14:19:02 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E45726606EC6;
	Thu,  8 Jun 2023 15:18:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686233940;
	bh=EY/Cv+BYzvq4HCOJOX2J805Hf5LJ5niFUoHwigfrkP4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mmWaOXwv2awwKmTlM0y4Hgladq081m791POg6DvoFJVWcrMtq+lHgb+npqE0ZhEVL
	 76Rn7K59zwEvcWcH4KkzV7KOrmns970zFDAw1PL+KTSy/VXKzX4TB8dI12No52fNrY
	 2WrxPGhPaYCZzIk8NsCLaOl90L3gM+qiy7ZRUxPq0j3QbgNk0NF8deQZvTvI4oaRqH
	 F8yKKj4hKX7KmTDZ1+uzot3014eJe06arvZ4jFquQAGuxCigvetuzM/i+l+V5PGjdY
	 N18R59I+d6T3IpBTSoy+WPaR0p+IHrQkKJKsUpnhhMzXjDSJZACiwntwSj7Stq92Q+
	 Dp1kDQtf2aeXg==
Message-ID: <6d5bd11c-6f57-adc9-b35c-78cb80882d52@collabora.com>
Date: Thu, 8 Jun 2023 16:18:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/4] arm64: dts: mediatek: mt8186: Wire up CPU
 frequency/voltage scaling
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230607090653.2468317-1-wenst@chromium.org>
 <20230607090653.2468317-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230607090653.2468317-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_071901_815485_419199C7 
X-CRM114-Status: GOOD (  14.70  )
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

Il 07/06/23 11:06, Chen-Yu Tsai ha scritto:
> This adds clocks, dynamic power coefficients, and OPP tables for the CPU
> cores, so that everything required at the SoC level for CPU freqency and
> voltage scaling is available.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 274 +++++++++++++++++++++++
>   1 file changed, 274 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index 1b754f7a0725..6735c1feb26d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -136,6 +136,240 @@ cci_opp_15: opp-1400000000 {
>   		};
>   	};
>   
> +	cluster0_opp: opp-table-cluster0 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			opp-microvolt = <600000>;
> +			opp-level = <15>;

As far as I remember we don't need opp-level, can you please recheck that
and in case remove the levels from all OPPs?

Thanks,
Angelo



