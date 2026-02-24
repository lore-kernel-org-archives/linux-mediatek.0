Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B29FF4BB89
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Feb 2026 20:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=022wprulhDW7PoDVmwG/syyzttAeWCZka9SmjdVHSlo=; b=HjAMthBK2OUkYXIicmVRb6pQty
	dfmlS8ncNz/qYum1q/qguEE8pBsbm0XsI2Aa3uEBfVeJNZiVNNu4ZavErp7Vmac5hn/D5y23Y6VIV
	AqGCNmIr97QqOn/+RGtYnXj/WHLdSZirh0sRDsOzFyzDKK1ecZU7SGbz5vP5FM4GzRpC8bKNR5A8G
	rPSh4WUIJrvllC2BYXv3M5qG81GFa4CPLQQElTc1n8j9y9BVYHaQ6sYX0uhnP4rSQaXurXsrhPHke
	TUSZZr7yySH4qpi58iMb8lGQ1gMQ8U/QvPFTbU9gxh31g/I1tfkJIzNWjSrMVVwPLLpX2GCBJGTwU
	rbufuvwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuz2i-00000002lGd-0QQM;
	Tue, 24 Feb 2026 20:30:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuz2h-00000002lGX-1oNT
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Feb 2026 20:30:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C495600AE;
	Tue, 24 Feb 2026 20:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367DCC19422;
	Tue, 24 Feb 2026 20:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771965002;
	bh=FWVYnHrFiSYu00+TBU/59piex8zCA4H56AvpNx3WHdg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CEUt6gcvAPFUlr+xHssLhKRVQe38OL2rOMJGDwF+c74dWcPnwx9hCYikAT3RoVf1E
	 T6UD3EHBj4zLQczqd4Slp5X/zDA7pb536IQ4b9Veq1SvQj+4NCjYENJwZnw/6ArEzg
	 XDP0TMO8rArYELaqhOxT1KyARjMmOgs5k45oYZRWaA2hTe0ptwr6Fu9bDzFP5whgws
	 3Cjk6vGtjjOkIxbRYrHXSqaPxOJv9FPYwB+CCYqOQH1Id0dEc4dAY7BjjqEbY/aw+b
	 cROVkBoejhAzIcjfOMF3/RghVY2DIX4EsUSsEbIio3uRQAgJfVxckVuU3LFljIMLCQ
	 K0oKsFdJ/eBAw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02CDE3808200;
	Tue, 24 Feb 2026 20:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/8] mmc: sdio: add MediaTek MT7902 SDIO device ID
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <177196500778.4139022.732715685642852259.git-patchwork-notify@kernel.org>
Date: Tue, 24 Feb 2026 20:30:07 +0000
References: <20260224061325.20189-1-sean.wang@kernel.org>
In-Reply-To: <20260224061325.20189-1-sean.wang@kernel.org>
To: Sean Wang <sean.wang@kernel.org>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, ulf.hansson@linaro.org,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-mmc@vger.kernel.org, sean.wang@mediatek.com
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

On Tue, 24 Feb 2026 00:13:18 -0600 you wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add SDIO device ID (0x790a) for MediaTek MT7902 to sdio_ids.h.
> 
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> 
> [...]

Here is the summary with links:
  - [v2,1/8] mmc: sdio: add MediaTek MT7902 SDIO device ID
    https://git.kernel.org/bluetooth/bluetooth-next/c/30c211ed0440
  - [v2,2/8] Bluetooth: btmtk: add MT7902 MCU support
    https://git.kernel.org/bluetooth/bluetooth-next/c/ad7c85c44e42
  - [v2,3/8] Bluetooth: btusb: Add new VID/PID 13d3/3579 for MT7902
    https://git.kernel.org/bluetooth/bluetooth-next/c/39b32232e047
  - [v2,4/8] Bluetooth: btusb: Add new VID/PID 13d3/3580 for MT7902
    https://git.kernel.org/bluetooth/bluetooth-next/c/cde58a6f8d84
  - [v2,5/8] Bluetooth: btusb: Add new VID/PID 13d3/3594 for MT7902
    https://git.kernel.org/bluetooth/bluetooth-next/c/71fa9af03199
  - [v2,6/8] Bluetooth: btusb: Add new VID/PID 13d3/3596 for MT7902
    https://git.kernel.org/bluetooth/bluetooth-next/c/2dbd6783e368
  - [v2,7/8] Bluetooth: btusb: Add new VID/PID 0e8d/1ede for MT7902
    https://git.kernel.org/bluetooth/bluetooth-next/c/df6be153d1bb
  - [v2,8/8] Bluetooth: btmtk: add MT7902 SDIO support
    https://git.kernel.org/bluetooth/bluetooth-next/c/287f90321f25

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



