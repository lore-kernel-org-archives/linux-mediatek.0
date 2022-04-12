Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E07C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 10:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JevxNSWzE5P185K8OViy3shfHzQES7on8VmCdGilfg0=; b=203Xg7hLba76xT
	ZYmzhjcHy9F/n0SNZ8S4hK/8kBsl+CEy07MNrWQxYkx2PbXn0CAPkp0qZuh7QCR/WByKq/ih/Wpcs
	w03Eq1kPqrOznIrlj0qrd1Rq29RTWOj3pMFyHoUoSw7r8Dn395GAA7LAJDcE4E8l4qU7IC0CwTkyI
	vHcTlNoaGPFmS+lzYhSiLzos/IRbj0cBp2P3WyugBGxbLCc6ZlSsI/NjpCzjrfn3tUByRaQ572ZQF
	BZs9ZJ8dsAdgl6DHNLAcqzFGgw0X27LUgPIDfPXbTtW2E1DToOWgLw4eb2Vtf1WiQrmZqg7fZ6/Q0
	nkyoBbgZpUzylir8oEQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neDfD-00DG9w-Lx; Tue, 12 Apr 2022 10:22:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neDet-00DG0k-3s; Tue, 12 Apr 2022 10:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8mu2jTD+xVbtbIrFy4KRwneKcuptUUpWu7md4ZAhGrE=; b=BrWKl+UaU5ES+56Jq/lPqBAFKN
 hUksDkt9l6SM3ADDOPa2LRdm/dflNIaFzHHxbx7ABhFGBo3I4ZSVlqJ6T+ZZiakoJ07dhSrIKKynm
 nCYhso4gW5F1IYN7kSHfx9Em//2NorFgqICGoAKWuPRTqvnyKFPHpGeFBWsSkIViSAMB3C8cNIeFL
 MffrdjlQRFI8vwyAT/AG5D6ypHmgQUuT85oXeFuubUMFopv8mfaVJSSOcxHI0iYovDD2SY9weBvlh
 2/SVTyFX5o9sN1+AATXjtd9Mu0PkyogDE+ll99Jz9nAEDESQQTmue6CZES1fbktRR3cCcZv6+kRCP
 wz32bH6Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58224)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1neDel-0001gX-2w; Tue, 12 Apr 2022 11:21:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1neDej-0002Ir-L2; Tue, 12 Apr 2022 11:21:53 +0100
Date: Tue, 12 Apr 2022 11:21:53 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: patchwork-bot+netdevbpf@kernel.org
Cc: Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
 andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
 kabel@kernel.org, olteanv@gmail.com, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 0/9] net: dsa: mt7530: updates for phylink
 changes
Message-ID: <YlVSwTNMgBqB8AHl@shell.armlinux.org.uk>
References: <YlP4vGKVrlIJUUHK@shell.armlinux.org.uk>
 <164975821353.21132.17881540288519221118.git-patchwork-notify@kernel.org>
 <YlVSaqofDKfspeX9@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YlVSaqofDKfspeX9@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_032203_174513_A3E8C64F 
X-CRM114-Status: GOOD (  10.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Apr 12, 2022 at 11:20:26AM +0100, Russell King (Oracle) wrote:
> On Tue, Apr 12, 2022 at 10:10:13AM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
> > Hello:
> > 
> > This series was applied to netdev/net-next.git (master)
> > by Paolo Abeni <pabeni@redhat.com>:
> 
> Hi,
> 
> I think your bot is incorrect on that point, and probably needs
> servicing.

Oh, sorry, misread, everything is fine (apart from my sanity.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
