Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4593E7717D
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 01:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eo4Cvix0Q6Ny9IVkv622V5LskCRdrNKizWnESnyiqRc=; b=amGLwcl1Ro75dA1zbunvgRr+QM
	ZwqU26frFTmy4sooB6//NeFhQ+D9LCHklsZJnajtq9h5ePN55m4jCsvFC1vsXOkltGICXHGzw6U34
	34pgquk3qorpIDoKyAoLb67SuoYrjoHGbsBcsYFxvduzpIxmfnZGqSjsrj2qSe4KFAFHdEykk9Dzr
	ul93sz65ljDLGy2UkwTTGZPQRECouTF5waexayP8WQOh2Y8EDF2OJKtHi+xYMwXLyvZWTwdWcf2dE
	mG6Vz5iFBO5vu6q9kQkxOlbudDFTE4EdIIwBl2Z4zOw+0jsgmeqFKHTsQXdtc7vjn3GtwGABNfrmW
	by+ei3kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKpD9-00000009rDd-3pGZ;
	Tue, 10 Dec 2024 01:38:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKpB5-00000009qt6-34fi;
	Tue, 10 Dec 2024 01:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=eo4Cvix0Q6Ny9IVkv622V5LskCRdrNKizWnESnyiqRc=; b=zlxM1gJbeJPhQfj3PB35xuI8ka
	vkwcwGEOvFv3yoPz55tUJfg/DXCtYKZTlq9jj8viWj3uR/WYXPWDA6puNYS+cDwEyQWxoraWd54M/
	4LMvidGOhs7EPkylBIkBEcr7FTmVOI5TeH5gBWhxMDVMWJ5Ru37S+YjElYMFjqhx5C+A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tKpAr-00Fjr0-8U; Tue, 10 Dec 2024 02:36:29 +0100
Date: Tue, 10 Dec 2024 02:36:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 9/9] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
Message-ID: <b3b79c80-ac7c-456b-a3b5-eee61f671694@lunn.ch>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-10-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209134459.27110-10-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_173643_773303_257C9FBB 
X-CRM114-Status: UNSURE (   9.79  )
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

> +config AIR_AN8855_PHY
> +	tristate "Airoha AN8855 Internal Gigabit PHY"
> +	help
> +	  Currently supports the internal Airoha AN8855 Switch PHY.
> +
>  config AIR_EN8811H_PHY
>  	tristate "Airoha EN8811H 2.5 Gigabit PHY"
>  	help

Do you have any idea why the new one is AN, and previous one is EN?  I
just like consistent naming, or an explanation why it is not
consistent.

> +#define AN8855_PHY_ID				0xc0ff0410
> +static struct phy_driver an8855_driver[] = {
> +{
> +	PHY_ID_MATCH_EXACT(AN8855_PHY_ID),

Is there any documentation about the ID, and the lower nibble. Given
it is 0, i'm wondering if PHY_ID_MATCH_EXACT() is correct.

	Andrew

