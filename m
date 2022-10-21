Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9553AC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 07:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3QJldfimGMGhCUVfS4T2fQs9aVrQkUBT9b7wxuInmVs=; b=REdCCQSflF3IheGb33hFDxOZjB
	cYJtJ1giqeiSm7ECLoTac/RrgDektUoEuxC+uX6kE+dHTJfA9oGaSNf62ryrNnP7EMh8AiBaWUTGG
	5fXsxi60hlO5wQM1us5iKM3ffmZPmPkeQfLndcEqLvO35AnzNqTeb6huwojFlI8RZbxxNI+YTnn2N
	PYhFpb19PHx/gbYF0Pcfaf7doPqJUI81mHE9d0TBFDuzCqjXGOdeRjoojmT91fRe6p3LRrGnEzNiF
	wMCHL9KXC+IprmJp88DyfprLnUR5Ub2+n/5JJ2lPsLoJmjXZOmehkPgdXv0z6iDdBBuGTRfelAYB0
	q6L7Prdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olmOB-0060DY-DR; Fri, 21 Oct 2022 07:24:19 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olmO8-00609z-Me; Fri, 21 Oct 2022 07:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3QJldfimGMGhCUVfS4T2fQs9aVrQkUBT9b7wxuInmVs=; b=ZTILIayE9X7wdaGqo8oZBO6jEI
	kFjfze0pHhiT162fcjz9zR0xhMJ5vcnIrncJcnVcB4ahsQ6sXSXUmk6shy20vj3tx89/uKqfrH5GX
	BBbMyV3A0SwzM+6Mj8+53QROktOQLRY1QD99ecZmOIt7x/ovkwEs6zLXR084uOfH93qghfLYVQOBN
	e4gHzybzRtjgNAUIEVYYaMgmJ9wqSR0QyeF2+yWYawQ0S8Ae/6h0ocAHRtQgg/26xYQv9pSOsU4cw
	2r1XQ3X9ZB6AkBeG8KC17SX+27NsTkgUQGsznB6cl/zJVqUsDiFTfkP4n4c2zqB9cReJRQ2QoXAJQ
	kSdWR6Ow==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34848)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1olmNz-0008Ix-Po; Fri, 21 Oct 2022 08:24:07 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1olmNu-0003yS-L9; Fri, 21 Oct 2022 08:24:02 +0100
Date: Fri, 21 Oct 2022 08:24:02 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
	Alexander Couzens <lynxis@fe80.eu>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Message-ID: <Y1JJEtvra2F3JGQS@shell.armlinux.org.uk>
References: <20221020144431.126124-1-linux@fw-web.de>
 <Y1F0pSrJnNlYzehq@shell.armlinux.org.uk>
 <02A54E45-2084-440A-A643-772C0CC9F988@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02A54E45-2084-440A-A643-772C0CC9F988@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_002416_790339_CDCA07C6 
X-CRM114-Status: UNSURE (   8.95  )
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

On Fri, Oct 21, 2022 at 08:04:51AM +0200, Frank Wunderlich wrote:
> On my board (bpi-r3) we have no autoneg on the gmacs. We have a switch (mt7531) with fixed-link on the first and a sfp-cage on the other. Second mac gets speed-setting (1000base-X or 2500base-X) from sfp eeprom, but no advertisement from the "other end". Imho it is always full duplex.

If it's a fixed link, then this function you're adding won't be called.
It's only called for in-band mode which is exclusive with fixed-link
mode.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

