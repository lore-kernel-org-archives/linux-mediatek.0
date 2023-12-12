Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6B6C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 16:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAHoUIvmXpFdAuxEC97AyKTda/E27uuTn6Q0M5epw4I=; b=4krw1HZmT/XP0YXcWE/6lKiCgC
	XfQwUzvyqcUOKEgoOo3H6Zdh4GoOEXpdz3vMaVB1pX0oYZGe7w3AiGAUviYDXWvlinl491K9dp0ES
	PdgQn04/bfSPjkznkTvw1UuIrl81BihM6ynfVpq4vAMBCDR0Wl9Xd7FspxsNkBgoEKIbJlbfhBXq7
	aLH1a+nxclm9m3p3jV5Vm31plRU7Ta3EUI5KlH6W4i4VoftUNaiuekGzORhpLvi+val8VSBViJ8oO
	PqX7z1FAuMN4uRoabC2DYJKcCe8NE5KTJZHDf461OTMVB2BaSqNqBal9zF63Q3ppI0rbDBYiH3YyF
	Xvo+PRIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD5Up-00CBxz-10;
	Tue, 12 Dec 2023 16:20:35 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD5Ul-00CBx1-2K;
	Tue, 12 Dec 2023 16:20:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 52D65B81741;
	Tue, 12 Dec 2023 16:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5A0CC433C9;
	Tue, 12 Dec 2023 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702398025;
	bh=Gv+mO4PMFcKCSTAW/D0ZVcdMq7d8CoX5pEYybTDqgPE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YjaaCOW1fCwRdEEdOl0SVCkPGKPdXzosMlrVNXS6mJLoyFN7V8yCuOK439aihW5q6
	 Kd6VYSryGu9NKDwCQnMfqYwoQf4p/7bNzD3Hz6hXU2gl11HjGQv2cK4d8G4OxZHRod
	 gXnsuz4AqrB2OZifQjmhpubDMJTMXq13qwSdvTg7/VYIn36+oyCfTxs901uWn8HspY
	 ZE418llpCZrBmPmoW+bshBpKQO2w9vyom5wryOMov93dVogs5eQEUkHDz5JWP7EzG/
	 NYxMBTUKsZ6MAf5nEtNXIJ/UwfSLuho6vg71bqbYQNPoEbW7tuFUyU3cbDTRIo0wK/
	 dug9xTU6yfq5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8D7EBC4314C;
	Tue, 12 Dec 2023 16:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/3] Bluetooth: fix recv_buf() return value
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <170239802557.22444.1717551799062581956.git-patchwork-notify@kernel.org>
Date: Tue, 12 Dec 2023 16:20:25 +0000
References: <20231211164020.173253-1-francesco@dolcini.it>
In-Reply-To: <20231211164020.173253-1-francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: sean.wang@mediatek.com, marcel@holtmann.org, johan.hedberg@gmail.com,
 luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, amitkumar.karwar@nxp.com,
 neeraj.sanjaykale@nxp.com, francesco.dolcini@toradex.com,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jirislaby@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_082031_917797_93A410C0 
X-CRM114-Status: UNSURE (   9.43  )
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

On Mon, 11 Dec 2023 17:40:17 +0100 you wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Serdev recv_buf() callback is supposed to return the amount of bytes consumed, therefore an int in between 0 and count.
> 
> Do not return negative number in case of issue, just print an error and return count. This fixes a WARN in ttyport_receive_buf().
> 
> In addition to that a small cleanup patch is added on btnxpuart to remove a useless assignment.
> 
> [...]

Here is the summary with links:
  - [v2,1/3] Bluetooth: btnxpuart: fix recv_buf() return value
    https://git.kernel.org/bluetooth/bluetooth-next/c/7954bbcdd7ea
  - [v2,2/3] Bluetooth: btmtkuart: fix recv_buf() return value
    https://git.kernel.org/bluetooth/bluetooth-next/c/687d2de93b11
  - [v2,3/3] Bluetooth: btnxpuart: remove useless assignment
    https://git.kernel.org/bluetooth/bluetooth-next/c/99f188d71731

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



