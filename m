Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFFCCD37AC
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 20:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAojFAT3ba3n2wnIcj5YA7EMjuQSkflQk3mevZ8OoEs=; b=iW58C41PQIrLDIgxlZ/sqzKTsH
	Mf3TqVhd2SyOrt2JSAOGEWhQLbuhQsY2uCs1x2EKom9/HG7fvyC84pD1hKL5Ku0Hef5hkRk3yZF3i
	J+W9ymDcNKE1FNGCHcvpIIAA/05pUGKPPpBfn6XSYtAXIxpmsV4ygJJIPRckyO3QbCyBRWLHyzl8R
	3s2n4ogqcA0H0YQILtMSb1WuNDYarU9Hg91OZJuk3BofbAx7UasC0liPSAWRFhvwoKF+Wp0KHlr4b
	VHkyQxaYc8SxvJVEUaciI4uBJH1DsmcLKQbBSkQ/RaYzOI39zcY7D5egrcOUOCtzH0vZJLtLVFc+z
	tzb5+B0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slZs9-00000001iEc-2xtP;
	Tue, 03 Sep 2024 20:11:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slZrC-00000001hyH-1hNg;
	Tue, 03 Sep 2024 20:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 38EE35C5647;
	Tue,  3 Sep 2024 20:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4384FC4CEC4;
	Tue,  3 Sep 2024 20:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725394229;
	bh=Gw0IBZUNC2LELFePtOPc07moZnDlfXuC4n8LfF7pvzU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ixWllNYlPxV1drLcJ6si72tTxEd7GRY8zYsO2uGb8/oFrVS2IZ9nQD7XN5xS9b/GY
	 JBSuk1ELBOIp9Ik9gy+7U2jNl7+xNpRRhSNOd9YSUl4XrTCizUuzKmSVJiwSsXZBqY
	 UXHmJMmDbeiOuIdC1XCwdNTyc2cxZKMNYlazw/wmSV2jmyzQ0iGUDsDl0EH8g/fOFP
	 9vGwg2CBV2lKNO41vooZQ/XlEF5+0zPTlG4gV9HOM2JyFkyFC5F/9RehYKcgYnTNA9
	 2TH7pHX7RuO/qrhuMw2ctg4xypmAh05jlDWZyKB9BclnSUq4OuSOYHAXjCdvJOvSiJ
	 Ybark54rrOPag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 342A63805D82;
	Tue,  3 Sep 2024 20:10:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v5] bpf, net: Fix a potential race in do_sock_getsockopt()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172539423002.426047.5750436407367309589.git-patchwork-notify@kernel.org>
Date: Tue, 03 Sep 2024 20:10:30 +0000
References: <20240830082518.23243-1-Tze-nan.Wu@mediatek.com>
In-Reply-To: <20240830082518.23243-1-Tze-nan.Wu@mediatek.com>
To: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, ast@kernel.org,
 sdf@fomichev.me, alexei.starovoitov@gmail.com, bobule.chang@mediatek.com,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kuniyu@amazon.com,
 chen-yao.chang@mediatek.com, yanghui.li@mediatek.com,
 cheng-jui.wang@mediatek.com, daniel@iogearbox.net, john.fastabend@gmail.com,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, kpsingh@kernel.org, haoluo@google.com,
 jolsa@kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_131030_504931_18586C8D 
X-CRM114-Status: UNSURE (   9.86  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 30 Aug 2024 16:25:17 +0800 you wrote:
> There's a potential race when `cgroup_bpf_enabled(CGROUP_GETSOCKOPT)` is
> false during the execution of `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN`, but
> becomes true when `BPF_CGROUP_RUN_PROG_GETSOCKOPT` is called.
> This inconsistency can lead to `BPF_CGROUP_RUN_PROG_GETSOCKOPT` receiving
> an "-EFAULT" from `__cgroup_bpf_run_filter_getsockopt(max_optlen=0)`.
> Scenario shown as below:
> 
> [...]

Here is the summary with links:
  - [net,v5] bpf, net: Fix a potential race in do_sock_getsockopt()
    https://git.kernel.org/netdev/net/c/33f339a1ba54

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



