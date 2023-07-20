Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9BBEB64DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 01:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jb64syu8Us3wU0rAgN0OC3UoGb2ysNxwkjvP215WM0=; b=jxiw8py0ZbV5E1AdqGI1f9hKy0
	xJr9s4o37q7V7lL7lILB/9mPmPwMT0T8ev5P6NoM9/MGan4DRFxa4OiVyHdu9d1Yx0A4xe+g/sqNt
	9cLpJn5uxfVr5CNmk/EqffKMi22yaS2DF9sk5bbEGOOulkMoCQDBRODlF8aGq2+3iimjaWikbIHBn
	4Ioz/NtW6DGevFlxZ4C6zgOzzz3lcidDmlOlfjoaMH1WENIHipfKZ7ObykHfhUS/hVx10tr2Kd28O
	bQ3oIbegc5aBiISAZetY3EweVx3dvIeuwVHIHod0ElitrUAZGNPGGl6OaHLQLbfxAeagGH97Rw5Zp
	AmNn/gLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMfMa-00CZc7-2q;
	Fri, 21 Jul 2023 01:55:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMfMY-00CZa8-2v;
	Fri, 21 Jul 2023 01:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5jb64syu8Us3wU0rAgN0OC3UoGb2ysNxwkjvP215WM0=; b=LC8PvxAYG+KcskWThg1JfsRaPx
	UtS9Us+6LrCwltm5HwcAnAdV85CFr5O6wK92PodmOu+sokynr6Kk17Rj2m+GgLx/Ph8roI8EzzYU6
	q5Tp8ndxRuR4P/uBIHGW8T5DS29/YhCa63uQFH+VaO/WLnb7CsWMbi5xN/+PuqGM5fGbhgkm7dshB
	JnOyoIwf5Evc8S9G2YqGf++Rv/swFldR2uDicP3ocpgA4+nqYD2ocIR2EgKG+d3r8KeeXhwXuuoGl
	FXYVdpwn1VK06f1D/KyI10QONaXD9ZYjeUszEmJ/YvACJRpA93BfS3CEatKXrQuO9oNLvo1tOEQLi
	7aJxGlEA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMdQh-00Fy2n-2d;
	Thu, 20 Jul 2023 23:51:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0259661CC8;
	Thu, 20 Jul 2023 23:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FB79C433C8;
	Thu, 20 Jul 2023 23:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689897021;
	bh=feJewLUTFiUeftAknY22nUa7pWdY5sIWSFqpthJJNOs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tXBDZOgsmTJnhGz7BNLECINsPd6ybEu+oBNJSilrewRog3SQz9ZhoqJNRumFvO4/n
	 VSUvaCzLsE5VtAri9r/PYG8eni8lspd28m2qrse6zvuwLwG1ca1zB7ZO4+i4RY+8N1
	 fuyg3ODxaGveVsJTfgwXlZOG5Qjm875XmS34ksuLnsuTwdcKyotEF+G/+wK0PoBXw4
	 PRSuYZTbu/W5ZE7qdLvCUN3HqdMMfPaV4fmkrlX9t/Qea3XbNOhxYls0a4Qw/L1fBA
	 WdoJJOUixdLOUu76cur/wiw+GU3f6EjTo45m2ecPEookHgzSM758bOGPCt9pdWKaYg
	 /8NhzLAUWTxLQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 41E98C595C3;
	Thu, 20 Jul 2023 23:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bluetooth: Explicitly include correct DT includes
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <168989702126.8881.8720051222737802178.git-patchwork-notify@kernel.org>
Date: Thu, 20 Jul 2023 23:50:21 +0000
References: <20230714174057.4041063-1-robh@kernel.org>
In-Reply-To: <20230714174057.4041063-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: sean.wang@mediatek.com, marcel@holtmann.org, johan.hedberg@gmail.com,
 luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_005133_542826_E2A088A0 
X-CRM114-Status: GOOD (  10.22  )
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

On Fri, 14 Jul 2023 11:40:57 -0600 you wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Here is the summary with links:
  - bluetooth: Explicitly include correct DT includes
    https://git.kernel.org/bluetooth/bluetooth-next/c/f0eecb651f96

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



