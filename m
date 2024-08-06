Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30E0C52D6F
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Aug 2024 20:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAayS2LzlPl1w21HSU4UVAO4yzNnSSWguqeGtb88ugw=; b=S1SFMwjow2HwJmn/cO2mGjCEcp
	2NmfpsxYHIZlLzbbnDA6pIH0UKOvTHXO1EiFMudZMcdMVugc3VDS1TkEnz2DMMyVjthqxUPbicLy3
	Yo9Z5S+w7b7mIE2Qz/4Lq+FXCU4U3gBt50azNoxEd2XE5EszuRJ9DujbBPxHrJkxLQ3x5LISo0Rym
	7m4AbfETwFVP6rM9rGkBbqbX19KAMhXdbjviruoyFYmeqJHn0I+qGQG1hP9OB/ouEmXg3H6GvoKeF
	S3YRPRGD6NSmH4JII9xcOQwE6eHie4J2gHszzlK0zJUHSp8BMSUkF92VvoSrMjJ2AdLVp5cGQ5gzS
	1pqlqhQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbQnR-00000002o5n-10An;
	Tue, 06 Aug 2024 20:28:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbQmr-00000002npm-24Cd;
	Tue, 06 Aug 2024 20:28:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 64758610A4;
	Tue,  6 Aug 2024 20:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34760C32786;
	Tue,  6 Aug 2024 20:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722976084;
	bh=ZDK2VIjGyasQEBAujexaEDG0pqWNc67yY+RUFkv9r8Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=vNUmJn/WmTUY4BM5CUfu8ziqUcNTR6cHYb2qpCJk7Ha9S5wJetD5eVAGVc5jLaFJ9
	 3ZuMun5c6P3yLcl0xRmQjDxezEjVNBXsJ3Be6nD9c9M5QeodbUcaE4B8rTwgG7P3eH
	 buWU3A46BuWoCRqodME3tSZSmrCJpAVzKyO/vQ5LDnRzKk7TIDieEMMlyVHfMtMOEk
	 kqaBi+9SSkE3EyigXE8q21UHZFCEgsJrFhZgVcoFPqY6bqwOqFC3REIx2zx1dEiz87
	 /uoaIa3ya0iBCi56TFROSzc4jLzyO+1ZZFyHFxZJNRuh2z8RhYVqBwM04kyFFr5o/B
	 VPembsN1WEopg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F153824F34;
	Tue,  6 Aug 2024 20:28:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: honor reset return value in
 airoha_hw_init()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172297608275.1692635.2332592411478238343.git-patchwork-notify@kernel.org>
Date: Tue, 06 Aug 2024 20:28:02 +0000
References: <f49dc04a87653e0155f4fab3e3eb584785c8ad6a.1722699555.git.lorenzo@kernel.org>
In-Reply-To: <f49dc04a87653e0155f4fab3e3eb584785c8ad6a.1722699555.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmai.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_132805_620084_5098C6CC 
X-CRM114-Status: UNSURE (   8.80  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat,  3 Aug 2024 17:50:50 +0200 you wrote:
> Take into account return value from reset_control_bulk_assert and
> reset_control_bulk_deassert routines in airoha_hw_init().
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/airoha_eth.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)

Here is the summary with links:
  - [net-next] net: airoha: honor reset return value in airoha_hw_init()
    https://git.kernel.org/netdev/net-next/c/63a796b4988c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



