Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9758C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 09:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aeCORxMFzKT2TagWUxofrc2tbwNMnGz0p+G7uiYeXLs=; b=3tZF+SCzEJxFXPLQsSlT3oElPx
	UUgonO3dH03HwycPWY3whp6a0vNiGhki6yGHyVlfY4vh+cgTzHIZrTdQrQGjA+uk+PL1vovgyYhOW
	UGFgO9flmbtB+DJn9ZqQuGyuzoSQEC+gq/ggvGA/fTlJNZ+gpBV2SYfu9EEeht/uG7kYIyjZ0o2Xz
	qMgQHiwxbnMglrTFQL2Dd9Dke/EBuWPLTTUt035+Fy/T3emAo5Xh1oa7hvPukIJ97u4bqmnVHvr3f
	ldKlSqaLoXNXkp3JpSLyZebL+GlXpcWle7fb0BWqANl/9n4zeGdWWNKQKDg2fE5a87ey3DvLrS9oZ
	mm/OoY9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9oR-00A4S2-8z; Wed, 02 Nov 2022 09:13:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9oG-00A4Eg-1i; Wed, 02 Nov 2022 09:13:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 53B9766015E4;
	Wed,  2 Nov 2022 09:13:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667380398;
	bh=yddB8YzbDqd9GZ4u8pL6Zol8d3iPlUtOe1y4r884crs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jhctdhIkhVmddWdje6jcB76l5ca/7YUVPZs61kGwkJO/cVz37YWfDHEQSuK9YFGzC
	 7+IT0gHZC3aBoS2M+/NwNHePwRSV5dGRhhUU90yrfC4KS4w9fDSQQ50dmgTCkMl3lX
	 98yLtzUOTA8yZebHdWo2Q9qd72HMjMGAxkCA0Eg3wOEqB/RndIpxJsZJnlYMoCSAX8
	 8/nShXz+TBvnTZ7/Niu8zrTcL60yviUi9+uCKQUTjHa5khNmLElHyy9Aw/fdZ2C4OL
	 l8RY33ATCTYDNCf5XV5OnYtGNAxzxI+Db+Z1bgGSqoFosXFTR4jaHrd21u1C0hwgNv
	 +yNPSVRrSEghg==
Message-ID: <1f0bb630-20b0-160e-a530-05fae7572b10@collabora.com>
Date: Wed, 2 Nov 2022 10:13:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 1/2] dt-bindings: dsp: mediatek: Add default clock
 sources for mt8186 dsp
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Yaochun Hung <yc.hung@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221101061137.25731-1-tinghan.shen@mediatek.com>
 <20221101061137.25731-2-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221101061137.25731-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_021320_256690_5FD68158 
X-CRM114-Status: GOOD (  20.37  )
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

Il 01/11/22 07:11, Tinghan Shen ha scritto:
> Add the default clock sources used by mt8186 dsp.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   .../devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> index 3e63f79890b4..4cc0634c876b 100644
> --- a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> @@ -35,11 +35,15 @@ properties:
>       items:
>         - description: mux for audio dsp clock
>         - description: mux for audio dsp local bus
> +      - description: default clock source for dsp local bus
> +      - description: default clock source for dsp core
>   
>     clock-names:
>       items:
>         - const: audiodsp
>         - const: adsp_bus
> +      - const: mainpll_d2_d2
> +      - const: clk26m
>   
>     power-domains:
>       maxItems: 1
> @@ -82,9 +86,11 @@ examples:
>                 <0x1068f000 0x1000>;
>           reg-names = "cfg", "sram", "sec", "bus";
>           clocks = <&topckgen CLK_TOP_AUDIODSP>,
> -                 <&topckgen CLK_TOP_ADSP_BUS>;
> -        clock-names = "audiodsp",
> -                      "adsp_bus";
> +                 <&topckgen CLK_TOP_ADSP_BUS>,
> +                 <&topckgen CLK_TOP_MAINPLL_D2_D2>,
> +                 <&clk26m>;
> +        clock-names = "audiodsp", "adsp_bus",
> +                      "mainpll_d2_d2", "clk26m";

You are assigning those clocks just to be able to call clk_set_parent() in
the DSP mt8186-clk driver... and that's not necessary, nor it is the best
way of doing what you're trying to.

In reality, you don't need to add new clocks and you don't need to manage
that into the driver, as you can simply assign clock parents in devicetree
... like:

assigned-clocks = <&topckgen CLK_TOP_AUDIODSP>, <&topckgen CLK_TOP_ADSP_BUS>;
assigned-clock-parents = <&clk26m>, <&topckgen CLK_TOP_MAINPLL_D2_D2>;

without any clk_set_parent() call in the driver.

When the driver will call clk_prepare_enable() for top_audiodsp and/or for
top_adsp_bus, the assigned parents' refcount will also be increased (and
if the parent clock is not enabled, the clk framework will enable it).

Regards,
Angelo


