Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13D8D10399
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 15:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IK54LL5cOViShizPSWTzXJ2DOUrz0AyRL0HdQ4ube7I=; b=GUbSrlgSTtneQ06cPelXJe+O+c
	zusLPUqN/BXLx9YB4VWtDS7AV68eb/PVfotlVZ+Mq+2Ls73MsH0qIXMOFyLDXHt3PNKN3fbQ+m/0A
	s7iFsFA/wJTWxo+xVeAHZ8HM2+x/YP4T48ghAR6lKnUgL709yznOXusnCcgqQMXAL625hFr4VJp05
	irZ5wdmLqs7Ig7oxohO61m32Tbuefp1lD2QMnDBZKPvkpQo2SGyNv+W+XlTVuYVEwMfCflZgS20Dt
	DgDAvoWgDy6eio9Vr0jVvhch104in92maujVKRcDAdV7ZR/negC1pSuP1X0U/rRjn6F5HAtq9WUF9
	OjKyppwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MWn-00000004JGn-2IqB;
	Fri, 25 Oct 2024 15:47:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MQV-00000004HfO-06dp
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 15:40:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 353E9A42FBA;
	Fri, 25 Oct 2024 15:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BE5C4CEE3;
	Fri, 25 Oct 2024 15:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729870833;
	bh=HjI+JzV1raC5Lry0ocWZJu5wPZ0AXj80BC5ZRUwkceQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AhrBtg9dB9G5+Gh1+IXkMUzfoOKn72ZkvP0CJFM7Zeh4NZuf2Xr8fVdY0jHwrZpUP
	 QTN53zG7olTM/TWI+2c7slNZKfpyYHLmfR9/nYHjDivCtsdQYYfp5GSHq5t+F/0Are
	 tUcHSTm5UF1pSJ6LZWlpresgXMl5xRBiI2HWnCdvKQIVcvewWafTzWSW4k9h2w5ikn
	 63TaHHpN10TOZ8Du/KC48slqia4/cAL6EoEg4co7DXQz73ySSlUVE8FmymOseMtNJH
	 P0it9VpcelpkMx5+Q2TgOuVrhgp5ZftXjxNSxK4FUSNeU5/j+g44S6BagWcFHBRwY0
	 bc2Uz1kffTA/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C773809A8A;
	Fri, 25 Oct 2024 15:40:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: btmtk: adjust the position to init iso data
 anchor
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <172987083975.2948690.13538212857409218005.git-patchwork-notify@kernel.org>
Date: Fri, 25 Oct 2024 15:40:39 +0000
References: <20241025060717.24222-1-chris.lu@mediatek.com>
In-Reply-To: <20241025060717.24222-1-chris.lu@mediatek.com>
To: =?utf-8?b?Q2hyaXMgTHUgKOmZuOeomuazkykgPGNocmlzLmx1QG1lZGlhdGVrLmNvbT4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, aaron.hou@mediatek.com, steve.lee@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_084035_152687_93D7570A 
X-CRM114-Status: UNSURE (   8.18  )
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

On Fri, 25 Oct 2024 14:07:17 +0800 you wrote:
> MediaTek iso data anchor init should be moved to where MediaTek
> claims iso data interface.
> If there is an unexpected BT usb disconnect during setup flow,
> it will cause a NULL pointer crash issue when releasing iso
> anchor since the anchor wasn't been init yet. Adjust the position
> to do iso data anchor init.
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: btmtk: adjust the position to init iso data anchor
    https://git.kernel.org/bluetooth/bluetooth-next/c/2422d0e13858

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



