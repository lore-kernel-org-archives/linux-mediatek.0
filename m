Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1577F606A89C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 00:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qnDRyllN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UiTeGyCY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2wghTaLv3bd7cxoSQxpRSgUbdH9hiZjTo57P7TCO9lY=; b=qnDRyllNZKhTJs
	XJwdD0eTJa1qBMrYtX2YbDz6X6vU4q6RIVq6C2p2OmsrOTdS5oXdwL6S4yJ+v5R/u78NR8+trjrUx
	8XQd9pkokN170tM5s447FD4tcwYP61ZPUsHHtVYjGzEaYUh8woWba0MZceqWNPcyPdQNrt7KThFfm
	DqN+YPhBO251GF2I3wd7P8eEZTYCteE1krCcK2qS4GmU2We31uJb4O8+Jsl80KyubMji5FWcI166P
	bJS2DGNw3AgxzmCFgpEUJYdDTHqCzMm20XfoizyG2yDUxGqTotWsWutOfuj16ssg+nwz6TGhsFwNz
	VeT1+fjgUW+UtTC4LwYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT6cR-00000004DtR-2p8x;
	Tue, 17 Nov 2026 00:00:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT6cQ-00000004DtB-1jM9;
	Tue, 17 Nov 2026 00:00:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A514C6286C;
	Tue, 17 Nov 2026 00:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3D71F000CA;
	Tue, 17 Nov 2026 00:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794873613;
	bh=2wghTaLv3bd7cxoSQxpRSgUbdH9hiZjTo57P7TCO9lY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UiTeGyCYpcbiQOHt/hLZ4Qfo3MvpY6j3jmb0EwgeJnBq3ZU6JiIh5gjRTeUAkyFm5
	 kk36ipkaGNEQT8lOeEtcKmLFzr7hTNKW5HqxAWJRwR+VfPQgfwT90CLP2q4gNaoYBT
	 jR8TcH9sgvhWvMmE+c43DrbxfrAgNpHbyuRHRTkkSN1b7U5mVOS+q64ES3TKkzyU+/
	 sO3Nncj5dLxNqrrGZX9DMk3bCrfPE4GfblPCAAd059sk5xxgpDWf4i6U8Msstwej/P
	 UUKdkIHZsBgiXbbeSd/Mx477ekwBkPB/RN+kQ9uV/tNK0lv4Wcy4aEMVGexayiyFsB
	 TcY6z11uoiUdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A31B391B06A;
	Tue, 17 Nov 2026 00:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: ethernet: mtk-star-emac: fix device_node
 leak in mtk_star_probe()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179487361177.250117.1599495795624921279.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 00:00:11 +0000
References: <1794455490000.585551.2561101329908158128@cmss.chinamobile.com>
In-Reply-To: <1794455490000.585551.2561101329908158128@cmss.chinamobile.com>
To: Xia Yan <yanxia@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ot_yanqing.wang@mediatek.com,
 brgl@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 yana06070@163.com
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Nov 2026 11:51:30 +0800 you wrote:
> mtk_star_probe() gets the PHY node from the "phy-handle" property
> with of_parse_phandle(). The helper takes a reference on the node it
> returns. The node is used by of_phy_connect() each time the netdevice
> is opened.
> 
> That reference is never dropped. Every error return after the lookup
> leaks it. Unbind leaks it as well: the driver is devm-only and has no
> remove callback.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: ethernet: mtk-star-emac: fix device_node leak in mtk_star_probe()
    https://git.kernel.org/netdev/net-next/c/b78cbbb527ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



