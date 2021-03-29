Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0908C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 17:02:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97FA76191F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 17:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97FA76191F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aRTLNN4CUFllKbtG1gWYA8wkRZPRxaHQN2YmaROSk/A=; b=F+TLFibisD5Eqb0yUKGo7lpls
	mplYTEYRkd0sdSflYZrIcfzd+5NfLmlxX5qEmVk1nX8wlgGnezWUnBHlSK5FNFbJ+5khiWdaaS8Mb
	3X+KPLSac31ZlbVqFtNFAZOmAc+P+Q1IwogWoPUxl+ZVgcEhcQMj1iAaWlMsvXwMDvLXhBTZSvDy2
	2vDEKSCV98zBlnmU+18RsTjcd3tW3EpdsHrZkmMdRGGcboDH0/bCX9Vx6jUg/2I0B0yoRrvLRa9uJ
	eVRv+g6sviFBQ02vflRfcaU/Jfm2jmJegNKFcTCrK2vaWj7QyRj9iYjEIKm4ysN9Xw8OnE6tM548V
	a9ufaTMcA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQvH2-000pKS-VK; Mon, 29 Mar 2021 17:01:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQol4-000Z1E-K8; Mon, 29 Mar 2021 10:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Date:
 Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=7+1fESDpBuMZFO06qMLLF7D7rR/O/8rpUE/fiN6xhyg=; b=RfQmysVzT7CcPn1Q/vSeHpdFPv
 Otv7K/jXeECUNPYRk1nqoLTbB/QbzfU45gS7P/kEm8dTR3yTW+pt+bFtG2FSKHFx+hleRJO7KFDzq
 AU8HiA5w4XofieaT6udDWFbFkqhFJmqD16cpuP5MO9iMKFCkJ9lxkypQRbQSKMWRjBdLyavwuqVP4
 plf65Gd1+Z6kAHl2rIwaihWwMZohJNrN5eGgaLc+C8IScPxtjmgYPBmY0T3x53cu3Wm3hwEyvyd33
 t1VVyqd8oKX5x1f0EzkJnikdjal3yDlXYWY0in/U3c87/JWWP8OwIxA/y9/73vdIrCSKtqGkoirFu
 A5/BqYJA==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQgGQ-000oCZ-NA; Mon, 29 Mar 2021 01:00:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 68E1A61951;
 Mon, 29 Mar 2021 01:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616979611;
 bh=gpcobxCjcUdS+iH3QsNq2oXcv+K1EvjHXu2erxNHrrQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CaL9yUbHLJa9Wql9vkz8HvKDg7sN7cagoaDqMryo1OEwdcj5VRl38p70qt8L3CIOG
 dMSyamL+yR0g6L87EpfTHUfymd1p1Ln/Cm5Qz2yAa1oJrtAVuFwrdLne7a85xCkhLA
 UjbKSVCI0C7eNgatOPCfxDRdHfhjU3HWexGn2c/bw/F4ZHUJEvoP6NO/b7Lk+lmj2e
 tt+ozUioqxai2fhxYVCUm/gC++63uqgdH5M92s/vkbT0Zz1SvrCFP3ATpXk24R0nKN
 QCWE+RYBwRjwNeNNI8266KW5v6OET6x/VCPK2SXepq+0uf2ffV+TI6c3lJrYxk7zoJ
 fxOc7kS9mPgLw==
MIME-Version: 1.0
Subject: Re: [PATCH net-next,
 v2] net: dsa: mt7530: clean up core and TRGMII clock setup
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161697961139.31306.12191866785096357875.git-patchwork-notify@kernel.org>
Date: Mon, 29 Mar 2021 01:00:11 +0000
References: <20210327060752.474627-1-ilya.lipnitskiy@gmail.com>
In-Reply-To: <20210327060752.474627-1-ilya.lipnitskiy@gmail.com>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: sean.wang@mediatek.com, Landen.Chao@mediatek.com, andrew@lunn.ch,
 vivien.didelot@gmail.com, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de, linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_020021_248759_BE5E6B4E 
X-CRM114-Status: UNSURE (   7.78  )
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

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Fri, 26 Mar 2021 23:07:52 -0700 you wrote:
> Three minor changes:
> 
> - When disabling PLL, there is no need to call core_write_mmd_indirect
>   directly, use the core_write wrapper instead like the rest of the code
>   in the function does. This change helps with consistency and
>   readability. Move the comment to the definition of
>   core_read_mmd_indirect where it belongs.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: dsa: mt7530: clean up core and TRGMII clock setup
    https://git.kernel.org/netdev/net-next/c/4732315ca9fe

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
