Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD87C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Aug 2024 22:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zy3ki0wOeMnX5B65JZFVnODIZGgSlOs4ivJOBWhHes=; b=ADEwID9xi5npl+b1SWlzEGfXQS
	6TbRvduvS8Ap3ue/3JYNZHH20C1GBLyPiNm3LYHnmg4mQ+T/Sfa5tTmINvZor8+YMBgRnYRNpDFGK
	sbQUbfG7xxI8I7MXcMS4maVq6yHn2BypGKRtBT2MhGtF0Q/M2/gNech7K1yYqgYbCYuYSRJNQKVBP
	FMQDkuuRJXyRdANymI7EFI9C6fheU6/WTOtBxq/pRg7x5TZtbRZq4kq8l8NoVjR+BOilei/3mIq45
	04LnvDNzbZygN65NwFXqaHlLl1p6CmCbgKvNQa/Ys+LXNzmyFl7yhzOPOa7UgOO4fT8uWvXoqIhqx
	2xgctqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgXXS-00000006pqZ-1sTs;
	Tue, 20 Aug 2024 22:41:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgXWj-00000006pgf-0aKO;
	Tue, 20 Aug 2024 22:40:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CC59860DE2;
	Tue, 20 Aug 2024 22:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74888C4AF09;
	Tue, 20 Aug 2024 22:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724193631;
	bh=Z2W8i0+0KtSrExfZq0x4rSOeJ1fGjcgaUp6rqgGlQi8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Zif5NnJEKiX1L45h590kjBXasecw2a9F+fYvoXTpMtZ7Jtn7mljcwoOX8g4shLp1J
	 E6EJW+GtRVG2ohvMnOzrsUpb3Ys7NLCRQLTWCFnAw1DyZFMqRvOWQCemvRgX/qlkFT
	 8fdvtHncCXi6W98SWPy+1LYjhwDbpcF25ZuaNUwkr6KQLPMFNyWSHT9wJaSLVqMXvn
	 5WjvIOa4jo/HgsRf3w15fzwcZx/+E2ivOxliJnxJZOj8aNm6y/+fGTTuI+kuqQ8UzO
	 iYLHb9K843Adjd0JRMvlTeyeFswNuBZ06EbN/LMcT9Pmu2Xn03Sj4XBb1XDg5bwM0s
	 Gpp6ywERsBFZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 342ED3804CAE;
	Tue, 20 Aug 2024 22:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: mediatek,net: narrow
 interrupts per variants
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172419363004.1257878.11782803911296798283.git-patchwork-notify@kernel.org>
Date: Tue, 20 Aug 2024 22:40:30 +0000
References: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 s.shtylyov@omp.ru, hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, lorenzo@kernel.org,
 nbd@nbd.name, sergei.shtylyov@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_154033_251266_EBB7FA2E 
X-CRM114-Status: UNSURE (   8.97  )
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

On Sun, 18 Aug 2024 19:29:02 +0200 you wrote:
> Each variable-length property like interrupts must have fixed
> constraints on number of items for given variant in binding.  The
> clauses in "if:then:" block should define both limits: upper and lower.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/net/mediatek,net.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Here is the summary with links:
  - [net-next,1/4] dt-bindings: net: mediatek,net: narrow interrupts per variants
    https://git.kernel.org/netdev/net-next/c/55da77dec1be
  - [net-next,2/4] dt-bindings: net: mediatek,net: add top-level constraints
    https://git.kernel.org/netdev/net-next/c/06ab21c3cb6e
  - [net-next,3/4] dt-bindings: net: renesas,etheravb: add top-level constraints
    https://git.kernel.org/netdev/net-next/c/70d16e13368c
  - [net-next,4/4] dt-bindings: net: socionext,uniphier-ave4: add top-level constraints
    https://git.kernel.org/netdev/net-next/c/2862c9349d5d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



