Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0FCC07E97
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 00:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXJUdpNEWT2fSRqZk39lN7kLn1cO7XXum10Kr+b8hjY=; b=gOlplx+XU/JBMy2MGDv/oRS/mC
	7SC8VUOcHkS2Colm6qsHX/5+YdGHL+bl2+6OVDmhrzjgKXCJ/g76YpLdiovHVBvSHZM6PNcOWdVes
	PYho8IqmMKaEjqWH64/ujYKn0Js4BdqrJ4xcS6aD2F1qov7d988S0Ef0oh/uZpOoNsUA2XwoZxSuk
	kAZt3Vxc1VQtqLpFrnEeT72rv2D8iOp1+op4nlw08f9hakfMlB4sJe9OUGvLhZzJwET4Vv4L38Gw8
	couIPRJtzC9mQO2r9nbLMnvWrbrDt8VYPs0vSGWV8/Z1ADrQuMILFdTBHqoAdUuDlTT4j5BSVJ5Gj
	7ZbSE9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7lzZ-003kR1-2V;
	Tue, 28 Nov 2023 00:30:21 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7lzW-003kQ7-0U;
	Tue, 28 Nov 2023 00:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RXJUdpNEWT2fSRqZk39lN7kLn1cO7XXum10Kr+b8hjY=; b=bbRTvQC+J9K35PMLvA3Fco0upj
	MXvAojVmeMrAECfyRQc8vr4zJyenwbw1Aq9RVLf+xuTx1nDokvAvv+jB4Q+m1xMBedxW2YYu/gD+O
	bg8gkORBNviUZkOVH9FgDPBXzSSfTkta8T90HtZC9wcOFK4jLQb1Da3edMOC6eLS64kc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r7lzM-001Ou7-Jn; Tue, 28 Nov 2023 01:30:08 +0100
Date: Tue, 28 Nov 2023 01:30:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH RFC v3 6/8] dt-bindings: net: Document Qcom
 QCA807x PHY package
Message-ID: <19605736-0f67-4593-a9ae-0e5c4578648f@lunn.ch>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-7-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126015346.25208-7-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_163018_189074_68A8BD45 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

> +$ref: ethernet-phy-package.yaml#
> +
> +properties:
> +  qcom,package-mode:
> +    enum:
> +      - qsgmii
> +      - psgmii
> +
> +  qcom,tx-driver-strength:
> +    description: set the TX Amplifier value in mv.
> +      If not defined, 600mw is set by default.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [140, 160, 180, 200, 220,
> +           240, 260, 280, 300, 320,
> +           400, 500, 600]

This is O.K, you are describing package properties, even if i don't
agree about qcom,package-mode.

> +patternProperties:
> +  ^ethernet-phy(@[a-f0-9]+)?$:
> +    $ref: ethernet-phy.yaml#
> +
> +    properties:
> +      gpio-controller:
> +        description: set the output lines as GPIO instead of LEDs
> +        type: boolean
> +
> +      '#gpio-cells':
> +        description: number of GPIO cells for the PHY
> +        const: 2

But now you are describing PHY properties. These belong on a .yaml of
its own, just like qca,ar803x.yaml defines properties for the AR803x
PHY.

	Andrew

