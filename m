Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E760C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 10:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAFsUUGecd2PZahjRe1w84p36VFhgyCGb6V13rC7A2U=; b=t5HF0SHN0FC3iEk3tdprpmw2xN
	9iK4w4Qn68dkBc7yYO6J82ZvG6pQqqjWi6Kd2v6IA7cokTe8XvO1gd47LbyTRklzUGnXsJPZG8X1G
	wyZwITar+vmvUNf+SpWGjXVIK/5z+1iaeNeEUwST8MZrbIePJW7oYWOVn/m6rfUg36EEi5PJ23tjr
	STXX+oJgXk1DHorw2Lng0L6CesbvQxOuqlkSXe2wuGe1hn3QdFSajxz8ta1yE3x98d9Y2FaDhbIUY
	7iB0W4Rtd5EG2qeCWW3x38uYawWwL7BFa2HZYBLinvQ07ZvmWhGmdSOCxRlxtFN8OPtqgeYLm4FoC
	Hzfi5qSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQQjZ-005INu-Q4; Fri, 10 Feb 2023 10:34:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQQjW-005IMT-UG; Fri, 10 Feb 2023 10:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gAFsUUGecd2PZahjRe1w84p36VFhgyCGb6V13rC7A2U=; b=NOfNM5sFbwpYn5HnQkbpw3RlvQ
	3FfQuJp9bNctwhBYwzEAPh8WcBfNEHf+Xszakp5ad7nVdapvZLtwonmJwDMc3whqmSZnd35fF94bI
	BUahACO7xG4Vj3CADD7lmmM4yKQkRK9Q18x7l1WMyQDTVwe+XIpvQVFmhBcgflt4x/cyvV4OxDiSU
	I83xaW1zQDpYT3Rgd30w2TzKnlVr0YZ2QRy+rvzo4vU/F7K8BLjrN43+05y9pKZAFSoS1lyo29L0A
	2Y68bs8s9F36kh+5xe2sc58vF25T6JMxADvIaFWTAUDf4BFjnS+pMu0Bl0fdFJ2qnMkVp7lqCFWru
	RY4Yj4Eg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36502)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pQQjS-0001Gy-RS; Fri, 10 Feb 2023 10:34:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pQQjR-0005Ua-6I; Fri, 10 Feb 2023 10:34:17 +0000
Date: Fri, 10 Feb 2023 10:34:17 +0000
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
Message-ID: <Y+YdqbJS4bDvTxuD@shell.armlinux.org.uk>
References: <cover.1675779094.git.daniel@makrotopia.org>
 <a8c567cf8c3ec6fef426b64fb1ab7f6e63a0cc07.1675779094.git.daniel@makrotopia.org>
 <ad09a065-c10d-3061-adbe-c58724cdfde0@kernel.org>
 <Y+KR26aepqlfsjYG@makrotopia.org>
 <b6d782ef-b375-1e73-a384-1ff37c1548a7@kernel.org>
 <Y+Oo9HaqPeNVUANR@makrotopia.org>
 <514ec4b8-ef78-35c1-2215-22884fca87d4@kernel.org>
 <Y+QinJ9W8hIIF9Ni@makrotopia.org>
 <c29a3a22-cc23-35bf-c8e0-ebe1405a4d94@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c29a3a22-cc23-35bf-c8e0-ebe1405a4d94@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_023422_993788_ADE4952E 
X-CRM114-Status: UNSURE (   9.02  )
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

On Thu, Feb 09, 2023 at 12:30:27PM +0100, Krzysztof Kozlowski wrote:
> On 08/02/2023 23:30, Daniel Golle wrote:
> > Hm, none of the current PCS (or PHY) drivers are represented by a
> > syscon node... (and maybe that's the mistake in first place?)
> 
> Yes.

Nos, it isn't.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

