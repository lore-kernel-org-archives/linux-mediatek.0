Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5FBC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 11:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H6edCYlK/lWLkWKszMxThIDh9riOMwOBMev4TxY9odo=; b=PaNwiDWtFkj8+JbJG7aLFatOo9
	J3LdCtB40e/rCTLil4lQgt32ymQD4Fi3FuiVJAzaO6KtMP5nNBeDOAGfRViR89GFRsrKpzT4SuON9
	p3Zf195yHtCgTcSi4MdUkGc5Kvc1apybzbr6EiHWR2e5CJRovBsL5ZHqK7mwiBAGvBn2Eic79Vu7+
	GgYp4yoZjlSTkymFuVhwQw1hJe0B6zGlJp9PujMF9qEoJNW1oD7lmJBAeDtbTAqsiwvc+AX5rbY6G
	FIrXohw7c5jlvJ++VqARjhDKVfYNft18+ZvFwrgkdmbaJvgDrOY/nJxtUXYtwwQw10iXYTL63Apdq
	Eea9QALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1m0L-00000006EPT-3RnQ;
	Tue, 30 Apr 2024 11:50:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1m0H-00000006EOO-3zes;
	Tue, 30 Apr 2024 11:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 02DEA614E8;
	Tue, 30 Apr 2024 11:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D1BCC4AF18;
	Tue, 30 Apr 2024 11:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714477829;
	bh=p+ENwJCsykCW/qhdhEg1FQUbh2EUt27b+foeevRiMcw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Z9r9azER/+HcufesMEygLcC9skhZqlT25mKI/8CLRDemnzxbrKj0YD4cdB9P3IUSi
	 dyITdqORqwEWm68mYvn6LDFaNYKzoNS7Io3ML7Aye6vUidzjoY2bQFIZwtAgkgbsg+
	 voW+HRElcy/Kq13O4Q/DBSJPbn7wjwHRppVTmnjwk9dmJ4uVoFEBLXyZCWxV3NZDBg
	 8F28E07Ti1KcIcLzLU6uPGAKjadJbba4iIWmeunxNArzYv9WTfGjpQYa3qw+gZ+EPI
	 E0MLn4n7o2DyP6HDkahyTQbrQ9OyKg6X7ulCljdimGbT5MNeSSb5+6FnjaeDvZFiXQ
	 XURCV+Q/VMkUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8B2BDC43444;
	Tue, 30 Apr 2024 11:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: dsa: mt7530: do not set MT7530_P5_DIS
 when PHY muxing is being used
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171447782956.17629.8692193318005326042.git-patchwork-notify@kernel.org>
Date: Tue, 30 Apr 2024 11:50:29 +0000
References: <20240428-for-netnext-mt7530-do-not-disable-port5-when-phy-muxing-v2-1-bb7c37d293f8@arinc9.com>
In-Reply-To: <20240428-for-netnext-mt7530-do-not-disable-port5-when-phy-muxing-v2-1-bb7c37d293f8@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCB2aWEgQjQgUmVsYXkgPGRldm51bGwrYXJpbmMudW5hbC5h?=@ci.codeaurora.org,
	=?utf-8?b?cmluYzkuY29tQGtlcm5lbC5vcmc+?=@ci.codeaurora.org
Cc: daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_045034_060105_1D4A36B2 
X-CRM114-Status: GOOD (  10.63  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Sun, 28 Apr 2024 12:19:58 +0300 you wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> DSA initalises the ds->num_ports amount of ports in
> dsa_switch_touch_ports(). When the PHY muxing feature is in use, port 5
> won't be defined in the device tree. Because of this, the type member of
> the dsa_port structure for this port will be assigned DSA_PORT_TYPE_UNUSED.
> The dsa_port_setup() function calls ds->ops->port_disable() when the port
> type is DSA_PORT_TYPE_UNUSED.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: dsa: mt7530: do not set MT7530_P5_DIS when PHY muxing is being used
    https://git.kernel.org/netdev/net-next/c/16e6592cd5c5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



