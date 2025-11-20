Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675EECF9C7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 18:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwM5k5rgC0aLTOlLlaqV7CdyE7qCy37SSQ37pPp8whM=; b=xSLcnfLDmKyep28nrIsZ0ndwS1
	IHPNinVuMwpy9Mhi++t9Sj0+g8CtbqYDuxMOw13Tm7zmrirKzBZCAihBVW9vn5NnK4rWT8K+er31M
	+NjA0o1bBplsHRZbt4pRzEskbHw3qiONHNvGqnB5vy8DgEbdApLBxHGaJ3rEXatE5Q5gNxas94AxZ
	MJQ+F5B//uVKikp7++7cD0uPc/lv6wI47bG0N4Nk9on7YASVV6SaDbc1/CfBUM8caZkkOsoYXdwrT
	q3yl86kvZPtMAvVtZz1I2gFkJMMQ8LllXDqh9SmkuUGSQhGO89HkaHqh/DUPweSABRnI/wH2z3hsr
	NihBt+ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9jy-00000007FSe-3lHn;
	Thu, 20 Nov 2025 18:50:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9jw-00000007FS9-34co;
	Thu, 20 Nov 2025 18:50:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E241344154;
	Thu, 20 Nov 2025 18:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF406C116C6;
	Thu, 20 Nov 2025 18:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763664641;
	bh=YWC2QaLQIZnbvvKPn+rk+SMxZpvA1t+FyR0kuqU02KA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lLpIh82ApTKkcPa5DAFGjUR3FHxD+gzl/2/tjY9sFKwRGaXOhouiGSEOwvENQ6ddO
	 BC6shW7HOkL81jFMqBcTkEfUEmi36F0Lwmd1kYc8hpvbPI49PtqhIkZkVTRjtL40jR
	 VsR8eYHqfWeWZb6B5Lzhq+BtrM+gY6Z7nn+1tt2RjsKm0p6KDOK5U6mVH1wfz8J6qv
	 69Lva35wffUJrAcoQJEkFRdKyDnJnepkJlYhYjsK4lX33lFHbK/EY3gr3KNals1s6J
	 2f2GK06S56j108BVMotqoybEYjmoXradFsnthBCeiBWjEN0oj7uwfY7wXMT6D8IJ6V
	 kiT3dQrEiPi3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F663A40FE6;
	Thu, 20 Nov 2025 18:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] Bluetooth: btusb: mediatek: Avoid
 btusb_mtk_claim_iso_intf() NULL deref
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <176366460701.1748676.511972373877694762.git-patchwork-notify@kernel.org>
Date: Thu, 20 Nov 2025 18:50:07 +0000
References: <20251120081227.v3.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
In-Reply-To: <20251120081227.v3.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
To: Doug Anderson <dianders@chromium.org>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, regressions@leemhuis.info,
 regressions@lists.linux.dev, incogcyberpunk@proton.me,
 johan.hedberg@gmail.com, sean.wang@mediatek.com, stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_105044_816290_D513AB65 
X-CRM114-Status: GOOD (  11.53  )
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

On Thu, 20 Nov 2025 08:12:28 -0800 you wrote:
> In btusb_mtk_setup(), we set `btmtk_data->isopkt_intf` to:
>   usb_ifnum_to_if(data->udev, MTK_ISO_IFNUM)
> 
> That function can return NULL in some cases. Even when it returns
> NULL, though, we still go on to call btusb_mtk_claim_iso_intf().
> 
> As of commit e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for
> usb_driver_claim_interface()"), calling btusb_mtk_claim_iso_intf()
> when `btmtk_data->isopkt_intf` is NULL will cause a crash because
> we'll end up passing a bad pointer to device_lock(). Prior to that
> commit we'd pass the NULL pointer directly to
> usb_driver_claim_interface() which would detect it and return an
> error, which was handled.
> 
> [...]

Here is the summary with links:
  - [v3] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf() NULL deref
    https://git.kernel.org/bluetooth/bluetooth-next/c/dd6dda907d09

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



