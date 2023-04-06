Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E965C76196
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 09:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFW9QAC4jikZoW0W2zc6Rt5f0q20NRSct6hUZozJsV0=; b=3rSg3wyQAzXo5A5Nt9kwcnbMf/
	Zu4PO/oLa+Nh3ldA0Bch8i2anmL1EYWeKRzZAs1Z1lu3f4/kGYhl0aS2yrURyyWonT7Zwc2mPoHoO
	MDPXjPxFRe5bj1P4LlrtJ4975t6GGGpfg7XaSaawWCTSVrx5q1A+pFWaesGfhlgb8QJGVGPtnuo3J
	u4q+lNArWq2LMt6Gd0S8iqnz6GGpYYHt3hxiTiov8pGt/sJrGLQECcMds+N8XjYjIimWRJG47WnIk
	D2x6etnah7x9U8gdUIkYwiveyQtXsOKUD+B14jL4eVFPlMzDoStEDmSZYmKEKWIiESpycv0V1zP8h
	C1mgTpJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkMCw-006uj7-1A;
	Thu, 06 Apr 2023 09:47:06 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkMCq-006ufZ-37;
	Thu, 06 Apr 2023 09:47:02 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pkMCb-00009F-1W;
	Thu, 06 Apr 2023 11:46:45 +0200
Date: Thu, 6 Apr 2023 10:46:42 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: arinc9.unal@gmail.com
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/7] dt-bindings: net: dsa: mediatek,mt7530: improve MCM
 and MT7988 information
Message-ID: <ZC6VAgweb58mfYku@makrotopia.org>
References: <20230406080141.22924-1-arinc.unal@arinc9.com>
 <20230406080141.22924-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230406080141.22924-2-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_024701_004437_CFA21547 
X-CRM114-Status: GOOD (  24.24  )
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

On Thu, Apr 06, 2023 at 11:01:36AM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Improve the description of the schema.
> 
> The MT7620 SoCs described are not part of the multi-chip module but rather
> built into the SoC. Mention the MT7530 MMIO driver not supporting them.
> 
> Move information for the switch on the MT7988 SoC below MT7531, and improve
> it.
> 
> List maintainers in alphabetical order by first name.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Acked-by: Daniel Golle <daniel@makrotopia.org>

> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 25 ++++++++++---------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 6df995478275..7045a98d9593 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -8,29 +8,30 @@ title: MediaTek MT7530 and MT7531 Ethernet Switches
>  
>  maintainers:
>    - Arınç ÜNAL <arinc.unal@arinc9.com>
> +  - Daniel Golle <daniel@makrotopia.org>
>    - Landen Chao <Landen.Chao@mediatek.com>
>    - DENG Qingfang <dqfext@gmail.com>
>    - Sean Wang <sean.wang@mediatek.com>
> -  - Daniel Golle <daniel@makrotopia.org>
>  
>  description: |
> -  There are three versions of MT7530, standalone, in a multi-chip module and
> -  built-into a SoC.
> +  There are three versions of MT7530, standalone, in a multi-chip module, and
> +  built into an SoC.
>  
> -  MT7530 is a part of the multi-chip module in MT7620AN, MT7620DA, MT7620DAN,
> -  MT7620NN, MT7621AT, MT7621DAT, MT7621ST and MT7623AI SoCs.
> -
> -  The MT7988 SoC comes with a built-in switch similar to MT7531 as well as four
> -  Gigabit Ethernet PHYs. The switch registers are directly mapped into the SoC's
> -  memory map rather than using MDIO. The switch got an internally connected 10G
> -  CPU port and 4 user ports connected to the built-in Gigabit Ethernet PHYs.
> +  MT7530 is a part of the multi-chip module in MT7621AT, MT7621DAT, MT7621ST and
> +  MT7623AI SoCs.
>  
>    MT7530 in MT7620AN, MT7620DA, MT7620DAN and MT7620NN SoCs has got 10/100 PHYs
> -  and the switch registers are directly mapped into SoC's memory map rather than
> -  using MDIO. The DSA driver currently doesn't support MT7620 variants.
> +  and the switch registers are directly mapped into the SoC's memory map rather
> +  than using MDIO. The MT7530 MMIO driver currently doesn't support these SoCs.
>  
>    There is only the standalone version of MT7531.
>  
> +  The MT7988 SoC comes with a built-in switch with four Gigabit Ethernet PHYs.
> +  The characteristics of the switch is similar to MT7531. The switch registers
> +  are directly mapped into the SoC's memory map rather than using MDIO. The
> +  switch has got an internally connected 10G CPU port and 4 user ports connected
> +  to the built-in Gigabit Ethernet PHYs.
> +
>    Port 5 on MT7530 has got various ways of configuration:
>  
>      - Port 5 can be used as a CPU port.
> -- 
> 2.37.2
> 

