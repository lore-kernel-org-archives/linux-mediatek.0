Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD87C197A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 20:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JznYf3WwK2ea80O29WWc1jrp4vT2fXc+cuKeytbFeKE=; b=uJl98lQzw8v+pmzn/TVZUAPpeS
	jSfk+WzZuShT0dRxhm5DSFQxpnms8j9ak4UK9fk+3/YZcOoJDLTzpTGBRcTXU2LzW+bd5yMvFmOLj
	ZLLAXXQigSUHYouQptlW/p30r2a/bnURwzmn2YQk6sFYjINfchIps9S7XizWF04e69/ytIJE3woNj
	CCGmN2X147W4dEKzbnrmoZiYMwIju+2JVagCyodGRFwo5t2iZUj0z2PtD+iEbBK7xJ1IfoCOMknAP
	w5RPQCZFNF7eLsCjWyCtOJ0qujM0TUl/Zidmqax11w96Ra9LQwTifyu8Io5Klmm1qTcMPv5eyLjuj
	bF3yg3+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Ag3-00EljF-0O;
	Mon, 20 Nov 2023 20:15:27 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Afz-00EliX-0v;
	Mon, 20 Nov 2023 20:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JznYf3WwK2ea80O29WWc1jrp4vT2fXc+cuKeytbFeKE=; b=XOJgjdCCfmr8LYhyR6y2QLGjiI
	jNSPz3w8oBz7kr7v3PA2TyUDWtVP7sM2dHQglVtug6mHRl9a2QqP4QmALdE4IzXAPSQaeZ7EyXq9K
	dMLQEVqh9lMtTu6HwSRbbwVoE80GjYy8Xafcxep2ngc6pjehMOXe27wov2DrCj1miVaI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r5Afg-000gaj-G4; Mon, 20 Nov 2023 21:15:04 +0100
Date: Mon, 20 Nov 2023 21:15:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
Message-ID: <14c3900f-8f2e-4614-8317-f85763d1d953@lunn.ch>
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_121523_349893_CCBCB7B5 
X-CRM114-Status: GOOD (  10.27  )
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

> +Naming and Valid Characters
> +---------------------------
> +
> +1. Node and property names are allowed to use only:
> +
> +   * lowercase characters: [a-z]
> +   * digits: [0-9]
> +   * dash: -
> +
> +2. Labels are allowed to use only:
> +
> +   * lowercase characters: [a-z]
> +   * digits: [0-9]
> +   * underscore: _
> +
> +3. Unit addresses should use lowercase hex, without leading zeros (padding).
> +
> +4. Hex values in properties, e.g. "reg", should use lowercase hex.  The address
> +   part can be padded with leading zeros.
> +
> +Example::
> +
> +	gpi_dma2: dma-controller@800000 {
> +		compatible = "qcom,sm8550-gpi-dma", "qcom,sm6350-gpi-dma";
> +		reg = <0x0 0x00800000 0x0 0x60000>;
> +	}

Hi Krzysztof

What i like about the Linux Coding Style is that most sections have a
Rationale. I like the way it explains the 'Why?'. It makes it feel
less arbitrary. When it does not seem arbitrary, but reasoned, i find
it easier to follow.

Could you add rationale like the Coding Style?

      Andrew

