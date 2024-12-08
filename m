Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6E8E7717D
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Dec 2024 01:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVE1g6JOaWoyD1d2etZ8XoUWUf0aJM+RLjA/YQA7vHM=; b=SJOk6N4Z6AuWowWZi4KGyxcsEj
	K3sb7D2PhvyP+EMWAcqP5cuAkD54TEoZ613b5F0YSwwoL+9Oy93NOo085H6o7O2YAjeEumhFey6sp
	hb1Mu2qmkiGuu2v84T0Aaje8ZaUqcmgp2aIK3dh2anU/ZyIS1YGGWE8enTczwm85WTZQQb5fUtkOY
	WEMIroYxTNjFMminJ7kYzjSuHIG2tkFBMLnVPlQmkb1PvQQIcxbKksb39fbqBZTyGIlXf1ei6yVjj
	v9U07+n+ysltApt8QF2Jv3TTcR90doKsuIkD1BwDVc0EDvwh/jVDsPEYmlFikiZ/VwXEjHPltD6L1
	4JQi8VyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK6PW-00000004gNC-0MGY;
	Sun, 08 Dec 2024 01:48:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK6OT-00000004gH3-29Sl;
	Sun, 08 Dec 2024 01:47:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0019AA403D5;
	Sun,  8 Dec 2024 01:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B4EC4CECD;
	Sun,  8 Dec 2024 01:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733622451;
	bh=psQ5GMnf4rJXcmuiIZaepV21KhxnioKMXbB542RhZKo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=i/IhdKaF6S9PFRirdpX+D/yTb+4EgZcgi/tjM+A/WMU+nMZlWULmy/LoU7I41kfdk
	 6QqZwXBSJtXVne+mE7xB4nrxgSdfTMOlgljYW53DXY5qGPMThsBoaT/++CpkUbQJiY
	 A9y3h3E85ExIvL6nmtfnz8jcZDhCc9lj7vbrmc2T7JfYGgTEjW3kDRh0k2sSpk7h55
	 0I19zbKqX53lWBAuWNhEClVRl6qIQ1DFPtkAgU3zvNOZ7eJ0OzmdFeq7bJ+BYLXQKQ
	 SiqcPmwTkgBzbqTXAplzOs3qxc998RgSuz6vja4681SVGV1akMaMOsPLMEKZcDlly4
	 Rm2l3dAHRIH1Q==
Date: Sat, 07 Dec 2024 19:47:29 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, 
 linux-mediatek@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 upstream@airoha.com, "David S. Miller" <davem@davemloft.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, Vladimir Oltean <olteanv@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20241208002105.18074-5-ansuelsmth@gmail.com>
References: <20241208002105.18074-1-ansuelsmth@gmail.com>
 <20241208002105.18074-5-ansuelsmth@gmail.com>
Message-Id: <173362244923.3602058.6036855102171988535.robh@kernel.org>
Subject: Re: [net-next PATCH v10 4/9] dt-bindings: mfd: Document support
 for Airoha AN8855 Switch SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_174733_652930_73F949E5 
X-CRM114-Status: GOOD (  11.57  )
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


On Sun, 08 Dec 2024 01:20:39 +0100, Christian Marangi wrote:
> Document support for Airoha AN8855 Switch SoC. This SoC expose various
> peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
> 
> It does also support i2c and timers but those are not currently
> supported/used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/mfd/airoha,an8855-mfd.yaml       | 185 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 186 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.example.dtb: mdio: mfd@1:reg: [[1], [2]] is too long
	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241208002105.18074-5-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


