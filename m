Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D224C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 13:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ssmwmv8S60IECMD5Mwiz9cfGvMs4/PqF/7DODBr7b1U=; b=K2NiIh/J4e6lmLiO9+YMZmYSBp
	GDXYDYnIYk6y+mUuO2JD8OQNiweTT5k1sqSSPt0m+ewkJCp+KUZT4cPZuAItJC62JEq/27xPyZr0B
	KpA6aO8/sHxseNbtZEMhZRzFseNk9Gn6Js/vPs8dYeh/SBU+Y9wU/OnWLD5h6Kg93eoA6h1P1ogDG
	lemYE1vYR247Ka56AX2zMEbw2fl8h4t9XuScajr9oxzw9uDqq937/mPikilAIMKAPg6lwlDn5XDbr
	hQ5X2g6SAthdcDZnihEsGd/v9jubeMyEjBii3I1oZldCA0gRr9zDw9lOtKXJSHiziOUt2aUjBVViv
	urpjp6GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odAxA-00B5GN-4O; Tue, 27 Sep 2022 13:48:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odAwu-00B54T-7k; Tue, 27 Sep 2022 13:48:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 76C1A660035A;
	Tue, 27 Sep 2022 14:48:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664286515;
	bh=bCw9THk8cKcz/XlHJZlqthDRQQFL7XlezPvIuw/e8yA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E7z06G8kgpmlBIMbq6NoLAmGmvZkzZM/sWYG100fKVweQ+Ag6lMIg4aozURcrMhVw
	 xyejQa8tA1C7TO295QPFgJiePSBx7SMN04CD3v3XwPzfZTmU+lOdQxU+wkE9LDHSeN
	 q/L/H7gv2jQ1oV1Ob8TKl2iT96ezQ0QEv4RytBio1aoCBuoBM48CIroHqLf4G04ELW
	 xwkx75Gu+UwIxx9DmPUJBBdI4kT2HY+gLag0bDpUXZwcVv7/BqFXdz9Pf0VvFCS47R
	 M2xcmWyJfLIsaECItO/yUnY03KN8M3OQ8gYbO2Cs3G8g6RsqpYHrzCC6eZjNRYxuLN
	 tb8EriF1+W68A==
Message-ID: <b590390d-fd74-924c-9411-e3c9ab015c40@collabora.com>
Date: Tue, 27 Sep 2022 15:48:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 5/5] arm64: dts: mt8186: Add xhci nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Lee Jones <lee@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20220923131148.6678-1-allen-kh.cheng@mediatek.com>
 <20220923131148.6678-6-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220923131148.6678-6-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_064836_437631_E6EB4B92 
X-CRM114-Status: GOOD (  13.10  )
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

Il 23/09/22 15:11, Allen-KH Cheng ha scritto:
> Add xhci nodes for mt8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 41 ++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index c6809fdc7d15..b08af431e525 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -845,6 +845,26 @@
>   			status = "disabled";
>   		};
>   
> +		xhci0: usb@11200000 {

Is there really no MTU3?

Regards,
Angelo

