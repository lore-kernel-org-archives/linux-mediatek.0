Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FF1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 12:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMCmw5hzHP8ja1lWwES8M/2Z8fwq+4teZUssqpoj1U4=; b=vbZTtUnTm6ubbM
	7OWfUSB5EI573ffh2nvzSx9lRBljQUTPsM8zej6JMkBtTbxWmQieJIUSWvUJhlw0IQmkYtL2UsPHp
	R7idWatEIFxC823EmIdaq2ebxUZHQrMR7qGWESYvmcztzKGRlRcDLNlh6l3zFyaKNOEBqNUjt5+J3
	4KnVL53oms8qHzdvN8FWEY94Ip9haheMMjVrzPe9cZl45KufDhQt/pSMRBLL0u1wb4w5KC0Nuk0fU
	s+dIKg6nKSzYYApQ8oD05fbcjEL0/gR0e05x5/YGRKQQvVmnJPBFdyDWJ1hduIAlOJYpQn5vad8UP
	NY7SYVIzY3yYnXLcpVig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRYyx-004Mat-Vw; Tue, 08 Mar 2022 12:30:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRYyk-004MZI-Kz; Tue, 08 Mar 2022 12:30:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F1AF7B818A4;
 Tue,  8 Mar 2022 12:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 967C4C340EC;
 Tue,  8 Mar 2022 12:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646742610;
 bh=6FszrISk1dSIgT1ZCr4pn2WXttnNm0A9IShBszaSE4g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Z15SDG5piWI0HQAlErMTBxXMpfTZA8SZ24/okqswokz4BZdXb4OSJJk8QdVzL3gDB
 RoY5yzBj7G4lwHC34DrvUp3NBBs36XIM95cJrSAxFjy7QvPhBcePAY/RZdOsVEkT1h
 +KbDfS1m969124FOAcUgT5JLZLW9pgEW4gAi3M6AsIQcFUE+AaLKnSv6QMLTqyc3SZ
 1syl2C0NYquaxaCdLsr1RvfzL2fUeAUoa+/YrURAyRUghJ8qPCPxRN9fpFMMXZ+HXU
 N16NMQCSRw79Z38eM454+5kQxxt0K55SjenDV02ek++NkzUbWDWPvqlm3fnP31w0oa
 5eAP9aVW+n/aQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 777B4E6D3DD; Tue,  8 Mar 2022 12:30:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net] net: dsa: mt7530: fix incorrect test in
 mt753x_phylink_validate()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164674261048.611.6556079639015466902.git-patchwork-notify@kernel.org>
Date: Tue, 08 Mar 2022 12:30:10 +0000
References: <E1nRCF0-00CiXD-7q@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1nRCF0-00CiXD-7q@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: dqfext@gmail.com, Landen.Chao@mediatek.com, sean.wang@mediatek.com,
 andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
 olteanv@gmail.com, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_043014_895632_6903C949 
X-CRM114-Status: GOOD (  12.09  )
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

Hello:

This patch was applied to netdev/net.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 07 Mar 2022 12:13:30 +0000 you wrote:
> Discussing one of the tests in mt753x_phylink_validate() with Landen
> Chao confirms that the "||" should be "&&". Fix this.
> 
> Fixes: c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> As the mt7530 maintainers are not very responsive to my recent two patch
> series, but Landen Chao did state that this should be "&&" not "||", lets
> at least get this patch merged.
> 
> [...]

Here is the summary with links:
  - [net] net: dsa: mt7530: fix incorrect test in mt753x_phylink_validate()
    https://git.kernel.org/netdev/net/c/e5417cbf7ab5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
