Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232F2C47422
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Jan 2024 16:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ee0LVJaO5xx5GZobgreq3QpintDB0kzQxoNG6Nuq/Q=; b=jsTV8+HrjfEiMaW5el4W0RhuHk
	89320vxD2ShoiekfKAVh1UsGesnazLFHXRn/RDIzsHicWkaUvB08WOcEVsfZYYM0rQg+WG6TcHhOp
	/1LmEtqH3YxARx2dWZ0Fzd5Dr7bB32gc6Dgq9do/nCKZjCogkLnojU/zGXFRjO0CxumnjD2hHkqly
	+wJyuRScOWIgLKbTSDE9Z7D/ORHuIuHAvaBLujFR+9lRVFCcTmGMFEFFgCTouJx4wnJBdiakpPyPq
	S5YpN1jvDWRN+JoTrYuK7PvovJ4IKq/2UM5X6dDznkP/ikPMFGdeBlQn2wqA7KEpL/TcuRQ/8W1Po
	CETkx8SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRana-009kQX-2s;
	Sun, 21 Jan 2024 16:35:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRanU-009kPw-2p;
	Sun, 21 Jan 2024 16:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+ee0LVJaO5xx5GZobgreq3QpintDB0kzQxoNG6Nuq/Q=; b=CiRXlYfVKNnCf62BxY//FksKhE
	ATDCOxtIR1lSIREWhqcUtHK3cRqyog9XQ4GH772UTukXmojvgCobskeCeXZ5ZcY9fXK9MYVU8G7xW
	8V5HvUAVz2B6iAb9lDZXB8BkOdb4nxFLuGXjeTy9xUMCOjfQ7EoPwCi4LpAxqYcLX6kM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rRanN-005f4P-HR; Sun, 21 Jan 2024 17:35:41 +0100
Date: Sun, 21 Jan 2024 17:35:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ziyang Huang <hzyitc@outlook.com>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	richardcochran@gmail.com, p.zabel@pengutronix.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 6/8] net: mdio: ipq4019: support reset control
Message-ID: <9ac4b153-2318-4d69-9771-1b3365104904@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB55568177805D79143E8CF4E2C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR01MB55568177805D79143E8CF4E2C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_083548_917517_B0EFA819 
X-CRM114-Status: UNSURE (   9.41  )
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

On Sun, Jan 21, 2024 at 08:42:35PM +0800, Ziyang Huang wrote:

In this case, you need to document why the MDIO core reset controller
code does not work for you.

You are also missing the device tree binding again.

> @@ -248,6 +254,10 @@ static int ipq4019_mdio_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->membase))
>  		return PTR_ERR(priv->membase);
>  
> +	priv->rst = devm_reset_control_array_get_optional_exclusive(&pdev->dev);
> +	if (IS_ERR(priv->rst))
> +		return PTR_ERR(priv->rst);

How many resets does this MDIO controller have? Would
devm_reset_control_get_optional_exclusive() be sufficient.


    Andrew

---
pw-bot: cr

