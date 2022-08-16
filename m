Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512A4C25B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 21:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+8oYnnpdIhRIEGZGcK4qOgJpnQIoppLCcEyPpOxTNw=; b=SHXRrymBhus+o7qB7PQI4Ra2qL
	NIfkyHFrht6ZQWjebaeKdX/if+4ImGL4zYH9emgbSC4Yj8TlvLBHi3dTGLWqdUsowNuHgV9p2dIw3
	4ho4bWc0wSvDHZ1qfUzi9ZXmPtTLiJ68+VFJZtkmqwVpOCf7rOeYpcQ24ZbxcwrPLKPDEsO8dGIvR
	oZgLBquITiXIu/ltK1UcbByQS3OHhUlOxj00t5QTvKMIr5O3Dn/16zkzg6nOF+jE1vdXY9G/W1Vk1
	do4zALjSy9h/GF5kVm3gL6yaAEsmPyHp40IxbabO698KUketoT/4D3af4ttF6uu4YPAWqABjYu9p/
	wEt1o6MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO44k-0078TN-NJ; Tue, 16 Aug 2022 21:26:14 +0000
Received: from mail-il1-f175.google.com ([209.85.166.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO44Y-0078MO-Fc; Tue, 16 Aug 2022 21:26:04 +0000
Received: by mail-il1-f175.google.com with SMTP id i18so4875924ila.12;
        Tue, 16 Aug 2022 14:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=e+8oYnnpdIhRIEGZGcK4qOgJpnQIoppLCcEyPpOxTNw=;
        b=B5ud88DVfw22/hmI+1nSS4dhTezWTlMFuYlOHM02GoJky1HxQochDVkqIzlHTJ2j85
         KL3u+gBu4UJxjhmNwgv5RRmmrgDtQPyf56qbpICdqMlvIJnSiWBUvy06b5AO4lt5IWbz
         C82FnluevaDaYVlgyenu3NwJlgxVNN0OUSvdAVAg9z6onc1R2zI17YBunOrWtHuZv4Y7
         P4pViupnnrgf1V2iQFwjU2emECQrGgVR12/a9wB+wqs7VvCdxjCQlF2K8cXhOnWfCB2X
         s7JW4PWZclWPFR9jzDBVwaGsNUoEg08YmysmgUz1/gFNTv2Fh5zdKHGlcCbJB/fguwQ3
         Skkg==
X-Gm-Message-State: ACgBeo1zM4n70DojFs6P3lWhUd6t4ZhgS8B0CF2eQKSNSbPw2aVEHeMW
	LThVuLxYguqGExpnOnRtqg==
X-Google-Smtp-Source: AA6agR6EOf2Li1pE1BhUBeQSyQnTZ1kOYEa6pQmULPPxxdADWpIbayo6/yuBU0FUP3tf2Muj0m+AeA==
X-Received: by 2002:a05:6e02:1645:b0:2df:1f18:3d7f with SMTP id v5-20020a056e02164500b002df1f183d7fmr10479186ilu.281.1660685160920;
        Tue, 16 Aug 2022 14:26:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r27-20020a02aa1b000000b0034686e29f8dsm2821613jam.134.2022.08.16.14.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 14:26:00 -0700 (PDT)
Received: (nullmailer pid 2761345 invoked by uid 1000);
	Tue, 16 Aug 2022 21:25:58 -0000
Date: Tue, 16 Aug 2022 15:25:58 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH v2 7/7] dt-bindings: net: dsa: mediatek,mt7530: update
 binding description
Message-ID: <20220816212558.GA2754986-robh@kernel.org>
References: <20220813154415.349091-1-arinc.unal@arinc9.com>
 <20220813154415.349091-8-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220813154415.349091-8-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_142602_556084_7568FC9A 
X-CRM114-Status: GOOD (  36.72  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Sander Vanheule <sander@svanheule.net>, linux-kernel@vger.kernel.org, =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Aug 13, 2022 at 06:44:15PM +0300, Arınç ÜNAL wrote:
> Update the description of the binding.
> 
> - Describe the switches, which SoCs they are in, or if they are standalone.
> - Explain the various ways of configuring MT7530's port 5.
> - Remove phy-mode = "rgmii-txid" from description. Same code path is
> followed for delayed rgmii and rgmii phy-mode on mtk_eth_soc.c.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 97 ++++++++++++-------
>  1 file changed, 62 insertions(+), 35 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 530ef5a75a2f..cf6340d072df 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -13,41 +13,68 @@ maintainers:
>    - Sean Wang <sean.wang@mediatek.com>
>  
>  description: |
> -  Port 5 of mt7530 and mt7621 switch is muxed between:
> -  1. GMAC5: GMAC5 can interface with another external MAC or PHY.
> -  2. PHY of port 0 or port 4: PHY interfaces with an external MAC like 2nd GMAC
> -     of the SOC. Used in many setups where port 0/4 becomes the WAN port.
> -     Note: On a MT7621 SOC with integrated switch: 2nd GMAC can only connected to
> -       GMAC5 when the gpios for RGMII2 (GPIO 22-33) are not used and not
> -       connected to external component!
> -
> -  Port 5 modes/configurations:
> -  1. Port 5 is disabled and isolated: An external phy can interface to the 2nd
> -     GMAC of the SOC.
> -     In the case of a build-in MT7530 switch, port 5 shares the RGMII bus with 2nd
> -     GMAC and an optional external phy. Mind the GPIO/pinctl settings of the SOC!
> -  2. Port 5 is muxed to PHY of port 0/4: Port 0/4 interfaces with 2nd GMAC.
> -     It is a simple MAC to PHY interface, port 5 needs to be setup for xMII mode
> -     and RGMII delay.
> -  3. Port 5 is muxed to GMAC5 and can interface to an external phy.
> -     Port 5 becomes an extra switch port.
> -     Only works on platform where external phy TX<->RX lines are swapped.
> -     Like in the Ubiquiti ER-X-SFP.
> -  4. Port 5 is muxed to GMAC5 and interfaces with the 2nd GAMC as 2nd CPU port.
> -     Currently a 2nd CPU port is not supported by DSA code.
> -
> -  Depending on how the external PHY is wired:
> -  1. normal: The PHY can only connect to 2nd GMAC but not to the switch
> -  2. swapped: RGMII TX, RX are swapped; external phy interface with the switch as
> -     a ethernet port. But can't interface to the 2nd GMAC.
> -
> -    Based on the DT the port 5 mode is configured.
> -
> -  Driver tries to lookup the phy-handle of the 2nd GMAC of the master device.
> -  When phy-handle matches PHY of port 0 or 4 then port 5 set-up as mode 2.
> -  phy-mode must be set, see also example 2 below!
> -  * mt7621: phy-mode = "rgmii-txid";
> -  * mt7623: phy-mode = "rgmii";
> +  There are two versions of MT7530, standalone and in a multi-chip module.
> +
> +  MT7530 is a part of the multi-chip module in MT7620AN, MT7620DA, MT7620DAN,
> +  MT7620NN, MT7621AT, MT7621DAT, MT7621ST and MT7623AI SoCs.
> +
> +  MT7530 in MT7620AN, MT7620DA, MT7620DAN and MT7620NN SoCs has got 10/100 PHYs

s/got //

> +  and the switch registers are directly mapped into SoC's memory map rather than
> +  using MDIO. There is currently no support for this.

No support in the binding or driver? Driver capabilities are relevant to 
the binding.

> +
> +  There is only the standalone version of MT7531.
> +
> +  Port 5 on MT7530 has got various ways of configuration.

s/got //

> +
> +  For standalone MT7530:
> +
> +    - Port 5 can be used as a CPU port.
> +
> +    - PHY 0 or 4 of the switch can be muxed to connect to the gmac of the SoC
> +      which port 5 is wired to. Usually used for connecting the wan port
> +      directly to the CPU to achieve 2 Gbps routing in total.
> +
> +      The driver looks up the reg on the ethernet-phy node which the phy-handle
> +      property refers to on the gmac node to mux the specified phy.
> +
> +      The driver requires the gmac of the SoC to have "mediatek,eth-mac" as the
> +      compatible string and the reg must be 1. So, for now, only gmac1 of an
> +      MediaTek SoC can benefit this. Banana Pi BPI-R2 suits this.
> +      Check out example 5 for a similar configuration.
> +
> +    - Port 5 can be wired to an external phy. Port 5 becomes a DSA slave.
> +      Check out example 7 for a similar configuration.
> +
> +  For multi-chip module MT7530:
> +
> +    - Port 5 can be used as a CPU port.
> +
> +    - PHY 0 or 4 of the switch can be muxed to connect to gmac1 of the SoC.
> +      Usually used for connecting the wan port directly to the CPU to achieve 2
> +      Gbps routing in total.
> +
> +      The driver looks up the reg on the ethernet-phy node which the phy-handle
> +      property refers to on the gmac node to mux the specified phy.
> +
> +      For the MT7621 SoCs, rgmii2 group must be claimed with rgmii2 function.
> +      Check out example 5.
> +
> +    - In case of an external phy wired to gmac1 of the SoC, port 5 must not be
> +      enabled.
> +
> +      In case of muxing PHY 0 or 4, the external phy must not be enabled.
> +
> +      For the MT7621 SoCs, rgmii2 group must be claimed with rgmii2 function.
> +      Check out example 6.
> +
> +    - Port 5 can be muxed to an external phy. Port 5 becomes a DSA slave.
> +      The external phy must be wired TX to TX to gmac1 of the SoC for this to
> +      work. Ubiquiti EdgeRouter X SFP is wired this way.
> +
> +      Muxing PHY 0 or 4 won't work when the external phy is connected TX to TX.
> +
> +      For the MT7621 SoCs, rgmii2 group must be claimed with gpio function.
> +      Check out example 7.
>  
>  properties:
>    compatible:
> -- 
> 2.34.1
> 
> 

