Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D94BC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 09:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5wPLE9TZz9FB8/zFddxM+lmOG8aS1WUAq/N+WIF/34=; b=pGlTWEIkJHkeRAQ4xg4dwuky9r
	/+Q1rIsKhqbD06R2i3QZjFZOMPlg+JdicOLL/p64ZH/X/pTv3MOLwMuHGjtaKKxNm9CJLSfhmoY0x
	ZPDhDjzy0DZmdOSfZJKQJAd8W1KyTHEFFOcFa0Ry/74hx4QqCLoiZpFnYzyIE681aONtYCbNBtHZu
	FkvtrsBjUW+E0IkwxVDkcic/aTmG4C9kXiHgar3sCTelh9rm4LuraPzLvdW/LSBxAnccwwWFq5Ea9
	sFvn7AL/sSGYMjMZPjBaWGg8lhf6x02j6DBIoJ+jq9n2s8vmo3kmBiSMTHbxnCGa7+Pk+KBDg4Zfg
	rNwppG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKxts-00AI8Z-1e;
	Wed, 03 Jan 2024 09:51:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKxto-00AI5X-28;
	Wed, 03 Jan 2024 09:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D5wPLE9TZz9FB8/zFddxM+lmOG8aS1WUAq/N+WIF/34=; b=jg9h8ytC1jyaCi86YZ3yq/HzUo
	Seznnu4aTFRdTXJGmfFHAoH6YU3aS90j7cpthWeEQHQJRY2fKCahqw78iCTzpUsUvyYF0Idcea9e7
	4arIyVUDfOFaoh9Ibm0so5z1qetdUTK0DxUHg3rlmi42pbdqAQmsIpfDsucH/U7J2FS+8C1QwFHUG
	/ZaP/aEtdTMz/JKRqc7Fvp06Qz7ijJfpB+2r5LEOqJjR4MudDJfT0fJl8KRvuJCSFaU5DM/lstI4G
	VrnQtA+7spviCCv2HrumYR8WSHEDQpeo70e0Z8kk54G9pVtQUnZ9haza8a/DcL/nUFA4ZkjBsJYKu
	+4iAFSWQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45524)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rKxtZ-0007JJ-0I;
	Wed, 03 Jan 2024 09:50:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rKxtZ-0006G0-1w; Wed, 03 Jan 2024 09:50:41 +0000
Date: Wed, 3 Jan 2024 09:50:41 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH RFC net-next] net: pcs: pcs-mtk-lynxi fix
 mtk_pcs_lynxi_get_state() for 2500base-x
Message-ID: <ZZUt8YG/z8koXK9y@shell.armlinux.org.uk>
References: <20240102074408.1049203-1-ericwouds@gmail.com>
 <ZZP9GR15ufDbjGAJ@shell.armlinux.org.uk>
 <92190426-3614-4774-9E9F-18F121622788@gmail.com>
 <74223164-ab50-4d6d-a4f4-561b0a70d396@gmail.com>
 <ZZRrk85SCDmo76NJ@pidgin.makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZZRrk85SCDmo76NJ@pidgin.makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_015056_696411_39893E9F 
X-CRM114-Status: GOOD (  13.02  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Alexander Couzens <lynxis@fe80.eu>, Eric Woudstra <ericwouds@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 02, 2024 at 09:01:23PM +0100, Daniel Golle wrote:
> On Tue, Jan 02, 2024 at 08:33:32PM +0100, Eric Woudstra wrote:
> > [...]
> > 
> > So if phylink_mii_c22_pcs_decode_state() should not set the speed, then it is not correctly set somewhere else.
> 
> Yes, but the fix should go to pcs-mtk-lynxi.c and you don't need to
> change phylink for it to work.

... which is broken thinking. It's "let's add custom hacks to drivers
to implement driver specific behaviour, ignoring what is being asked
of them by the upper layers."

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

