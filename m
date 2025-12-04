Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8B2D216A5
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Dec 2025 16:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nHd6TUa3jMw7HvelrkfjqnHW7Wscvlkzal0YuOmQ94=; b=huhG6mAq074FsGQ0GjZPscq9pf
	ElTlAs4i6fB4d4FYTGvpB4WL7tALsqOmX7tTnhjkvoW9uQUA4O50UMiNC7FOhVkLVpLo1VcgNGRiw
	zEQeJWZEHoyv+W70Q/p3f5Jq3YJOvFssuobhCVtPKCF0mU5yQLp36tp5ydzyBKHA9jkPtXomFya1u
	xFcOG2vVbebKQaRfgjK7BaiYVihnXgI0brra5lgsUHXRIaRlsCfDbXWNXUk1Vk5D9rnjDfrl+hbQ4
	g2xPQU2cwjS1htRprzDVffwEQsqvo7zZg1m6ZmxQ0YLyMF3bs3XXAnpsU2rqJzafdFE8oiYUyCmeN
	/MLWHOxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBxI-00000008GRI-2d0m;
	Thu, 04 Dec 2025 16:13:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBxH-00000008GQe-0FQe;
	Thu, 04 Dec 2025 16:13:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7AA9C601FD;
	Thu,  4 Dec 2025 16:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F84C4CEFB;
	Thu,  4 Dec 2025 16:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764864798;
	bh=BrNx6hRXccMLCbDLWyg8tGP+XIvGp7NdIU9kGAIwDxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aRdZROds3f0jvOdMXob8rBlcxJFXp/eb84yof+VXswL63kLYl7AM8zbN15mhmaTRc
	 cioIGfrmSYahuhtxgDP5boH33oev09ETkd9pIyzBzKg0tEf9O6JCPWchmhuyQQRTYp
	 k1fGSMxnnhM+vMqsjRzUGhbvMTpsf26fYO0t8dm7lS3PnyfwieLl9Ou+Sjlo2trHno
	 draZfUk4xJgTBWfJj82BpaPLSaSe3WnX1VdF1RmyTdVE12JDOR46dS2XeKHqjB6UIw
	 g23s1fN8n3xf5iMxRNJX81HFRZaOWh6JxSGBUiNO7Xalkaaw2zvyzSUWKdI6qiEE62
	 VIbWwDYEZU8GQ==
Date: Thu, 4 Dec 2025 10:13:15 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Woudstra <ericwouds@gmail.com>, Lee Jones <lee@kernel.org>,
	netdev@vger.kernel.org,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	"David S. Miller" <davem@davemloft.net>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 4/9] dt-bindings: net: xpcs: allow properties
 from phy-common-props.yaml
Message-ID: <176486479535.1579612.18279461397755794325.robh@kernel.org>
References: <20251122193341.332324-1-vladimir.oltean@nxp.com>
 <20251122193341.332324-5-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122193341.332324-5-vladimir.oltean@nxp.com>
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


On Sat, 22 Nov 2025 21:33:36 +0200, Vladimir Oltean wrote:
> Now XPCS device tree nodes can specify properties to configure transmit
> amplitude, receiver polarity inversion, and transmitter polarity
> inversion for different PHY protocols.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


