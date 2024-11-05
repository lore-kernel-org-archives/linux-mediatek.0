Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C154D2C11B
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2024 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBoUfMyPxqwPFaikmd4iEQcy/AgVwrpmivkKz5IC/Fk=; b=xs1mpT/alXZB9W5lFt3RpgqhRf
	r2J7zNYmC00GXbI6P3AsOhUqSSraajzqX1IuHkaEyYzMvyKfp+3urAryTOj7dKmJj3N5zFhpcpWee
	01WJ5Kk9F0TER84QlBPhk+Dy0Gvw8a0TAjwL0DrMWxLgQcIXWlyg0RH2CVjwDg1RAOBvCtdhkkS3M
	VNwJ0JszcBROHO3M0LCpX5fwkEMCOD2ODB+jZcdUQg/0y76u9FGY6FC/FjljjPfQr43xFKRa1HyqO
	U+Eec8P9n43SZR9B7hAAcc45ZyuNESz/I1DT4kGJM/Q4HsXEucIoWPYnB+OI8oHTTAa6PAD2XyQa+
	MaQ3L/Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8L2j-0000000HMW3-0CDa;
	Tue, 05 Nov 2024 15:00:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8L2f-0000000HMV0-3JUP
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Nov 2024 15:00:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 779645C4B18;
	Tue,  5 Nov 2024 14:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60B0C4CECF;
	Tue,  5 Nov 2024 15:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730818823;
	bh=hwtMV9Qj3NKD2N3GDsqgdxIXuPb/uUtnEmMIN4rXi2k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qdv91sWHFUwZk0VDjArFin6owvheOMzHKOnwxIFrw3vvJcan/FZ9GJbFp7wDe4t92
	 Bm9IwdTW1Wd3KB1kxKJOZaGB158an2xiYd2WZx9SX2ojduoHYaNyAkbeFQtMPcJthd
	 a5NBkeZKF699UHFDUkT7CdSxWpDnNBDtfyDYA8M5grMc2dUQ4a0HURSttyTK7vlIA/
	 jK8Zb3wC+8la2sQEPdvmoELTfCy7+HQVcAY/LZdbnVNBlKZtHdNOjGZoBo+UqSHvjq
	 1LERG76VYgx9OLQof0vMvV/Jvid0wOaMbn2pWz2yDX1xe3DMJLTOHg+fv3ftMY2FsS
	 wFltS6PoZUdHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADA83809A80;
	Tue,  5 Nov 2024 15:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btusb: Add new HWIDs for MT7925
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <173081883249.584547.18341653514811903582.git-patchwork-notify@kernel.org>
Date: Tue, 05 Nov 2024 15:00:32 +0000
References: <20241104131904.30447-1-jiande.lu@mediatek.com>
In-Reply-To: <20241104131904.30447-1-jiande.lu@mediatek.com>
To: Jiande Lu <jiande.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, chris.lu@mediatek.com, deren.Wu@mediatek.com,
 aaron.hou@mediatek.com, steve.lee@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_070026_053129_5FB9E4A2 
X-CRM114-Status: UNSURE (   7.27  )
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

On Mon, 4 Nov 2024 21:19:04 +0800 you wrote:
> Add below HWIDs for MediaTek MT7925 USB Bluetooth chip.
> VID 0x0489, PID 0xe14f
> VID 0x0489, PID 0xe150
> VID 0x0489, PID 0xe151
> 
> Patch has been tested successfully and controller is recognized
> device pair successfully.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btusb: Add new HWIDs for MT7925
    https://git.kernel.org/bluetooth/bluetooth-next/c/408ec48013da

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



