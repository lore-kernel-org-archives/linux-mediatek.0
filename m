Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0BAC04A94
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 08:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dzNnig7n4Y6U79EhteM0cj7JVTxiMMciJX9DmDhPSc=; b=Z+odvb71+MVHA8KlbFKP1dnAoW
	iWh8fjPLUw0M8fJX6j1E9ONsDVYreAAkVdcqjUI1nNbyRb9pIFIWib68du+bD7KalzVNm81WZD9n/
	pPU3QtVxZmAKq8DS93wNlouk9Q5N8sE4xDCuh21BkUqdPeF/t6DnjqomMOIXAjpFn0uNqukJI8fsO
	5OtYqaWy51P4RJURujSuR2amxmfq/zH36VIiFYHPXPPzDE3IHmK/K05rUDXnexNdG2HC0Rg/oDgki
	LyS3Mkt/g8kOisUmENL+9DEW80dl1zmwRFgIHewVTumx0Q4/5gXGzfBH2tOAtds+8ZgrOBl57d3J3
	czMvyRlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQO8h-00EVw2-0x;
	Mon, 31 Jul 2023 08:20:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQO8e-00EVui-0U;
	Mon, 31 Jul 2023 08:20:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E0E1E60F53;
	Mon, 31 Jul 2023 08:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A724C433C9;
	Mon, 31 Jul 2023 08:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690791622;
	bh=D94/uDM8VUf/iGPEsn5ahoMjiZ3Iz7JJ22L+8EoN1p0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EyD+FtGw/uK+xmEOJtKgpmCQIXNZyuUxxRcgBtktxBTQDclVs0Rg8FyLWJ/0DiXFy
	 JtHY8DQKjWLII3BcXpo/eORdLjNSeAt0QbvlrFNV5vnm3mip+RWO/S9flD6nd89xPe
	 2rdiADXYrzuLRmANArdd0FDlhQFtRbs86xUkp4AI92R6NEUfzs9kELkM1dTDFKitxf
	 gMvUPiL7+9/FmoZnTepwWnxGuuGfHa7csN3XgBLWpHye5XaiT2Gh+XozyIR65nGr4f
	 u4O6hUUGtFT3lHS9z3TqnwpD+VMxoWv4CfsQfpoGGroVTr5E/0Mnj6B0c9y8wKxoE3
	 goN4ZQ9U3rqvA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2D755E96AC0;
	Mon, 31 Jul 2023 08:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: net: mediatek,net: fixup MAC binding
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169079162218.10005.10651716865931454338.git-patchwork-notify@kernel.org>
Date: Mon, 31 Jul 2023 08:20:22 +0000
References: <20230729111045.1779-1-zajec5@gmail.com>
In-Reply-To: <20230729111045.1779-1-zajec5@gmail.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tpIDx6YWplYzVAZ21haWwuY29tPg==?=@ci.codeaurora.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, lorenzo@kernel.org, nbd@nbd.name,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 rafal@milecki.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_012024_255701_22752DD7 
X-CRM114-Status: UNSURE (   8.55  )
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
by David S. Miller <davem@davemloft.net>:

On Sat, 29 Jul 2023 13:10:45 +0200 you wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> 1. Use unevaluatedProperties
> It's needed to allow ethernet-controller.yaml properties work correctly.
> 
> 2. Drop unneeded phy-handle/phy-mode
> 
> [...]

Here is the summary with links:
  - dt-bindings: net: mediatek,net: fixup MAC binding
    https://git.kernel.org/netdev/net/c/8469c7f5472f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



