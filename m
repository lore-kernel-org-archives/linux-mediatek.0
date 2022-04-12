Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D666C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SmvNrlHdir/jeKZo6ckG3ENuWAB7AqCmkglrdrif/Jo=; b=FQ6ofWa9yL2ejR
	sdDGPoSJO7TNbNnCalbGnd4y6cUvUlxm5pw+cQVQuiO0yUPknQzKgvMkR/zzH/9k4iAht9IkQ+LRh
	OfNkHi7c5n7Lz7VKDsTFiuji142M9SUbbdUHPQF9IYScFKZr3GztuY1ZnUZ7L+n9xw8iCEGfNaqxT
	H7lMuwLSDspwFIAmH4vrDHrwYbYCigYHH8vv9F8Jvv7U8OValZZU51C7V08298UuIt6Tiqgw1mjCf
	aWf7qtxT0e+t83hxsn9qMcGkRlGljT+vXdsQHab3nNGZ0YE5e6XAXO7esXkfz7DDYywvRDgDPGg/G
	0wJFK89Eta9NCw4m7zZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neDeH-00DFfa-QS; Tue, 12 Apr 2022 10:21:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neDdh-00DFKW-3A; Tue, 12 Apr 2022 10:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=frZD6RZxhZJKCmfaA6+Bd+cAy86b0BJikQrdi8OEOzE=; b=0jJzFS/woDIFHow55Db1ZDsK3P
 L12Fl3QjYReEx5idhzmSgguptyZ+A18R2ZTZQBnJBWV8f8jIDEOJ024zNqvwFPyfEEobj5Y5MnUZZ
 WR8O+SuNDOx7bTxVW2xXoIF7UDjhZkgfsfZGkN2zN1wohjfzPpGBeLQ2Wu+Sp5AByeP1TLh/5GnSe
 q+d/2vXPlKw7ajUXzO20Fa0sphVUF5cG6jvewdZRT4A4QOS7AqhODa3PHI222CyHenwrQJ90OUsa0
 gwJzXE0AqadPfcOpkhpbsMXzBoEP2x0Fjyg8pwMbxfiBNZ6d/5Txr3D2jSSnZdNMvIDTSr6Pscx4K
 UzNhbT7g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58222)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1neDdO-0001g3-4J; Tue, 12 Apr 2022 11:20:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1neDdK-0002Ik-QV; Tue, 12 Apr 2022 11:20:26 +0100
Date: Tue, 12 Apr 2022 11:20:26 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: patchwork-bot+netdevbpf@kernel.org
Cc: Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
 andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
 kabel@kernel.org, olteanv@gmail.com, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 0/9] net: dsa: mt7530: updates for phylink
 changes
Message-ID: <YlVSaqofDKfspeX9@shell.armlinux.org.uk>
References: <YlP4vGKVrlIJUUHK@shell.armlinux.org.uk>
 <164975821353.21132.17881540288519221118.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <164975821353.21132.17881540288519221118.git-patchwork-notify@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_032049_427698_26239E37 
X-CRM114-Status: UNSURE (   7.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Apr 12, 2022 at 10:10:13AM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
> 
> This series was applied to netdev/net-next.git (master)
> by Paolo Abeni <pabeni@redhat.com>:

Hi,

I think your bot is incorrect on that point, and probably needs
servicing.

Russell.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
