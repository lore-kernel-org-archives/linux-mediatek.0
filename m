Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEECC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 May 2024 14:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMiy+5sKeS+5h/5rn07Wr6ekTEUDqPQI5yyE1jNCBnc=; b=dCujt39D7V70PgMhm0rGm3hGcC
	YijJsBmvejAXrmdsD8t0f/Fa/bUhIRZV5vEvoDsPQgu+cR/wIGmHTEkImR/rob5HKvsx7OsG6P5UQ
	odQdGmbNJYe8hLFCAZ6jUPjecCKPL6jVqkl6KfD5UJTbVXWppGooZ1+h+yZ9wrsX9ACOpPXof0/aY
	gawIOmBZeUxvjUmaD5WyOOu6e4w/xjaDkzjl9PiC8dBp2TS70ncc8gQKaZibRxTP72A73/CFaNgoF
	j4G7eSHAiqAFCHqO2QA5rMOSqt/d5QPREkEYuJTD768Vbo7L5/TCNv8sQmkrBIYT/SRK9BferavWr
	A32X6o/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Xlh-0000000Czi2-1UGI;
	Thu, 02 May 2024 14:50:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Xlc-0000000CzgJ-3mmY;
	Thu, 02 May 2024 14:50:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 827CACE1730;
	Thu,  2 May 2024 14:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21E65C4AF14;
	Thu,  2 May 2024 14:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714661433;
	bh=VLCdT8S8RHn0J5m1d4S8joxMLvrBRQKRrINYgfmKubA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VwDde+BRMnQvir5Tx8KN74Mo3z9lrZG+Q1cUDRAAdnxbR9bpwHEHWfP9YKhwnVE7e
	 qKgp1hAwOKtleGVsUjiLAhIXRg6xSdXINvfnc7IVqYKEmhnLOVY5Ky8IG2buan2y7A
	 chBN/rm527LAuKkPsNMJCP/lHEm0ZnMbvQI1Zn4ChPPv+86gmeDL7OWPvfzUR8g7Lm
	 3Ja4oyTe6k4qndhm6ys0a8sQekapqPS+l/Wz5q9XqRFWa470pUrcotMN1xMidcG3SE
	 KHpYlVuRcyI1AtjxZOErGrofdGv5HnbJfgM5JaC7AL4+uoiLKuXhG6khUBr7VNpsHX
	 TC2k7QWM2yvNw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0916CC4333B;
	Thu,  2 May 2024 14:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/2] bluetooth: mt7921s: Add binding and fixup existing dts
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <171466143303.15417.16267391359658685037.git-patchwork-notify@kernel.org>
Date: Thu, 02 May 2024 14:50:33 +0000
References: <20240412073046.1192744-1-wenst@chromium.org>
In-Reply-To: <20240412073046.1192744-1-wenst@chromium.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 sean.wang@mediatek.com, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_075037_144811_74B42F6E 
X-CRM114-Status: GOOD (  10.84  )
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

On Fri, 12 Apr 2024 15:30:41 +0800 you wrote:
> Hi everyone,
> 
> This is v3 of my MT7921S Bluetooth binding series.
> 
> Changes since v2:
> - Expand description and commit message to clearly state that WiFi and
>   Bluetooth are separate SDIO functions, and that each function should
>   be a separate device node, as specified by the MMC binding.
> - Change 'additionalProperties' to 'unevaluatedProperties'
> - Add missing separating new line
> - s/ot/to/
> 
> [...]

Here is the summary with links:
  - [v3,1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S SDIO Bluetooth
    https://git.kernel.org/bluetooth/bluetooth-next/c/556511c33388
  - [v3,2/2] arm64: dts: mediatek: mt8183-pico6: Fix bluetooth node
    https://git.kernel.org/bluetooth/bluetooth-next/c/f90ac18d01cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



