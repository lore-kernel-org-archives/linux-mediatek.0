Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24180C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 22:03:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4D2D61428
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 22:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4D2D61428
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5t08ykhrEtfXHYFhbpn6tKFX+hNklTHteMO1mDBf8qM=; b=h4qHo61rYj2ehviJe9PTfgmUG
	UwJbcEObCkZ3oiNC+mw8+dyweVi2qAx75ABSvd3L0slrsL05JUeAHfJpfa+ZIfgYxnE7YAwUZ0g3T
	E1W3dusgXhai0DLgGxlHntYZ9lSuLC2AqY9IK895YQnZBsQ1klBcT5lafTNaDt8auVtSHwGzF9hnC
	sgZCfGfM+88H1YDr4cH7UXQ4wnpYIgSIq9a6AcFoDLAwb1vOLMfBPE5/k0mVXtB12/5ZOZtqA33ay
	uwWoICKhppjix4VB0xC/r2AQD4VM4Dy8PsO/pJc8Q4dr9dEi17LFHb19MxD5/tegrxXBxP90IPV0S
	IVzbtnq2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZKwQ-00FG5I-6C; Wed, 21 Apr 2021 22:03:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZKw7-00FG4E-UE; Wed, 21 Apr 2021 22:03:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YyWRRR5pID7wLfiSPpITLgjBSDaDSiWNgGz2ZVQAVm4=; b=ZwKmuC++sR6UtCbO691mqkPTWH
 6BwCrYJ4ATRvEU7pwYHxN9hvCuBX+boLtVbTUXUF/3umPRZosdZN0dRhE2ExuK+ETWkRKfbsYu5jD
 VeBcpAb1nOZRnXOVN6vUqLN9aCPHo5w6K/Hkgr9JsvTRysHLKkDZTD5ZB+V50kdsc2wkC6czDO84Q
 CLTwniNhJRyM7zNZkpGzT02O7EMajrMI353u+aDD0SevgNEa0uBFkbNfYiOfb8/92eBObB5ZEZhi7
 TVtHZ3pmiEQMJIykBDaX41QxqYt48qMLuE7CuRAB3LTugimkdk6bK6ACD4u1XBI6YZV4IML7zXNv0
 BL58TlxQ==;
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZKw5-00DDXJ-71; Wed, 21 Apr 2021 22:03:06 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 g4-20020a9d6b040000b029029debbbb3ecso7338752otp.7; 
 Wed, 21 Apr 2021 15:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YyWRRR5pID7wLfiSPpITLgjBSDaDSiWNgGz2ZVQAVm4=;
 b=oPu4RJj/3b/yk7/SAzXcPx+rRRadR9O7WX0E/lU6ASoHJd6mCAzLle3V6Wl3+tbitV
 jaQcinCp/9Klrcjz6px3UVEfXHc9EAp5EMySvvU4nVtbTYdEa1QEZMSC4n7qiMiPO5V3
 h/ypFdXZpYNErN7EboRjSrC6XxOWW3Cf5knB0dYsR7b3d09tU7Gx8XasguCkceh/N5lU
 kcr1r0UX09n43xQZGE/kw3YVOnFTXI3IMAaokXGwZczlK2IGrKBeMAvt6fgVNxtLgdJA
 rWyrhJRJEUE/9qmOpdln/B/mvCFXg+5YF5X8M33v+6ntDkUJcJHYxgW07hFo5uS8ukhM
 UeGQ==
X-Gm-Message-State: AOAM530KMDX4hQU7tFAojhMrxwDdmcsrzCcrOdcrTXgOarKdJ8PxC090
 u1ovW4v6IwZbxp4t++JEqQ==
X-Google-Smtp-Source: ABdhPJzSgNh0eNuEFHn0OFogk6iPvpAuniBWUk4gpFN/M9tEV9RdIvzxu7w4iRlWdvf0PZgHYwNEIQ==
X-Received: by 2002:a05:6830:158e:: with SMTP id
 i14mr258106otr.154.1619042584165; 
 Wed, 21 Apr 2021 15:03:04 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v12sm163185ota.63.2021.04.21.15.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 15:03:03 -0700 (PDT)
Received: (nullmailer pid 1695324 invoked by uid 1000);
 Wed, 21 Apr 2021 22:03:02 -0000
