Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FF0CDB482
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 04:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzF/c0QVcu55bEXg8Cle2e/uiKeyuckUKabag9GFfos=; b=mczghOyjHGoxtyE9b5I46as5iG
	th3S5CYFeLRa06HQXvxTguMbkww8qNvhdzR91NtJhqvxv9N7GQD9IJQiCtHrMrE1ZzRbEam7mEpRT
	KI0D80IusmV4xpP67Yy2QJkq6OH9rPrtDsArcorS32K+PW+cGtGgPBpgKvhpdp/UzZaFLzz0lXRjk
	Zd6G+tz0z9oBYPI99N+nuGLQEs93T6be31xUxkGYw0PtTd0KbYLaW0z0HR8bMnWVtdd/nGVga9rgf
	SYP+Av87AB/wqkqjQCGFBzug+V+90NC+pe+dmoI5S8tmGkK0Ub9Z4ZyFPpMTu/EevLYFhIPSgQm2z
	oC+3Yvfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsbPk-00BBaI-1G;
	Tue, 17 Oct 2023 04:10:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsbPg-00BBZY-2d;
	Tue, 17 Oct 2023 04:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C284C61268;
	Tue, 17 Oct 2023 04:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63058C433C9;
	Tue, 17 Oct 2023 04:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697515835;
	bh=lQAc0M6wyDc260gsVnZP65MqVVRlE4I8/AoGwjKnMNY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uhBclQ0dI0ivJwnZ3PAiWJPwa9irt4jB3y4VhfKTrwrniIo5Jcwgff+TDzZvP7bv+
	 +lztTmmLaf6dap7HLbT0KzMa4RMLVLP3tfoewfmCW2TJz54K5S6EE1OdMcjSDkKwF4
	 VHA8F/kTx9bWuStif47Ab/POnqssGvaZ1mXUSiGsxDrHdVODJw+fVztWKKtUx8sfN0
	 Q07+xEz5NvtNFJP+kpLOb/6e1SIzXiDDvSEUsibmtu7PtO1eBaFax19wh/9PXSZzVP
	 BFXxY4N3auHeY3RbxaB6X0skPRmnFfx9TTAj0b4wwTQT5PWPJfK6m0L9H/22sLj4u1
	 IjYv5p9EQejUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 264D3C4316B;
	Tue, 17 Oct 2023 04:10:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v11 0/6] introduce page_pool_alloc() related API
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169751583515.29825.863167765608905945.git-patchwork-notify@kernel.org>
Date: Tue, 17 Oct 2023 04:10:35 +0000
References: <20231013064827.61135-1-linyunsheng@huawei.com>
In-Reply-To: <20231013064827.61135-1-linyunsheng@huawei.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_211036_899973_8E5DE79D 
X-CRM114-Status: UNSURE (   9.95  )
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

On Fri, 13 Oct 2023 14:48:20 +0800 you wrote:
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
  - [net-next,v11,1/6] page_pool: fragment API support for 32-bit arch with 64-bit DMA
    https://git.kernel.org/netdev/net-next/c/90de47f020db
  - [net-next,v11,2/6] page_pool: unify frag_count handling in page_pool_is_last_frag()
    (no matching commit)
  - [net-next,v11,3/6] page_pool: remove PP_FLAG_PAGE_FRAG
    (no matching commit)
  - [net-next,v11,4/6] page_pool: introduce page_pool[_cache]_alloc() API
    (no matching commit)
  - [net-next,v11,5/6] page_pool: update document about fragment API
    (no matching commit)
  - [net-next,v11,6/6] net: veth: use newly added page pool API for veth with xdp
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



