Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE54CD98CE
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 16:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7p2Kiie/VwPTVeZsZUYTTjk6TXHw3XumFkCp16/1eI=; b=PrGH4Qm7kbEe+7ImYmlfPXwEwx
	5FBbTOLl1aHS82ErMVa6xgJRv4sSd14RmEF4ge2Brs49iGaJv7riOi3Bo86WGeNaBCJntb97x++sU
	/IY0B+IOsvCa9CS9KobC0aRKmCAKj2ynGqw0j2tE3bubgcJELLxlWLPIyMkyLeEsvMo3prDpeVQpA
	l9J0sskOHi1SdHdV1uyp/5knAhIO9S5TFBi64JfyGFJaaF93kHejSQQJ40ULam3kOAfVzGPnaBc2Y
	TILqIzDj4hqktzUtSZRV53baJd8czRUFrS6dHvHe7N/Fdi7ojiGtKynrYmqqsnNkPoYhv/MSzOKfT
	Gl466Yww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4e6-0000000BEZq-0esB;
	Fri, 12 Jun 2026 16:22:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4dw-0000000BE9r-1E95;
	Fri, 12 Jun 2026 16:22:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8753360008;
	Fri, 12 Jun 2026 16:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B1E1F00A3A;
	Fri, 12 Jun 2026 16:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781281323;
	bh=X7p2Kiie/VwPTVeZsZUYTTjk6TXHw3XumFkCp16/1eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z22YVM6WMIASp6bj1/Lj5CY65UT+3UNWrBON6qYWNpw0F0ROXkocPb7+mxyQK9JXv
	 XPhj7R63As+LKNe48ExXO+TlZCvteRV2aCuTZJYYDOLZynJgw42IRVmzFln5mPS+B9
	 W0aeKwkDtkcyMvTAMJ3T7pbJNaE6vqwB67v7GFkRfQ/p0PPxLYu0BNrTtrGo8LG3X6
	 D1uFff4UvovL0WBLq7iZRvv12GLKLps4GmetJoUDJI0z9UwdMukaGnsxzZ7BLxz5ZP
	 pmf8rKWC/hKZSQb/2iYXEwLi/86TiQqEpUcRqfSfI7L336oBRhWagti2L1hzgefXZy
	 f667hOdnhLW7A==
Date: Fri, 12 Jun 2026 11:22:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Roger Quadros <rogerq@kernel.org>, linux-omap@vger.kernel.org,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Tony Lindgren <tony@atomide.com>,
	linux-rockchip@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Shan-Chun Hung <schung@nuvoton.com>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: syscon: Disallow simple-bus
 with syscon
Message-ID: <178128132175.1153833.2573734544472661843.robh@kernel.org>
References: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
 <20260608-n-dt-bindings-simple-bus-syscon-v3-1-4eba9ec1212a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v3-1-4eba9ec1212a@oss.qualcomm.com>
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


On Mon, 08 Jun 2026 22:44:24 +0200, Krzysztof Kozlowski wrote:
> "syscon" is a system controller with registers having their own
> functions, thus not really a trivial MMIO simple bus.  "simple-bus" on
> the other hand is just a bus on which multiple devices sit and the
> "simple" means no functions are allowed here.
> 
> Combination of both "syscon" and "simple-bus" is abuse of DT for easier
> instantiating of Linux device drivers so add a schema to disallow that.
> 
> Unfortunately there are a few old cases of that patterns, so add
> exceptions:
> 
> 1. "cznic,turris1x-cpld" and "img,pistachio-cr-periph" are already used
>    in upstream DTS.
> 
> 2. TI has several DTSI with a child of SCM device (e.g. "ti,am3-scm")
>    using "syscon" and "simple-bus" but without a dedicated compatible
>    documented anywhere.  Add new compatibles for such cases.
> 
> Additionally, add comments around code enforcing two or three
> compatibles: it is similar safeguard detecting incorrect bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v3:
> 1. s/ti,omap5-scm-conf/ti,omap5-sysc-padconf-global/ because it is more
>    appropriate (specific)
> 2. Add comments, why simple-mfd+syscon has dedicated if:then:
> 
> Changes in v2:
> 1. Complete patch. I accidentally sent only part of it, built on top of
>    internal WIP which I forgot to squash.
>    I received Ack from Rob, but change is significant, so please kindly
>    re-review.
> ---
>  .../devicetree/bindings/mfd/syscon-common.yaml     | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


