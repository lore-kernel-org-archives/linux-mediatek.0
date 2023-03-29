Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F35CC761AF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 16:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsYhrL4QtC5ZNA+kq7n/KEZPoa+gL9m0J5D2VbucwVQ=; b=xToATykECWFMtz/Yq2W5Q2t+y0
	s5p5Oi7aReHkiPSY1bxCXsMrk+hI3MnbSE9aP5pN1SkSu2yTGRjL2jK7RT9zhU2sE0Btuk6BHHDQb
	W+IHHCOIvYVtj68bNyFeQAf0zLiAN4ClEoFpBTgxJGR/kwo/PBFKXgqUJ4Itc+Udv46Q+ZsmzHTAB
	WGE8vy/SdRtFOG49mcmmVX/C0bHn9iCtywgI6ywK9XwGYBqkTjJpsSMT928mon868MiLEtc4wVcnd
	/srf3aA+odwwhtLrtQs089NZH7S7DxEEG4YHnx04zjWAPfn8e4nbFhaE/AhWtroSyT1E+Gxm1D/HE
	CpV3pHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYpG-0018no-2f;
	Wed, 29 Mar 2023 16:39:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYpE-0018mn-3D;
	Wed, 29 Mar 2023 16:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VsYhrL4QtC5ZNA+kq7n/KEZPoa+gL9m0J5D2VbucwVQ=; b=yydGJAtSK1nqRobhiENbWmwZLY
	0rux+2yOz3bBQg9V1LLqsADGFqtceIQXhoXO1XvBzI2IB9eLT7PfoOgCEYLyf7uDUKzOZa8poZDii
	PIlK0ypB1cnReKyhNoMsdZTnyxxREExfqAuWOPoJmBst0iVZsJwDO9SJJAbTF6jUhGJk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1phYpD-008mdt-D6; Wed, 29 Mar 2023 18:39:03 +0200
Date: Wed, 29 Mar 2023 18:39:03 +0200
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
Subject: Re: [RFC PATCH net-next v3 11/15] net: dsa: mt7530: skip locking if
 MDIO bus isn't present
Message-ID: <022e2a44-31de-4667-9474-6a8518ca030a@lunn.ch>
References: <cover.1680105013.git.daniel@makrotopia.org>
 <4e6d1cbba2ff16cad5b9ac48ccdf4407f45c7857.1680105013.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e6d1cbba2ff16cad5b9ac48ccdf4407f45c7857.1680105013.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_093905_037956_BC90ECED 
X-CRM114-Status: GOOD (  12.69  )
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

On Wed, Mar 29, 2023 at 04:59:47PM +0100, Daniel Golle wrote:
> As MT7530 and MT7531 internally use 32-bit wide registers, each access
> to any register of the switch requires several operations on the MDIO
> bus. Hence if there is congruent access, e.g. due to PCS or PHY
> polling, this can mess up and interfere with another ongoing register
> access sequence.
> 
> However, the MDIO bus mutex is only relevant for MDIO-connected
> switches. Prepare switches which have there registers directly mapped
> into the SoCs register space via MMIO which do not require such
> locking. There we can simply use regmap's default locking mechanism.
> 
> Hence guard mutex operations to only be performed in case of MDIO
> connected switches.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

