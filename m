Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E02CDB482
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 23:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydRKyl5FFFmauA2OlTfYIzE2VPoDtPJMJ+t0iRvMPR8=; b=s0dQfrBv1SPbu0f5wjpLGld4DJ
	C6OGZjSm6Mhx4bnh5neA5O6EmyZEZf610/DQpmroiiB77Mg9M73XjdB0CHGK1mHI3DF6sJHrDgaAg
	gQHjUgEq6SQX15YROlaNchW2dSQ6AhZ1LuYC1/gB10ef5SYJ6yzLa7JsMZxBoZ6PiIW38Doq0mtqP
	B6c0Pi/KZZnGNsPBraPZKi6lNp6o1/6d4+dIKzNBirILlzLIQlpfWburwn9/rv8b8Gh1AxtwFPRjV
	8Ounr9gcMrID6QSQlHLyHq/H4xJ3ZnizUUXOHcMw6bmgXcAvZBXvL3AeVj7AmKcoN3WYVliLgO3ky
	M0wTt7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qstWZ-00DQ8m-2W;
	Tue, 17 Oct 2023 23:30:55 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qstWW-00DQ8B-35;
	Tue, 17 Oct 2023 23:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 777DACE225F;
	Tue, 17 Oct 2023 23:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D54B5C433C7;
	Tue, 17 Oct 2023 23:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697585425;
	bh=F19AIuWps+oFrYH8x6B7coL3wkdUt+k3yWrH9Gy2Mkg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=t9OSlMXAflk4PpJblN8Uo2R2260sS8qQzSn6UefWFZ2DWS5M4x/rz7kPoyQ03KYco
	 uGZCJKIayPfOQrJqEv2rHaKg2MOXR9HYXAHrCZOJGHG6RKVPdSq00OMHuYeUwMw9qU
	 N0eYCSZRidNJTLHfGqLAADNJtXvKYj1u9mNAVQKXEcfmT/+CR3QKyQFQ3HZ8rFYUUg
	 iiJZAAj+89S+tfGoS2dHg7vWEliFIX3uGPlKsk3J6s4lcd1IyrzGtQmUNuIscV/9dW
	 ZZMmN3+fUTOAi8c16TfQvle2Ia2ikszhAlWAwbTUBhAtoBiFPARcpkIPJN7joR6AbS
	 X+kE4CujJYfHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B8D98E4E9DD;
	Tue, 17 Oct 2023 23:30:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [kernel PATCH v3] Bluetooth: btmtksdio: enable bluetooth wakeup in
 system suspend
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <169758542575.4587.5326115164218555952.git-patchwork-notify@kernel.org>
Date: Tue, 17 Oct 2023 23:30:25 +0000
References: <20231013124707.kernel.v3.1.I6dbfc1fedddf0633b55ce7e7a10ef7f3929a9bdc@changeid>
In-Reply-To: <20231013124707.kernel.v3.1.I6dbfc1fedddf0633b55ce7e7a10ef7f3929a9bdc@changeid>
To: Zhengping Jiang <jiangzp@google.com>
Cc: linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
 luiz.dentz@gmail.com, chromeos-bluetooth-upstreaming@chromium.org,
 angelogioacchino.delregno@collabora.com, johan.hedberg@gmail.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_163053_192394_263B997B 
X-CRM114-Status: UNSURE (   8.15  )
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

On Fri, 13 Oct 2023 12:47:07 -0700 you wrote:
> The BTMTKSDIO_BT_WAKE_ENABLED flag is set for bluetooth interrupt
> during system suspend and increases wakeup count for bluetooth event.
> 
> Signed-off-by: Zhengping Jiang <jiangzp@google.com>
> ---
> 
> Changes in v3:
> - Replace deprecated macro.
> 
> [...]

Here is the summary with links:
  - [kernel,v3] Bluetooth: btmtksdio: enable bluetooth wakeup in system suspend
    https://git.kernel.org/bluetooth/bluetooth-next/c/2fddfadb0478

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



