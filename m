Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41525C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 12:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ss/fT0+pO2ebylXMeYPiNzF/F4IOL0SlP8TBBIfYEPk=; b=RhmPRkEU3Fw5v5JuFJS5HYMhhC
	vou0rkwOiZ8Xr0lm3j59AgPT65hif+tK1tLTw8zb5QeI5QGF/FrLQy92/kiFIfNvYel/4Xmkiydvh
	o0HGCvXBQF5cygN0VbWc16y9qfFFMqp7scZxyrOvi7qP2ph/LdwVV1vwadjTqidFBAL2WJfU54Ono
	Y52Q3g9YLYrhc+d8R/W0Jom41fnBdbvRGU9rzfRPFWygxvYLo6zQhZe+uBgH50CADukOaoHCjIPjS
	D5cfiEJDt8K3q2350gCTMVLnC5sPUlgBj79YBU81XpN+FLvfXNmd0Ktu4EHHnS5GXsywOLJLBezFz
	iPBNp+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7m4-000uX6-MF; Wed, 18 Jan 2023 12:42:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7kK-000tnA-QK; Wed, 18 Jan 2023 12:40:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D6E4B6602DFF;
	Wed, 18 Jan 2023 12:40:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674045651;
	bh=d1VJaoCiBYN9H4WMqdtd45SqyAGkM54Qn323yEvTnfo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bSCQNxvwq+RnF5fjdoYlS+3/XzYavSvIw+jkPUHqNToe2FCgqXlX+T2ZY2wnVpmb6
	 0FGsQUDRJbctYXqWSsshfl6ZXR/WpSn6yVDIq4yUwLnC0G/tXdnHnj7UA18/NQ2LBQ
	 0jlG11pESs19ATpy/y9qNX/tnjgcSisnSwVnOH9jDjkgjDR49bHEVvhPpRrKDopuBx
	 mRloBrRvx6cZSVZzMz9RG9ivtEXJscQ5fdsNOgQyuoCyuRIJpkj+v9hdOfva6fxsMl
	 0gKWq9MDrQ37vJ6FRFJrtJcwwxfViJIDV7VO5wkS6khHN6GAxOAd56LI5typyqmu8J
	 LdHz+csEE+Q9Q==
Message-ID: <5fe09a71-7d86-ed55-fdd1-c5608a333f5a@collabora.com>
Date: Wed, 18 Jan 2023 13:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 5/9] arm64: dts: mediatek: mt8186: Add ADSP node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 dri-devel@lists.freedesktop.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
 <20230118091829.755-6-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230118091829.755-6-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_044053_044057_33AC0891 
X-CRM114-Status: GOOD (  14.33  )
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

Il 18/01/23 10:18, Allen-KH Cheng ha scritto:
> Add ADSP node for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index a0b7dacc10cd..2700c830316f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -640,6 +640,26 @@
>   			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH 0>;
>   		};
>   
> +		adsp: adsp@10680000 {
> +			compatible = "mediatek,mt8186-dsp";
> +			reg = <0 0x10680000 0 0x2000>,
> +			      <0 0x10800000 0 0x100000>,
> +			      <0 0x1068b000 0 0x100>,
> +			      <0 0x1068f000 0 0x1000>;

reg = <0 0x10680000 0 0x2000>, <0 0x10800000 0 0x100000>,
       <0 0x1068b000 0 0x100>, <0 0x1068f000 0 0x1000>;

reaching 82 columns, which is fine.

Regards,
Angelo

