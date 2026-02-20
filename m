Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E125C56204
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Feb 2026 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/oAEEzW3GFNTM62qK/BgnkUSUmypAVwYMK11LupOYk=; b=QMj7mokiDt0coQxbP9MQBTY9oz
	MjiF0f4MqmnClpqXDhMLcMQxd/FOEJX9gqrqxmhwevAuQM9gmpfh5KdVxiHG/a3oZpcnO3v1JPnUO
	RUGkcOqNmt0cVpCnWQRWTZIGiX+l5QlY793WpbMfFCcMSKJMPrP3YgeKPzeQhiYYe5Etsib4U7D3G
	5lJC8UJAZzjEF27SRsrVqSGY2ynurj5aKJ+virOQ7UtjIhTt5j7YgOkMR68Xiv0oDgjuOJnrlSazA
	JnJ3cZJkVF0sHGV2Ss9o7dVz6z3yNfWtK1br8YOJD9DiRHwvrZ0oxbdY3MADF4Swqfgg2a3IsaAdI
	xWid1b9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRfs-0000000Erei-1QLJ;
	Fri, 20 Feb 2026 14:40:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRfp-0000000Erdg-3vTz
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Feb 2026 14:40:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B898438B0;
	Fri, 20 Feb 2026 14:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFCBC116C6;
	Fri, 20 Feb 2026 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771598403;
	bh=RNGWBNoDYNlMRfVdZ5vPCGmmNX7HW7lp2LrCEUjpVqI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tb0ANaXDLqSWZoFJK9d+qg8iG7dUl+KzSgNTMM53ZUn/0L1WtLNdrHFoi0Ol+IxVt
	 DJzF9NyiD9n7Owav7FTdVbMETSoYgFacAUtyKQZ+BVC4F4wj5LZSwuqNZx20cf/q/Y
	 tS+X3M9z3yBK9ON2kCT2rOXoCe8u9rKcbWfzGVUHyVCPyyC+uxDoAZQ3OuQLk6iS2e
	 R1wuuY2lBoeddAPAbwkyzKZx0pqsbyb5hX7g5VgOue9MOGNtdK4xJow/pbkCU9Dr+f
	 FgWjT6SbIErnfdmBGRmhCFQiVli5PVGHO/27v8kLw4CrKIi1GfjFZmgSrG62nMlSYp
	 mgQsvucfG/rgg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FCFB3808200;
	Fri, 20 Feb 2026 14:40:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: btusb: Add Lite-On 04ca:3807 for MediaTek
 MT7921
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <177159841186.557111.6936785365893536625.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 14:40:11 +0000
References: <20260219193209.69937-1-dylan.eray6@gmail.com>
In-Reply-To: <20260219193209.69937-1-dylan.eray6@gmail.com>
To: Dylan Eray <dylan.eray6@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, pmenzel@molgen.mpg.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_064005_995824_A12B41BF 
X-CRM114-Status: UNSURE (   8.28  )
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

On Thu, 19 Feb 2026 20:32:09 +0100 you wrote:
> Add USB device ID (04ca:3807) for a Lite-On Wireless_Device containing
> a MediaTek MT7921 (MT7920) Bluetooth chipset found in Acer laptops.
> 
> Without this entry, btusb binds via the generic USB class-based wildcard
> match but never sets the BTUSB_MEDIATEK flag. This means btmtk never
> triggers firmware loading, and the driver sends a raw HCI Reset that
> the uninitialized chip cannot respond to, resulting in:
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: btusb: Add Lite-On 04ca:3807 for MediaTek MT7921
    https://git.kernel.org/bluetooth/bluetooth-next/c/79e029818394

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



