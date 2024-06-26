Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C40FC30653
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 01:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgDIG9yiwWop8WJ9P9WnQv4Fe2pBoxAyizEpK7GQgts=; b=MR/zjtqFuUbsAOTiMJCv7HvyEI
	kVmIVJWVMAtCUgOr9tAl8y3NaoFdmAb2+NtQ4axOyCOhzvFfmHQrTNfgYg102AEmZGDchOYE5x7W2
	CUopS7uU44hx5CF+87ihbhbAP0E+R5w/HIAnLpK9adOpblltw79GjIS/N8VCHEldPPDdJZ7T+1G7X
	aL313CqLGrI7loVvoq3z1JLsBWX/E0TyMIJbFDqVdzBefCwGyMmSkK2W4ILae5u1Cc29Y5/VUU+zO
	2h2YalbuxWC5jU8g5a5WHy9yncyI8wMLPUX39Ab1U1U1A1rgrSbZSv1LC0y9/Rtjd7RvWdrpfHNTP
	/59x0/aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMH1e-00000004x1o-211x;
	Wed, 26 Jun 2024 01:00:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMH1X-00000004x0J-0BkX;
	Wed, 26 Jun 2024 01:00:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 34C2E60AC6;
	Wed, 26 Jun 2024 01:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A72C3C4AF0B;
	Wed, 26 Jun 2024 01:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719363632;
	bh=gpUPtrAJh+6J5oR6dtl8bHUoF7ypTcfE6JUr36MyO3Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FdVaOVLnRk9qKF1Dpx1thAwkpJQ5tazsEM6CA8bCxBZhUT+ytBzcYGLM4v2xIfDmg
	 Ygqat3nHrp9NgV67yNlx5PmSNu493Jx7VqlUXNNOQoSsDu8ax7GDvCxoyHT3KaHDEO
	 XlkoJc3/2Tx6tDPN96wSCHtNGsDc7kfVsE6kvfXgAJ/wHROYefSSVrIhyp6OEVeGM0
	 irvOMVXeiMwz2OgfeewduYPv2RFXjUc35HRMKC2hEW5YzC1LofhrPWjvaLvidwJbgN
	 lQUX3IaErccsWJRg+ow2a6KhdZgwVWrKXowbimkWpTlqtP83OtBmgnpFJh9EL3bvgn
	 ewMJoF78brFXQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8DE4DDE8DF5;
	Wed, 26 Jun 2024 01:00:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] dt-bindings: net: dsa: mediatek,mt7530: Minor wording
 fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171936363257.31895.7020799709212449758.git-patchwork-notify@kernel.org>
Date: Wed, 26 Jun 2024 01:00:32 +0000
References: <20240624211858.1990601-1-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20240624211858.1990601-1-chris.packham@alliedtelesis.co.nz>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com,
 Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
 daniel@makrotopia.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_180035_248589_2C1D3129 
X-CRM114-Status: GOOD (  10.89  )
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

On Tue, 25 Jun 2024 09:18:57 +1200 you wrote:
> Update the mt7530 binding with some minor updates that make the document
> easier to read.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     I was referring to this dt binding and found a couple of places where
>     the wording could be improved. I'm not exactly a techical writer but
>     hopefully I've made things a bit better.
> 
> [...]

Here is the summary with links:
  - [v2] dt-bindings: net: dsa: mediatek,mt7530: Minor wording fixes
    https://git.kernel.org/netdev/net-next/c/c0c68e4d52ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



