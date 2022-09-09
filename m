Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5B5ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 19:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CiHpK0woNdmM/och6DLffqp5S43SPlre/Yb6rwV2nk=; b=L6rNGZIiLcJgZULiNIs2DitsG8
	DtkG2ULY07T+xZFECnIbvrbmrZ2NJAuIdlCZhzWdgMUIUo/pey87aAGexujiipJ3Jg5IlG8bjM9hz
	2M+3jOI3ZkmEHuFarRjEb17jAYHIhgR08sXN8ygvwyRsD08NwkOCZOUdiV2/R076s4Jz88aIUXegM
	X3b3fGJNfXKTHNgOzg6uET7F05kpryxVWqYmmrJPd2hxXxlD9zfpLYcyFfQcWMYA9TbH9Hods6fkD
	1C6nGVoujQZ3KdWt7YRmMf9degi2AdMrMdgkzdt2nw6Lw7Hbc/1vQJvEMwrUdXLOeR/PKEnNzakuj
	PhR4HVlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWjhn-001rWM-8X; Fri, 09 Sep 2022 19:30:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWjhk-001rT2-FH
	for linux-mediatek@lists.infradead.org; Fri, 09 Sep 2022 19:30:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 58CC2B82625;
	Fri,  9 Sep 2022 19:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08469C433D7;
	Fri,  9 Sep 2022 19:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662751817;
	bh=TlR5KkdKFGZEA3IVTZd6lKfqF7mgIKXOnZzTEUCZlvE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s49j/z2MegOyfjiF+cd/XOyEPA+aOWDq6rAVy509zPAAoguzoTvjHvjcxm0NBcRXW
	 +ns9TWpkTQ2hN8zitTFp0aF6ZtHan15j1OepuokEG5+4C+uZW2vDl4JWXhdaZXPFcm
	 QI3wW3PUyb8SGNou5PoO4Fe2mSWnQA3kBvNIQUTFq4KlkAiQC0p0HvCGELdiHn4kNt
	 mYIL7BDIXn6aQUYh11pRzvTTmGr6pjG53rVHqlngILghmvXrxh/+7dEZqXPTMinZNX
	 3KhAKQlBKn1pY3FyoFUl8B1jYZeCEKVHE03JsyNkXwjaQFcbSy5ZfMkNqNBn2wx18M
	 tC15R/g8ZSdug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DDDEEE1CABD;
	Fri,  9 Sep 2022 19:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btusb: Add a new PID/VID 13d3/3578 for MT7921
From: patchwork-bot+bluetooth@kernel.org
Message-Id:  <166275181690.14413.3140542582465641512.git-patchwork-notify@kernel.org>
Date: Fri, 09 Sep 2022 19:30:16 +0000
References: <575471871695aaae73ebc15eee73411ee53f4bb4.1661596165.git.objelf@gmail.com>
In-Reply-To: <575471871695aaae73ebc15eee73411ee53f4bb4.1661596165.git.objelf@gmail.com>
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
 chris.lu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_123020_702351_673D1514 
X-CRM114-Status: UNSURE (   9.68  )
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

On Tue, 30 Aug 2022 06:55:58 +0800 you wrote:
> From: Chris Lu <chris.lu@mediatek.com>
> 
> Add VID 13D3 & PID 3578 for MediaTek MT7921 USB Bluetooth chip.
> 
> The information in /sys/kernel/debug/usb/devices about the Bluetooth
> device is listed as the below.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btusb: Add a new PID/VID 13d3/3578 for MT7921
    https://git.kernel.org/bluetooth/bluetooth-next/c/a614ee94a849

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



