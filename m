Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232FAC761A6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 22:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUvWcSk4q2OtdCCFSokbqXR2MDjcWokmOFXBQXZUNrs=; b=QA9ZDQWxstnErlsY1qO30M7/fb
	skRoQ7tkXYVc6F1GFFZu2zELTV4tVVpRK13X1ZXspvgS+yuvr0BhYfmkvXFEsXgRqt6wpL/Np1Rqf
	TtD6vxW2EH55oOUuV2aAzpGjBKHtsJwfNVXTam5Oy4ENhrY1D71cBjYEjL9+bcsswIzB+1XZeqKfO
	rzLqNk/rt0AaM2xhyK7qa17B/bONqCyZrc60t6VhZHammRcV3kxg/OrIkVv3kG030S1fcptI7SNeX
	tKreE6RZKSY/XTsfG55EU+yRZYWtXUle8tlqlwuAR5uJ5uZglYmkJDMv/m0sUREW5O76NkSX9Fv2P
	fJgiberA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phHuL-00G1nY-1N;
	Tue, 28 Mar 2023 22:35:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phHuI-00G1mL-29;
	Tue, 28 Mar 2023 22:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=oUvWcSk4q2OtdCCFSokbqXR2MDjcWokmOFXBQXZUNrs=; b=23p5LPbwhEL8SKLaUdZHVRAOQC
	n77xT4tNz5KGDYJ33g14arqK+v/nWQECGWaL2I+DQCR/RnpvBm1V0n4y72E4RZqbHdkR5+F2l2s4s
	S7WMuLqStlge1lR4feWxBo/GqASj+AFFy9uBnKoTU9iTts8YJ+OQnKtKX4KJGG8LGWCs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1phHu8-008hJt-PY; Wed, 29 Mar 2023 00:35:00 +0200
Date: Wed, 29 Mar 2023 00:35:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sam Shih <Sam.Shih@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [RFC PATCH net-next v2 1/2] net: dsa: mt7530: split-off MDIO
 driver
Message-ID: <c50b91b7-4dfc-45d7-9fd2-f1afb4480acc@lunn.ch>
References: <cover.1680041193.git.daniel@makrotopia.org>
 <4acd93e451146cee593c1b91b74ee72319c63833.1680041193.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4acd93e451146cee593c1b91b74ee72319c63833.1680041193.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_153510_789155_CDDEEBE3 
X-CRM114-Status: GOOD (  15.29  )
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

On Tue, Mar 28, 2023 at 11:16:51PM +0100, Daniel Golle wrote:
> In order to support the built-in switch of some MediaTek SoCs we need
> to use MMIO instead of MDIO to access the switch.
> Prepare this be splitting-off the part of the driver registering an
> MDIO driver, so we can add another module acting as MMIO/platform driver.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Hi Daniel

This is getting better.

Please try to split this patch up.  Ideally you want lots of small
patches which are obviously correct. So maybe refactor the creation of
the PCS as a patch. Move p5_intf_modes() as a patch, etc.

Also, look at mt7530_probe() and mt7988_probe() side by side and see
what is common and can be put into one shared function in the
core. Same for remove. It could be that creating that helper is a
patch done before adding mt7530-mdio.c.

      Andrew

