Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB88BC761AF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 16:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqb3eOXKREvLW9BAFYXjCeVhhXMvbL63kC9zEhZdZEQ=; b=z4I8Jpq1F12UHRkZrlkwqfhVdC
	frC2YS35mDMTAeIAEzOnGl938XQUrhI1UxbHSW9Wa4s3FRzwHK27R3nusjeOZrK98pjf247ZoFRRa
	LcgyGgKENFGX4iOPhvI1x8lN01c1oXRu9v1HQfA0I8nTIDsJAogtAVbDYCU1sEVwUKiJJsw72ejiy
	b8205W7cYd4n64CueJcMNsa66f4vxpb0Q/ybt6k3v8Mw91ATQsiDebCBcIEMtIGBmyyoPZaaH7M7M
	BI+q96K9cdPj+u4HoeVVchQzqbizW+qKxGiR8hnFmuImF0rp1g0k1x6ERpeXCR6pQZc38gP4I7Oeq
	G+XgJ7Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYoV-0018ZL-02;
	Wed, 29 Mar 2023 16:38:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYoS-0018Yd-1l;
	Wed, 29 Mar 2023 16:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nqb3eOXKREvLW9BAFYXjCeVhhXMvbL63kC9zEhZdZEQ=; b=rPat5mwvB49J7zctdFuplYqikj
	uAZJOanlxahOez2qiAOXwTugc5ITra60zC3mK6Uq0b4WjWjNEEcpR6Wa6wFCo9R7wq+cakq7zokLz
	BZC4R9JLa23qoPLCL8avs9c2uBwOBIyNebwD/+VW6IKwlVcgq1+HMxlXseM3GuOiTCz0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1phYoQ-008mcU-RO; Wed, 29 Mar 2023 18:38:14 +0200
Date: Wed, 29 Mar 2023 18:38:14 +0200
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
Subject: Re: [RFC PATCH net-next v3 10/15] net: dsa: mt7530: introduce
 separate MDIO driver
Message-ID: <868f3eae-cca6-4234-95aa-e21c021e18a2@lunn.ch>
References: <cover.1680105013.git.daniel@makrotopia.org>
 <2bef9ef442261e26d4d933f101f4a25c0f3aad2a.1680105013.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bef9ef442261e26d4d933f101f4a25c0f3aad2a.1680105013.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_093816_584444_DA5C6A32 
X-CRM114-Status: GOOD (  10.52  )
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

On Wed, Mar 29, 2023 at 04:59:30PM +0100, Daniel Golle wrote:
> Split MT7530 switch driver into a common part and a part specific
> for MDIO connected switches and multi-chip modules.
> Move MDIO-specific functions to newly introduced mt7530-mdio.c while
> keeping the common parts in mt7530.c.
> In order to maintain compatibility with existing kernel configurations
> keep CONFIG_NET_DSA_MT7530 as symbol to select the MDIO-specific driver
> while the newly introduced hidden symbol CONFIG_NET_DSA_MT7530_COMMON
> is selected by CONFIG_NET_DSA_MT7530.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

