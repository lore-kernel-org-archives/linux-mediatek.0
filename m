Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6402FC64EC4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 00:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+qkGHqx9DnI3ouer0st1WoW3djy1INNi5TelpYJmDU=; b=2aIiz0qTYx/Itt9qqlz65OjmfO
	ycMo2yz0KtB6GeLPFwIlk42NPFJ/fGgYMawyzuQRxFJ8QOCpeTw9Eqn8n02ukd10gjj8QNoePisDR
	7oHpLnZX1tL9rkLfa51HVRdjWlxYccQIXRoJYt1cqNqvUdtAZJD/xbFqsSonG0VLNZ4/EesyvT7z3
	YZvymTO+knxrvy9bw+qb7TnjlWgIWL6lqm9m1hPQA8dUHBDZ9UxVAPlKcIJ4wlsVy8JTUwnOQv/uC
	madEZtZxk5tUHWFVdG5C1MFRLqm2QR6GCisWPY/hihzINP0IoxMWxZmikEnnrQ8os8UQbDKg7s+Ue
	3//ziteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZLVw-00FeYD-H0; Tue, 07 Mar 2023 00:49:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZLVm-00FeUW-96; Tue, 07 Mar 2023 00:49:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3282D6118F;
	Tue,  7 Mar 2023 00:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 805A1C433EF;
	Tue,  7 Mar 2023 00:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678150138;
	bh=zQIEMnEBtNLscoBzoZrW13CYG48psh/0hSKscCNvEQI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BoSkQJyOAuQAbEdPtt9KI0jx3jogk0TeILp/i9CmU/ARmQxR4JepdbtAp1USgmpwg
	 kvw/9Q3OO4pZE+7zyViBl3bx2fV3YHsC3UDNJqM5MQmwaKLDDhC35YbTq2Ds7XMJ8A
	 8feUN195WkQuz94VJxDLRWSzRljW6F9hv4S+2Za5/foBrlHj6nqhZVPKUblGzzyMgJ
	 IKskGioZNpG8ow+rh8uDur5Fk7gD2avyM5J9Qp4kxAKFLrsy9ytDBlXN85G3ekIk3K
	 GiKhCVTr9wW1APyvE3BoZ8WlCIJQIrSb6ll88GVYa+rAD3XckooymuyDlYoXubY5bV
	 HbZ4pbJoz0R8Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 600A0E4FC50;
	Tue,  7 Mar 2023 00:48:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 02/10] cpuidle, riscv: Push RCU-idle into driver
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167815013838.19612.5396346808460094460.git-patchwork-notify@kernel.org>
Date: Tue, 07 Mar 2023 00:48:58 +0000
References: <20230303092347.4825-3-cheng-jui.wang@mediatek.com>
In-Reply-To: <20230303092347.4825-3-cheng-jui.wang@mediatek.com>
To: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
Cc: linux-riscv@lists.infradead.org, stable@vger.kernel.org,
 anup@brainfault.org, rafael@kernel.org, daniel.lezcano@linaro.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 matthias.bgg@gmail.com, peterz@infradead.org, mingo@kernel.org,
 surenb@google.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_164902_490388_A497B660 
X-CRM114-Status: UNSURE (   8.73  )
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

This series was applied to riscv/linux.git (fixes)
by Ingo Molnar <mingo@kernel.org>:

On Fri, 3 Mar 2023 17:23:24 +0800 you wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> commit 8e9ab9e8da1eae61fdff35690d998eaf8cd527dc upstream.
> 
> Doing RCU-idle outside the driver, only to then temporarily enable it
> again, at least twice, before going idle is suboptimal.
> 
> [...]

Here is the summary with links:
  - [02/10] cpuidle, riscv: Push RCU-idle into driver
    https://git.kernel.org/riscv/c/8e9ab9e8da1e
  - [10/10] cpuidle: Fix ct_idle_*() usage
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



