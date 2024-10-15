Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F14D1F9C5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 20:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yASOrNrrQC0uomLo7V7/54VjLaoyiUEuE0ga6tJAgKc=; b=1Ijn/x+BkUCgQXdudnaACPNQVt
	ReZNOUdGPlNiwxP2CcPu4Ow7YI7w5MHYnAixDfODB5CRzHGI/eDyLYD479eLRsxtyM9jLpTQ0nyme
	LVtutHp3Rl+Xc8aCkaWmSniXiWH+HQRIYniM+uA9RELP9t1TvU55Fy1G4gAMhim9BWWY4PK6X+mv+
	w8bz5Nds8N2EDMOLqqR5NqtpzINkreSAJTzb0vi7gMvVDH4UanY/nU7382JUXiE1D1kPdHPf98cLV
	EBkYEVkga+luCediAML/oGLdue+wEfb6aUss64omKfOE0FAKyKXnoqY48ikArzIC1bgKtArusUxpc
	lOtna9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0nkz-00000009So0-0QB1;
	Tue, 15 Oct 2024 20:03:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0nhj-00000009SAf-2oQb;
	Tue, 15 Oct 2024 19:59:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B8D955C5ADA;
	Tue, 15 Oct 2024 19:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB59C4CEC6;
	Tue, 15 Oct 2024 19:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729022378;
	bh=o5PDrtHObgP3OmjsttXcysEYMPEFODbevDbCa/VABeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z2ngDwqftl2tK6JYPRqFTdIB9M3Nf7L2hWKvqlGo7FBf1hUaV2n2mhR9TGAPnkFoB
	 /+STaMSfjMjd1EaoMUh4X13/jOocGJb/dMHogYG09O2Po6cQmxsO3VO5mlLXhqLrsX
	 Uh5FqO1nuLwEhO9NzW+c/53QAjx6aVJfhMR485S4F5KXX7gregg/dzia1R2yLvjwg3
	 m0Yo25Rg6FC22Ys6FqTW6QxK4C5n/5mV21H53oI5Uf0vtSq+SFCVmkNIIlBq1ZZ1Yx
	 HcyB2lOZG8vdY7k77T5CjHFFKtkMJydkeFWVdJlv91NW7l5jLNYlxDG6PjYU2pGwiS
	 344t4ohLIpm/A==
Date: Tue, 15 Oct 2024 14:59:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	ansuelsmth@gmail.com, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-gpio@vger.kernel.org, upstream@airoha.com,
	benjamin.larsson@genexis.eu, linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>, devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v6 4/6] dt-bindings: mfd: Add support for Airoha EN7581
 GPIO System Controller
Message-ID: <172902237741.1702164.15273097757598307405.robh@kernel.org>
References: <20241013-en7581-pinctrl-v6-0-2048e2d099c2@kernel.org>
 <20241013-en7581-pinctrl-v6-4-2048e2d099c2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013-en7581-pinctrl-v6-4-2048e2d099c2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_125939_771483_F8FDFD3A 
X-CRM114-Status: UNSURE (   9.96  )
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


On Sun, 13 Oct 2024 00:07:10 +0200, Lorenzo Bianconi wrote:
> From: Christian Marangi <ansuelsmth@gmail.com>
> 
> Add support for Airoha EN7581 GPIO System Controller which provide a
> register map for controlling the GPIO, pinctrl and PWM of the SoC via
> dedicated pinctrl and pwm child nodes.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../bindings/mfd/airoha,en7581-gpio-sysctl.yaml    | 90 ++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


