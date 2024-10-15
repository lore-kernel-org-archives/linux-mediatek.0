Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DD3D1D88B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 16:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFhq8ByNznJoNP7FuiZ6gJqYKwbr35XdwHEJ2jOBcIw=; b=ljBHKBfba/pY7prUCz/Xm55fBq
	5SCNEQ9lwsZGeYoyfJX6Ewume9obFF9IwZyiM/YdPrGCfbCinYgHtrJJljIuUZBkQdmmzTfpIquqz
	UAREf5mWPHcI4uL1rvpK6bqqEulOhfYupz+hy2SKpEsdv7shSjStEx+pxiEy0psGTsEcmzNcV3wfY
	WBnR3VfAEhIJ4VX24nw7be4irAvhdTpGtfxFvoWK/7MgHxoHOPRsu/W3YOnu/HtifG+eeAQudoMhJ
	VbRPoLf8ljpzMWNJR1RFTYdiHNk3hjJKRY61v7ZjMXYRVIHH3e3/lR7liT969eQjwOUK/+XG/b2Cd
	SciMBFYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0kRE-00000008sKx-42Eg;
	Tue, 15 Oct 2024 16:30:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0kRC-00000008sJZ-3Hh5
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 16:30:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F77C5C5924;
	Tue, 15 Oct 2024 16:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51960C4CEC6;
	Tue, 15 Oct 2024 16:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729009821;
	bh=FgON5Om3rKaoN4TKocO7hZ9b9nRLVEFWYhnuAVb718g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iFpiTghjGy4t9vuOsBP9O+zK57td+5/sAUiC03kVcK4T/wG6pARklbyrQe5U3FXDY
	 fdhZdGBZUTh7+8gcBbCKvC45m9HMjBVR412OEgqvy2ndraMlyEF4+x3Cn4TONdFKiI
	 j6PIZ9ef4AmZU7zw/4nQGJUV5tyE0SLcHTg/A+7CNUh2fX4ywXsZpbmRK0FU3Exe3U
	 SoWn/wIsjLhryGMoRhNpVOnroVXDttfk62hRbvu1I74bIvFpQV8vwTK1WsKSY5dfvH
	 UCW3YF/Mi+Bw3YfaD3bnhxBJMWc2suftkaCqZfH08XHOfh0+GpuFJ8hg6opUvosslF
	 lU23TDG2hmC4Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE183809A8A;
	Tue, 15 Oct 2024 16:30:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND] Bluetooth: btmtksdio: Lookup device node only as
 fallback
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <172900982650.1218646.12147169588333175190.git-patchwork-notify@kernel.org>
Date: Tue, 15 Oct 2024 16:30:26 +0000
References: <20241008082721.4004100-1-wenst@chromium.org>
In-Reply-To: <20241008082721.4004100-1-wenst@chromium.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, sean.wang@kernel.org,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_093022_945391_D9BFDE23 
X-CRM114-Status: UNSURE (   9.76  )
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

On Tue,  8 Oct 2024 16:27:20 +0800 you wrote:
> If the device tree is properly written, the SDIO function device node
> should be correctly defined, and the mmc core in Linux should correctly
> tie it to the device being probed.
> 
> Only fall back to searching for the device node by compatible if the
> original device node tied to the device is incorrect, as seen in older
> device trees.
> 
> [...]

Here is the summary with links:
  - [RESEND] Bluetooth: btmtksdio: Lookup device node only as fallback
    https://git.kernel.org/bluetooth/bluetooth-next/c/cbb516bbcdfd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



