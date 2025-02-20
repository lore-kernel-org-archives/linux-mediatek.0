Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74692C021B1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2025 18:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuRBlEKv0IQZ8Vu9TgskcFco2+889dbRYek2aozSRNw=; b=vdUfT+4ctdvOWSvk2Q3FS9qGVK
	dBv9rFH/SmxmkfE5F+wsLL0Ebhf95DL18G63Rq/ISl/2g6u4Uhm+1NAMLOPH3cBkv9Ti1bOOn1gH8
	LIoEndYGV3dmo0D93DtMTQZ8byCl4gMK+LATM/NxuB51EfEU/C2k9A8KbyI8pBEeCWVf+52ZGi/AK
	oEvz326/Cb1J6DD0j0ra/N305MEK/vYmL+wGpDUrftV5ifcjGWBK9HXRFIAGzr27u1Jx5KYHyErCw
	Sr4l8hmrWhHn9kG8ts/chqA6hVsodl98dcKpGPEgO3yP4XAcnplGgT+tgJL/KLy0IuWtrBgJMSTXm
	V9JWPr1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlB9Q-00000002Kl3-1sEN;
	Thu, 20 Feb 2025 18:19:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAzw-00000002Ia3-0Qjq
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Feb 2025 18:10:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 089875C5F59;
	Thu, 20 Feb 2025 18:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE364C4CED1;
	Thu, 20 Feb 2025 18:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740075007;
	bh=Y7MaMfD9DEqfEQuEhCmvFOzAfwIYc7wHGUXF/wMwcLk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SbkhjCY+Mc+k1rpe591Ru7OuVHxSEOmm7ZWLxr6z0eR8+v5fu1ecN/E4ACaJYw/D+
	 rUbMSWPcl0MdHexu5uH7ULwD1ujdQT2t/5WP8/4Hz2v290/gL4vQEjRLqyFY/GPogu
	 nYrPmDOAo1N4CdMWYbO7CEXAkfonjmZVEwLeiCe/8AbG6gakTr+1ymHLlIYTUpPikJ
	 KReViCnQfAAoTpNcHXYarKYemFsW5fAu8qkPF9ZapburQ4WE/5I+4MXaZkCfVbjZVl
	 FeD1ayCHJi6aXsKnqPOgOOyrWuoFjWpOzsLI++74/U1irZO3Y3YwlXcGb72mSFiU4i
	 Pv/u2S1YJDGKA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFBB380CEE2;
	Thu, 20 Feb 2025 18:10:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btusb: Add 2 HWIDs for MT7922
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <174007503776.1411319.11609386550305618639.git-patchwork-notify@kernel.org>
Date: Thu, 20 Feb 2025 18:10:37 +0000
References: <20250220020129.2400730-1-jiande.lu@mediatek.com>
In-Reply-To: <20250220020129.2400730-1-jiande.lu@mediatek.com>
To: Jiande Lu <jiande.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, chris.lu@mediatek.com, deren.Wu@mediatek.com,
 aaron.hou@mediatek.com, steve.lee@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_101008_194563_DB8C44A0 
X-CRM114-Status: UNSURE (   6.98  )
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

On Thu, 20 Feb 2025 10:01:28 +0800 you wrote:
> Add below HWIDs for MediaTek MT7922 USB Bluetooth chip.
> VID 0x0489, PID 0xe152
> VID 0x0489, PID 0xe153
> 
> Patch has been tested successfully and controller is recognized
> device pair successfully.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btusb: Add 2 HWIDs for MT7922
    https://git.kernel.org/bluetooth/bluetooth-next/c/5118199eaca2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



