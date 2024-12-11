Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAE7E7717D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 16:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wetpZ2A9zdMh/YnViYZNOGYVA3IQ7fH3A2IIbam0YI4=; b=V9CTw63cAxKGk0u8O+PNegeFdT
	QKADqTzguvGWkYK8YSDqgrf1gcSApi1cCK/Sxo6bXdqsNV9B4p96rNc7FILKU6C6I4+K86G0jBWiU
	VKUrJTe6cPMO0xkQoW8BYiPhf4v9h8aCDpyXyZoymA3WF8utkTPkHLvgT/KuO1Ht9DXypkjM6bsJu
	nbV7f3XlluexyVqyj7DlI5pm5lLzZ51OznqQRtcUsOwRlJ79/KSde4qpkzyIQq4DtFwy0ws3u3FPI
	4ft8nr5W71KCAw1OPPwxI4qE8y5yKornGtS3480iiorZKBhWR0P7WC1PMWOEwvDcn+CyF4ZJRZDDy
	w8QKM/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPuk-0000000FWHV-0G4E;
	Wed, 11 Dec 2024 16:50:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPui-0000000FWHB-19lg
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 16:50:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BB3CAA41032;
	Wed, 11 Dec 2024 16:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA9FC4CEDD;
	Wed, 11 Dec 2024 16:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733935814;
	bh=o6PcnR1c7xEg6wA/JfQN4/icpK5gy4jiF0XLYoOAqng=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cttKk3Ltts0X7r4CZ01jo8PovltwjbKgem9mcCi55oU7ntNn9a2QnfkUT7BjlLiX/
	 26Ai22j3dRzyo/SnheNxk7lA+7k0uFdZjVIENdP4TdkI9vgCtoYikMtqT0x9mE45g6
	 PAgAkYs07mhCvG9+6GzW1fvFMoYjdUcCOgJjKhZmOAZluOSGWAs7lNRTc2s0E11oZ6
	 DL7vmc5VI18XPJTaNGlHfiJdfgmFnNYno1e3yXwJadfcTihqmPxRmCQlqWxjna/Gl9
	 B+q2QKQ8DT6Y4Ue66KZBzduFkmWDwdmHk41VUSD2qZHI2/Xr6XxMbLg6Bww6m4ihIk
	 0tS/qNb5l+Rdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0BF380A962;
	Wed, 11 Dec 2024 16:50:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH Resend] Bluetooth: btmtk: avoid UAF in btmtk_process_coredump
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <173393583088.1641618.16072077288978379551.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 16:50:30 +0000
References: <Z1iYKvmenw81i1UG@quatroqueijos.cascardo.eti.br>
In-Reply-To: <Z1iYKvmenw81i1UG@quatroqueijos.cascardo.eti.br>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, jing.cai@mediatek.com,
 chris.lu@mediatek.com, sean.wang@mediatek.com, kernel-dev@igalia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_085016_379766_682BFFA9 
X-CRM114-Status: UNSURE (   7.35  )
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

On Tue, 10 Dec 2024 16:36:10 -0300 you wrote:
> hci_devcd_append may lead to the release of the skb, so it cannot be
> accessed once it is called.
> 
> ==================================================================
> BUG: KASAN: slab-use-after-free in btmtk_process_coredump+0x2a7/0x2d0 [btmtk]
> Read of size 4 at addr ffff888033cfabb0 by task kworker/0:3/82
> 
> [...]

Here is the summary with links:
  - [Resend] Bluetooth: btmtk: avoid UAF in btmtk_process_coredump
    https://git.kernel.org/bluetooth/bluetooth-next/c/845b4c649f56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