Date: Wed, 21 Apr 2021 17:03:02 -0500
From: Rob Herring <robh@kernel.org>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 John Crispin <john@phrozen.org>
Subject: Re: [PATCH] dt-bindings: net: mediatek/ralink: remove unused bindings
Message-ID: <20210421220302.GA1637795@robh.at.kernel.org>
References: <20210420024222.101615-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210420024222.101615-1-ilya.lipnitskiy@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_150305_280960_B49ED572 
X-CRM114-Status: GOOD (  24.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Apr 19, 2021 at 07:42:22PM -0700, Ilya Lipnitskiy wrote:
> Revert commit 663148e48a66 ("Documentation: DT: net: add docs for
> ralink/mediatek SoC ethernet binding")
> 
> No in-tree drivers use the compatible strings present in these bindings,
> and some have been superseded by DSA-capable mtk_eth_soc driver, so
> remove these obsolete bindings.

Looks like maybe OpenWRT folks are using these. If so, you can't revert 
them.

> 
> Cc: John Crispin <john@phrozen.org>
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
>  .../bindings/net/mediatek,mt7620-gsw.txt      | 24 --------
>  .../bindings/net/ralink,rt2880-net.txt        | 59 -------------------
>  .../bindings/net/ralink,rt3050-esw.txt        | 30 ----------
>  3 files changed, 113 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/mediatek,mt7620-gsw.txt
>  delete mode 100644 Documentation/devicetree/bindings/net/ralink,rt2880-net.txt
>  delete mode 100644 Documentation/devicetree/bindings/net/ralink,rt3050-esw.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek,mt7620-gsw.txt b/Documentation/devicetree/bindings/net/mediatek,mt7620-gsw.txt
> deleted file mode 100644
> index 358fed2fab43..000000000000
> --- a/Documentation/devicetree/bindings/net/mediatek,mt7620-gsw.txt
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Mediatek Gigabit Switch
> -=======================
> -
> -The mediatek gigabit switch can be found on Mediatek SoCs (mt7620, mt7621).
> -
> -Required properties:
> -- compatible: Should be "mediatek,mt7620-gsw" or "mediatek,mt7621-gsw"
> -- reg: Address and length of the register set for the device
> -- interrupts: Should contain the gigabit switches interrupt
> -- resets: Should contain the gigabit switches resets
> -- reset-names: Should contain the reset names "gsw"
> -
> -Example:
> -
> -gsw@10110000 {
> -	compatible = "ralink,mt7620-gsw";
> -	reg = <0x10110000 8000>;
> -
> -	resets = <&rstctrl 23>;
> -	reset-names = "gsw";
> -
> -	interrupt-parent = <&intc>;
> -	interrupts = <17>;
> -};
> diff --git a/Documentation/devicetree/bindings/net/ralink,rt2880-net.txt b/Documentation/devicetree/bindings/net/ralink,rt2880-net.txt
> deleted file mode 100644
> index 9fe1a0a22e44..000000000000
> --- a/Documentation/devicetree/bindings/net/ralink,rt2880-net.txt
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -Ralink Frame Engine Ethernet controller
> -=======================================
> -
> -The Ralink frame engine ethernet controller can be found on Ralink and
> -Mediatek SoCs (RT288x, RT3x5x, RT366x, RT388x, rt5350, mt7620, mt7621, mt76x8).
> -
> -Depending on the SoC, there is a number of ports connected to the CPU port
> -directly and/or via a (gigabit-)switch.
> -
> -* Ethernet controller node
> -
> -Required properties:
> -- compatible: Should be one of "ralink,rt2880-eth", "ralink,rt3050-eth",
> -  "ralink,rt3050-eth", "ralink,rt3883-eth", "ralink,rt5350-eth",
> -  "mediatek,mt7620-eth", "mediatek,mt7621-eth"
> -- reg: Address and length of the register set for the device
> -- interrupts: Should contain the frame engines interrupt
> -- resets: Should contain the frame engines resets
> -- reset-names: Should contain the reset names "fe". If a switch is present
> -  "esw" is also required.
> -
> -
> -* Ethernet port node
> -
> -Required properties:
> -- compatible: Should be "ralink,eth-port"
> -- reg: The number of the physical port
> -- phy-handle: reference to the node describing the phy
> -
> -Example:
> -
> -mdio-bus {
> -	...
> -	phy0: ethernet-phy@0 {
> -		phy-mode = "mii";
> -		reg = <0>;
> -	};
> -};
> -
> -ethernet@400000 {
> -	compatible = "ralink,rt2880-eth";
> -	reg = <0x00400000 10000>;
> -
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -
> -	resets = <&rstctrl 18>;
> -	reset-names = "fe";
> -
> -	interrupt-parent = <&cpuintc>;
> -	interrupts = <5>;
> -
> -	port@0 {
> -		compatible = "ralink,eth-port";
> -		reg = <0>;
> -		phy-handle = <&phy0>;
> -	};
> -
> -};
> diff --git a/Documentation/devicetree/bindings/net/ralink,rt3050-esw.txt b/Documentation/devicetree/bindings/net/ralink,rt3050-esw.txt
> deleted file mode 100644
> index 87e315856efa..000000000000
> --- a/Documentation/devicetree/bindings/net/ralink,rt3050-esw.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Ralink Fast Ethernet Embedded Switch
> -====================================
> -
> -The ralink fast ethernet embedded switch can be found on Ralink and Mediatek
> -SoCs (RT3x5x, RT5350, MT76x8).
> -
> -Required properties:
> -- compatible: Should be "ralink,rt3050-esw"
> -- reg: Address and length of the register set for the device
> -- interrupts: Should contain the embedded switches interrupt
> -- resets: Should contain the embedded switches resets
> -- reset-names: Should contain the reset names "esw"
> -
> -Optional properties:
> -- ralink,portmap: can be used to choose if the default switch setup is
> -  llllw or wllll
> -- ralink,led_polarity: override the active high/low settings of the leds
> -
> -Example:
> -
> -esw@10110000 {
> -	compatible = "ralink,rt3050-esw";
> -	reg = <0x10110000 8000>;
> -
> -	resets = <&rstctrl 23>;
> -	reset-names = "esw";
> -
> -	interrupt-parent = <&intc>;
> -	interrupts = <17>;
> -};
> -- 
> 2.31.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
