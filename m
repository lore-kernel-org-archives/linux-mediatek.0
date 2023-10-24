Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22222C00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 02:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgcnqjWxpd73W6XX//cKjGJmKzOQkROcPxKPNNmmR7Y=; b=oIPCVzUyhuDFIjEsg58T753O0A
	+GZeiQn3HO0OmEEffGYgFtvtHFDW+xcPtOWZKMwfYmZ9nkNmeTmIKCPZkNHrE1YFyQrTl1/7VlI/Y
	KhBT3KanLAmID2dP6hz/pTEo0YVDc+wi7nAZ0s2IhOBgRaHUOSyF3h2bKgSEf3DF8M5zYTt95/pN8
	GogXhDSQ4O0TBMUNwaqkg8ospzsxM3ohVdeLlcWx3YabUJWZDMFRqm8qdJH511DMfYFPaYHOmyu+H
	GKsc3G8yENXyfyFzwBOXwO2d2HyzoOemT6x+L++CHtr62SOiAQgHhiKVceoUKWXEV9UsunAKLppRi
	0YNsVn6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv7Bk-008eee-0C;
	Tue, 24 Oct 2023 02:30:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv7Bd-008ecy-1b;
	Tue, 24 Oct 2023 02:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 24E9FB82317;
	Tue, 24 Oct 2023 02:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7511DC433C9;
	Tue, 24 Oct 2023 02:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698114626;
	bh=uTJdGU6PVW1afxCvV2580N6vBNBEyv5C/dwm7N1xx30=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tIjr5rhWhTWmiR8DtTfZ0kX00SWnR2RhmiuhhWkePpU7Iq+bvG2C8aMpbb1Wv+05h
	 RLQANx3NlAvgz73qrXAqPj5uJbtzZ103L7qwlBfWswuMqlf9FQ9VaFwHPLyr0BE5Wj
	 X0D17clSpw9Tr4WKNV1f388OxCpkYojpW3giJ8ooIqDlo07tV+vBI3bPOOZHD0bi3J
	 6hzsrrwtCltCDIATfeeUtdqWzCOrC09cvGEdS98zkIO8JnRFA69+r+ejoMdAgvcTBB
	 JkvQCLSYytS0LJIR85wziYD28S/b8IsIF5oH99q+DmOUHL64mHYvynrz13sz4fJ+YW
	 a0b6RAvW7BapA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5A647E4CC1D;
	Tue, 24 Oct 2023 02:30:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v12 0/5] introduce page_pool_alloc() related API
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169811462636.8734.17177752915706845046.git-patchwork-notify@kernel.org>
Date: Tue, 24 Oct 2023 02:30:26 +0000
References: <20231020095952.11055-1-linyunsheng@huawei.com>
In-Reply-To: <20231020095952.11055-1-linyunsheng@huawei.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_193029_726124_3549EC98 
X-CRM114-Status: UNSURE (   9.52  )
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

On Fri, 20 Oct 2023 17:59:47 +0800 you wrote:
> In [1] & [2] & [3], there are usecases for veth and virtio_net
> to use frag support in page pool to reduce memory usage, and it
> may request different frag size depending on the head/tail
> room space for xdp_frame/shinfo and mtu/packet size. When the
> requested frag size is large enough that a single page can not
> be split into more than one frag, using frag support only have
> performance penalty because of the extra frag count handling
> for frag support.
> 
> [...]

Here is the summary with links:
  - [net-next,v12,1/5] page_pool: unify frag_count handling in page_pool_is_last_frag()
    https://git.kernel.org/netdev/net-next/c/58d53d8f7da6
  - [net-next,v12,2/5] page_pool: remove PP_FLAG_PAGE_FRAG
    https://git.kernel.org/netdev/net-next/c/09d96ee5674a
  - [net-next,v12,3/5] page_pool: introduce page_pool_alloc() API
    https://git.kernel.org/netdev/net-next/c/de97502e16fc
  - [net-next,v12,4/5] page_pool: update document about fragment API
    https://git.kernel.org/netdev/net-next/c/8ab32fa1c794
  - [net-next,v12,5/5] net: veth: use newly added page pool API for veth with xdp
    https://git.kernel.org/netdev/net-next/c/2d0de67da51a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



