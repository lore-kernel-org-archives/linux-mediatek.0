Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8009C25B77
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 19:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNYn/xwQupG/60gIP6cmO64mjb0M2Dpl91wRfP6ktEc=; b=PuhX2nyVoSkW6VBo5gYlXLTx7w
	gKaYf/fYhHm3pLHF8QxJUhHQhLW1AQlmj9a972HvhijBnnkSTVrNuu049xblQUC+9FMtF2/Og2b7y
	+ZJ9xzg7W8xu1vr3jabVRK9xgZZC3+UQIT9HGkdaC5GuKzNvXaWboIAVZ8oCbhxDKph0+t/YMqqFm
	dAD+z1y7GJpOMQvVn7AhiLaYsoeFFrojx9INjKhj6wK+0KaVzPTg7ap02xb/4qjE8ch11WwgYP7JY
	9Vi0RXSjKQhV+EIonZHY8qVHBE2IEh+5IbuZ9LtceRueVVGPym8Fo05TMYAftgH5CKqq+ywfRHTjW
	/0Jn01gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s98sG-0000000FO4p-2w7Q;
	Mon, 20 May 2024 19:40:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s98sA-0000000FO2Z-12xY
	for linux-mediatek@lists.infradead.org;
	Mon, 20 May 2024 19:40:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C48A161E5B;
	Mon, 20 May 2024 19:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6872BC32789;
	Mon, 20 May 2024 19:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716234032;
	bh=KKvmUiNEkdDNOF+4LIuWQvPdLdakaCHzGqUIUcvsXaM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tOg8RPralfb5JUgiBhuOkvD4qy/awCGhqgdY6MgIl11YzgpkuA9WdJeVmkHfdWRTU
	 2UNInfTbEn7dUochGzuClWoz2e9EkfPTNzInitxgDHWT36v6jn2QPkRFZp6wxLUvix
	 uLG5SwvhtlyU678Wvx4FF8w3gS0HBYD+hc8u84rF4HBDSCrj8HbrXYHqHrjk29dEEH
	 eVDxf/hUE7XSWsHSAkDpIzf60lE0nAM7224xuHZBWhYEjRBOJSLR2qkjKN4yypKHWW
	 sOkGBv/bfxnoMBOVyCgCx8tPnJ306dHPmPpjmKfJjY0JBEv/V0HdjA2z8T2vqvD/XN
	 L3vPd8ifwFQgg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 58154C54BB0;
	Mon, 20 May 2024 19:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 1/5] Bluetooth: btmtk: add the function to get the fw name
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <171623403235.10216.9445226154249031065.git-patchwork-notify@kernel.org>
Date: Mon, 20 May 2024 19:40:32 +0000
References: <ce0337178bf617d52ff320a36837d75bf537df2d.1715813148.git.sean.wang@kernel.org>
In-Reply-To: <ce0337178bf617d52ff320a36837d75bf537df2d.1715813148.git.sean.wang@kernel.org>
To: Sean Wang <sean.wang@kernel.org>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, sean.wang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_124038_551167_B1C9885F 
X-CRM114-Status: UNSURE (   8.09  )
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

On Wed, 15 May 2024 16:15:17 -0700 you wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Include a shared function to get the firmware name, to prevent repeating
> code for similar chipsets.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> 
> [...]

Here is the summary with links:
  - [v5,1/5] Bluetooth: btmtk: add the function to get the fw name
    https://git.kernel.org/bluetooth/bluetooth-next/c/1a9f00aa23b8
  - [v5,2/5] Bluetooth: btmtk: apply the common btmtk_fw_get_filename
    https://git.kernel.org/bluetooth/bluetooth-next/c/8a5b9ee69fe6
  - [v5,3/5] Bluetooth: btusb: mediatek: refactor the function btusb_mtk_reset
    https://git.kernel.org/bluetooth/bluetooth-next/c/9d5a3b40987d
  - [v5,4/5] Bluetooth: btusb: mediatek: reset the controller before downloading the fw
    https://git.kernel.org/bluetooth/bluetooth-next/c/8f9fa6c70d35
  - [v5,5/5] Bluetooth: btusb: mediatek: add MT7922 subsystem reset
    https://git.kernel.org/bluetooth/bluetooth-next/c/2a6bc5724952

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



