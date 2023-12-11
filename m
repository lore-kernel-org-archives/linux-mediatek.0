Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68A4C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 10:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJQzGkW1aJD+v/Pryy73piwUswVyerLgbszVYvLz2KE=; b=PmezUHedJIdS7nKt5nQO0rgrWP
	3E3/Xr9f7I5KXCm8aom9xPUUxJ8XQPZUTAFDTm4/dyZVvkzsjvbfFiJaFMa7YH4DTT+zMfyvmJBd2
	vb/LrtL/5b9GoRXnoq1ineADl4VSwcr87/KfRVwhdkSglF1v8yZNKn3zMpiSfG5UwF5PeQPKVsrFq
	JygvDOAHWLgVO4J1q+D8hsjW3oj2PDniptusR2JlN453jT/zUiemB8S5gMmGvUfPMZvxEqtR+gEB3
	fd+E2d9gEjqb1V/9Grv8xvE/heQ/9lIt/CB6I4BWS+KpFnTbjEXt0EY3RPesuoXGRWFnx7ggeuG6E
	G4WxpB/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCd52-004Xdu-0h;
	Mon, 11 Dec 2023 10:00:04 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCd4w-004Xbd-0I;
	Mon, 11 Dec 2023 10:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702288796;
	bh=UGHfDCSkfnLHonKPO4l5G0OCvPlVDDc5beUYsxuWpdw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=gucwGgz7TgqspKXw8/jw6fsDjuyW7bOQ2FbacFsTr24NEuGIhLC2oyg1+u/oVYdWA
	 L+2ddLjGETBvw7qJvkiCdEaa5Ciml6W+oRx7aA8Kx7ffI5VHdk+/NO6fOfGYykZ5/m
	 m+7/qv4X8rnLnK2/H2TUHmJbyfj0wrwM5yeOlLiiFNAS1im8eM/xk6yGpqQI82inRH
	 5RkenM45KKpl/q+dVmrQ8dUIjw1vCR4J8WTY851adHRHZ9Jq/0N6RlAAnUfRBt4OD1
	 LkrnPSrpyRUNpU34mru/XQwfcAWK/KoqIsB+kkZbbyxP2op1fDDr2X1WTo4YkzjPmI
	 aR6ZWFl96AAhw==
Received: from [IPV6:fd00::2a:39ce] (cola.collaboradmins.com [IPv6:2a01:4f8:1c1c:5717::1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B076C378140E;
	Mon, 11 Dec 2023 09:59:54 +0000 (UTC)
Message-ID: <874b8a8b-7fe1-4547-828e-948ed25b7be3@collabora.com>
Date: Mon, 11 Dec 2023 10:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: clock: mediatek: add clock
 controllers of MT7988
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Jianhui Zhao <zhaojh329@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, "Garmin.Chang"
 <Garmin.Chang@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Frank Wunderlich <frank-w@public-files.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <097e82b0d66570763d64be1715517d8b032fcf95.1702158423.git.daniel@makrotopia.org>
 <93025cdb7c31bf413fb2be5a071340073a0679d1.1702158423.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <93025cdb7c31bf413fb2be5a071340073a0679d1.1702158423.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_015958_259126_F3F06B86 
X-CRM114-Status: GOOD (  20.38  )
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

Il 09/12/23 22:55, Daniel Golle ha scritto:
> Add various clock controllers found in the MT7988 SoC to existing
> bindings (if applicable) and add files for the new ethwarp, mcusys
> and xfi-pll clock controllers not previously present in any SoC.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v4:
>   * add subnodes for controllers acting as MFD
> 
> v3:
>   * move clock bindings to clock folder
>   * drop ti,syscon-reset from bindings and example
>   * merge mcusys with topckgen bindings
> 
> v2:
>   * dropped unused labels
>   * add 'type: object' declaration for reset-controller found in new
>     ethwarp controller and represented as ti,syscon-reset
>   * rebase on top of
>     "dt-bindings: arm: mediatek: move ethsys controller & convert to DT schema"
> 
>   .../arm/mediatek/mediatek,infracfg.yaml       |  1 +
>   .../bindings/clock/mediatek,apmixedsys.yaml   |  1 +
>   .../bindings/clock/mediatek,ethsys.yaml       |  1 +
>   .../clock/mediatek,mt7988-ethwarp.yaml        | 66 +++++++++++++++++++
>   .../clock/mediatek,mt7988-xfi-pll.yaml        | 48 ++++++++++++++
>   .../bindings/clock/mediatek,topckgen.yaml     |  2 +
>   .../bindings/net/pcs/mediatek,sgmiisys.yaml   | 61 ++++++++++++++---
>   7 files changed, 171 insertions(+), 9 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml
>   create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml
> 

..snip..

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml
> new file mode 100644
> index 0000000000000..e126f3fe0856c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/mediatek,mt7988-ethwarp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT7988 ethwarp Controller
> +
> +maintainers:
> +  - Daniel Golle <daniel@makrotopia.org>
> +
> +description:
> +  The Mediatek MT7988 ethwarp controller provides clocks and resets for the
> +  Ethernet related subsystems found the MT7988 SoC.
> +  The clock values can be found in <dt-bindings/clock/mt*-clk.h>.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt7988-ethwarp
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  reset-controller:
> +    type: object
> +    properties:
> +      compatible:
> +        const: ti,syscon-reset
> +
> +    # TODO: Convert to DT schema
> +    additionalProperties: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/ti-syscon.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@15031000 {
> +            compatible = "mediatek,mt7988-ethwarp", "syscon", "simple-mfd";
> +            reg = <0 0x15031000 0 0x1000>;
> +            #clock-cells = <1>;
> +
> +            reset-controller {
> +                compatible = "ti,syscon-reset";

NACK! This is not the right way to do it. Please do *not* use ti,syscon-reset.

Declare your resets in the relevant clock controller driver, like was done with
all (or the vast majority of) the other MediaTek clock drivers.

This means that you don't need simple-mfd here (and probably syscon as well).

Regards,
Angelo



