Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF724C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Mar 2024 08:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCkWYTEXWBakOnUz7fRFGXXdOpVCR+sv7wyPojg1oiI=; b=zVWQYoAB6ns/DeA4a7yBx/7VyY
	sfMm0octbxwYgYnmxIdVrH2nn2c3aOd31B2q6H3kl5VHeTzulWlgUk2SFYwnJ/5I73tvaqQetnzE3
	7YZt2lujTGtETCclFKTVjYPrddM5/IziM68SV5d6kq6J7c/rcuMxGPcfaKNv8H9jefksgBs2UMAfr
	Kfa7xO/y3uT6CjuCJL+WPJuDsy3CEJLpPhG0sIyDFeENPV2o9CoI0YWRWk6JxWvVpZZ2QTM/P0LEN
	Hbtd9MKnwDp45L7zxdHby7W215OtIQlL4YAjgwVoWU2L5Gn97g3jHSEVxL0ai/5+SHSFaWiRusrHg
	LE1x3IRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp2W1-00000003fi8-1j2X;
	Tue, 26 Mar 2024 08:50:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp2Vs-00000003fdc-28jd;
	Tue, 26 Mar 2024 08:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8DA88CE1F2C;
	Tue, 26 Mar 2024 08:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0CD0C43390;
	Tue, 26 Mar 2024 08:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711443029;
	bh=4X1Z3kvgSdNm/Ff7dFFnXnXj/MKpjiKYMAG4S+nj6rY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bMzQOZyUd//B/B/1Mhs5OviJK3RYqfO4NxyBm6TFNgBO6ql0hqh6PmXLOtnJ2xOFK
	 Tnv0jvVJC7WH+SweKyx3r3Oel1H89DK9Ouyvd7hBVkfrMPWSoqo+6Y1o6xKj8+0EGV
	 ehEhdJ7sJQS9WRsohNqoB+hZgqeFmyW6RCSbF/eL+ewPKrHS5f4eFSkUGL4eaSbove
	 keomdByrpeflobjpyb76QYRCU/w+XXu4fSLWpPgmgQQUfpihF6Mr1rL1Q7kvmzrQi2
	 zNXy47adMcpBN+Sn+RnnAFeq/JPSBeD9VkQbaLdxSlFbp0iSzJmaqtgj4Ez9jT62Cx
	 /t8/COWJAXTTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AB22CD2D0E9;
	Tue, 26 Mar 2024 08:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: dsa: mt7530: fix improper frames on all 25MHz and
 40MHz XTAL MT7530
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171144302969.11902.10822860484949100289.git-patchwork-notify@kernel.org>
Date: Tue, 26 Mar 2024 08:50:29 +0000
References: <20240320-for-net-mt7530-fix-25mhz-xtal-with-direct-phy-access-v1-1-d92f605f1160@arinc9.com>
In-Reply-To: <20240320-for-net-mt7530-fix-25mhz-xtal-with-direct-phy-access-v1-1-d92f605f1160@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCB2aWEgQjQgUmVsYXkgPGRldm51bGwrYXJpbmMudW5hbC5h?=@ci.codeaurora.org,
	=?utf-8?b?cmluYzkuY29tQGtlcm5lbC5vcmc+?=@ci.codeaurora.org
Cc: daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 Landen.Chao@mediatek.com, bartel.eerdekens@constell8.be,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_015032_758188_1FE96AFE 
X-CRM114-Status: UNSURE (   8.86  )
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

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 20 Mar 2024 23:45:30 +0300 you wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The MT7530 switch after reset initialises with a core clock frequency that
> works with a 25MHz XTAL connected to it. For 40MHz XTAL, the core clock
> frequency must be set to 500MHz.
> 
> The mt7530_pll_setup() function is responsible of setting the core clock
> frequency. Currently, it runs on MT7530 with 25MHz and 40MHz XTAL. This
> causes MT7530 switch with 25MHz XTAL to egress and ingress frames
> improperly.
> 
> [...]

Here is the summary with links:
  - [net] net: dsa: mt7530: fix improper frames on all 25MHz and 40MHz XTAL MT7530
    https://git.kernel.org/netdev/net/c/5f563c31ff0c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



