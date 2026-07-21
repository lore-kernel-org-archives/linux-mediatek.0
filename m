Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4F4C4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 12:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mfz+XYF9qEUPFn7vVrHbhU+dMueG9FqIjc17rMHYptI=; b=AJTK35FkF8EFNru66uGFTkufE9
	ALEu2yk6ec596bQ8oTloXcdEhs85RbETCy0SCXBHwEqSf8g/5nCy6S/Ld+rb81ExyIjeWOZaL+koH
	qZlIPYCciJk82rMnsKwisktIP9RfRdT4cjCHLkS0Hri5WVQhtZh+R9CXN048sbSF5upCMfZUgiHqZ
	sWMPEzd/+FAp+ujB6kEy0gi5KrXgiTpAfl3fz4MMcCk3KqmHbAThE6jh4qkKeWr4WrT+UnpASxlPi
	enCfZJGbVZQGYvQtbmVnVhswgwDn1zrpC2kNHlLuPdp08QXaYTVzpeUitItGk8CBzhK14nVjaXdk0
	UYEPMYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9AJ-00000009N6s-13y4;
	Tue, 21 Jul 2026 12:01:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9AG-00000009N5g-2HQ4
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 12:01:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E68561A1135;
	Tue, 21 Jul 2026 12:01:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B4FE660368;
	Tue, 21 Jul 2026 12:01:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B33611BD2234;
	Tue, 21 Jul 2026 14:01:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784635289; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Mfz+XYF9qEUPFn7vVrHbhU+dMueG9FqIjc17rMHYptI=;
	b=gf0l9KNidokNm/7c0EhDfFkJHuGxPwKzr0QShggJ+Q6UVWE9y2fPzZWR3NE3wz9xuleqfV
	O6CkPbq/+qFSLL7IlQVRnf/m0/MIc8KUTKzHAdfpG/xvdHsgWCYraQfImINouLc5rg+FXD
	nNEon5Pas5phPl4MNLgScqwjYoweV3IOg5MnrHyFfPsxfc44fesu4yoePHP4tlyEoz/ep2
	3fiBF4xsJkXL/YRz5xfUw7IkJDNS8CdGaXaEEilQLjVGTla+FETwYtPEup4ieeihBjPpps
	PrDWVz/0jxsvYvXCGAQmvrRgCTfwDQB/QDx8H/D69nxKYFhTTxIrqdFaEDI5HA==
Message-ID: <c0dbd5a0-97bd-4d04-9fcb-d8c0a805b21e@bootlin.com>
Date: Tue, 21 Jul 2026 14:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 03/12] net: phylink: add phylink_release_pcs()
 to externally release a PCS
To: Christian Marangi <ansuelsmth@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Saravana Kannan <saravanak@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
 <20260717065448.1498335-4-ansuelsmth@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260717065448.1498335-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_050136_720517_F6DE9637 
X-CRM114-Status: GOOD (  12.57  )
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

Hi,

On 7/17/26 08:54, Christian Marangi wrote:
> Add phylink_release_pcs() to externally release a PCS from a phylink
> instance. This can be used to handle case when a single PCS needs to be
> removed and the phylink instance needs to be refreshed.
> 
> On calling phylink_release_pcs(), the PCS will be removed from the
> phylink internal PCS list and the phylink supported_interfaces value is
> reparsed with the remaining PCS interfaces.
> 
> Also a phylink resolve is triggered to handle the PCS removal.
> 
> The flag force_major_config is set to make phylink resolve reconfigure
> the interface (even if it didn't change).
> This is needed to handle the special case when the current PCS used
> by phylink is removed and a major_config is needed to propagae the
> configuration change. With this option enabled we also force mac_config
> even if the PHY link is not up for the in-band case.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

