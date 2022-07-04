Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33C4C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 11:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhXfDKj4XnlwOj3hSIYVT7BNuFI/cB42aXjLcdctgao=; b=oiWs2LrzA321ywUHlfDXOj1x46
	SC/J/ZEHEtSdXD6TSNRVUH32VYSzPh/qeNPXnKk7mjgl9aL3fh2DN/RTSImtp8did97CQmQ92XIsL
	/V0i9NuDGhlhGNuQFRrFaaTERCaNoaRREy+FcNTLYO/IrdVlE1y98A53vcqMyL63tg+cKaA5zhdJZ
	K2BIQRDbVEE7SBwEUVioKDF7M7ayzxpOZeaGjS9ak5LoFKdo1EP1yefsYE8dotUkaNMr8Hxy+wPuB
	Wk3r0jlet/IZ6nagGcvyHHEoOflhOhZMOT7IniK0OWNEW2/inA6FWnQfbwW73NII053akwzAIQGoq
	6x3puEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JuO-007S3f-Nu; Mon, 04 Jul 2022 11:06:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JLn-0071hc-SL; Mon, 04 Jul 2022 10:30:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BBF1C6601638;
	Mon,  4 Jul 2022 11:30:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656930642;
	bh=rJUpYok85LF+d4r9kSHGVbYT9gpDpxf7ez0bJa0iUh4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MykPXsy3hmQ0Tz7tMuYaP/gOo2hMg00XcoeJg0/e6U+GPjf1TbXWAMx1gBKM1h17B
	 yNqw1MH4Mx3506V1Kree1XRVaR0UsALhVkUlHilNTvQod0XRho3tIjPgk9qOJJKITK
	 uyXSyXJZIiUr/0upV6kgqoOE2TiNbPN9MyNSVWOCwQGR9VptmBBDBLtm92UiajsAlq
	 QMof1O++d0KcxDdNBTsD+VRxyZ6dTrrm6/X2JYymLKGZAqLOJOiukPRIk6myjz/mf2
	 PgtaQZeiAtXoFIHJOROznwd9U7BCEWpl+VAKWK6PWYAq188/Y0LjQKmfVSB7js9/p2
	 e5vH6GIjDydqQ==
Message-ID: <e01fad71-0d7b-e0a8-7ee5-5a64792ed579@collabora.com>
Date: Mon, 4 Jul 2022 12:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 04/16] arm64: dts: mt8195: Disable watchdog external
 reset signal
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fengquan Chen <fengquan.chen@mediatek.com>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-5-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220704100028.19932-5-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_033044_110337_1DFB4BF9 
X-CRM114-Status: GOOD (  16.18  )
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

Il 04/07/22 12:00, Tinghan Shen ha scritto:
> Disable external output reset signal in first round of watchdog reset
> to reserve wdt reset reason for debugging watchdog issue.

If my understanding of the commit decription is right, then we can clarify
that with something like: "[...] for debugging eventual watchdog issues".

Otherwise, if this implies that disable-extrst is needed to avoid losing
the reset reason stored in the WDT, you could say something like:

"Disable external output reset signal in the first round of watchdog reset
to avoid losing the reset reason stored in the watchdog registers"

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> Signed-off-by: Fengquan Chen <fengquan.chen@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 066c14989708..436687ba826f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -327,6 +327,7 @@
>   		watchdog: watchdog@10007000 {
>   			compatible = "mediatek,mt8195-wdt",
>   				     "mediatek,mt6589-wdt";
> +			mediatek,disable-extrst;
>   			reg = <0 0x10007000 0 0x100>;
>   		};
>   



