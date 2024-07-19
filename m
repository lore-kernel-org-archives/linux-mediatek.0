Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07760C3DA5D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 15:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pttkNRYt2goNJWEisDY6jKbea3O0HF6TlNEW4lBRHfM=; b=TohRQ9fb+hMo71xFvg+ySxv70S
	lDxLlvCaFQRdcA6HR3ysL32k36+dx3mhjBCfwAkUi0iSsbF/bkHqknBFbUZr7GbfcydN8ewpWLjVS
	plb8QIK7m3eajwWJaZOPl318SK+t3WqgKvg6bNBNvdJqYcGYeZVes2m/azg5+dnij9Xin5QCjepOa
	xvGBReHdsizBCbGU+z9RH8xLgtiCMk1C4uSMJUuFjq1diargdplmkdJzeXM3y1D8haaU2TS2xVd9l
	bJ8NzhgaCN1m3+cyuSvTp098CjbjLQCCJOlFA1rbEhXEjmmromz/mDJjOgEAr9aIQKfL3dsuJuFOx
	eM9unH5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUpFo-000000032sJ-2jZd;
	Fri, 19 Jul 2024 15:10:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUpFl-000000032rF-14vE
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jul 2024 15:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 12507CE1C55;
	Fri, 19 Jul 2024 15:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EC1DC32782;
	Fri, 19 Jul 2024 15:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721401834;
	bh=fgRsB4Q2xXb4zPEviS99iTSMsB0c3TTBmRkQMXlyO/0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pyLN5vAU0E5zezTC2iqHAxDFPRKr8Jn0lD6sGTzcxSmyJi+kaqAKH4qBfKK7/pYEH
	 lHU/dEFgRx0VjL7TouFiAd2+tZ/IB7enUtO3SAstCH782o1VUPlhW5HTxLCuNEgPjq
	 oERrxQaiQh5hlNvkTsdSCzC3S9Jo3NY0t2thGYyGeXkAygiSRxRlNECcQ58uqfkdtU
	 uAlEOqJJi2lcEIp9cl7qrwFTVfOxqa2iJxobksRZy8YK6AvX+5o1ozacxi42LMrPHK
	 RAUsSkUJvpGwZXXagdVoXBmhvUgcvucQ4um93Py0xtuMI/k0QsWuyT6v4gJhksR6Dr
	 /hBGsMCJAzNbA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4E1F1C4333D;
	Fri, 19 Jul 2024 15:10:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] Bluetooth: btmtk: Fix btmtk.c undefined reference build
 error
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <172140183431.18849.13794056510473088684.git-patchwork-notify@kernel.org>
Date: Fri, 19 Jul 2024 15:10:34 +0000
References: <20240719033019.26767-1-chris.lu@mediatek.com>
In-Reply-To: <20240719033019.26767-1-chris.lu@mediatek.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, aaron.hou@mediatek.com, steve.lee@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_081037_500397_A891573B 
X-CRM114-Status: UNSURE (   6.59  )
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

On Fri, 19 Jul 2024 11:30:19 +0800 you wrote:
> MediaTek moved some usb interface related function to btmtk.c which
> may cause build failed if BT USB Kconfig wasn't enabled.
> Fix undefined reference by adding config check.
> 
> btmtk.c:(.text+0x89c): undefined reference to `usb_alloc_urb'
> btmtk.c:(.text+0x8e3): undefined reference to `usb_free_urb'
> btmtk.c:(.text+0x956): undefined reference to `usb_free_urb'
> btmtk.c:(.text+0xa0e): undefined reference to `usb_anchor_urb'
> btmtk.c:(.text+0xb43): undefined reference to `usb_autopm_get_interface'
> btmtk.c:(.text+0xb7e): undefined reference to `usb_autopm_put_interface'
> btmtk.c:(.text+0xf70): undefined reference to `usb_disable_autosuspend'
> btmtk.c:(.text+0x133a): undefined reference to `usb_control_msg'
> 
> [...]

Here is the summary with links:
  - [v4] Bluetooth: btmtk: Fix btmtk.c undefined reference build error
    https://git.kernel.org/bluetooth/bluetooth-next/c/52828ea60dfd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



