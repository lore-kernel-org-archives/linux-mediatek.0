Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36ADC02183
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2025 17:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFnKA0x6AFKKdKjff0q+TwfpiOESRdzhw9jgQvsIAK4=; b=vfj/VLu/tgrp2f2e/Zm8PEjIUS
	fFuWNpyl1waeb0zjwJiIEwa8hE9ddI77sJ2F2zMw1fB1Dz/zds31LT4QBqD9pErg7OabdrTu0eyi8
	xH4naF5FLhdOLsNWHdm85oO6YIEkzMeI2IqxODTE7RDrAsV8znCzHcQQn6WqcviyuyzfrcDMXA1im
	1Xgj8T+I6rI4w3U4RvDYppbOuZQDsGwMLrOHhX45ob4O389Ks82kJlV2IWsg1ASO0ubE0Zxwwymit
	k9QX7PmAxF7nXdCPYBYrxpyR8fbG/ogiPOS6f8315E6jwFy+8zvTmS77FCYKQUBpgZz26JJBwp+2F
	DZdjRQHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkaU-00000009Alw-3o1H;
	Tue, 14 Jan 2025 17:20:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkaR-00000009AlF-2rxz
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jan 2025 17:20:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4AC7FA4198A;
	Tue, 14 Jan 2025 17:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41565C4CEE5;
	Tue, 14 Jan 2025 17:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736875218;
	bh=6MF0dlcJddwJ2j8LDnKkAPEmE1AocvfGYy4073HYR0g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dorQIg8H8KLDz3WrEN/YIAyfm0I4vUlZIBQgo+JjIbRIXdXmnvq0QAmq+BeadKx+x
	 DHtgdsVEVruk60i0ZUXuDXFJbRYYgH71Yh6Ie9BWFPJvALVy8qP1PoGO93XRi4gYKY
	 /xGS5b44rZf4SbJ0ehoH+Hk5rzqRmV8xrqq55XdfETZiasVcR71sTLvFoI/LMZCoGD
	 E5uwXxKu8TXqQP+hK2BWvAcqv8U7fEvb0KV29aXpSjjQeRzhl8ZtH9HI50+Mucwxez
	 r/lEVWAT8WcmysWIDPIxUaPny8/J5yi3JI3t+p97YGRrYSFpG9Q94ByltvDPaLoNKi
	 xZkw7BCdsRPpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FD6380AA5F;
	Tue, 14 Jan 2025 17:20:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btmtk: Remove resetting mt7921 before downloading
 the fw
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <173687524073.62266.12024494240760693746.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jan 2025 17:20:40 +0000
References: <20250110095548.12761-1-hao.qin@mediatek.com>
In-Reply-To: <20250110095548.12761-1-hao.qin@mediatek.com>
To: Hao Qin <hao.qin@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, deren.Wu@mediatek.com, aaron.hou@mediatek.com,
 chris.lu@mediatek.com, steve.lee@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_092019_792288_C8721E54 
X-CRM114-Status: UNSURE (   8.99  )
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

On Fri, 10 Jan 2025 17:55:48 +0800 you wrote:
> Remove resetting mt7921 before downloading the fw, as it may cause
> command timeout when performing the reset.
> 
> Signed-off-by: Hao Qin <hao.qin@mediatek.com>
> ---
>  drivers/bluetooth/btmtk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - Bluetooth: btmtk: Remove resetting mt7921 before downloading the fw
    https://git.kernel.org/bluetooth/bluetooth-next/c/c8d46ea46991

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



