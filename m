Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5555CDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 16:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGiWKX2ybzKrvPNjx6r+KqyVTNMn/0LSQPVvhPXJezU=; b=vPzlnhAfgHeHJeIWLX1BICmvTR
	j9+W05zFLUpOIsH68E84zVhlL68RGY9ITKYYp4vCyprnX618UHX7PVcOkrLZh96SwQRe+sCyoDsLl
	7d8puFsMhCxUfRFU/5u2KrR0AEG3jO3gjAp6pXH+6JrmC7bfxok2LFSxlsONm3zu1HwLC2bUVA8ck
	DUcQJF9hoNHmedOlRoLqVul7pFI68Pj/Fb71xY6pPHktNWGm1pUkjkpeDlkNZKB3LQlUppw9pUWwh
	CbLy5iSDxVamv9KtRszS9P83j8h76FX5OrC32slAAb+nSgqGDEXdmUtxub36TA8glfF5zTHtYIV8V
	PmZSEh7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVbQ-000HuA-2b;
	Thu, 19 Oct 2023 16:10:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVbN-000HtE-0v;
	Thu, 19 Oct 2023 16:10:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BC0D619E2;
	Thu, 19 Oct 2023 16:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1016C433CA;
	Thu, 19 Oct 2023 16:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697731824;
	bh=ZSHnlwGKVf0pTTc0ZzD9hgMl3t8ZCUhEI3/eJiY4aFQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=g58PwMQZnJ4RJRiO8+msu58Y6jNJM9gZ3qsxvkA+6vQIFHiWzFHQQOIZxVuCWBrFR
	 5Dtsl2Zf05Y4rwNHAyL9m2zN+PY9HDSs0NHl71IMKtAhzpdXc3HaNx0scB1fp04qxX
	 brDITEHGT8UEBpqrIuZ7EiKyvTYeRFEH9t6WKc+n708rud1MlD9zsWPmqErjz6jlKs
	 l8l+Jzk4NhPjURhEVmFfUwUX+eVb0x2+CbChHH6GVYEA1sb1HuPpN9Fz4mjCK7Wcft
	 +UYvJSvS7rNgu5Hcs3ocbdlgU54v0aSXBHNcZqZSjwOwWNMVe6A3n+JIeK1nr8uPfM
	 QYn7P3uPixRpQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BDDF7C04E27;
	Thu, 19 Oct 2023 16:10:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/8] dt-bindings: net: Child node schema cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169773182376.32102.12284978532277554063.git-patchwork-notify@kernel.org>
Date: Thu, 19 Oct 2023 16:10:23 +0000
References: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
In-Reply-To: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org, andrew@lunn.ch,
 f.fainelli@gmail.com, olteanv@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, woojung.huh@microchip.com,
 UNGLinuxDriver@microchip.com, linus.walleij@linaro.org, alsi@bang-olufsen.dk,
 clement.leger@bootlin.com, geert+renesas@glider.be, magnus.damm@gmail.com,
 mripard@kernel.org, arinc.unal@arinc9.com, Landen.Chao@mediatek.com,
 dqfext@gmail.com, sean.wang@mediatek.com, daniel@makrotopia.org,
 john@phrozen.org, gerhard@engleder-embedded.com, hkallweit1@gmail.com,
 s.shtylyov@omp.ru, sergei.shtylyov@gmail.com, justin.chen@broadcom.com,
 florian.fainelli@broadcom.com, grygorii.strashko@ti.com, nsekhar@ti.com,
 claudiu.manoil@nxp.com, alexandre.belloni@bootlin.com,
 vladimir.oltean@nxp.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_091025_414983_C456FEB0 
X-CRM114-Status: UNSURE (   9.53  )
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

On Mon, 16 Oct 2023 16:44:19 -0500 you wrote:
> This is a series of clean-ups related to ensuring that child node
> schemas are constrained to not allow undefined properties. Typically,
> that means just adding additionalProperties or unevaluatedProperties as
> appropriate. The DSA/switch schemas turned out to be a bit more
> involved, so there's some more fixes and a bit of restructuring in them.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next,1/8] dt-bindings: net: Add missing (unevaluated|additional)Properties on child node schemas
    https://git.kernel.org/netdev/net-next/c/659fd097b098
  - [net-next,2/8] dt-bindings: net: renesas: Drop ethernet-phy node schema
    https://git.kernel.org/netdev/net-next/c/ac8fe40c3628
  - [net-next,3/8] dt-bindings: net: dsa/switch: Make 'ethernet-port' node addresses hex
    https://git.kernel.org/netdev/net-next/c/51ff5150258a
  - [net-next,4/8] dt-bindings: net: ethernet-switch: Add missing 'ethernet-ports' level
    https://git.kernel.org/netdev/net-next/c/f0fdec925fe7
  - [net-next,5/8] dt-bindings: net: ethernet-switch: Rename $defs "base" to 'ethernet-ports'
    https://git.kernel.org/netdev/net-next/c/b9823df7bbad
  - [net-next,6/8] dt-bindings: net: mscc,vsc7514-switch: Clean-up example indentation
    https://git.kernel.org/netdev/net-next/c/491ec40d67a5
  - [net-next,7/8] dt-bindings: net: mscc,vsc7514-switch: Simplify DSA and switch references
    https://git.kernel.org/netdev/net-next/c/7c93392d754e
  - [net-next,8/8] dt-bindings: net: dsa: Drop 'ethernet-ports' node properties
    https://git.kernel.org/netdev/net-next/c/31f47f303c6b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



