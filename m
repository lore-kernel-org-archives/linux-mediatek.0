Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FE3C07E8E
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 14:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqBjRkU2QTKNmQeQa5T2j/xX44Q08P1m73/kwlMjB04=; b=TVjAh+Zz6UBrpCjplqdc4/AxZ1
	+6Rj7OqDNi7lqcOSSKh66zi/h+eFq+SpT9JGnpjWYizzfVwzZ9Cw/U3FfVngQOelyzVRrPI9Kj9jL
	sKz5L3oJ1mSDG2HT6ATYSggf+nctI3zJ7oLcUwZ5tryWYoMIfqRbAgTOm50/+pAKOGpZuoH40a7D3
	PInx8KwOfkoD9Gq/DaNAsXPndOO31fJk6iv5bS/1u5Ai4Sd45kX5FY/6v9Mil10PP01P5TbpjAxB+
	yldSuQikNyiCf4L2uHs25FLr9VF/Qf1Mc0Nvy7yhrefxk8ticQeWuIr0F/jp42jRJLVJhfOHT7tDw
	ROvEToKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzddq-00000004Udr-1BBg;
	Wed, 24 Apr 2024 14:30:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzddm-00000004UdF-2dwK
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Apr 2024 14:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73F3D61B9A;
	Wed, 24 Apr 2024 14:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B38CC113CE;
	Wed, 24 Apr 2024 14:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713969029;
	bh=M1cm0t9jToH3lGaAFH2NKA1e80hsoHbeF5wtjnc0wSg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Sr2LVEOkmSCvTiAW71+sPsBokFdg+iP8PqoO7HvJwdZlNCoBRpZtu6tP2KDsjg5HN
	 YxAa6q93ZW2Yt4ho3zflUlIdATLW9nt1O6Xf+kJeKFwnFXBIpA3vuk/8uIfWrsTjOi
	 X3K8UdnKuQTCmp03KxoCOSg4bowBrj4+8KriZ//5ieYNEvKUHmK9d1Q/BD5OlGmZyR
	 gdD4N7rY1nKyd5Qb8jHkEo4mGKr8DYibWFpC/XtEQni4XOg46KZ/x34Han0HOI12+U
	 lj9RbBwdxBDj4owHnCpFQHDTHptybUhOwRr8WKKWpcvfjuvsNuPKFKLD1Fxj3ZZ9mj
	 uMIHSllHtW5CA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 05326C595D2;
	Wed, 24 Apr 2024 14:30:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 1/2] Bluetooth: btusb: Add USB HW IDs for
 MT7921/MT7922/MT7925
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <171396902901.2541.2890926466501511586.git-patchwork-notify@kernel.org>
Date: Wed, 24 Apr 2024 14:30:29 +0000
References: <20240423065157.21805-1-jiande.lu@mediatek.com>
In-Reply-To: <20240423065157.21805-1-jiande.lu@mediatek.com>
To: Jiande Lu <jiande.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, chris.lu@mediatek.com, deren.Wu@mediatek.com,
 aaron.hou@mediatek.com, steve.lee@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_073030_734776_6245C6C7 
X-CRM114-Status: UNSURE (   6.98  )
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

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 23 Apr 2024 14:51:56 +0800 you wrote:
> Add HW IDs for wireless module specific to Acer/ASUS
> notebook models to ensure proper recognition and functionality.
> These HW IDs are extracted from Windows driver inf file.
> Note some HW IDs without official drivers, still in testing phase.
> Thus, we update module HW ID and test ensure consistent boot success.
> 
> Signed-off-by: Jiande Lu <jiande.lu@mediatek.com>
> 
> [...]

Here is the summary with links:
  - [v5,1/2] Bluetooth: btusb: Add USB HW IDs for MT7921/MT7922/MT7925
    https://git.kernel.org/bluetooth/bluetooth-next/c/3d513268312d
  - [v5,2/2] Bluetooth: btusb: Sort usb_device_id table by the ID
    https://git.kernel.org/bluetooth/bluetooth-next/c/2214b639ca14

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



