Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7501CC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 08:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFBBvo1Q72Gnlsd1eMUOXXzEV3l0rb61xTduiSt8CNI=; b=QNh7qUHVjUa+0B3vwVMAXql7vD
	X9RTQcDJe0Ns2HxaxrNBAXgIv7qj6e1DpmK6wEP5azX+xTiDgHnn4jKeEIyk9eSk/W+YdQPw8Ut1x
	AiOAAdH6t5m3SM/xh9oqGb/uLKPeCdeXlDyG0plTeJYbUewlSZDS/vIe4GK9AI1rWwZ8DeNtt/9T7
	0FHnTXSTe2hXmAR91pvNign1igeaejXrdP2J0BRGSu/i8w1q5/xhQLMNpPG72rSSI5nIOu4gePU5P
	VsbokC8+ylSqJrVx1JlOsWkOq3arnRs9eFBuvTLIO3D7N53KhL64U+WU3uVmGx2DOZi0XLMgs3zNB
	vKsTWR4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQuY-00CCPY-IY; Thu, 20 Oct 2022 08:28:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQuN-00CCIg-Kc; Thu, 20 Oct 2022 08:28:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 55D9D66023A3;
	Thu, 20 Oct 2022 09:28:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666254485;
	bh=Dm2sSpcy/WPT5qaMKRDCmxl/L7RXt0Zoucvbb30uh6g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q0pak6ywHzVJvhN8eGTE2FfIQO1kLkFxLeg3dP2mvNeHMiNAhPJiH6dHxHpl12qTS
	 J+8nY/2EVFTQgzz9+8s8R+lpiGRdx3sFVnpvKHLr+zDlEJi97gP7pcMbkRVYoah7tZ
	 Fpo912yLr/OKsUnex8YjcPEk9IH6tz597jXROLsb/CbNTkoMlg+thZ57HGmyBoSKtA
	 0dJPuRZZDHr5UUx54YNNFpEc/7e8LJ48W8fIK0g79/hRW+OUfi7gEidO6uzzg2biCO
	 BbE2ThRTNpQ/cQD87churaTOiy/4WhJHjnKdWi/iYUwyNJlokS/mxqQSAfs5RfiLr6
	 NaLDOuU07xU7w==
Message-ID: <b33b9d2a-f6d5-b2a7-bcb8-1ed2303c04b4@collabora.com>
Date: Thu, 20 Oct 2022 10:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 2/2] dt-bindings: iio: adc: mediatek,mt2701-auxadc: new
 32k clock
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-iio@vger.kernel.org
Cc: Gwendal Grignou <gwendal@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <f98ed7f3fc15a0614443a57427d46ce17ec2e0cc.1666190235.git.daniel@makrotopia.org>
 <dbe88fd2f7ea5b2f419dce6ecb48c20e96e2e634.1666190235.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <dbe88fd2f7ea5b2f419dce6ecb48c20e96e2e634.1666190235.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_012807_831168_E7B589A7 
X-CRM114-Status: GOOD (  16.88  )
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

Il 19/10/22 16:38, Daniel Golle ha scritto:
> Newer MediaTek SoCs need an additional clock to be brought up for
> AUXADC to work. Add this new optional clock to
> mediatek,mt2701-auxadc.yaml.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   .../bindings/iio/adc/mediatek,mt2701-auxadc.yaml          | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> index 7f79a06e76f596..c2a1813dd54152 100644
> --- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> @@ -44,10 +44,14 @@ properties:
>       maxItems: 1
>   
>     clocks:
> -    maxItems: 1
> +    maxItems: 2
> +    minItems: 1
>   
>     clock-names:
> -    const: main
> +    items:
> +      - const: main
> +      - const: 32k

You're adding this for MT7986, and I don't see any 32KHz ADC clock on that SoC.
I suppose that your '32k' clock is CLK_INFRA_ADC_FRC_CK, currently parented to
'csw_f26m_sel', so that's 26MHz, not 32KHz.

Since you'll need the same changes for thermal as well, I would consider setting
"infra_adc_frc" as a parent of "infra_adc_26m", like so:

	GATE_INFRA1(CLK_INFRA_ADC_26M_CK, "infra_adc_26m", "infra_adc_frc", 20),
	GATE_INFRA1(CLK_INFRA_ADC_FRC_CK, "infra_adc_frc", "csw_f26m_sel", 21),

...just because there's apparently no reason to have one of them enabled but not
the other or, at least, it looks like we *always* need ADC_26M_CK enabled when
ADC_FRC_CK is enabled.

Regards,
Angelo

