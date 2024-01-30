Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98EBC47DB3
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 02:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyVvKVopKe6TxNhd9+OQTLGZrH6+ig0Ksl4YbeY/6QU=; b=raB/NUkY/tNStBAcdjY4I5JjSq
	eH9dzk2qtLi/sq4rYraJMZ2EuHHjrVLaWphvvA5lqQ83tuYiwJgQLqKCIcdYtD8nas9iwx9L17sl8
	HIK1sK/ycx85siB2brUbLnKW2fRKiWgxVsyAilj3O2keVAViVWAoZf4Ob/y2DhOIgywy76wkUiM/o
	j+FlOw2BILQU1GqaoHAacHtzh1k1GKEgxT6aWM4D37uVMeRjwWAuLMDOwaA7ZhtyWDBESGRgOx+3y
	1pqeApcwZbLb62rkTf46FyR3gYonLTyMzhJtCpUHFOS8xhxiMPQ4KObKZFnFuUELwxijuD/epKw+N
	5SvWWbuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUda5-0000000Ev3i-2duQ;
	Tue, 30 Jan 2024 02:10:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUda1-0000000Ev2W-308k;
	Tue, 30 Jan 2024 02:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 980B4CE0BAE;
	Tue, 30 Jan 2024 02:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C84D9C43390;
	Tue, 30 Jan 2024 02:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706580626;
	bh=4+POrROwPnatEmM5H95Kp47HMH+fWtriY394HxDqm4w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XgC+4ANf7/FtsIREu2/ImCQS+UqIYlntE3DhKgXU3wCsqhk4QKGgS+c/NvP04IoXW
	 Z5ld4+b0LiQNG9zzfm6hM3eQrbcq3gMsppMJ2k1n4t37PeKqikB0lkCLMqB9BLsXhC
	 eR4zVUHMniPARwlTFCd1HZrX/z798PeBFF2bZ9l9EKAUIf0amtv2W4t3j7vjLrIGjW
	 1hlFYFUuxxuVHWYp0UFTS+cnggC6qYDHTbNLTvw3PdLbKrp65TH9KXjeSqZoB9t4NX
	 AdQR57LgpgBVpTC8jyJWXklG3XQuAhNtoA7AW9iuJ7FXL5SaP3mrDefJwDZLo+BcAy
	 GF3Pn6yTo+bAA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ACE77C00448;
	Tue, 30 Jan 2024 02:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/7] MT7530 DSA Subdriver Improvements Act I
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170658062670.15779.8221227198505165496.git-patchwork-notify@kernel.org>
Date: Tue, 30 Jan 2024 02:10:26 +0000
References: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
In-Reply-To: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCB2aWEgQjQgUmVsYXkgPGRldm51bGwrYXJpbmMudW5hbC5h?=@ci.codeaurora.org,
	=?utf-8?b?cmluYzkuY29tQGtlcm5lbC5vcmc+?=@ci.codeaurora.org
Cc: daniel@makrotopia.org, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, andrew@lunn.ch, f.fainelli@gmail.com,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 bartel.eerdekens@constell8.be, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_181029_952308_4FFA6268 
X-CRM114-Status: GOOD (  11.70  )
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

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 22 Jan 2024 08:35:51 +0300 you wrote:
> Hello!
> 
> This patch series simplifies the MT7530 DSA subdriver and improves the
> logic of the support for MT7530, MT7531, and the switch on the MT7988 SoC.
> 
> I have done a simple ping test to confirm basic communication on all switch
> ports on MCM and standalone MT7530, and MT7531 switch with this patch
> series applied.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/7] net: dsa: mt7530: always trap frames to active CPU port on MT7530
    https://git.kernel.org/netdev/net-next/c/024d8577f534
  - [net-next,v3,2/7] net: dsa: mt7530: use p5_interface_select as data type for p5_intf_sel
    https://git.kernel.org/netdev/net-next/c/b198c9097f06
  - [net-next,v3,3/7] net: dsa: mt7530: store port 5 SGMII capability of MT7531
    https://git.kernel.org/netdev/net-next/c/1f4a85f2eaa8
  - [net-next,v3,4/7] net: dsa: mt7530: improve comments regarding switch ports
    https://git.kernel.org/netdev/net-next/c/05957aa77ed8
  - [net-next,v3,5/7] net: dsa: mt7530: improve code path for setting up port 5
    https://git.kernel.org/netdev/net-next/c/152f8e8e7458
  - [net-next,v3,6/7] net: dsa: mt7530: do not set priv->p5_interface on mt7530_setup_port5()
    https://git.kernel.org/netdev/net-next/c/6537973f2a5d
  - [net-next,v3,7/7] net: dsa: mt7530: do not run mt7530_setup_port5() if port 5 is disabled
    https://git.kernel.org/netdev/net-next/c/04a22bef5fc2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



