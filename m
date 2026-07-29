Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A38C53200
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2026 06:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hA/U9ooyyT4N+H8fqyLDL8P4Nj8V96DYvGvtGFRQdSo=; b=ME9Lt4/zUq9QbsESfw2eGSg+xC
	rTkcDUTW1I5uHuCzX9gwHLMqOD2QhWcnolX7nyGGoGJy4xOf62EO78s1N+i+Yyp9ec2tzftLJ3CJs
	2fVxNTP/1abB4SkUr04DCX1FEChIRXk9rdTmxcfI22moFgaZjptGNyDdJ/Xd/5SFUuwwloCjzPqz9
	i0ZECXpUFDz/PwglkhV/c7Y1e1TBIo4wnqM8mlUxks9GHkCiZMtBguJH6W8ZSuy3Wrm8EB4dE5G3D
	Eikj25z3X4Ezc8tGzkDyfmrx9tY/Q5XvXStkCSMHvvjZS+kIY1+ZN1VaySsomG1U0n0IlPXh5JN4v
	VxFXQcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxh6-000000070zU-3zGv;
	Wed, 29 Jul 2026 06:23:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxh4-000000070ys-3P1g;
	Wed, 29 Jul 2026 06:23:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E14E860A65;
	Wed, 29 Jul 2026 06:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3843B1F000E9;
	Wed, 29 Jul 2026 06:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785306185;
	bh=hA/U9ooyyT4N+H8fqyLDL8P4Nj8V96DYvGvtGFRQdSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X3AAutlg1b0d4uaufadLTBrecOm+SBXOXEarl8Ydbk8/Y8BafAFkmwbbjM25ZJy2O
	 H4nXwNfzmeysu8+jK54ARg1JAbp86xbroWSSRpqx65NmtMsxp1Ht9CZ+F48fN/WGjD
	 RYmaF4BUDcbOohQa+GReRzqoRS3llCRlf4M3hJTxWtfNztC6WgCFjIgtLShfx7jQHw
	 UMOP6FGbhqUsFfs6XaBUBUWJlJpFR29Dv/JbusdYGrUjWL6jA1SSjErmIApE69X09G
	 MiPdBVY97Z90ibrM0phck2sEKDP091Drqqd7rL8hpJcQsvbSNBZg8EjecLQ5YBpmXg
	 O9LVRVsO94Rug==
Date: Wed, 29 Jul 2026 08:22:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Daniel Golle <daniel@makrotopia.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v19 01/10] dt-bindings: net: dsa: Document
 support for Airoha AN8855 DSA Switch
Message-ID: <20260729-mystic-goat-from-asgard-d6c2d8@quoll>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
 <20260728154846.1828945-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728154846.1828945-2-ansuelsmth@gmail.com>
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

On Tue, Jul 28, 2026 at 05:48:28PM +0200, Christian Marangi wrote:
> Document support for Airoha AN8855 5-port Gigabit Switch.
> 
> It does expose the 5 Internal PHYs on the MDIO bus and each port
> can access the Switch register space by configuring the PHY page.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Just one SoB.

Best regards,
Krzysztof


