Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AA4C6FD20
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 13:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jA0qSMARdzRgE1AJqk+4t7Ih8p3aUBwuQDgOk+mXsw=; b=WxIDvuFdgAke8JiO8GW4UGtaXh
	VrLvGkY7qQ5YXQJkYpxhqblimTfB/3VzrkdVMRr/D/fPccYAiSzttjk9wDKWVced8W+QI8RFmJzBA
	WmzG2VWrn6tcT5KThxM8EEbUnV51erosdKXJPUSVzBXCvfME3PShK/H+IHDEjkEhV/Tulk+xC883i
	W77JgDWXyKRiq0LgZNIB6k1h1Na3LxLkKWOOoVn/miTjMj28gDXAp2v/7dUPEgHcM1ABKZOFZg4fs
	HueP+/K8nkLPSqqdDz8vDRPDdra+55bAuqEZM3Za4yJjAFtbIChRfsZ0uh/wpyYne383ILvUfJ8xM
	fp5afM7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZtd9-0057QE-7P; Wed, 08 Mar 2023 13:14:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZtYj-00556i-Q6; Wed, 08 Mar 2023 13:10:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 43BF0B81C9F;
	Wed,  8 Mar 2023 13:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4A8CC433A1;
	Wed,  8 Mar 2023 13:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678281018;
	bh=HDU5RSFrhJRyPeHHGe9PSEO9fpmqEJDVjePgAMyAk7g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bOwDgHThICTR3yhRaANBrsC3Cp8OtkvmOo0my5DgyfeKSRp5BcEbZphH0xzYPFpG/
	 htKwOKcYPzaS8TPfgNyGOlpQ3T1R8rzB5pZwvfkC2DfFKfsqUDm9+d0LT9NZvC8mGQ
	 K0emFp5cNLZWeNPTEjxvy1PfOQkSTm8MLF/Ybe+E+HJzRtv2FT3xHwJhXIqm81qBad
	 eYyFUKlkpAG3BJtxEG/8Mbo6xYllalw68jXMZGqlgOrazXasJEssGxQm0T/MntS9Sn
	 OvQ4hoMX57uKoW9st5H2RcBrfKHxuS/mRjE4ljCldz+J+ZTFAIX8nVS8aXod13koPh
	 e4fJmk3cyZEvg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BAC19E61B61;
	Wed,  8 Mar 2023 13:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] dt-bindings: net: dsa: mediatek,mt7530: change some
 descriptions to literal
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167828101875.17807.8617360531349466866.git-patchwork-notify@kernel.org>
Date: Wed, 08 Mar 2023 13:10:18 +0000
References: <20230307095619.13403-1-arinc.unal@arinc9.com>
In-Reply-To: <20230307095619.13403-1-arinc.unal@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCA8YXJpbmM5LnVuYWxAZ21haWwuY29tPg==?=@ci.codeaurora.org
Cc: andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
 arinc.unal@arinc9.com, robh@kernel.org, erkin.bozoglu@xeront.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_051022_020216_5643C5B9 
X-CRM114-Status: GOOD (  12.34  )
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
by David S. Miller <davem@davemloft.net>:

On Tue,  7 Mar 2023 12:56:19 +0300 you wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The line endings must be preserved on gpio-controller, io-supply, and
> reset-gpios properties to look proper when the YAML file is parsed.
> 
> Currently it's interpreted as a single line when parsed. Change the style
> of the description of these properties to literal style to preserve the
> line endings.
> 
> [...]

Here is the summary with links:
  - [v2] dt-bindings: net: dsa: mediatek,mt7530: change some descriptions to literal
    https://git.kernel.org/netdev/net-next/c/7d8c48917a95

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



