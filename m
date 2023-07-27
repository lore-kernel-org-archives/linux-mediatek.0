Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A928C00528
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 05:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJOAh0xGb2yKu+4MkyWbi/OaV6fcfIw+cv3slHuPrGE=; b=Hkp+U7V2JIGTo0ypAoTmJXHAfo
	tRFOwUnk0lRIIxYLDokjgsF8NhWDMLYvwr1LwxNBiVUw5E0VxP3W2dCZMy0Lt1EnniVuTz+FM0FyD
	0adDJbVUsSNMKFjCmLRi7IXO+fVpGySsNoiN9LfoztzfOnJMmqGgyVsjYHW5b8oTDq/bvCTaNITV8
	nfc02grZTD7I1AgrBVqNj7jhUHftot+DUaFQnaAlzMDYbrfJf2C0dU6LTGBUKRcJXkXuuLEoOyLN2
	kHXNa5CHVaXh2y0wgFM9wEFs7JA7wcZa69+9oIk7Nj/C6KuWDH4aoN9TnhYvgO/1CmC51sLxgkFAa
	2UnWbPGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOt76-00C8nQ-1F;
	Thu, 27 Jul 2023 05:00:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOt6t-00C8iK-32;
	Thu, 27 Jul 2023 05:00:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 37FA461D3C;
	Thu, 27 Jul 2023 05:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 911D9C433C8;
	Thu, 27 Jul 2023 05:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690434021;
	bh=Ho/Rc97euneW3X7+KywJSmYkbBsCi+0ii+vr0Lg7AH8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DeXwY1FAOBCm6nBgzy/dJXh8JdgAE6MaJDYvPXnQu0m8hITSNArjVrHWUSawZFKjs
	 V7KIq7Ei+r+SNlTX2ALb20z7BZ+VcUZl+sTvwK7OfxQSqsj+ZnmrEFj/ep2S6V/Ope
	 LWc1eru8+wSDlG0i15XwFz3M/0mp3H4xqsOVVxw/BQV4E6szKliVJ9q8WKtUuazNmN
	 N0ioBB+l8u8hGME/JnUKGgeNAviCVs8DAsop2t5kO3VhoHjkOOKrF25urLF5iuFUd6
	 VoI8yx6egPPBZcoSnIR16Inw5MfEXIDK091MW++8o6giBr09OSVGalK3DHoD0/f8VO
	 Hk+etct+udOSg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7CACBC41672;
	Thu, 27 Jul 2023 05:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: dsa: Explicitly include correct DT includes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169043402150.24382.17232071139070506085.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jul 2023 05:00:21 +0000
References: <20230724211859.805481-1-robh@kernel.org>
In-Reply-To: <20230724211859.805481-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: florian.fainelli@broadcom.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 kurt@linutronix.de, woojung.huh@microchip.com, UNGLinuxDriver@microchip.com,
 arinc.unal@arinc9.com, daniel@makrotopia.org, Landen.Chao@mediatek.com,
 dqfext@gmail.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, claudiu.manoil@nxp.com,
 alexandre.belloni@bootlin.com, linus.walleij@linaro.org,
 alsi@bang-olufsen.dk, george.mccollister@gmail.com, richardcochran@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_220024_048517_CE43576C 
X-CRM114-Status: GOOD (  10.48  )
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

On Mon, 24 Jul 2023 15:18:58 -0600 you wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Here is the summary with links:
  - [v2] net: dsa: Explicitly include correct DT includes
    https://git.kernel.org/netdev/net-next/c/f44a90104ee5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



