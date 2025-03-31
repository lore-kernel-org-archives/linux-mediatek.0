Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F999C36019
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuiLyf+DP6K0vqCLha7nUx/krAp7T39xdEwwAFkGyMg=; b=cfAD6UrYNOnW+WpBbJq6EQM2HL
	0KdzeVVDyWwhTySWg3qfJVSNWTMpO9+w3lrAKlUBMrgd+rYItF5MxRfIWIvcdK4DCqJn21onuMWE9
	qSNlocy0dgiRr9WACSJB1Bk2nRrwCTRTFOPHcmyNpNjoqVwAHyYHIBIKj39oz5Ah6DMtPWSDc5gP7
	SYeagbYhWrb+7ta5ePEqZE/UtSnAq0qK8Vr6l4/UlRqtgGJl8n5M0hDlbNTQ3zpotgShH3Q49sVSw
	2vG7MfYgNU+i8TWUMPDcbv/8oc8haQtRu+I1B1cnXXQ/iKa3FnJ3r6U1Z4VdUQwlLHl0ITBVsDlz3
	2CMPyklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzMFx-00000001NJR-2fB8;
	Mon, 31 Mar 2025 21:01:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzMFv-00000001NId-1tjq
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Mar 2025 21:01:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A3BFCA43DB6;
	Mon, 31 Mar 2025 20:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5971C4CEE3;
	Mon, 31 Mar 2025 21:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743454874;
	bh=PXB9+IIdexxKf88I2wNQQL6Ymiw74kkfsgF8CJopTpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WGCGKDjtaPWgg8JQDlWXwrCTej0iosz6GowAQnbt+UNvEnb6XRI3zuaOS6YBODI5R
	 h/EewDHMaLPST9inTzzyOI0ScqAh1WqjvYaRZPDmKXfI2h1aGAth8uIFGtXdsh1bSF
	 HEPCDHohIuI+xHqPzr8ZNX/teuZH4Og4i6uVD07ywY83czZEvH53II0GQj2HtRMVY7
	 es0z/yifpGD1MdAe/4rvw/jSWbAGJkgvLHDU8ykTijC6aGB8cFr4SkNcINBHhz/KCP
	 DyqCPe5IdhPNjG0ni7Tp9PyzNXBT8vk5vUuzLl3Dv+y3toUEe/7m8Xj8zkdvcanQ7N
	 DG+5iV8f3JBKQ==
Date: Mon, 31 Mar 2025 16:01:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	benjamin.larsson@genexis.eu, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 02/10] dt-bindings: interrupt-controller: Add EcoNet
 EN751221 INTC
Message-ID: <174345487191.2817170.10410972908712434627.robh@kernel.org>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
 <20250330170306.2584136-3-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330170306.2584136-3-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_140115_558308_6939E18E 
X-CRM114-Status: UNSURE (   8.26  )
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


On Sun, 30 Mar 2025 17:02:58 +0000, Caleb James DeLisle wrote:
> Document the device tree binding for the interrupt controller in the
> EcoNet EN751221 MIPS SoC.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../econet,en751221-intc.yaml                 | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


