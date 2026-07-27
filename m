Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AD1C531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 20:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bek5K8MpSEcPq0n8AmlhIm0UXmOy9Y9eeNOvMKm/NIA=; b=in0bS9ChjML781GGi5eEbLA6h5
	i4Y3sLDfkGpJr1rueqwEQKa/bjxEy1YuWIrhBP4ta7AktUxeCaYw4deTOG+NcmkqoahBF7dmMmg29
	Ndlm5u77gzIOJzrgbXX5qFx4zYgu3O7kF8s2qJMiGleTYY4e02zh/GleQvWp28ot7ctSeB5PKwdLU
	4W7kwTisDiTcAw/OM2J9TU9xS2Wwfd6OjgNnyZriA1xmLvHY6K1CvA+QmrTsFD21KIUKLNaq22G+w
	kgLvinydnAv8LDndRKiQ8WZofpYltfBH6ia6rdE2tL8BfnTdDwOtebw5RcPlm0odCdvCOBzpZJToB
	dZq7Mopg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woSHc-00000003tt0-2tKV;
	Mon, 27 Jul 2026 20:50:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woSHb-00000003tsm-0zcU;
	Mon, 27 Jul 2026 20:50:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A7FCA42D7E;
	Mon, 27 Jul 2026 20:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A76D1F000E9;
	Mon, 27 Jul 2026 20:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185442;
	bh=Bek5K8MpSEcPq0n8AmlhIm0UXmOy9Y9eeNOvMKm/NIA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ShaxVeCIX/P0dn6AI9xK7iIKca/wqChDH+NUl4TooKyBYyhFAmyHGDVMZ0DIWSNOi
	 yZLbnn97y/OhzuLOtuKTnRSBwT7VYrfGRydZqEo/CM2t/0w2JlB9OZ7x3mJZWZHH5r
	 q9sMBLRsRL+p6JbMDcnbRbFLOK2ROd9OWoJMpRKvY2vL2FrW+6SAfkKbez9GTPhB/b
	 Vi7GYoaQmMR2xzWgGQXrhfeqg2hXP0jS1NwBfJvwwt+muYJHXRrTByagPL56Gw2Zfk
	 ZLIwol5O9RqrXvP/pMnN5aks/sqi3G52UaLPzhOEmEYveikpjHpLsz6ndYeMD2cfX4
	 c6qWmQsFXQn2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19866380664D;
	Mon, 27 Jul 2026 20:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] Bluetooth: fix short read errors in usb_control_msg()
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178518540763.1412337.1240855663216361705.git-patchwork-notify@kernel.org>
Date: Mon, 27 Jul 2026 20:50:07 +0000
References: <20260727-bt-ctrl-v1-0-2e8650e9df01@linuxfoundation.org>
In-Reply-To: <20260727-bt-ctrl-v1-0-2e8650e9df01@linuxfoundation.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, stable@kernel.org
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

On Mon, 27 Jul 2026 17:57:31 +0200 you wrote:
> There are two drivers in the bluetooth stack that suffer from possible
> "short reads" when sending USB control messages.  Fix that error up in
> them which allows the error handling to become even simpler.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Greg Kroah-Hartman (3):
>       Bluetooth: btmtk: Fix short read errors in btmtk_usb_uhw_reg_read()
>       Bluetooth: btmtk: Fix short read errors in btmtk_usb_reg_read()
>       Bluetooth: btusb: Fix short read errors in btusb_qca_send_vendor_req()
> 
> [...]

Here is the summary with links:
  - [1/3] Bluetooth: btmtk: Fix short read errors in btmtk_usb_uhw_reg_read()
    https://git.kernel.org/bluetooth/bluetooth-next/c/3501d7754c85
  - [2/3] Bluetooth: btmtk: Fix short read errors in btmtk_usb_reg_read()
    https://git.kernel.org/bluetooth/bluetooth-next/c/abcb881d99ad
  - [3/3] Bluetooth: btusb: Fix short read errors in btusb_qca_send_vendor_req()
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



