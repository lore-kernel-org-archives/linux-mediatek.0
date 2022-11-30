Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83688C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 11:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6FOSgMr8Su+IJbLdlgRztGqBXhVXeziNmWxZQDcSnI=; b=nlxDMNEyU1W+D6iUHMj5Pw5tXf
	ItzlEJxXGaJ6nRgfpOQ4IEzyYFFDLJZW/qYJ4DOLS1jwfawyvZGse6TZN/7gok6MzfSWJb3FMeHcR
	QRyhsBwr8GEHdXwSrDKltl4AAZOCtTIajGF4IzZZUof6Tk6E5kyXTjSyNtT+muhERrcG/D5Uvo1cu
	ZKx6ZcOH+k5fILORfy2c0owZhUYsx7Co9zyNgox2A9Ot00PLb4UE6ojyn0yqluvBmHpV1Ba8Og4DI
	fs1HPNL3Oe9Wg89+9cTIacvlLV9Zk43c4M5QAyiy1BDpm7uKAixt1Fo+EVFgD0vanUriLD5KIXBdp
	g6Km1jjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Kz1-00FgGr-Sw; Wed, 30 Nov 2022 11:10:31 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Kyq-00Fg9w-0G; Wed, 30 Nov 2022 11:10:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 27F4A6602B30;
	Wed, 30 Nov 2022 11:10:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669806618;
	bh=7oMfqslqjC4FH70ZlLLwmJ6wNhE3DEsyVazeisOoOzY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iA46UbVmQiGhwuAjFApfJ0W5FpNTR2AkxX+XIKvJzDSmnIvsIZpEeijmxcyX4FM79
	 3yOd71F23Yj+MK24QU535Eaau3j1PtDirFk44cHaBDPwG0Z3FqylNLfzxWXGMggOPH
	 TCUGtMN1WJ7bRAmltM6DBu5ejg9ngyO/9cYngUFmFvEcEu7tgypho0BBsm6uM0hbj8
	 C3haxogMkdTvsA+mY/VHa9GE5QgLGIG8bWq+r026Dw+k7O6QBV5RTegPW6Ks25CQTV
	 08kEnRSQ7i50OhRFOerPxoT5MAmXoFN219edNQGp5dYECgfIbqhWy4m3raH3h29Ze0
	 vuG6J/zwdZALQ==
Message-ID: <2ec80bd8-dfef-d2e6-eb41-6e6088043e33@collabora.com>
Date: Wed, 30 Nov 2022 12:10:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH resend] arm64: dts: mediatek: mt8192: Mark scp_adsp clock
 as broken
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
References: <20221130031741.3176853-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221130031741.3176853-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_031020_203028_EDD7B9DC 
X-CRM114-Status: GOOD (  17.31  )
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

Il 30/11/22 04:17, Chen-Yu Tsai ha scritto:
> The scp_adsp clock controller is under the SCP_ADSP power domain. This
> power domain is currently not supported nor defined.
> 
> Mark the clock controller as broken for now, to avoid the system from
> trying to access it, and causing the CPU or bus to stall.
> 
> Fixes: 5d2b897bc6f5 ("arm64: dts: mediatek: Add mt8192 clock controllers")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

....or we can add the ADSP power domain to actually fix this properly, which looks
like being a generally good idea :-)

Allen, can you please take care of that?

Thank you,
Angelo

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 6b20376191a7..ef91941848ae 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -575,6 +575,8 @@ scp_adsp: clock-controller@10720000 {
>   			compatible = "mediatek,mt8192-scp_adsp";
>   			reg = <0 0x10720000 0 0x1000>;
>   			#clock-cells = <1>;
> +			/* power domain dependency not upstreamed */
> +			status = "broken";
>   		};
>   
>   		uart0: serial@11002000 {
> 


