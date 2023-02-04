Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EABC636CC
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Feb 2023 17:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfwLdUV5OBNPu08HpkznU3dMK/3+zRMaw+qY8WlDfR4=; b=t5xEsJ7IcFCwNOtgJVWKlrlq2B
	eIYC/BS5ALM0Vqx5lUofBMAxRb+c3mcqcULC8zVkV2qpo1FQLivPpVh7SKRMP08QcKbJS/+0xESl+
	GINdCvE9SukWcDgV3TSNC7fP2DLrBcURbFRWbFuciVfLJi+ZCl6p4PxSrdlQSJ2DzBc27Zg41nB6j
	oUEryouRS/vDX2Po4yj8mQmeyww3b4bShWtuNzLT0933v313qhPYY6XCIeDHPAaTqQd4BQFb7GYR1
	kgTH6xn1OO7mamAjqS+QW3EokFZHV2W0JjWhlWJI6WJOqBImGYVaVLraOczX6RS+UGyxDPVRtR7kJ
	4nWC2VIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOM6v-005QXA-7c; Sat, 04 Feb 2023 17:13:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOM6r-005QWf-HW; Sat, 04 Feb 2023 17:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yfwLdUV5OBNPu08HpkznU3dMK/3+zRMaw+qY8WlDfR4=; b=boU3IvUz5Lb9rtkdkCwc23U36U
	wDWsJEhJMCBxMf+siIQtrhN35p2pW7RHluKNeuaCeMP89luYV1RgZLiqCEA3gMssBzOIkCXgEt93x
	uHUAaqSVBDJ7f1Qdz/DfhLdGbofjeT5rKHUjj3Wct4VlJHmmLvPJX+ogcIvYFksrxDtI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pOM6g-0046AO-MB; Sat, 04 Feb 2023 18:13:42 +0100
Date: Sat, 4 Feb 2023 18:13:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH 9/9] net: dsa: mt7530: use external PCS driver
Message-ID: <Y96SRu4BFxNmaLjt@lunn.ch>
References: <cover.1675407169.git.daniel@makrotopia.org>
 <cover.1675407169.git.daniel@makrotopia.org>
 <677a5e37aab97a4f992d35c41329733c5f3082fb.1675407169.git.daniel@makrotopia.org>
 <677a5e37aab97a4f992d35c41329733c5f3082fb.1675407169.git.daniel@makrotopia.org>
 <20230203221915.tvg4rrjv5cnkshuf@skbuf>
 <Y95zaIJbCj3QIdqC@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y95zaIJbCj3QIdqC@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_091353_622309_FB417B84 
X-CRM114-Status: GOOD (  12.52  )
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

> The SerDes PCS units are only available for port 5 and 6. The code
> should make sure that the corresponding interface modes are only used
> on these two ports, so a BUG_ON(!mt753x_is_mac_port(port)) would also
> do the trick, I guess. However, as dsa_port_phylink_mac_select_pcs may
> also return ERR_PTR(-EOPNOTSUPP), returning ERR_PTR(-EINVAL) felt like
> the right thing to do in that case.
> Are you suggesting to use BUG_ON() instead or rather return
> ERR_PTR(-EOPNOTSUPP)?

BUG_ON() is considered to mean something which you cannot recover from
has happened, and going further will only cause more file system
corruption, memory corruption, etc. WARN_ON() is better, since it
gives the user a chance to perform a controlled shutdown, so
potentially not loosing files etc.

But even a WARN_ON() seems a bit extreme. If -EINVAL is sufficient to
cause either the whole device, or the port to fail to probe, that
should be enough to get the DT developers attention. Then either a
dev_err() or a dev_dbg() to help narrow down which check failed.

	  Andrew

