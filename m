Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BFBC47422
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Jan 2024 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQG4nHZXopQxzqSol4cwnGcgn3VgAtdNUYmrjVuxWfE=; b=RtA4mHZfi1ntoq35SOfXlu4joK
	TWpoOkJ8zGQoz81Rruv2phtNSSUdMrXvz9fYc0QAxgsDP/40NytEGlWf8GI75F+ySKXgFKVrToz7z
	0ZNukBZtH31p7gL0tUc5Yiq7VYH3QQvFpq8pfb1YAXrCc57YzeYUEeJW7e3NtPJY2hZ/ewXFMVc4G
	VEt7d+HpTybrqGT0P77UaGrdcDqqbCWHuEvOL5kgLck1SPMFg6NoMo8v8DI96+QZryxIuBiUAg/x6
	n1Lk7BZoRaPmMdw2ZXQmRgTNEehIr+aKjPmM3XEsz1v5TDly4Who7m7xjir2Co9WwjYSxV60vUhWF
	/+i1qipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRa6p-009hkl-1w;
	Sun, 21 Jan 2024 15:51:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRa6i-009hk8-2H;
	Sun, 21 Jan 2024 15:51:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=oQG4nHZXopQxzqSol4cwnGcgn3VgAtdNUYmrjVuxWfE=; b=gFfv8cCnZ6CMIr6F5ugXpN8Clw
	zx9Qh7kD7jkeJFfdlJu0flHDEqrqHw661qdrZdDEK8QVSgfledgmDer/kSHHQWJ6Wb8T64SWFje4+
	hPvZMBJX69a1i+oMghbrSt8Rgnscl9OrTbOkttD81MvVx4ia4cErLy60BqIFWF316Ats=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rRa6Q-005exL-RX; Sun, 21 Jan 2024 16:51:18 +0100
Date: Sun, 21 Jan 2024 16:51:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ziyang Huang <hzyitc@outlook.com>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	richardcochran@gmail.com, p.zabel@pengutronix.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/8] ipq5018: enable ethernet support
Message-ID: <830a2717-c7f5-4bec-83b2-be14ba59337d@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_075136_745557_295FE62B 
X-CRM114-Status: UNSURE (   7.71  )
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

On Sun, Jan 21, 2024 at 08:40:39PM +0800, Ziyang Huang wrote:
> Enable ethernet support for IPQ5018.
> 
> Praveenkumar I (1):
>   clk: qcom: support for duplicate freq in RCG2 freq table
> 
> Ziyang Huang (7):
>   net: phy: Introduce Qualcomm IPQ5018 internal PHY driver
>   phy: Introduce Qualcomm ethernet uniphy driver
>   net: stmmac: Introduce Qualcomm IPQ50xx DWMAC driver
>   clk: qcom: gcc-ipq5018: correct gcc_gmac0_sys_clk reg
>   net: mdio: ipq4019: support reset control
>   arm64: dts: qcom: ipq5018: enable ethernet support
>   arm64: dts: qcom: ipq5018-rdp432-c2: enable ethernet support

Hi Ziyang

You failed to Cc: a number of Maintainers here. e.g for the PHY and
MDIO patches i would of expected the PHY and maintainers to be Cc:ed.

     Andrew

