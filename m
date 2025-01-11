Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F42DE7719A
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jan 2025 21:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/I8MT+eVEIJlkDqXpv6xPh7XxleYT2QyYUi7oa6+Qg=; b=zGUhdoX7wgnP/OPm0+aoy+2UuB
	UidOY7lpzhpBoNXX24TaVjvKo9jkubQOiGYIvAmB8JsS+jLQEiBfr0K2ArN14SZEMSYLXkuPUMStR
	VO5ieFnkVRZTYfEh3c7FN/f+EBTI/4Wl8lyYLqHLsWLVvgEOt657nsW/wpA1dzw6fllwATk6Setbh
	vG8aM1jBAoolj+gzWDTaKoOjothRuvCOQNiTj/fFGMF/NY9WErtYSIjVycfl5amW4jc83iCzZewGc
	2bBXRBar5v9T/44AxUPIQUGal3XGTpcqKRYOU67gPJsJDdxF/upkCbf/fI3iK3OMPXRtBN+ABG+8I
	69BhvMOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWivA-00000001Tvh-0bN0;
	Sat, 11 Jan 2025 21:21:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWitv-00000001TjH-28cH;
	Sat, 11 Jan 2025 21:20:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC3AF5C0685;
	Sat, 11 Jan 2025 21:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE65C4CED2;
	Sat, 11 Jan 2025 21:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736630409;
	bh=d+CjSnWYenwUHwQ3HAhXwdYz3H2sh3KOtK+AFQLc9Gs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LKuhullKPphx1ny0+ac63nI5jTOPOCf7LO5GCh71ih+T7THXUBcMl1Q48NjtN2D5L
	 aBGpfuySR3at8Wx0mDQQjfR0wwpwJ0Z04hwGYIg+VE644gHHflwj/Y+Ei/I4/3lGkb
	 C9CDvR/A91LC3vsbRGtIJ6jcwB6adDuBhmmgLYvXupS38X0T52Ix2rICvTxSMpOLgw
	 pfW3diLLygbO8LW6Qnj/YfyRyyWnofQvSzvsBbJjVwwhOk6HX7T/z5QUAGS00KkEFd
	 M4PsUyarW1nh0Ez+p3GPZo4y7WMjVuvpOnY0kGEipulf+SS8A3FGOHGXQbZWBSeZfc
	 c9RjHZQnAm6eA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB242380AA54;
	Sat, 11 Jan 2025 21:20:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Fix channel configuration for ETS
 Qdisc
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173663043176.2451513.12890809036064265655.git-patchwork-notify@kernel.org>
Date: Sat, 11 Jan 2025 21:20:31 +0000
References: <20250107-airoha-ets-fix-chan-v1-1-97f66ed3a068@kernel.org>
In-Reply-To: <20250107-airoha-ets-fix-chan-v1-1-97f66ed3a068@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_132011_585003_D42E3941 
X-CRM114-Status: UNSURE (   8.10  )
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

On Tue, 07 Jan 2025 23:26:28 +0100 you wrote:
> Limit ETS QoS channel to AIROHA_NUM_QOS_CHANNELS in
> airoha_tc_setup_qdisc_ets() in order to align the configured channel to
> the value set in airoha_dev_select_queue().
> 
> Fixes: 20bf7d07c956 ("net: airoha: Add sched ETS offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Fix channel configuration for ETS Qdisc
    https://git.kernel.org/netdev/net-next/c/7d0da8f86234

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



