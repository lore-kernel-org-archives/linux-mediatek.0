Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944ACC5475B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 21:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BftpSiz613AbPdBVXibqLOKwDu3gpLN4FBMkB7GeR/k=; b=nXnJ6qfyKckic1DAteo95JqIZm
	ZeB7FYplBYc3gm+f8/QWo1yws8wykFCEqyIxOwbUXH2fja1/LwaczIPBqkrw1uBuC5dCquLDzFfTo
	NtEXFljiHezAmCIshttNCUuOwK3SJ2LPRe8qnLu5ufOPzS20lNdIynfppaMeq68UaF0APHEXqftSX
	2np7INNXmAZbIFqgVuBWSveJ87FzXokkJBk4lwC1L6Om73XKjZNg+NsOFGq1On+3hr8d6wUuid5yK
	zcUfNiYnIJWKOzL7BrGissabMtzV67QsXY6oeuVB6u41QrxQeGEW9wOCFa1q8kW06Z8mXfgBvQl5T
	bzOZlO7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjmuv-00000003Ck2-3pX7;
	Mon, 11 Mar 2024 21:10:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjmur-00000003Cir-0DbZ;
	Mon, 11 Mar 2024 21:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 85260CE1277;
	Mon, 11 Mar 2024 21:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8C94C43390;
	Mon, 11 Mar 2024 21:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710191431;
	bh=+o7mv1cjyYTsa9bpXsMjAc0mxBD9nIfC2qmi/mgGAnk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ntk2KMgQSTVcYWlrhUHpgdMsE2qJ6qfWeFom25F0RQubqoGPry/0Ve30ujYOw4Aa3
	 5nXd4owp0m7Gyju/1ibdupJc48jC7rn3GAIcChJ5IKEJqw51iJar58nayZpUbYGzzH
	 YI+wN9e8x0xhm6kIDAKpjfB5t8kX840XuO1dSRusSZwc40N4UqG0AwoD8w2IMqudPU
	 TNSLEEJxRc7DHufxQAEKhVkTz/kamDjdm4NY6lkEINGRnuGRTH77K2ZnYatIsDyTKp
	 KdSYcEAxwOjYBtCbXcNi7ww6lQKvV+NkQquthjfxrC8V9xjnC2ieL8+vvihBkTRpVO
	 RCxnTivu8qfDw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9C07CC395F1;
	Mon, 11 Mar 2024 21:10:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: dsa: mt7530: disable LEDs before reset
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171019143163.14853.15330891015381229970.git-patchwork-notify@kernel.org>
Date: Mon, 11 Mar 2024 21:10:31 +0000
References: <20240305043952.21590-1-justin.swartz@risingedge.co.za>
In-Reply-To: <20240305043952.21590-1-justin.swartz@risingedge.co.za>
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: arinc.unal@arinc9.com, daniel@makrotopia.org, dqfext@gmail.com,
 sean.wang@mediatek.com, andrew@lunn.ch, f.fainelli@gmail.com,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_141037_288551_3BB924F9 
X-CRM114-Status: UNSURE (   9.18  )
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

On Tue,  5 Mar 2024 06:39:51 +0200 you wrote:
> Disable LEDs just before resetting the MT7530 to avoid
> situations where the ESW_P4_LED_0 and ESW_P3_LED_0 pin
> states may cause an unintended external crystal frequency
> to be selected.
> 
> The HT_XTAL_FSEL (External Crystal Frequency Selection)
> field of HWTRAP (the Hardware Trap register) stores a
> 2-bit value that represents the state of the ESW_P4_LED_0
> and ESW_P4_LED_0 pins (seemingly) sampled just after the
> MT7530 has been reset, as:
> 
> [...]

Here is the summary with links:
  - net: dsa: mt7530: disable LEDs before reset
    https://git.kernel.org/netdev/net-next/c/2920dd92b980

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



