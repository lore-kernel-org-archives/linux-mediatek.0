Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67502C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 13:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzAFMvObqs5NM9xGgfWuqL9xKk4I70CmSYBFXwxvy/o=; b=3B6SE7jHclwjap
	AoxNNQXedbattqXNA1LIUOph1DTm+OMfwmZ5xNJJd3q96BXwKiGS0T/jOwJ5rxMyacg3wR4zVxP1j
	Yk3GmBE6fHQLKu0z5IcjM0CvLmhwSp71aixiOtSthD5z/HTVcPthahEQQTrbcLmL2h/T7l8flehkd
	RzyqWgJNJ4jD4TanDQz/gdHM+BQpAalLnfdmMcSgD10z/Ig7GH099DKHskr211e5v7KcpPOpZV8Ck
	Mlgwd5d7XqTG5G/pOvYDbXa37Voqi2t7MBauP4nEg+rXN/WPcNwdztLD+XxkRAE3lsd1IZ4fqPSQC
	QDBYu8dsvqeGtnJz0wWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZI9-007klC-K3; Tue, 07 Jun 2022 13:30:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZHh-007kXa-Ob; Tue, 07 Jun 2022 13:30:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3D2D61446;
	Tue,  7 Jun 2022 13:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5159BC34119;
	Tue,  7 Jun 2022 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654608612;
	bh=zyhrWRXdVXO+HYqEJk8OrrgU5Np0Uk7LNBouSz/WdWk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ScN+2e1u3+nDzZk/Al7r1+6WF1/wNS0eV+otewgvoNfOjHPb2KfMd1X/bldLpTCnb
	 AAbYk3HnKiIUFUlMwrPUF2rpCiJ+dd2+0MN8sFOWVoxJ+wlUZpc4JoqEs1bcvuB9a2
	 h2ZiF1bKQsR8b6YchGandWN+7DtI5GRgYVNhKiaTL6aLSxes4cN4BLcdyTW3axXO7H
	 Xko5T/ioQy3I7z40H1xCTLC80OtIyWMg/YNyKyLZelyTEkYa6Z6kYzw+nbKIxEn7qZ
	 EPEKyNQBM7QQkm3L4hhfic9xpioxdOLfYPMvpLbhrSbYRTByyTsq2yvXK/sbbL1HaH
	 gUd/mRMYm4+Zg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 33CDEE737E2;
	Tue,  7 Jun 2022 13:30:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] selftests net: fix bpf build error
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165460861220.26982.2362920387757777214.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jun 2022 13:30:12 +0000
References: <20220606064517.8175-1-lina.wang@mediatek.com>
In-Reply-To: <20220606064517.8175-1-lina.wang@mediatek.com>
To: Lina Wang <lina.wang@mediatek.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, shuah@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 john.fastabend@gmail.com, kpsingh@kernel.org, matthias.bgg@gmail.com,
 maze@google.com, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_063013_911329_E5EA07A2 
X-CRM114-Status: UNSURE (   9.26  )
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

This patch was applied to netdev/net.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 6 Jun 2022 14:45:17 +0800 you wrote:
> bpf_helpers.h has been moved to tools/lib/bpf since 5.10, so add more
> including path.
> 
> Fixes: edae34a3ed92 ("selftests net: add UDP GRO fraglist + bpf self-tests")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Signed-off-by: Lina Wang <lina.wang@mediatek.com>
> Acked-by: Song Liu <songliubraving@fb.com>
> 
> [...]

Here is the summary with links:
  - [v3] selftests net: fix bpf build error
    https://git.kernel.org/netdev/net/c/cf67838c4422

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
