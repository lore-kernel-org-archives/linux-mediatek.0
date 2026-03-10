Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A08FD2D69
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 12:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELrrCbxIPB/3LJIx8lDJKH/BBlwUfQI6JhtI01g48AA=; b=WLfkowh0+uXx4uKnbNldqpGBvF
	6R4mXVj3zMd8F23TQkiWZH4nyPfmPkoDliuBnliKeqE2qLkgnkOXtidXrBxW6C/Ga+fUDYyNSjrha
	OdYf5OfPC6FwuazNIM7YnZqx1dJftANLSovgCl869Xv4zgE5MgTBAaDyiiaATcz/UT1TDtKGJMY6p
	JK0Yg5m4HWEY1YGbhk0j29GbabaEhRoDg8QbCzsDkF3YykJtbx87SlDXbPDNVgaGXAeKG+Hy0zeBl
	j0Sot9uVhykjhgHNEUV4YmDEWtAoOE3jKUNiXSEi6Rfc/k+fWCqNrGt7PCNjp3OQr7UN5PbNc6ck0
	AoKKW34w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwE1-00000009UI5-2y1O;
	Tue, 10 Mar 2026 12:30:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwDy-00000009UHO-2tU3;
	Tue, 10 Mar 2026 12:30:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 933FF408D7;
	Tue, 10 Mar 2026 12:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D47C19425;
	Tue, 10 Mar 2026 12:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773145809;
	bh=TzlCotxcVT6dvedJ0FiuS4FRNkDSl+AbCRH0nt2v3jU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oMuqiL5KD/vE1T73WmdbrD7Ys72rQc4Gj/7cE98alu6HSeOGlVn/QMZYHFrt3ZXHM
	 TMcZ4f2OE9l6gnGZxp8LUFqKYIUCHVJtZgsDspWwhqIo1NpsRAj2dZsz/OSDf3ki5n
	 cAaDVOx+oF+SclLCMH/HYHssnfVPAgjt8+p5geEAt1hb4YjznDLyHDKHOH3QUzM21U
	 5MCW68OxflZWKyfojLH67hpcKx+VP0U+JakijCwEBRBIqy8NqHnPvWYFRxVhrexNrv
	 CBb2r6BJRJT0/TSafCp4wLTQBFIYS995fb24DFVSycGil1bmoxZ/FmIaQONKcGKTbc
	 YiJ4YfCJh04Ww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CDF53808200;
	Tue, 10 Mar 2026 12:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Move GDM forward port configuration
 in ndo_open/ndo_stop callbacks
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177314580605.2263385.3496529123194142050.git-patchwork-notify@kernel.org>
Date: Tue, 10 Mar 2026 12:30:06 +0000
References: <20260306-airoha-gdm-forward-ndo-open-stop-v1-1-7b7a20dd9ef0@kernel.org>
In-Reply-To: <20260306-airoha-gdm-forward-ndo-open-stop-v1-1-7b7a20dd9ef0@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_053010_770863_AA9F890F 
X-CRM114-Status: UNSURE (   8.47  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 06 Mar 2026 16:09:47 +0100 you wrote:
> This change allows to set GDM forward port configuration to
> FE_PSE_PORT_DROP stopping the network device. Hw design requires to stop
> packet forwarding putting the interface down.  Moreover, PPE firmware
> requires to use PPE1 for GDM3 or GDM4.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Move GDM forward port configuration in ndo_open/ndo_stop callbacks
    https://git.kernel.org/netdev/net-next/c/46097d011f77

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



