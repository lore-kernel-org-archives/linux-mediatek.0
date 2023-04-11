Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED6DC77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 01:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2M/HH3KP2MXkvoBt5iayML7Fhe/4TJymFPNB2Lnc/I=; b=ODXKDus59ALUqFihIQx7EWL27J
	AAB0ou8dBPl3O2Y0Z+Kp8lIfnL9Cm2VhpcJjGp4bH8owChX3oj8CDeEyZCyS7YNG+x7CN1Xw01Zk4
	VjOA5WIqsk3v+1luCe6QKO7lpyVQYj3vWK3POnl45DeKzp2i/QdKVtxwa+80h3J04BC3KxAFQ5YiP
	T5bgyw/abrMZFeT2O9URtk6kBYshddUJLY+d0YnU16pX4f0V2+A01iRTkcxu8hpMPyxTd2UkAPANu
	E5U6TSfYAGUfOECsqJooUqb9D9bgNIXDgTsANZvJHYGgeCFWy21fR1XEBFW/MRraZVON/0drH93ys
	uR2VZGmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm2zh-00GDZZ-0Y;
	Tue, 11 Apr 2023 01:40:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm2zd-00GDYZ-0k;
	Tue, 11 Apr 2023 01:40:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0F9AB61F73;
	Tue, 11 Apr 2023 01:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65595C433D2;
	Tue, 11 Apr 2023 01:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681177219;
	bh=Phhd3b5xzdZAq0qYVQ0j7I4tVQEDlwELHRNYYxVGzQ8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rFQz5u8numU+VO3K8uAIuwctXgTPHOcbX/too+33oIYjjIuOyL97mMo5stgHxhCZ4
	 pNXeWJYG23z0+YyqALum1JYA1dTtlcd/rmmsFkSuWwSLoy7yzeJsTWtTbxkhWIM4LV
	 VHuWDqHg+T18W6fyInmm9IQ5UfAvQGaWUyihXD6F32ewefWpUTDbdBUn0roQ4h909B
	 jiPnmyXMaNSLRFsACFmKPVzr4YoqTjt5V+E1OuhAsm3FXsUpr6ceguFHtE+/fgh2Qk
	 gk0aHfbMDays/4hagH3BcjMKYYJDzF5OYxGKonzm0rn0wFG90mume4WiPy9ybtrp24
	 /8BmdLaaal2hQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 47E1CC395C5;
	Tue, 11 Apr 2023 01:40:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: ethernet: mtk_eth_soc: use be32 type to
 store be32 values
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <168117721928.17236.15670103612054656296.git-patchwork-notify@kernel.org>
Date: Tue, 11 Apr 2023 01:40:19 +0000
References: <20230401-mtk_eth_soc-sparse-v2-1-963becba3cb7@kernel.org>
In-Reply-To: <20230401-mtk_eth_soc-sparse-v2-1-963becba3cb7@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, andrew@lunn.ch,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_184021_324772_920F511A 
X-CRM114-Status: UNSURE (   9.81  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 07 Apr 2023 15:26:51 +0200 you wrote:
> n_addr is used to store be32 values,
> so a sparse-friendly array of be32 to store these values.
> 
> Flagged by sparse:
>   .../mtk_ppe_debugfs.c:59:27: warning: incorrect type in assignment (different base types)
>   .../mtk_ppe_debugfs.c:59:27:    expected unsigned int
>   .../mtk_ppe_debugfs.c:59:27:    got restricted __be32 [usertype]
>   .../mtk_ppe_debugfs.c:161:46: warning: cast to restricted __be16
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: ethernet: mtk_eth_soc: use be32 type to store be32 values
    https://git.kernel.org/netdev/net-next/c/9bc11460bea7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



