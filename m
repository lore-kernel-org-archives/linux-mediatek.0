Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288C9606A320
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 02:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1R2i4cKE;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Q6z2hs+y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x975RPbjrU50lC41m9HmrVr6NK7q9GoZJG5+jFFHqw4=; b=1R2i4cKEr5My+coSY9LDTEmtQK
	kdw0ClnSwptr8OcTYhkBNWOBoVB97MjjFHJj6RIXNi4daG5e14Yo0j3KG1w4AruSmfmgPHO3tCaLI
	I08Lt+rdZMKN0t8YDJl9jqWNLtmJNu1RwkLuXrgulk3j1W6fOC/uUc42RGDOr0gYVsKwg67EfENtM
	1wWpOQJkwSUsxynGEv6KgnConRr4FU+SOefnMYcfIIsxgBRuO7n6F+K35OsgRUSqo1KibCgMpUH8w
	d9QEHLsAvzYKVFvTOYrCxOf9iFS9Bxg2jJtgtGRwIf41w6KjFcHIKRABowJEYZzsrqYvkXOazKnEj
	w4eZl0xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLt59-000000064ea-3AlH;
	Wed, 28 Oct 2026 02:08:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLt57-000000064dy-0NZs;
	Wed, 28 Oct 2026 02:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=x975RPbjrU50lC41m9HmrVr6NK7q9GoZJG5+jFFHqw4=; b=Q6z2hs+yY4rVCwBAW1v5bDfhbc
	/YM28bMKMNrW7s2hX5/5WTigXP856vo/9TrVFTFfkQxkcYvK+2nx7IW6XunU99c84Gy2thnSSN3Ad
	ecnXZdpSF+X98YRTdpfuEO0LIceyl6/yu/rg2wsz86xHDr1hGrLnYkxVE79bN4wcOWao=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xLt4p-00D2ks-DD; Wed, 28 Oct 2026 03:07:43 +0100
Date: Wed, 28 Oct 2026 03:07:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, olteanv@gmail.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com, daniel@makrotopia.org,
	linux@armlinux.org.uk, arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, naseefkm@gmail.com,
	b.larsson@gmx.com
Subject: Re: [PATCH v3 3/7] net: dsa: mediatek: add support for passthrough
 mode
Message-ID: <d4564675-fa56-42df-8c5c-cff14f7884f9@lunn.ch>
References: <20261028011317.1557238-1-cjd@cjdns.fr>
 <20261028011317.1557238-4-cjd@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028011317.1557238-4-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_190801_151657_FFC83ED1 
X-CRM114-Status: UNSURE (   5.28  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> +static int
> +mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu);

Please don't add forward declaration, move the code around.

       Andrew

