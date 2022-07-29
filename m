Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D078BC00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 08:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UsN4Xf9mbAqVsuiE3CKKdReghqUPs6rdpszyd7vJRfk=; b=PYdxAKAL+o9rLk8+Pq3uLIe/R+
	EVpotxHz2gXin7jvWI6AwtOZbdq+nobeVX0VPBjbOHNmMvEJa30DusRwYuezkP7XZRG9Y4b2BuViI
	3Fecss+kDIpbvWBIFDfZvViaQ4Y4ahCuzkFSEmZnPHIH+H0DVJe9v4cgCQcb+xONe7hS41rsYipXi
	aTJyoKBhB3o8u1SIj+DbZjXizVfZo08ZTyn+aIUUxnJR3RxmG5ftfOvi0bGjVYJVsGUMOEyZtq6hz
	TxT5noarHgPyAQ0Hq66zXD6GIpeYwSB80S7e0yvks6M4YmBB+ixrnZNoOiviBZnpTtEb95L0g9/Dx
	2XpqlLZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLHf-003BAE-Tp; Fri, 29 Jul 2022 08:23:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHKwQ-002sV5-B3; Fri, 29 Jul 2022 08:01:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AAE836601B5C;
	Fri, 29 Jul 2022 09:01:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659081705;
	bh=k4GSR8K8Yxmn5V+GuDbXfyZH3FJzAp24oZRJaG27Pas=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jpb7hop/Zv2vfHqKxVfvgVdmF3Fo55Qi66Jo97McWyRe/G7bE4rSCBkQYmKftX2Bu
	 1rrMvZQ4csYzwAf+ROaFzAKKy4K+ov4DNB6KYyr9790ZrQumXIcF2V0qwFMBkZcc7n
	 ESLrFQ2TSG+v+Mgn4VMhTtjCIwmrU7mL8c7pl2z8SpntYqpfEby5tTrFi3vh8VteAi
	 WLmK0p7YVnrsWA2wE33zfu02Yl5uIAhyCwSYVuyNPntzx/Oi6z4vzuFOzc6c8IqqCi
	 ZQIb6089hq3ZhmpTbnOlJej9SEyMaegDXDnez3z/+t9lYj87879RubpzHRl1BE4QbW
	 aTzg7/ynEnzfQ==
Message-ID: <2719519a-4690-4cc8-42c3-f6089d888cce@collabora.com>
Date: Fri, 29 Jul 2022 10:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4] arm64: dts: mt8173-elm: Switch to SMC watchdog
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220729032423.157144-1-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220729032423.157144-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_010150_632941_FC242C2F 
X-CRM114-Status: GOOD (  18.67  )
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

Il 29/07/22 05:24, Pin-yen Lin ha scritto:
> Switch to SMC watchdog because we need direct control of HW watchdog
> registers from kernel. The corresponding firmware was uploaded in
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
> 
> Changes in v4:
> - Rename the watchdog node (smc_watchdog -> watchdog)
> - Correct the patch summary (mt8173-oak -> mt8173-elm)
> 
> Changes in v3:
> - Remove /delete-node/ and create a new node for SMC watchdog.
> 
> Changes in v2:
> - Move the modifications to mt8173-elm.dtsi and add some comments.
> 
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index e21feb85d822..421bb2945135 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -161,6 +161,19 @@ hdmi_connector_in: endpoint {
>   			};
>   		};
>   	};
> +
> +

You don't need two blank lines, just one is enough (please fix).

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +	watchdog {
> +		compatible = "arm,smc-wdt";
> +	};
> +};
> +
> +/*
> + * Disable the original MMIO watch dog and switch to the SMC watchdog, which
> + * operates on the same MMIO.
> + */
> +&watchdog {
> +	status = "disabled";
>   };
>   
>   &mfg_async {
> 



