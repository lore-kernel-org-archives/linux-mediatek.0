Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB3EC74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 16:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVJeQXAAkUcIEbt/RzgMtWzPHAS6fEs3vnlZ41+68Nw=; b=NgPfFpgTL9VqP8C2pz1htq6tJH
	fiMVCkyq2JIsAS/zfD5DriuFyje/iQ6sKc6KiSNTCJHZog6OLQWowXPOAgHjeEF+md13Ni0eHHob6
	EMOJwkXibxGIuWCyB7pXS1+VdkN1mCisa909ogx2ObRRuC7CODN7uEE2FV3KzrYujsQSzZL/ks53T
	A3SG5LR/Ddb2QzzXFYLtwtS3D/olXBqR4v5wRlamW0F99KOEjqkt2VDGEcGCIy0CIT/EpnnGlTs9o
	szzPB8B5wyDAj0uWQcWHXHZ8pr+EGCP1PXqKdN/WfbFtPKlQmMFcSdSL+s9xt4zbNcNsg7K2rPHtF
	BphCWg7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYkj-0017Sj-2Q;
	Wed, 29 Mar 2023 16:34:25 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYkh-0017Rv-12;
	Wed, 29 Mar 2023 16:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lVJeQXAAkUcIEbt/RzgMtWzPHAS6fEs3vnlZ41+68Nw=; b=GVU2fl2ATLxLurLW6y/vQZRGzO
	KqOUPhIaIZXJRgx9Y+NAGI8GoQZiFki06kjKN0BZArTmQ2vI49J964ibHCGZQC2ca8g9CsIOFku11
	J7tapOpscTKFM5DxVyE9l1l6QdhGRw7y+gVben5jsr8GK1reahdlG2/Kh+k0UQJfQdGc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1phYke-008mZ1-5u; Wed, 29 Mar 2023 18:34:20 +0200
Date: Wed, 29 Mar 2023 18:34:20 +0200
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
Subject: Re: [RFC PATCH net-next v3 07/15] net: dsa: mt7530: introduce
 mt7530_probe_common helper function
Message-ID: <caaab39c-96ae-4f64-9153-5168c306df69@lunn.ch>
References: <cover.1680105013.git.daniel@makrotopia.org>
 <d5147ef8738c1425fdd4fb351c1f3d98786fc19f.1680105013.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5147ef8738c1425fdd4fb351c1f3d98786fc19f.1680105013.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_093423_361435_A815A07E 
X-CRM114-Status: UNSURE (   9.15  )
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

On Wed, Mar 29, 2023 at 04:58:50PM +0100, Daniel Golle wrote:
> Move commonly used parts from mt7530_probe into new mt7530_probe_common
> helper function which will be used by both, mt7530_probe and the
> to-be-introduced mt7988_probe.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

