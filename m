Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A3FC04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 09:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQV8rDiXqhOz8+DTUTCNn5gY7UonS02G2V7rroIDquM=; b=yGROpPtUvD40PiOgV5AkoIWVkB
	XOdmQZaFdWk57y4am+aYaRCfGpz39i5R43Js/2bzEoSrAWztkP84jwwEQ0OCSi2ORZ8W72YeaMHER
	6SuUF2D8s+3iT/rhT/I/RRF7EB5kwykpXUYKTLPrOMZ8nNa1AR5Ib7gGdYYL47LJaE+n3fesoeVvV
	CgHcjzn7Ekh7PSAgmc8gLjMZcFl/ImqOs3uMROs5jGx9xVdYgjf/zRr35JZ3uQrXOI7fqkbD4NqYx
	3+2ueyNScS/kSUZoSwOZBtBo3dwZnN+5Hi8E2mnANfTXJVFWZWP/uQLgzInu28S4Q3bqrkPXpBzKd
	sE48LWaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8zmf-0000000E3xP-3wFA;
	Mon, 20 May 2024 09:58:21 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8zmc-0000000E3wX-0u7C;
	Mon, 20 May 2024 09:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716199096;
	bh=9GSZX+aKLnx8y8TUWKzJzkq8VGJDTGApJAWDt61fS7U=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=pEp44sC8Kg7b5wvV8lTZxd1j2+1nCYixzWpOUBTyDht6mzgSywYdW3sNAopDUn58i
	 i6qXK/vRW0yMdqdoL1hDe2fSVYa39bo0eN+DshkXDOYp7gooJ9pjpl4X8EFPAy8FbA
	 +DyACb7P6HMurzFKbpVT/NgpylCb5edcJK48oxfuBfAYyU4hMJNnA7r472ElyhA3Qw
	 Ieqi3gIR1K357QSiTdOZReaFjC1z99t88w8SwBNKJQGLgO1XfsbCfaM0nmnAk23tB3
	 uJRd4fp1EOnPl1z09eVhne8VZNnCIGP93pVxSkOVDTRiNyHbpsaDPEuWNoTMntLWaB
	 V0X+JjMN2aM0Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D611537820CD;
	Mon, 20 May 2024 09:58:15 +0000 (UTC)
Message-ID: <3b1be547-ac49-40fb-909f-96952c299545@collabora.com>
Date: Mon, 20 May 2024 11:58:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: mt8365: drop incorrect
 power-domain-cells
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
 <20240518211159.142920-3-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240518211159.142920-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_025818_421853_1F0A024E 
X-CRM114-Status: GOOD (  14.27  )
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

Il 18/05/24 23:11, Krzysztof Kozlowski ha scritto:
> The top SCPSYS node is not a power domain provider.  It's child
> "power-controller" is instead.  Fix dtbs_check warnings like:
> 
>    mt8365-evk.dtb: syscon@10006000: '#power-domain-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Well if you're fixing that by migrating to scpsys compatible, you might as well
resolve all of the warnings in one commit, removing that power-domain-cells
property in patch [2/4], otherwise this one is technically a fix for that.

Please squash [2/4] and [3/4], like that it just makes more sense.

Cheers,
Angelo

> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index d3da5a22c2d2..eb449bfa8803 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -302,7 +302,6 @@ syscfg_pctl: syscfg-pctl@10005000 {
>   		scpsys: syscon@10006000 {
>   			compatible = "mediatek,mt8365-scpsys", "syscon", "simple-mfd";
>   			reg = <0 0x10006000 0 0x1000>;
> -			#power-domain-cells = <1>;
>   
>   			/* System Power Manager */
>   			spm: power-controller {


