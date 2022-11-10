Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C63FC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 18:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKdGnCKxpuTh9fhvavU8cWMge7d1DhtKAJibrny01yg=; b=C8vKuUO4oc0cGaQOGGtszxFYWB
	y9zOkO94rLQkU/jUON66i0Ltn3+ZPdHOJjJ4hZyofcp6TMgEjIgun7mwHNjGMxWadYF7aa6ZDvAOA
	/V5O4LHuQB2Ql2vKK3x7MKAY7uTx7TbljNxg2Dz1rVp5KmBz2oKwpYCajgM/CT7jj1bPb8ZYP79G3
	Cl5ffTw48oqo7F/6FqNK+dPRxWFca/h2AGmWiKO+3E/YbBeLT12PYlXNHtg80xfA7+FpNqOyuz/va
	0fiFzVY1sz+4OudY6avMRpGJaABP6TrTiNOVHMzA+kwcKozCiHwfnDbou7E5EqIyhno8700jwvYXZ
	uki6GU6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otCgw-008MIi-RP; Thu, 10 Nov 2022 18:54:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otCcr-008JAM-Qb; Thu, 10 Nov 2022 18:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QKdGnCKxpuTh9fhvavU8cWMge7d1DhtKAJibrny01yg=; b=KQw0ZO6ZcEBYnKesCL60YxJaNh
	rY84E1GhkPUwTYg2l3ja9XdzsluWi9Agu3xNtH10AVRtlHloAGWlLWPJRHl6M3S6jE3Igl+st17pm
	sUI4EKhWwOfnpVpqKQXKlATlahV4LvRnw7a4l7EEwql8YLckSc8LJvFYOGi8ORE5Op/d01GMjgvQq
	7gOexK4sdHiPkpElv1z+MHqB4jcU+qv9teEhg+EzMRMpOQXg4caHVjOXG9h4Lxj6baarMmRZ2Ff51
	1h5xM5m1JqDww24hjEESPFSfGyYKxKM8AHG06Kamx8/V7FUy2v3f6B+2jYfjYhyr3Dx/FNfTsFj3P
	XcppuzMg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35208)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1otCcm-0005yV-Dv; Thu, 10 Nov 2022 18:50:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1otCcl-0006r4-QG; Thu, 10 Nov 2022 18:50:03 +0000
Date: Thu, 10 Nov 2022 18:50:03 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 00/12] Multiqueue + DSA untag support + fixes
 for mtk_eth_soc
Message-ID: <Y21H22Geh0a0pcta@shell.armlinux.org.uk>
References: <20221109163426.76164-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109163426.76164-1-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_105010_075238_EAB06CE2 
X-CRM114-Status: GOOD (  10.67  )
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

Hi Felix,

Not directly related to your patch series, but as you seem to be
tinkering with the driver, it seems appropriate to ask. Are you
using hardware that uses RGMII? If not, do you know anyone who is?

It would be good to fix mtk_mac_config(), specifically the use
of state->speed therein - see the FIXME that I placed in that
function. Honestly, I think this code is broken, since if the
RGMII interface speed changes, the outer if() won't allow this
code path to be re-executed (since mac->interface will be the
same as state->interface for speed changes.)

It would be nice to get rid of that, because this is the very
last pre-March 2020 legacy ethernet driver, and it's marked as
such for this very reason.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

