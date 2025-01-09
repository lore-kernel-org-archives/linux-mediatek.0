Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6129E77197
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 09:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2z1ESVuVcDzbxcpb3sc64PCr4c05BAv4LDC9oyfa7s=; b=PGRbJ5cyMBb/uuBplcQaJ8T3Tu
	SIXbW7zWxZV10GR9w/XWV1Af0BVtX65ESSxodzg3awIx/VOGHRR7QtwKFyyh8MWtZRHIoYpy9GdXK
	nahv555G7Z+lFPa1vtXlv+RbnoD8BJQJZFo5RWHmOioGtaM5urZ4wZHRSmnFNCjHw251WX3wUy++f
	5xyTg2rcEQAzvPUzvpb+/v0m7UhuLHCd5rMA/qG7HmjmdRfu9T1YBIyjSEAL7Zd9QTQLJ8zhVQt4t
	MVb4s8BcLviUbW8uV2MuT3Puh01cchSjpFawkI9eoklEOYDiej6p/CgWSfbnvLteOo3JxLyKRyP6b
	WiUQXRkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoiJ-0000000BKoD-3Ubj;
	Thu, 09 Jan 2025 09:20:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoeN-0000000BJTl-1T3k;
	Thu, 09 Jan 2025 09:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R2z1ESVuVcDzbxcpb3sc64PCr4c05BAv4LDC9oyfa7s=; b=L4ZB8MDV1RBG7G8NSURC7qZQ3A
	qvL8HWzbo7iVXe/7oTalE7eJwQfWrWgFE3pE8tn9nD8hHXKq5fkEatoELVfIPL8sh0NwED/hInbgw
	RCTSNRNKdl9vOn70vjC/Xj8o2afinyk+LuedUBhugETfYryDTX+TJ1OOvQVccDr1qYrTKWCLwCN4X
	T0Ylh6f72ij58CSbUyfgRJTppxnCwun62Ofytl/7+bU09/16MnSdS7rw/iFdDhJ0YNSvhIYFE280t
	e1qWDcLPZ3g6/eLHdl0uk218eEKmVH+Q+HrnFRP8yh/TMHd0OwM4nME37G0yKiJ4L16sqxhaOXzmU
	4kgH/NWw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46832)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tVoe3-0001oO-2e;
	Thu, 09 Jan 2025 09:16:03 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tVodz-0007Cf-0c;
	Thu, 09 Jan 2025 09:15:59 +0000
Date: Thu, 9 Jan 2025 09:15:59 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Eric Woudstra <ericwouds@gmail.com>
Subject: Re: [PATCH RFC net-next] net: phylink: always config mac for
 (delayed) phy
Message-ID: <Z3-Tz5WdLCat91vm@shell.armlinux.org.uk>
References: <20250107123615.161095-1-ericwouds@gmail.com>
 <Z30iUj6DE9-fRp0n@shell.armlinux.org.uk>
 <4b9b2a9a-061b-43ad-b402-a49aee317f41@gmail.com>
 <Z31CJS1YUvPGiEXs@shell.armlinux.org.uk>
 <98234080-946e-4b36-832f-113b185e7bca@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98234080-946e-4b36-832f-113b185e7bca@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_011623_443843_90B2336A 
X-CRM114-Status: GOOD (  13.57  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, coreteam@netfilter.org, netfilter-devel@vger.kernel.org, bridge@lists.linux.dev, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 09, 2025 at 09:56:17AM +0100, Eric Woudstra wrote:
> So I've narrowed down the problem a bit:
> 
> At first state->link is set to true, while looking at the bmsr.
> 
> But because linkmode_test_bit(fd_bit, state->advertising) and
> linkmode_test_bit(fd_bit, state->lp_advertising) are both false,
> state->link is set to false after looking at the bmsr.

We shouldn't be getting that far if aneg isn't being used. The problem
is this is no longer sufficient:

        if (!state->link || !linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
                                               state->advertising))
                return;

since whether we use aneg or not now depends on state other than just
the Autoneg bit. It isn't going to be a simple fix, because we need
the PCS neg_mode here, but we don't have it as an argument to the
.pcs_get_state() method. I'll look at what we can do for this today.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

