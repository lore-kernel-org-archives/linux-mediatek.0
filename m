Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF48C87FC5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 02:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeBKQHu4REtoDiGxmR/wYFvgGjsPsH6vkGgdHIDgaKo=; b=aQhrYfp89tv4hK/2DBXk54VUlX
	vyK0HDqG9mjggDxoBB5ofZE8i+2eNWFDvS3a6U/YA8HhzGMNUTnXBfCNFAMVY4o336IlBDFpG3gbx
	ltAtOCbVPta+ld0TMqxYo02Vps+mJ3e6QprYJTKJKOoxQB/oTpvvus/Jt/ZyzN4LQZ5C3Sck5yHiJ
	0L5XwnpjTHUjNE+gnvnpkTLg+fdy0WbjOmIc3p6lPc5iZ0TJStaKP8z1x32twcq6yazWAdvBJHHGA
	NCR36vHJYOGsegaySEa9nk5YO+3dou+wsD3MqN6SLRarDJeDk70sP1pA9tAM15z21aMW2Z6RG66ze
	U7U1FZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uelG0-00000006JmX-089o;
	Thu, 24 Jul 2025 02:00:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uelFw-00000006Jkw-3qfC;
	Thu, 24 Jul 2025 02:00:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C194B5C677D;
	Thu, 24 Jul 2025 02:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6749DC4CEE7;
	Thu, 24 Jul 2025 02:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753322423;
	bh=BpiBxoeu56d35+/JzOYrXKdHXbJJT/hxC16C6lp6gcA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FZpVLHS3icbEQYbRG1+helDdBFX+wQpCFSiakNNIv0ThNYsWN8+wKwU2x1N3sV8Gv
	 DXyX6qd9uvS9jbrnH0u1AgyvOaQft9DZtNjlPlsDXjoox7TvcPgZF/8wxi/eoD80UI
	 pIvFlEM4HcIYFB8rWvVJbTSH6/DXIoGZ9E25Df4gXS0SPlyC1AGBcuDyjGXIo4nkX8
	 X35iuPt2DKaZYuJFYaIKvTAJD2ICgAWE1rhevidTMwzKKjRKBODq2DoqE4ZEKRvMtb
	 TxPoHsoPDEoXYaEYxkkgSrElK9ZWMvipIX7CN8ER7eNLHuBZQez7JQAhtnpZdBVBWh
	 97HvXJttZJJ3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD9E383BF4E;
	Thu, 24 Jul 2025 02:00:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v12 00/12] Split netmem from struct page
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175332244124.1844642.1793292791852018522.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jul 2025 02:00:41 +0000
References: <20250721021835.63939-1-byungchul@sk.com>
In-Reply-To: <20250721021835.63939-1-byungchul@sk.com>
To: Byungchul Park <byungchul@sk.com>
Cc: willy@infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kernel_team@skhynix.com, almasrymina@google.com,
 ilias.apalodimas@linaro.org, harry.yoo@oracle.com, akpm@linux-foundation.org,
 andrew+netdev@lunn.ch, asml.silence@gmail.com, toke@redhat.com,
 david@redhat.com, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-rdma@vger.kernel.org,
 bpf@vger.kernel.org, vishal.moola@gmail.com, hannes@cmpxchg.org,
 ziy@nvidia.com, jackmanb@google.com, wei.fang@nxp.com, shenwei.wang@nxp.com,
 xiaoning.wang@nxp.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, anthony.l.nguyen@intel.com,
 przemyslaw.kitszel@intel.com, sgoutham@marvell.com, gakula@marvell.com,
 sbhatta@marvell.com, hkelam@marvell.com, bbhushan2@marvell.com,
 tariqt@nvidia.com, ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com, sdf@fomichev.me, saeedm@nvidia.com,
 leon@kernel.org, mbloch@nvidia.com, danishanwar@ti.com, rogerq@kernel.org,
 nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, aleksander.lobakin@intel.com,
 horms@kernel.org, m-malladi@ti.com, krzysztof.kozlowski@linaro.org,
 matthias.schiffer@ew.tq-group.com, robh@kernel.org, imx@lists.linux.dev,
 intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_190025_031560_72606478 
X-CRM114-Status: UNSURE (   9.40  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 21 Jul 2025 11:18:23 +0900 you wrote:
> Hi all,
> 
> The MM subsystem is trying to reduce struct page to a single pointer.
> See the following link for your information:
> 
>    https://kernelnewbies.org/MatthewWilcox/Memdescs/Path
> 
> [...]

Here is the summary with links:
  - [net-next,v12,01/12] netmem: introduce struct netmem_desc mirroring struct page
    https://git.kernel.org/netdev/net-next/c/f3d85c9ee510
  - [net-next,v12,02/12] netmem: use netmem_desc instead of page to access ->pp in __netmem_get_pp()
    https://git.kernel.org/netdev/net-next/c/38a436d4e264
  - [net-next,v12,03/12] netmem, mlx4: access ->pp_ref_count through netmem_desc instead of page
    https://git.kernel.org/netdev/net-next/c/89ade7c73065
  - [net-next,v12,04/12] netdevsim: access ->pp through netmem_desc instead of page
    https://git.kernel.org/netdev/net-next/c/6fd824342a57
  - [net-next,v12,05/12] mt76: access ->pp through netmem_desc instead of page
    https://git.kernel.org/netdev/net-next/c/87dda483e63f
  - [net-next,v12,06/12] net: fec: access ->pp through netmem_desc instead of page
    https://git.kernel.org/netdev/net-next/c/65589e860a80
  - [net-next,v12,07/12] octeontx2-pf: access ->pp through netmem_desc instead of page
    https://git.kernel.org/netdev/net-next/c/58831a178551
  - [net-next,v12,08/12] iavf: access ->pp through netmem_desc instead of page
    https://git.kernel.org/netdev/net-next/c/c8d6830e32eb
  - [net-next,v12,09/12] idpf: access ->pp through netmem_desc instead of page
    https://git.kernel.org/netdev/net-next/c/fc16f6a5877d
  - [net-next,v12,10/12] mlx5: access ->pp through netmem_desc instead of page
    https://git.kernel.org/netdev/net-next/c/5445a5f71209
  - [net-next,v12,11/12] net: ti: icssg-prueth: access ->pp through netmem_desc instead of page
    https://git.kernel.org/netdev/net-next/c/c0bcfabd7752
  - [net-next,v12,12/12] libeth: xdp: access ->pp through netmem_desc instead of page
    https://git.kernel.org/netdev/net-next/c/9dfd871a3e2e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



