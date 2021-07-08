Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15600C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 20:40:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC7F1616E9
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 20:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC7F1616E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=saDsTNFlDUu0HtTqkYA9lk0n98Hzz6+k3RrQLes1z6s=; b=kmkCuI2UBsBpjo
	T5LS2c+gvQHpp2PR2CXIKqqAOmGyxbEaUfjhBL2FQUDKUJu3JZvtwtnfWTDxU5rfE/tR1MdKxSflz
	rkLqz9d3QRDVFEpkkJr3Dw22mYHnFKxS7y1Su7bbecuRaspNA3E4WBOmsFs4BFgV1JLbcdQoP3RBV
	foMwlxQH01XV+0dwuh3aEMCypPjcrOsVlon3K0owo4c2m/56cyXUo7Z4YZv7Bj2rCRTM61zqEc9ip
	wc9JnVkuGtirns/mTZ0z3tt3XjiPlX9KVzv7HgqTe3ekVIGLQFdEyXVIcn1QvBdfLrirgjXumtVhl
	dUI6/tVPBGh0rRTzDFPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1aol-000Fw9-1Y; Thu, 08 Jul 2021 20:40:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1aoX-000FtT-Oi; Thu, 08 Jul 2021 20:40:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 32BEA616E9;
 Thu,  8 Jul 2021 20:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625776804;
 bh=+5neBRC3/ETp/zdUfgyRaV6iyujCORLImXx5nfaB2ag=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Kuc0VWlqirRzd32TEuGkew1Q/GwXjWstMEpmJcChNqvVisRGqIbvT5lEG6xCmXiW4
 wggIkxfG5+N5j3sJ2lNPOB8LVdEt5T3cyzkbsHIdFuyy+PDpIWfFH3DotoYMp5rpiG
 GKkLn/jOHIiXJaAWFBYV1CqSnqzCL1WDfLXk4UjdBQpBmXwzi4/aG60r27Y0poIRR2
 OPPSueoa/VZCIYhzH1VTt1Do+h3Ka90WKqQKBK+N/KBfO9np93jn7SKQwJqHldQEJl
 xp1A1ra//y1GAx3HrSmFSBRfdD0jsZcwWjIXlGdeoSdmJUW6OlbDMOg3/KEvvzc17D
 BXUZlQs0DHyEg==
MIME-Version: 1.0
Subject: Re: [PATCH] mt76: mt7921: continue to probe driver when fw already
 downloaded
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162577680412.12322.7727150066013328820.git-patchwork-notify@kernel.org>
Date: Thu, 08 Jul 2021 20:40:04 +0000
References: <20210708131710.695595-1-aaron.ma@canonical.com>
In-Reply-To: <20210708131710.695595-1-aaron.ma@canonical.com>
To: Aaron Ma <aaron.ma@canonical.com>
Cc: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, sean.wang@mediatek.com, Soul.Huang@mediatek.com,
 deren.wu@mediatek.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_134005_864711_E9773B52 
X-CRM114-Status: UNSURE (   8.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Thu,  8 Jul 2021 21:17:10 +0800 you wrote:
> When reboot system, no power cycles, firmware is already downloaded,
> return -EIO will break driver as error:
> mt7921e: probe of 0000:03:00.0 failed with error -5
> 
> Skip firmware download and continue to probe.
> 
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> 
> [...]

Here is the summary with links:
  - mt76: mt7921: continue to probe driver when fw already downloaded
    https://git.kernel.org/netdev/net/c/c34269041185

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
