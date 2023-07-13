Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2829BEB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 07:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzFC7qNxQkAsCR0tnxCCk6SWQGRQ28U1/TaF6Fofsxw=; b=wTlTBdsk4EBaxWp3bAxbZAjmR7
	6Eh4K26EB7Xx5fqANw0P8ZwbrL6K0lfY3v651QDpqbz7b7j5cAt5RPOpohjLAiMdPu3PFG8ZTiyOj
	4COTXgu4vyrzg7t9xw1XAoNit1qARALXdpYXQgU35En7LzJbsBPJBLoJzY8zGeC0DrACFOrvQ/Lqw
	gVZRnCPPDS87o46YZbpMhviqyDlMKpAI7y656ag5WGVPhnv0+xoOkl1D5+5kMpPykOohqQ4y/1Lp4
	rRb5r4tfJD8mm9v3jDh1RXTbrziyMClyFkscnBL5iIypIXslRCjx2/jLYpotJGiFSrNh2t1f5tMC2
	TpxiAMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqi5-002EF9-1R;
	Thu, 13 Jul 2023 07:25:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqi2-002EEZ-0t;
	Thu, 13 Jul 2023 07:25:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PzFC7qNxQkAsCR0tnxCCk6SWQGRQ28U1/TaF6Fofsxw=; b=kx82qL2Q33zKRHoO0BsBb9bypQ
	b/QA4Z4g7ZnzMhjGWZuUiXjAVa0VLM1P09FKH2yVnk2KzsCUZ3gg94n64QCCQiMVOLy4HFMF29QAB
	DphIkiOPgi0BxVgyIM3UWf1sgH9kFGKtHmyP5M+GCxNDnIhRL3PUQdO8WD2M9GmvXuaWR1RWgbVq+
	g3SfY4GuCSO3y5Lju41ITXb7zX2YNsChV8wtDJn3PgZNmR/lr+akGUrKuVz7rTwyhVoTsgF/Fo5ni
	p0sSeVKXyWh832EjcVt3zPU8uMANW6yBARuSIC6XymXPEIde7oOQOsOgVd7JA42XsY6aUetKYs3wR
	FK14PNMQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56656)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qJqhx-0005sY-15;
	Thu, 13 Jul 2023 08:25:49 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qJqht-0005w9-QV; Thu, 13 Jul 2023 08:25:45 +0100
Date: Thu, 13 Jul 2023 08:25:45 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Ungerer <gerg@kernel.org>
Subject: Re: [PATCH v2 net-next 6/9] net: ethernet: mtk_eth_soc: add
 MTK_NETSYS_V3 capability bit
Message-ID: <ZK+m+ayRW/uaxl6u@shell.armlinux.org.uk>
References: <cover.1689012506.git.daniel@makrotopia.org>
 <6dc1e0ad7e8138835c959fc83a6c1564e8488c59.1689012506.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6dc1e0ad7e8138835c959fc83a6c1564e8488c59.1689012506.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_002554_309917_131A33F7 
X-CRM114-Status: UNSURE (   9.12  )
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

on thu, jul 13, 2023 at 03:19:49am +0100, daniel golle wrote:
> +
> +		if (mtk_has_caps(eth->soc->caps, mtk_netsys_v3)) {

this is a case in point for one of my previous comments...

this code started out believing that testing for mtk_netsys_v2 for v2
features would be sufficient. your first patch ended up having to
change that to !v1. how long until this becomes !v1 && !v2 because
it gets used on v3 and v4 etc?

this is why i think an integer version field would be a much saner
approach.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

