Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B509E77180
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2024 23:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+U/2c2oZlKC2157S49D5OO/8anE8SSNsca8MtUOTBw=; b=gbrjlSbj914CsGEQzELlJ7M4Yj
	aBR9cH8hGKHJXSZTX0ofGAkawFCdngtg0E3zCIFnCJ2+pMph5lDWcf9hKIUT5A9CUIO8t4DwozIjH
	582PsUduJiaIaZZlYlcWxWq4PASti5rspGrHztYVMDKSQMrblfQJnWKjneiXKkRIvyYeUEmVN9ySP
	AT6mW90AUe5VoJrmszMb52HjCfYvEJapmG5x93t/+RHK6xBaLKUAMmZW/FjXM0HlJsq3Cm5wivLp3
	J+4VLO+QIVEXQy6pNKhykLouRbkA6Ml+sUuvCO2/g6pb18S4lccoyPTxF82EJwFdSAmLs0dhWYQQe
	IQAT6GQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKn2P-00000009Y37-2Myr;
	Mon, 09 Dec 2024 23:19:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKn17-00000009XjY-1IJv;
	Mon, 09 Dec 2024 23:18:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B5325C5F5C;
	Mon,  9 Dec 2024 23:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E296C4CED1;
	Mon,  9 Dec 2024 23:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733786295;
	bh=hmPA1RbKTwQnOsHyx4RnWAjW6XPcda7839gBgswa0Kg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ezRxn5lBkTzNN0EGCUbugwW9spneaZXOJPMMsVwsQMcm4L0P4vnuSUhjAtDK8f8Ay
	 HIBUulUfDYuQCdk6B1IQrv7tzx2qB6Dq1DI3Eqijv/o0wx02yNC0pYwkLprmRTv7zR
	 PuTZ4YFiYKmF4ROoDR4qctEQTrPD/ZKm1fmq9bVqI/Zf6EPLiEPfpLvwNHAA+4FP14
	 qH9+jEhFK+T7FUAjjo7cf/qnYaP30n0UZ8+6bhj2QH9Th5TIiiCA6boczNHbzh+HY/
	 oY3mLguXSp48182n3hVjI8/GIga71eVeDxpOFFLNvG4rn0pdYbzVmN0vBHdZxd0TXV
	 whdtxyT8UIbBw==
Date: Mon, 9 Dec 2024 15:18:13 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Vladimir
 Oltean <olteanv@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@airoha.com
Subject: Re: [net-next PATCH v11 5/9] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Message-ID: <20241209151813.106eda03@kernel.org>
In-Reply-To: <20241209134459.27110-6-ansuelsmth@gmail.com>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
	<20241209134459.27110-6-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_151817_391454_9741227B 
X-CRM114-Status: UNSURE (   7.22  )
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

On Mon,  9 Dec 2024 14:44:22 +0100 Christian Marangi wrote:
> +	regmap = devm_regmap_init(priv->dev, NULL, priv,
> +				  &an8855_regmap_config);
> +	if (IS_ERR(regmap))
            ^^^^^^^^^^^^^^
> +		dev_err_probe(priv->dev, PTR_ERR(priv->dev),
                                         ^^^^^^^^^^^^^^^^^^
> +			      "regmap initialization failed\n");

wrong ptr?
-- 
pw-bot: cr

