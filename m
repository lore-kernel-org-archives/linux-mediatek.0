Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411D9CD98CF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 15:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93S5IJn8Nm38fDgXmSpC8QemVzQ1sjDUuJR7xlPUztY=; b=baA7t0hF/S0vOOs+OcnE4Glf/j
	xcvVsSRqmn+i6pu9V0bZGd+lnTfrf2JHe3Zldxnw9oiHJp/49T4oQyAArgA+IjjacKFx8A2HyN8SN
	jyITtDLGf7E9BPUAqgqMwuzPHPD932ZikKBaP2tRqJIR/4VxzqNQDczr2Atfu81NynDl1S50kgiMH
	72LqfMx1WKJ0II1Nhdumalz+p6JJ2nvacvfVPjsarpTZMBVaXBsKA7CM5wHF8//o9WWwEQxdUK9QA
	M84JJs/dweYowTcSAYY2jNdQysZ86H5ie09P62wXLXCwgge1jmGT/jJPJ8QbppyhJilxzfUslEsmf
	fQ65BJOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9E5-0000000EVAE-0S4T;
	Mon, 15 Jun 2026 15:27:49 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9E2-0000000EV9e-1wtJ
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 15:27:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6C7491A392F;
	Mon, 15 Jun 2026 15:27:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 378B460015;
	Mon, 15 Jun 2026 15:27:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75110106C8297;
	Mon, 15 Jun 2026 17:27:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781537262; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=93S5IJn8Nm38fDgXmSpC8QemVzQ1sjDUuJR7xlPUztY=;
	b=eJqkbjRIok7cjg54WjqMc6fe6G3dz/a0LkNOep2ilTQerWzkrRIgxxZMEeXuBNJq5web0h
	A2M4yefSKsLwn1t9M3LWHFWS342nrWp1I/I+le6oqzVXZwbLxbRWljpwWhXkZt3z9dbbp3
	Y4ID0x3rhrNyTGd8RV+HSFmrEOqKHB7EXbFyyR/3Nm/hV/LQeaufsrgpRp1NVpapIFdIJN
	4ptnQyWdKWKmvviISPPROC4tzfvLfVr1jxsz2p0q+lyMLhAHnUJvWiPmbXknRKRv0pojOg
	3qd6uC0pIgFR1T1Z2qqNnVNoqRsGL4vTTrumHZUfX5YXpUpINApAtumDwT/5bA==
Message-ID: <53f0eca8-05ef-4432-87c7-25bad6252585@bootlin.com>
Date: Mon, 15 Jun 2026 17:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix supported_interface
 set after phylink_create
To: Christian Marangi <ansuelsmth@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260615151106.15438-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260615151106.15438-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_082746_634932_B8B741DF 
X-CRM114-Status: UNSURE (   8.89  )
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



On 6/15/26 17:11, Christian Marangi wrote:
> Everything configured in phylink_config it's assumed to be set before
> calling phylink_create() to permit correct parsing of all the different
> modes and capabilities.
> 
> Commit 51cf06ddafc9 ("net: ethernet: mtk_eth_soc: add support for MT7988
> internal 2.5G PHY") while introducing support for 2.5G phy for MT7988,
> probably due to an auto-rebase, placed the configuration of the INTERNAL
> interface mode for the supported_interfaces for phylink_config right after
> phylink_create() introducing a possible problem with supported interfaces
> parsing.
> 
> While this doesn't currently create any problem/bug, move setting this bit
> before phylink_create() to prevent any possible regression in future code
> change in phylink core.

Agreed

> 
> Fixes: 51cf06ddafc9 ("net: ethernet: mtk_eth_soc: add support for MT7988 internal 2.5G PHY")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


