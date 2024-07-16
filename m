Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50273C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jul 2024 19:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4Fl1869OeleASeL1RKkFaYiGYxxnBqaxBHOHQl1Hg8=; b=rZwi63Rfpq0DSqnvWFMZRmogIa
	FJWgjFvsq7KT9Nl1quUwTKs+Tzc8bzo6er/q0ZcwBnLZlgmfouCk8H3jAhs8oCwjTWLCs3XvGsyIC
	YfPXQVAUoA2Q14ivcgAKWfRv3ItPsmOI5rWHOyL5AuVjpmm006EwIGmca7ajHa11iQiiN3qxFZXxp
	05XWKviNd2hNj1tuq+AB0htUqPHdh1z9IQ5rUsbwsd/nObaX6hjmAIhXEfwCKcp3i4JgMy99tPErr
	SJDRocikC38ef2Y9e0EKYx2F2q5y2mPt8boo3vWGwJbMbHy5lwRTPmUmnkkcta9AZnZ40q+Cn7Ixm
	64/pTajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTntc-0000000BWnG-0wJD;
	Tue, 16 Jul 2024 19:31:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTnsf-0000000BWQh-26Yh
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jul 2024 19:30:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1C3A61302;
	Tue, 16 Jul 2024 19:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57AFCC4AF0E;
	Tue, 16 Jul 2024 19:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721158232;
	bh=0mb2nKjeB/LgNGshNrVxcD0GwoYd5a7HHsVx7CM727g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=C5DzsGMHSVpOz++wsg1gKQdtOFMsbvdQBoIo8u0JIyRzuvqbxVJmxsZT/33W7KE6g
	 35Q7asxyM/1eyOKlEZelNNRfZxXk0IZI+a2Rt57rntNHMuCRbQEWWn21Gb2K3r+yd8
	 WHX9WXHe2IF9AYgBOh+8x8brWQ+NyIXcf5nlMC+sNCf33Ms1xl0AUDB9ufCdYx2kGK
	 vgyQG/QCCbZJBWTi6gwLGFxk60CnweRyO3erjAUrV0ySZkzO2dUf2xxW11r4kg9s++
	 4LbPJuv77xKLdl4M1cWfI76/uDg9qOqEH/b9yQpWb5S/WU6tkCDsXDp+2Wut5q05+s
	 pHSY2x1Awv45Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 426FDC43336;
	Tue, 16 Jul 2024 19:30:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] Bluetooth: btmtk: Fix kernel crash when entering
 btmtk_usb_suspend
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <172115823226.13786.2850053898867663349.git-patchwork-notify@kernel.org>
Date: Tue, 16 Jul 2024 19:30:32 +0000
References: <20240716074947.23073-1-chris.lu@mediatek.com>
In-Reply-To: <20240716074947.23073-1-chris.lu@mediatek.com>
To: =?utf-8?b?Q2hyaXMgTHUgKOmZuOeomuazkykgPGNocmlzLmx1QG1lZGlhdGVrLmNvbT4=?=@ci.codeaurora.org
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, aaron.hou@mediatek.com, steve.lee@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_123033_660158_321DE952 
X-CRM114-Status: UNSURE (   8.38  )
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

On Tue, 16 Jul 2024 15:49:47 +0800 you wrote:
> If MediaTek's Bluetooth setup is unsuccessful, a NULL pointer issue
> occur when the system is suspended and the anchored kill function
> is called. To avoid this, add protection to prevent executing the
> anchored kill function if the setup is unsuccessful.
> 
> [    6.922106] Hardware name: Acer Tomato (rev2) board (DT)
> [    6.922114] Workqueue: pm pm_runtime_work
> [    6.922132] pstate: 804000c9
> (Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    6.922147] pc : usb_kill_anchored_urbs+0x6c/0x1e0
> [    6.922164] lr : usb_kill_anchored_urbs+0x48/0x1e0
> [    6.922181] sp : ffff800080903b60
> [    6.922187] x29: ffff800080903b60
> x28: ffff2c7b85c32b80 x27: ffff2c7bbb370930
> [    6.922211] x26: 00000000000f4240
> x25: 00000000ffffffff x24: ffffd49ece2dcb48
> [    6.922255] x20: ffffffffffffffd8
> x19: 0000000000000000 x18: 0000000000000006
> [    6.922276] x17: 6531656337386238
> x16: 3632373862333863 x15: ffff800080903480
> [    6.922297] x14: 0000000000000000
> x13: 303278302f303178 x12: ffffd49ecf090e30
> [    6.922318] x11: 0000000000000001
> x10: 0000000000000001 x9 : ffffd49ecd2c5bb4
> [    6.922339] x8 : c0000000ffffdfff
> x7 : ffffd49ecefe0db8 x6 : 00000000000affa8
> [    6.922360] x5 : ffff2c7bbb35dd48
> x4 : 0000000000000000 x3 : 0000000000000000
> [    6.922379] x2 : 0000000000000000
> x1 : 0000000000000003 x0 : ffffffffffffffd8
> [    6.922400] Call trace:
> [    6.922405]  usb_kill_anchored_urbs+0x6c/0x1e0
> [    6.922422]  btmtk_usb_suspend+0x20/0x38
> [btmtk 5f200a97badbdfda4266773fee49acfc8e0224d5]
> [    6.922444]  btusb_suspend+0xd0/0x210
> [btusb 0bfbf19a87ff406c83b87268b87ce1e80e9a829b]
> [    6.922469]  usb_suspend_both+0x90/0x288
> [    6.922487]  usb_runtime_suspend+0x3c/0xa8
> [    6.922507]  __rpm_callback+0x50/0x1f0
> [    6.922523]  rpm_callback+0x70/0x88
> [    6.922538]  rpm_suspend+0xe4/0x5a0
> [    6.922553]  pm_runtime_work+0xd4/0xe0
> [    6.922569]  process_one_work+0x18c/0x440
> [    6.922588]  worker_thread+0x314/0x428
> [    6.922606]  kthread+0x128/0x138
> [    6.922621]  ret_from_fork+0x10/0x20
> [    6.922644] Code: f100a274 54000520 d503201f d100a260 (b8370000)
> [    6.922654] ---[ end trace 0000000000000000 ]---
> 
> [...]

Here is the summary with links:
  - [v1] Bluetooth: btmtk: Fix kernel crash when entering btmtk_usb_suspend
    https://git.kernel.org/bluetooth/bluetooth-next/c/0c9b6e2f7742

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



