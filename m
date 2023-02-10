Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28629C636CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 10:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Xo2ox37+Egn/6Ir107WQst5VTd3PA7umPp/8qxJ+cs=; b=Mk+YGTA25kCZ6dRBXYtFivxLWS
	mAXIfZJ89nH8iRk0Hdk+eSWHJKndS4Y5ORtLrXxMqntqD2RQoJZZSUKT3BdDDrYszSpWpdOyP6jIf
	tSYwIYNAYYrTCdZFY4qfYd68wFl+LJnHofCZIuzsF7nDeK0dMkYndM1+41jIWuKm3okUs7pUWpOVP
	meq8Bkk5tKlhG/mW7FlbSX0FrY8+ZyzwSEcDa0XakthjlmdinzBmY+APah8PpnGixWmB8cU0UwVx4
	jCiENBRNKsBp88kRoi6cJIzy1/88O7ucFWPUHt5vmUJo45pn42a3zOR+xJYQMGuDoB8XTY2HKy8oG
	kHkRkEHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQQgU-005Hdm-EP; Fri, 10 Feb 2023 10:31:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQQgR-005Hc0-Ac; Fri, 10 Feb 2023 10:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0Xo2ox37+Egn/6Ir107WQst5VTd3PA7umPp/8qxJ+cs=; b=dVIONNKXENZUqAvpuFHrmXFG2e
	fHmIlPW51KDfwGRcaGVcZoIcokwoff4EYSfraJOO/w915PSODJsEZp2T7Rn/X1azgEWiJLtUTAVeJ
	HVrBT1e/KqkjlaX6gjTecLCOtrtm0DPUf42QUd5tYSQ1Vpgg0Jg4v6Zq1dhyn+Jk0vEEJovyfr3Y3
	L4hbIrYrUilM2i237GVRlfhkQeyRtzy2jvkoaq7fRIbpRgwo/bP7uotL79J1xS9lFBoNPZq2KrLZa
	mbig1uAg2KZivRyzc5xvpZEgukY39vJPJfew/R62lXbCkhy+D7gXOdLZXA+Mp945YWDjTz6ezDJjd
	5qpG5JOw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36500)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pQQgB-0001G3-8k; Fri, 10 Feb 2023 10:30:54 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pQQg4-0005UQ-Mt; Fri, 10 Feb 2023 10:30:48 +0000
Date: Fri, 10 Feb 2023 10:30:48 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
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
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH v2 03/11] dt-bindings: arm: mediatek: add
 'mediatek,pn_swap' property
Message-ID: <Y+Yc2GlgQh415FWx@shell.armlinux.org.uk>
References: <cover.1675779094.git.daniel@makrotopia.org>
 <a8c567cf8c3ec6fef426b64fb1ab7f6e63a0cc07.1675779094.git.daniel@makrotopia.org>
 <ad09a065-c10d-3061-adbe-c58724cdfde0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad09a065-c10d-3061-adbe-c58724cdfde0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_023111_387981_2778AE6F 
X-CRM114-Status: UNSURE (   9.45  )
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

On Tue, Feb 07, 2023 at 06:38:23PM +0100, Krzysztof Kozlowski wrote:
> On 07/02/2023 15:19, Daniel Golle wrote:
> > +Optional Properties:
> > +
> > +- mediatek,pn_swap: Invert polarity of the SGMII data lanes.
> 
> No:
> 3. Does not look like property of this node. This is a clock controller
> or system controller, not SGMII/phy etc.

Wrong. Totally wrong.

SGMII data lines consist of a "positive" and a "negative" signal.
Clearly, this PHY supports swapping the sense of those.

This CLEARLY has nothing to do with a clock controller. It's also not
system-controller related either.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

