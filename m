Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A993ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 23:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsoN6qQtkG1BMY0QjY6oo8gApLqvI/v7vtEUxpfOguc=; b=a3+mCWN7AfdgxGJ9Ntz2lWzD0A
	0OyvJeD60aaUAVdgWSy3Xdq83h42xZRrAbqV7QerHal6NZjehh0nT/aXbYUiDl70qZmjHnxDiPgoI
	f1aqdXBqkyJ3fUEBxdHy2VAUvvIcmgcrRMz6QlFmv6DmGSojW5ldNnh04d2wC1ssLhvQLhTLE49Cf
	giutPy0SlTlapRlU4kX7hX4+4aySiEFLRFmdcx3PQ8TFTn91yPtDNW5ZFh2c/oy4nZUFHrRzEykkF
	TV5rOt2ko0HATu5/ibd3gK19HoPZ8jQedwQqtuhN4l6AL9qSyvj0OCW7PeyE2vYxtZZzQkViw8njU
	RT8hDMiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTXA5-008dyI-8V; Wed, 31 Aug 2022 23:30:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTXA3-008dxr-45
	for linux-mediatek@lists.infradead.org; Wed, 31 Aug 2022 23:30:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A1A9EB823C1;
	Wed, 31 Aug 2022 23:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 470A5C433D7;
	Wed, 31 Aug 2022 23:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661988615;
	bh=CbM8i5pqI5d7io1Cbk/QR8oz21S+sd2XFL/3nw9UKWQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GiI2HLi61IqdwaTwp3vtqAs8kGFLHSfn34VaFUiBEuhSTfgFVOmi7PlXlTRTOzJZx
	 O9UnjDkNawmBQIGLQlT/gjZz95rdBixXCbTUCZbvtJpki0cNAuMIDrIsp14QGdqn0Z
	 0ClbugYQpF3y1y1TiZJm9Oncx9Kj3tMQVmqcVp673O/oPOGb5rS7M+xXhevya+zPCc
	 T11Ii/xawFGJXgWzO0X5P3mVc1DJBqhaxFlnCrOI0O//SAmN30m+DXbSdDHYcqGjH9
	 cPXm9ajOtH74XsqwzA+IKbhOyZPqm1MmiceqYZGiR0fwOfHMhepuGKJXW7tE7CWZO/
	 GtuxAPY3wsP3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 28B3EE924D6;
	Wed, 31 Aug 2022 23:30:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5] Bluetooth: btusb: mediatek: fix WMT failure during runtime
 suspend
From: patchwork-bot+bluetooth@kernel.org
Message-Id:  <166198861515.30343.13576995414925272614.git-patchwork-notify@kernel.org>
Date: Wed, 31 Aug 2022 23:30:15 +0000
References: <6675f56fc8b0910f17ec506d534cf5330ff04733.1660177086.git.objelf@gmail.com>
In-Reply-To: <6675f56fc8b0910f17ec506d534cf5330ff04733.1660177086.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, ted.huang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
 frankgor@google.com, abhishekpandit@google.com, michaelfsun@google.com,
 mcchou@chromium.org, shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 jing.cai@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_163019_348369_48CF0611 
X-CRM114-Status: UNSURE (   9.97  )
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 11 Aug 2022 08:49:07 +0800 you wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> WMT cmd/event doesn't follow up the generic HCI cmd/event handling, it
> needs constantly polling control pipe until the host received the WMT
> event, thus, we should require to specifically acquire PM counter on the
> USB to prevent the interface from entering auto suspended while WMT
> cmd/event in progress.
> 
> [...]

Here is the summary with links:
  - [v5] Bluetooth: btusb: mediatek: fix WMT failure during runtime suspend
    https://git.kernel.org/bluetooth/bluetooth-next/c/177978b29426

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



