Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4160AC636CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 10:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJGL8CC3GueT1SRKiHEZtaJir610aPiqmcrvvGsouxQ=; b=WyEXyAE4ji0/SO+Tuavd4yFE0o
	M/epJ/TFrQdHuYrkrgaiDK7RVvwt+CzlHW6qT4AEDREZErLXPPtGFrFkcbCtGCBLuFtNicbZMLese
	7qDk4s9J+TeRbnpgba/oy9frhBDoHAafZbteYZaMestBPfTkbDHE0Qry8rvsDWxF2DWO9L/2dP25v
	pGKQj1Ks37c/zHYxXMf4+tQ26l2NM+sQ3eCdMrrksWbqJin0PVfBx4GPslS8tVU958Bcip10MKI6Y
	aTUqDt1RUrg+rnjqSuxcHlfMrkx32y84q6HnM4p9BhQcCNsw3xvU3cYJI033ci9W9P6Rg/Vlwk+jP
	Gik9hPFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMo0k-007TD7-Hs; Tue, 31 Jan 2023 10:37:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMnan-007Hjt-LQ; Tue, 31 Jan 2023 10:10:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4B719614A4;
	Tue, 31 Jan 2023 10:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9D01C433D2;
	Tue, 31 Jan 2023 10:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675159816;
	bh=aC8cWenY/vRb5MKewZpHU/4CYbTngFaS7WCF1/uPb70=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ONkWKGOB+Szx+qvF/cRcCVySPNBqaZ1nrBETiv101yQkOGv7B0bxFqDGMFyBLdgWo
	 w0ILUfUzw990HV3StV2jly3EEkeD58d7O/DGEpVK59bO5J1cKnm/XVfIMLi8zrCr6V
	 OPk/Ap0FFOmRmA9ElqjvvGw/RiztF2Ww4fncxH04n1j3EerZQAZN5JHIAV+oJZFceP
	 4MMKF03XUz4YeuMDFo4a8FWt2fnqK4QQjElpcpV0czOTLdpgxroaVy01ceYzEta3Rt
	 pE4QbW1KqxEdxSYAbOx64fUJM0o0FnEV8iAV39nFco9Ee7YLe2W8SxF8awhJSlHHJL
	 hIAEgdvjky5eQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 88837C0C40E;
	Tue, 31 Jan 2023 10:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: Avoid truncating allocation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167515981654.18378.5828273248043471615.git-patchwork-notify@kernel.org>
Date: Tue, 31 Jan 2023 10:10:16 +0000
References: <20230127223853.never.014-kees@kernel.org>
In-Reply-To: <20230127223853.never.014-kees@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_021021_775130_5E8B1106 
X-CRM114-Status: GOOD (  11.86  )
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

This patch was applied to netdev/net.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 27 Jan 2023 14:38:54 -0800 you wrote:
> There doesn't appear to be a reason to truncate the allocation used for
> flow_info, so do a full allocation and remove the unused empty struct.
> GCC does not like having a reference to an object that has been
> partially allocated, as bounds checking may become impossible when
> such an object is passed to other code. Seen with GCC 13:
> 
> ../drivers/net/ethernet/mediatek/mtk_ppe.c: In function 'mtk_foe_entry_commit_subflow':
> ../drivers/net/ethernet/mediatek/mtk_ppe.c:623:18: warning: array subscript 'struct mtk_flow_entry[0]' is partly outside array bounds of 'unsigned char[48]' [-Warray-bounds=]
>   623 |         flow_info->l2_data.base_flow = entry;
>       |                  ^~
> 
> [...]

Here is the summary with links:
  - net: ethernet: mtk_eth_soc: Avoid truncating allocation
    https://git.kernel.org/netdev/net/c/f3eceaed9edd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



