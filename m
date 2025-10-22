Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D75CCD1BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Oct 2025 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gBTBnH1FtYIyWKafmQ4A++qeLZVVVxfxFP4zj0a1V0=; b=3FNfKaHuZDAVKprJ2ZLYnURIVP
	8Np3p1T8bFHzJflrR0JbAktFQkZ5WruAzfmBH98XbUQUxdVgN3SQvXwWbKIUOnWstfdUNvte8XxrD
	QYVyntsbn73Kb9U/tQfP2Y0hewOVymaMOGUgyRk9bA2bjLPup+1esKqhIh0YTReaQsgTV3NcvuZHY
	UJehSXS9rg3V+Zq/7m9aY4AMn3Jbvm2r5F8HZXWBVM1vruQ1Z3hmsjEHTQmSn/fF4YZonX6WyqXkn
	MjZox2FOoIhFE8w9eRJpy2IH+Llq5kSUWeU/a5AaKakLps1ulfwrWAy6iTdYiSMJGZLg7AgJO3/CZ
	9o3qLGUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZEV-000000035ym-46wV;
	Wed, 22 Oct 2025 13:50:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZEU-000000035yJ-2cGE
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Oct 2025 13:50:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1208262131;
	Wed, 22 Oct 2025 13:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B374BC4CEF5;
	Wed, 22 Oct 2025 13:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761141029;
	bh=4q54NyL9BUJnCJ65isVEm3uQJQT5pbbLzT96h2CIzbw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YWyr7Hjk0uAHY3sKgeXvhwKG78pVsDenMZJcSGrxmKJcRnZCRIkd6++4oqzQJAbbx
	 KK41fh3yO45kfrWgUNrtmTd06QE6VuaUkGNVaAUvMDCMUY9ShTTpD8qMF6EIoS8Ua/
	 olWILwGewGyr6ekC3JWRnr0imSo+sD2kkLd3Ba1814l2ajdhJ/0LnNmr5R7tqRxZww
	 SbDGOW0FEfwEGeXI02aq6+ur8wH3bbOtevxz4EGCcAPhoxLxxf8WQZeV8c5pcxxFm3
	 umNYMM/F1NSelhlBumeT3jTrelaU3vt3wuFhYIn4F1TlLqtmlotnFJQlYtgBX02i0Y
	 A7zZjnBm+OU1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE133A78A5D;
	Wed, 22 Oct 2025 13:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 RESEND 0/2] Add two new ID for MediaTek's Bluetooth
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <176114101049.1909224.7135864082942324713.git-patchwork-notify@kernel.org>
Date: Wed, 22 Oct 2025 13:50:10 +0000
References: <20251015033150.498866-1-chris.lu@mediatek.com>
In-Reply-To: <20251015033150.498866-1-chris.lu@mediatek.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, will-cy.Lee@mediatek.com, ss.wu@mediatek.com,
 steve.lee@mediatek.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
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

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 15 Oct 2025 11:31:48 +0800 you wrote:
> In response to the customer's request, add the following two
> VID/PID to the USB driver table so that btusb driver can support
> the corresponding MT7920/MT7922 modules.
> 
> 1. VID/PID 0489/e135 for MT7920
> 2. VID/PID 0489/e170 for MT7922
> 
> [...]

Here is the summary with links:
  - [v2,RESEND,1/2] Bluetooth: btusb: MT7920: Add VID/PID 0489/e135
    https://git.kernel.org/bluetooth/bluetooth-next/c/bb9da27b29d0
  - [v2,RESEND,2/2] Bluetooth: btusb: MT7922: Add VID/PID 0489/e170
    https://git.kernel.org/bluetooth/bluetooth-next/c/042b9b4c55c7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



