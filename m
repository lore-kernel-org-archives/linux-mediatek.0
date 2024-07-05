Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6287EC30653
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 02:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcHWQRbiySbIh7P8m3ZaSQ4DRDaIxd5pNM8khSrCUg4=; b=XK/yOu50IzcbI3ni9C9y8W8xx5
	ASg+CkTG0W0uWqbToMpPAmDxbynbcXvdYDMa1z3O/2uvJp99P5Zq9L3dHqGSgoj43OizqFOinhvHn
	6lO2bvhoH03re6rbAIE5mzsgAHkPQWasy62C1PXit2DvfcHvmA14g7rVk85Z6UKOV1hWmiQ6Eq3vq
	zzA1Y8lZcJXLMwUo+6xVO2zXfgdFXF0BcI6ahytdW3hhrxuwZFHes7XE5645TMWiPQF7uE7P7+JBj
	Gfx263YfSdx+ifiyTRvpLKvJukTk87K2oDdfKo39NmngDfLXEZJFNkEUb/YrR2F94I1uP7xwn9U/l
	LcE3bFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPYZ6-0000000Ejfx-0Oh4;
	Fri, 05 Jul 2024 02:20:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPYYr-0000000Ejco-1W6S;
	Fri, 05 Jul 2024 02:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4D09FCE3B62;
	Fri,  5 Jul 2024 02:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C284C32781;
	Fri,  5 Jul 2024 02:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720146030;
	bh=QWd9ons4AXRKjTGh2DaZWE33fQe8DJP7zwUjzNaLr7o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Va8zm7voHc4ONfHmF7lhOXFaqvIdKiUSEB+drBOoEnFzCRRph0FHqsgubj4LP0sgI
	 P1i7QY+9DUhT/mWvupdu1eQO3UJ6JUGuDPgQQ7GT0b4AlzEhMyCfNQzUoI8LWkeRpg
	 8LChJBQ9lh5M6RCFh2xFuG5fu0WpJnKxGRs+ljNBGyyHXkc7qADRruYpWLOLFQFKQ6
	 a9T2tdIlLvDIw0P1OGHZkR4BFQurlRWRMxNRNF4f/XhiknjLn7V1LBVDUFoYP69eA0
	 FH1uWwMTQIgP3qgJn7Nt2Kg8fe821ZgyYl1S1C3cx7mEXDRm/9yZ2xNbwu5Yogl/AJ
	 L1nD+3tmh78SQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 68C6DC43446;
	Fri,  5 Jul 2024 02:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] dt-bindings: net: Define properties at top-level
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172014603042.16848.6916818330068048606.git-patchwork-notify@kernel.org>
Date: Fri, 05 Jul 2024 02:20:30 +0000
References: <20240703195827.1670594-2-robh@kernel.org>
In-Reply-To: <20240703195827.1670594-2-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: fancer.lancer@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 lorenzo@kernel.org, nbd@nbd.name, alexandre.torgue@foss.st.com,
 peppe.cavallaro@st.com, joabreu@synopsys.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_192033_598891_A27BBA05 
X-CRM114-Status: UNSURE (   9.43  )
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

On Wed,  3 Jul 2024 13:58:27 -0600 you wrote:
> Convention is DT schemas should define all properties at the top-level
> and not inside of if/then schemas. That minimizes the if/then schemas
> and is more future proof.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Drop the parts already applied from Serge
> 
> [...]

Here is the summary with links:
  - [v2] dt-bindings: net: Define properties at top-level
    https://git.kernel.org/netdev/net-next/c/390b14b5e9f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



