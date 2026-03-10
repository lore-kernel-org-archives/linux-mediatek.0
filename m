Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5623FFCC9AE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 03:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jUAQ5D4wJOfJgWpzyrFt3Hw32ZGQnCnoTnBRH4Vot0=; b=iEiMp63qOLNXgeREqM0IvnA2sE
	mDIy/MzkA0U9HME7oFD0XjssrYppuY1jYBCK/K3+2kN/Fk62SdAiq/6C49rpR8Y55jMYoteY7uFBj
	fJCP40Yjh0fPE0EkWIeaxpXs61A+QB+PapLolzfqfBCiY5vr02Ws2xQsPK4QOlNSNWr2amBCaNlbO
	AoPC18wi+OXG9T2qcLNmjr4n14xO3Qdz4l5Yr15RpgR3hdL6TSRhbDV3WWe4RQKvlnvQJ0xqT20wc
	Z2eBcNVMj7o9lBp4qpK8dpWwHak+oYyrF3dxhM5k/z2ek9KyWDyqxuKQOeQUfq/xoSDHQdiObyp8W
	AX6QjsQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznKu-00000008bjx-0kJl;
	Tue, 10 Mar 2026 03:00:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznKq-00000008biU-178H;
	Tue, 10 Mar 2026 03:00:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B27EC600AE;
	Tue, 10 Mar 2026 03:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662F8C4CEF7;
	Tue, 10 Mar 2026 03:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773111639;
	bh=3+2lYVzbzk7uvgRnRhf4lG9qT2OLixK/h/w5dFHyCmM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=T061+9v1A1Vba7QK0q0xa5c44YReaYrIOcS7933froKRzwqMRNC/gmyoeYLFgPD6/
	 n7m+q4CVSjgYii94cB7EYQtH7AMZf7ewoJIO6F0wHSmsvtVZ8sHlDltvb/28kDVTO9
	 3XRt959HRdvNFrf986WW5sy+ciopDIlHOgw5Ql4eUzi28V4z3+1TNi6y85iu8L+Qk6
	 ggJRDYwJ0vOOzLeot5p0xOPDlVOrPpbZOjnr2/1GlOnIUirKNhpQ9lFcNp6CG0c7Wz
	 DaAhdF0rjC+hlPiJneKgi/7sQaxoUUI1lBFGEv8sROHHyJ11uB8uY7dN0+gR38ldYx
	 Q57Vpn6ZKGXBQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA0053808200;
	Tue, 10 Mar 2026 03:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: airoha: Make flow control source port
 mapping dependent on nbq parameter
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177311163655.2039470.10429303373608059245.git-patchwork-notify@kernel.org>
Date: Tue, 10 Mar 2026 03:00:36 +0000
References: <20260306-airoha-fix-loopback-for-usb-serdes-v2-1-319de9c96826@kernel.org>
In-Reply-To: <20260306-airoha-fix-loopback-for-usb-serdes-v2-1-319de9c96826@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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

On Fri, 06 Mar 2026 09:07:27 +0100 you wrote:
> Flow control source port mapping for USB serdes needs to be configured
> according to the GDM port nbq parameter. This is a preliminary patch
> since nbq parameter is specific for the given port serdes and needs to
> be read from the DTS (in the current codebase is assigned statically).
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: airoha: Make flow control source port mapping dependent on nbq parameter
    https://git.kernel.org/netdev/net-next/c/bf3471e6e6c0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



