Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D82E77188
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 16:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Izo9IaxS63oXVftDFjJO/KO57D6Ym3M3lXzymnP7LVw=; b=XzIVp47BuZrwGhKJ1Hniw8Jzl9
	mCrMdtaSEDaY5L126R0A3WtiPVBXjzW9T6msKZ2s7xF0009Ys1pN0xWS1I/A4yVjnuu16JkMsJzNH
	MhxaCMGjY0Q0JnFe6Pkh7xwtR18RqGRT7kHeK5lml4wmyn6FRijBqJ9D3POxWEi0jRXeH4RUKBNem
	pbmUju1FzcAKQMITLzRacr0IKIXdbvJkOyV74XJ2ci3Tva4vxT5HEhu63f7hMSTpWcUgPc7DGz2Gj
	UfljNG7bG68uwo8NI2VrTnK4u3A7f9lR78cyFRgXMtd1AQN855wnClIrc5IANWkOnFb7uuRuMyV2I
	pO80DCvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYdk-0000000972m-1M2x;
	Wed, 08 Jan 2025 16:10:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYdL-000000096tz-3gVj
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jan 2025 16:10:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E59D0A41986;
	Wed,  8 Jan 2025 16:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A488C4CEDD;
	Wed,  8 Jan 2025 16:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736352614;
	bh=OrjXXnFq4nOyoITQ6bQZlHljOuIuZnV/qxm0Jq1QCfo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TeQNw/Ve/1Gx5AcZlqV25iRx63yy6dsOljR93pULxVn3LS41WpXDez3AKhwpyx8x/
	 98TU9m3VjpkazFVbeijlooEII/ADjBHnghRoFXzvD7mWFYNPf93rCH5J5zPS2StMLK
	 0xHvQV882RL2DG0JL5bemyQUyCc8J14ZZPkuIPxwXCqGZwnGX4c/DEG/o6jpEG4psE
	 cHHsT4XAyVD5okR2zeH9AKMvYeAQ4GIt4SRcZMkb92x+MMolNUTBQf6bSgt1BDgwc2
	 7HFTpOUiWNjDGcxGIB9u/2e+nqojb2mqSEjAvDc8VSuCYhQjm/OXVRA2a2q/kT9d3u
	 8+x6DH1BWkMYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF6D380A965;
	Wed,  8 Jan 2025 16:10:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btusb: Add new VID/PID 13d3/3610 for MT7922
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <173635263574.697160.13448726939811072198.git-patchwork-notify@kernel.org>
Date: Wed, 08 Jan 2025 16:10:35 +0000
References: <20241224-tx55e-bluetooth-v1-1-e83ebc81507a@gmail.com>
In-Reply-To: <20241224-tx55e-bluetooth-v1-1-e83ebc81507a@gmail.com>
To: Andrew Halaney <ajhalaney@gmail.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_081015_986543_2F5E74D2 
X-CRM114-Status: GOOD (  11.15  )
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

On Tue, 24 Dec 2024 14:42:11 -0600 you wrote:
> A new machine has a Archer AX3000 / TX55e in it,
> and out the box reported issues resetting hci0. It looks like
> this is a MT7922 from the lspci output, so treat it as a MediaTek
> device and use the proper callbacks. With that in place an xbox
> controller can be used without issue as seen below:
> 
>     [    7.047388] Bluetooth: hci0: HW/SW Version: 0x008a008a, Build Time: 20241106163512
>     [    9.583883] Bluetooth: hci0: Device setup in 2582842 usecs
>     [    9.583895] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is advertised, but not supported.
>     [    9.644780] Bluetooth: hci0: AOSP extensions version v1.00
>     [    9.644784] Bluetooth: hci0: AOSP quality report is supported
>     [  876.379876] input: Xbox Wireless Controller as /devices/virtual/misc/uhid/0005:045E:0B13.0006/input/input27
>     [  876.380215] hid-generic 0005:045E:0B13.0006: input,hidraw3: BLUETOOTH HID v5.15 Gamepad [Xbox Wireless Controller] on c0:bf:be:27:de:f7
>     [  876.429368] input: Xbox Wireless Controller as /devices/virtual/misc/uhid/0005:045E:0B13.0006/input/input28
>     [  876.429423] microsoft 0005:045E:0B13.0006: input,hidraw3: BLUETOOTH HID v5.15 Gamepad [Xbox Wireless Controller] on c0:bf:be:27:de:f7
> 
> [...]

Here is the summary with links:
  - Bluetooth: btusb: Add new VID/PID 13d3/3610 for MT7922
    https://git.kernel.org/bluetooth/bluetooth-next/c/0ea7223c40b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



