Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D75C3271E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jul 2024 21:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69o2SMD/wnGOefAx/VZx63p5/7au3TGhlc6jzkbelZk=; b=GLEzwlsFeNk/XqoYCWzPTj7cQr
	yX6ouaJBLHX08I18F6OYFJiWs/zAcKLDxHid6PffKQVy/vn9tfaOMJlrO1Pvbsh7XSSBT0uiI/26Q
	lNi/G2ueC33aZLZVQ5s6sgMGrMikgYTiionRy9JrwFQDjHFMcYl9MUDrXFVFYObP1GWJEhnGgxuo+
	JNvIMp1swp17HfMvUYE0n5a0uOgFv0AevlI+WI3bIYoFB6Q9SnnmnBKYhmUqVdIeSJaEpkSLaqSJy
	EqmqUzoePWN7lYdS9ZISCOsOEpnrDiFkafJls9N42P3Xv7Ox2Fx44jyE9onRTw3xp4k6K9/1IbG9r
	NvXSHtnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQvmp-000000053yh-3AJB;
	Mon, 08 Jul 2024 21:20:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQvmm-000000053yB-1Dta
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jul 2024 21:20:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 34770CE0F6D;
	Mon,  8 Jul 2024 21:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FC7AC3277B;
	Mon,  8 Jul 2024 21:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720473633;
	bh=UWSUycG/PBa3IFkaEkQfdVNMaUwjTzQgOq0EeeYQahg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Tzf3OvlJ7VLaI7Cc6adcYuF1tiePYjXl4cOjQ04OvnQMp253PGnyf7Bwb6vRtvFEW
	 Fn57tGkPCruoBjaHyBpKpvww5/isXUak0mbOrx24QvxkssRgHcWIm3SmnT9pNlSvax
	 1sEhKlCwCwgBod7ztWUmPvxEuvdtoGCjrh94WRDjx//T+qPxBYH0Cwsj3hZ0rkJz+S
	 2AAkTVyJvaA+KUavhg81LB+b5xf1dsE38s7UBYlS8Z2/XSKLklhSEeP5c+ksq2CAVY
	 xzM3Rz4me6mGtnDvSJ5080Z8flYjK+hEWhGgcfcTTBBciXcAIo9GixDzdh+sDSUu4u
	 +QGHsMp9iik7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 722C7DF3716;
	Mon,  8 Jul 2024 21:20:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 0/8] Bluetooth: btmtk: MediaTek ISO data transmission
 support
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <172047363346.9973.16198479983313620239.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 21:20:33 +0000
References: <20240704060116.16600-1-chris.lu@mediatek.com>
In-Reply-To: <20240704060116.16600-1-chris.lu@mediatek.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, aaron.hou@mediatek.com, steve.lee@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_142036_525306_8391FE93 
X-CRM114-Status: UNSURE (   8.53  )
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

On Thu, 4 Jul 2024 14:01:08 +0800 you wrote:
> Since SIG has not yet clearly defined the specification for ISO data
> transmission over USB, MediaTek has adopted a method of adding an
> additional interrupt endpoint for ISO data transmission. This approach
> differs from the current method used in the Bluetooth upstream driver,
> which utilizes existing bulk endpoints. The interrupt endpoint provides
> guaranteed bandwidth, sufficient maximum data length for ISO packets
> and error checking.
> 
> [...]

Here is the summary with links:
  - [v7,1/8] Bluetooth: btusb: mediatek: remove the unnecessary goto tag
    https://git.kernel.org/bluetooth/bluetooth-next/c/a06a1458192e
  - [v7,2/8] Bluetooth: btusb: mediatek: return error for failed reg access
    https://git.kernel.org/bluetooth/bluetooth-next/c/ac7daf0f197c
  - [v7,3/8] Bluetooth: btmtk: rename btmediatek_data
    https://git.kernel.org/bluetooth/bluetooth-next/c/dfad4030dcc4
  - [v7,4/8] Bluetooth: btusb: add callback function in btusb suspend/resume
    https://git.kernel.org/bluetooth/bluetooth-next/c/cacda8ed6753
  - [v7,5/8] Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to btmtk.c
    https://git.kernel.org/bluetooth/bluetooth-next/c/39a9e1c69e74
  - [v7,6/8] Bluetooth: btmtk: move btusb_mtk_[setup, shutdown] to btmtk.c
    https://git.kernel.org/bluetooth/bluetooth-next/c/314f1c00d267
  - [v7,7/8] Bluetooth: btmtk: move btusb_recv_acl_mtk to btmtk.c
    https://git.kernel.org/bluetooth/bluetooth-next/c/91d0ac304edf
  - [v7,8/8] Bluetooth: btusb: mediatek: add ISO data transmission functions
    https://git.kernel.org/bluetooth/bluetooth-next/c/7eac027d1b20

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



