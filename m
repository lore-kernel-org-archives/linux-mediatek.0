Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48147C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Dec 2022 03:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jWLl0do5Hh676XFHOrsVQWaIWy/zINdW+2FqtxurlI=; b=rme4FHAL95oeyihdXbd1j8WYd3
	cRV+uVS39fOBuYMUMiI5bYfVy+9xkbVxwq8mxrh8e5P2NpDN265SS8rsKz0JqAzPVyh0fC9mGrsj9
	2rS09hB2oKgZwVhmBDwssCnzmsEOSbiVdSEfLFOTWenWtL8EXZS67WeEEAbFD05WtjXr/JsXxJ2Hf
	tBcTPPOCZmD8MrOUXvqQPTQe6/gjGufxKx3ko4to5utattL2GibcEJWJTMU1Tg+Pp2ieNcsYnIffs
	ivy2UhRgRpDWmkD4HaPS2cUZgl1cdX+/NlXs+YkRVlkfZXGjwR1mGck9Qt1wJxA2oNowxvcxcYvfJ
	2lzFoxNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3UP6-002NKR-5E; Fri, 09 Dec 2022 03:50:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3UP3-002NAT-4X
	for linux-mediatek@lists.infradead.org; Fri, 09 Dec 2022 03:50:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1FCCBB82795;
	Fri,  9 Dec 2022 03:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8D21C433EF;
	Fri,  9 Dec 2022 03:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670557816;
	bh=Sq507ZJKfFu5pvL5ZO0IknPxsb3Z4M7hywSu7GplW5g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qK8aMrswXFZgPETa564QByWToQjjAOZisFm/3bpZ7wIyw25An69w4PCDCGNkI9E1t
	 NIXBKpLf7vWQwbVvahtFGIeTy0Kna64nj3voadMwhp1Tpwwu9RRMPZKqc5dkg060hu
	 1EZcvxQtE255WtrM+Ma2FIe7Z0/HpBiVzvfx1OIgGdDom2bJnBBU01PA1lYU6P60nS
	 hRP2hXw8vM8D76b0g/sSqKm078niFokhJg8D9/SGot/7XFoUzyihvn0t1TNDMdZCVe
	 x72XXJ5O8GLJ3crsy0LACsJGWljyRciFmunUsiCzrcLJtyG5Ve/iyTn+vNBKRDBfU6
	 ARoVje+nKeYDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A3ED3E1B4D8;
	Fri,  9 Dec 2022 03:50:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 net-next 0/2] fix possible deadlock during WED attach
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167055781666.4041.15328883962417059725.git-patchwork-notify@kernel.org>
Date: Fri, 09 Dec 2022 03:50:16 +0000
References: <cover.1670421354.git.lorenzo@kernel.org>
In-Reply-To: <cover.1670421354.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com, leon@kernel.org, sujuan.chen@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_195025_440547_AC6A3892 
X-CRM114-Status: UNSURE (   9.37  )
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

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  7 Dec 2022 15:04:53 +0100 you wrote:
> Fix a possible deadlock in mtk_wed_attach if mtk_wed_wo_init routine fails.
> Check wo pointer is properly allocated before running mtk_wed_wo_reset() and
> mtk_wed_wo_deinit().
> 
> Changes sice v2:
> - add WARN_ON in mtk_wed_mcu_msg_update()
> - split in two patches
> Changes since v1:
> - move wo pointer checks in __mtk_wed_detach()
> 
> [...]

Here is the summary with links:
  - [v3,net-next,1/2] net: ethernet: mtk_wed: fix some possible NULL pointer dereferences
    https://git.kernel.org/netdev/net-next/c/c79e0af5ae5e
  - [v3,net-next,2/2] net: ethernet: mtk_wed: fix possible deadlock if mtk_wed_wo_init fails
    https://git.kernel.org/netdev/net-next/c/587585e1bbeb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



