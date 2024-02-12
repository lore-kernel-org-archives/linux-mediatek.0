Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C122C48297
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 14:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBhb8NVYkl/KMpXruvRtYivcYNjp8Ycsj5Lx8vcGZTc=; b=omjmBms12AZQJGWko1NlKO6Xct
	r8jDbZ+d17qLVQaRAmioU4buyWXjnYDxju+cBR2/nrMuQMGZY6u+GhI3cDP/QUwpu3Xzp8oJRJhC3
	In18+RdyS7/Db1kMIfoBE+/R6K6pLSSblDqyWNEA920hdpPpa15cBlYQn3mJ53XRHj7iRt76reslo
	UvL7+eVOefbXTaqYezWgOsQxVfeoSaSLiSv4E9BBH3CSfzcjwArmsa8sv/qM4sQt8faAxIfoWh1RV
	k8hb1AG49aVvw3FhYqm9RYRboU1sQdSVbE9GHYxmjIddiSMK18mIa0/qC4cjeuyJjNde9KBr8GkjP
	BoYZnsqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZXYj-00000005pnt-1XsL;
	Mon, 12 Feb 2024 14:45:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZXYd-00000005pju-46mh;
	Mon, 12 Feb 2024 14:45:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CC99C60B54;
	Mon, 12 Feb 2024 14:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B27AC433F1;
	Mon, 12 Feb 2024 14:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707749118;
	bh=Uy1Hm9Mf3DmrZrxeQWTmF971xd/SzhqApTD6KqZ4D6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RoOMYfZKgD8COEAhzGgUFwSARdrtr2Vc5dPquEXPszpOgD/5ee88wy6GdU4Sd0BQb
	 +8x1GyckSVT3oJUYR5azNO9cLuStG8b1Jb1SgfQnT3fJXbfnTfmsm7oOKQ1BHJ1XoI
	 v/wP6LARAixstuhtEmq2PHwvN+NUSEEGxAy4pqK59xpwz5YWy2pX9YEU4es5USbDxa
	 AnyTbH6MBUHlBhIDvTY4+9suY42Rj5MQRI72UQYexuB9r1/a42PzfQ0eguEXKienvo
	 scdFV71Hpi8/GRTzpW2pPoJCkwnKzwordFgFVGTYeR1kExWjOIlE5Iozp1ekkRjN1E
	 Pu+OL9u1uiiww==
Date: Mon, 12 Feb 2024 08:45:16 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 0/3] dt-bindings: arm: mediatek: convert
 MT7622-related bindings to the json-schema
Message-ID: <20240212144516.GA301127-robh@kernel.org>
References: <20240211213925.18348-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240211213925.18348-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_064520_123987_4C210792 
X-CRM114-Status: GOOD (  12.44  )
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

On Sun, Feb 11, 2024 at 10:39:22PM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> There are more MediaTek bindings to convert but for now I focused on
> those used by MT7622.
> 
> V2: Move bindings to /clock/
>     Use clock-controller@ nodenames
>     Drop incorrectly specified "syscon"
> 
> V3: Update titles of all 3 bindings
>     Simplify HIFSYS compatbile (drop "items:")
> 
> Rafał Miłecki (3):
>   dt-bindings: arm: mediatek: convert hifsys to the json-schema clock
>   dt-bindings: arm: mediatek: convert PCIESYS to the json-schema clock
>   dt-bindings: arm: mediatek: convert SSUSBSYS to the json-schema clock

dt-bindings: clock: mediatek: ...

>  .../bindings/arm/mediatek/mediatek,hifsys.txt | 26 ----------
>  .../arm/mediatek/mediatek,pciesys.txt         | 25 ----------
>  .../arm/mediatek/mediatek,ssusbsys.txt        | 25 ----------
>  .../clock/mediatek,mt2701-hifsys.yaml         | 50 +++++++++++++++++++
>  .../clock/mediatek,mt7622-pciesys.yaml        | 45 +++++++++++++++++
>  .../clock/mediatek,mt7622-ssusbsys.yaml       | 45 +++++++++++++++++
>  6 files changed, 140 insertions(+), 76 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7622-ssusbsys.yaml

Presumably Stephen should take these, but you Cc'ed the timekeeping 
maintainers rather than the clock maintainers. Please use 
get_maintainer.pl.

Rob

