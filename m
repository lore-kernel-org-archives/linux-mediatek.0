Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91309C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 19:48:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 643772074D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 19:48:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qvpxr5Hk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 643772074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hkft46L3NFsWqApEN4pycX8jZWVE6rqthK7RWu7w3Mo=; b=Qvpxr5HkIn6GlitFBEgrCA/JT
	H/EYt2iYUkVI58cdj5Wa40qq8aHq13qz2pE/5qDAmgttLsOovptvpl5dGbGYJw3h3dV+J4WIa8HA0
	3sphb4ZbwPg6TzZcDspnwODxR3Mv5Z4T/ClGgr+YMoSmy+4aSIi/RMjYfQEOrYdnpdCyHlhy/Ols1
	ydw311kXzv9bvmO2eLe0m3rlssMCqL8o3CFLuAlNDtwXHv4Cz7CK6Yk/21cODyw2dq16xrFbFnpMV
	Zo4EeFrJNkAj8z94aVWKs5B4iUVFLa9t6Qkw0d9eVpzMWOBlrqLdoS8U5L3r5aPdGFIADm2/kGNa5
	Csmw4HaUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAevO-0000pR-S7; Tue, 25 Aug 2020 19:48:06 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAeqe-0003Ef-Nc
 for linux-mediatek@lists.infradead.org; Tue, 25 Aug 2020 19:43:18 +0000
Received: by mail-io1-f66.google.com with SMTP id s2so13776303ioo.2
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Aug 2020 12:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xFa4K2EMnvtSpb7MXWNHE/NvCVe7Pt+4e7+jJHBanys=;
 b=n74FXHGz8nLxXLC15eQqHXHlvvmqk7tDtJuKK2BfKHN6R6fq/xr5WnbcZGrx5m9SPe
 HZQD2eZnlxP/QLCtT5pGL6LqIcLNYFyR5jWl1gOK3W3Wpm0qtAYEZLWt/lsoj/QrTxml
 TwZChXGkY7J5rBYXDzqgACKiGSylz1nQM+2lhyfAzk68EIDEMJwq89CKB//r6c3HrTGs
 YY26nvAcldBjiFcBP3oKAHM4ysBXHZDZYj9btnV9IrUwNxUvsVaZQqaUtzz/alIiObmB
 uF7UKeyFiYThZ/8Tk7+MBNXb3CW8LDZG3elCW/z/qAfBgm2xrnmZyiiGvJZm72FLb7DL
 eNCg==
X-Gm-Message-State: AOAM53273eGF8ctsL/UM3tfge247EHgHZ+GR0GimLtfpopXrNVb+txzB
 t2nWB7vWmHyjgCWTmy7t9w==
X-Google-Smtp-Source: ABdhPJw/xaJIuCeQO1r6j9JB2bC93O0bNOs9R51Cj4LIZPtj20c0bgEkzt2KrzZok2oxQxpiHdKeDg==
X-Received: by 2002:a6b:bfc1:: with SMTP id
 p184mr10370531iof.193.1598384589390; 
 Tue, 25 Aug 2020 12:43:09 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id f128sm9645725ilh.71.2020.08.25.12.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 12:43:08 -0700 (PDT)
Received: (nullmailer pid 1198512 invoked by uid 1000);
 Tue, 25 Aug 2020 19:43:06 -0000
Date: Tue, 25 Aug 2020 13:43:06 -0600
From: Rob Herring <robh@kernel.org>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Re: [PATCH net-next v2 4/7] dt-bindings: net: dsa: add new MT7531
 binding to support MT7531
Message-ID: <20200825194306.GA1160944@bogus>
References: <cover.1597729692.git.landen.chao@mediatek.com>
 <1ec38b68deec6f1c23e1236d38035b1823ea2ebf.1597729692.git.landen.chao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ec38b68deec6f1c23e1236d38035b1823ea2ebf.1597729692.git.landen.chao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_154312_846549_BE9A2CB3 
X-CRM114-Status: GOOD (  19.41  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, andrew@lunn.ch, frank-w@public-files.de,
 f.fainelli@gmail.com, dqfext@gmail.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, vivien.didelot@savoirfairelinux.com,
 linux-kernel@vger.kernel.org, opensource@vdorst.com,
 linux-mediatek@lists.infradead.org, sean.wang@mediatek.com,
 matthias.bgg@gmail.com, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 18, 2020 at 03:14:09PM +0800, Landen Chao wrote:
> Add devicetree binding to support the compatible mt7531 switch as used
> in the MediaTek MT7531 switch.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Landen Chao <landen.chao@mediatek.com>
> ---
>  .../devicetree/bindings/net/dsa/mt7530.txt    | 71 ++++++++++++++++++-
>  1 file changed, 68 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
> index c5ed5d25f642..50eaf40fb612 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
> +++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
> @@ -5,6 +5,7 @@ Required properties:
>  
>  - compatible: may be compatible = "mediatek,mt7530"
>  	or compatible = "mediatek,mt7621"
> +	or compatible = "mediatek,mt7531"
>  - #address-cells: Must be 1.
>  - #size-cells: Must be 0.
>  - mediatek,mcm: Boolean; if defined, indicates that either MT7530 is the part
> @@ -32,10 +33,13 @@ Required properties for the child nodes within ports container:
>  
>  - reg: Port address described must be 6 for CPU port and from 0 to 5 for
>  	user ports.
> -- phy-mode: String, must be either "trgmii" or "rgmii" for port labeled
> -	 "cpu".
> +- phy-mode: String, the follow value would be acceptable for port labeled "cpu"
> +	If compatible mediatek,mt7530 or mediatek,mt7621 is set,
> +	must be either "trgmii" or "rgmii"
> +	If compatible mediatek,mt7531 is set,
> +	must be either "sgmii", "1000base-x" or "2500base-x"
>  
> -Port 5 of the switch is muxed between:
> +Port 5 of mt7530 and mt7621 switch is muxed between:
>  1. GMAC5: GMAC5 can interface with another external MAC or PHY.
>  2. PHY of port 0 or port 4: PHY interfaces with an external MAC like 2nd GMAC
>     of the SOC. Used in many setups where port 0/4 becomes the WAN port.
> @@ -308,3 +312,64 @@ Example 3: MT7621: Port 5 is connected to external PHY: Port 5 -> external PHY.
>  		};
>  	};
>  };
> +
> +Example 4: MT7531BE port6 -- up-clocked 2.5Gbps SGMII -- MT7622 CPU 1st GMAC

Does this really need another example?

> +
> +&eth {
> +	gmac0: mac@0 {
> +		compatible = "mediatek,eth-mac";
> +		reg = <0>;
> +		phy-mode = "2500base-x";
> +
> +		fixed-link {
> +			speed = <2500>;
> +			full-duplex;
> +			pause;
> +		};
> +	};
> +
> +	&mdio0 {
> +		switch@0 {
> +			compatible = "mediatek,mt7531";
> +			reg = <0>;
> +			reset-gpios = <&pio 54 0>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					label = "lan0";
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					label = "lan1";
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +					label = "lan2";
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +					label = "lan3";
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +					label = "wan";
> +				};
> +
> +				port@6 {
> +					reg = <6>;
> +					label = "cpu";
> +					ethernet = <&gmac0>;
> +					phy-mode = "2500base-x";
> +				};
> +			};
> +		};
> +	};
> -- 
> 2.17.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
