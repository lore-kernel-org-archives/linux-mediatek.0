Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744ACD58CCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i67Tur1lTDsW3PsndxC649p+2k9fL1eRjU0zdc9Cb8I=; b=R2489FTP/wYaZz0F4YEYZl/MWV
	iLtjNXjbYDE9qH8knquHsW2caEG/48Y30z2DyNMeTlYJvDxWgQLSqGudfm3ezbl0bB0AZAUPzSskz
	756ono2JgNw0kb16VdLwGOZ19TEb1S0i1oVRYkKiBQ0aoSlYEyaU8+2XPzgaUTWZqLgYEqP+9KDC6
	te1/0uQQnHjJ+oM1VWVysJTDjMIHIrINJWr1GReEDk9OoU4MhouJ3MFMSJHPjcOKt0EaaF5/f3w1l
	O8OUTR5wx83PkHEcCtKUvCf7Mi3Kmqu8UJA7Ku5Cd3N2HDfyA92kX1IBM2Pic/SaIK4qLRp4pvcb6
	Ck4/stbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51DB-00000001QuR-3rQI;
	Tue, 24 Mar 2026 12:50:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51D9-00000001QtX-0yDv;
	Tue, 24 Mar 2026 12:50:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D05941963;
	Tue, 24 Mar 2026 12:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16084C19424;
	Tue, 24 Mar 2026 12:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774356618;
	bh=Io+E9/jACh42NofLlkmVJ4EWwPjlsEobWJiByzv1PoA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Pb5e2AzGgL02ulaKN7mkzxqHz4t2UIdM3V2Y+M5duNJ4gTTUiVDoQ6ywCxSp+lcTk
	 PkXOC0p7Bwf3gdIa3IzgOKNZod8LrccQ82ZpZXFf3fXyzeFbGsNqCYxX7LeSblUGxP
	 mVDGy4skq1xssv595CRUTEHyNSzvlbLm74Apag4jPEsM5BSykePI5fdOFCPOHLjDdX
	 TN27nlX6mWS33rJ8JqeqcCyNLBBBy7dvZ/s1+NpzoXNyJyS9i8JY+4LC+F4EC+jleI
	 vSPTo4U/+o6+IEXT9lb5Lxjzgp/PV4mszsDgfEOD3PvPms4srtxjnD6lDCKfipq+j9
	 NxBtV8wbuZJXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE1F3808200;
	Tue, 24 Mar 2026 12:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: airoha: Rework the code flow in
 airoha_remove() and in airoha_probe() error path
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177435660604.669121.2908279813353897699.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 12:50:06 +0000
References: <20260321-airoha-remove-rework-v2-1-16c7bade5fe5@kernel.org>
In-Reply-To: <20260321-airoha-remove-rework-v2-1-16c7bade5fe5@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_055019_295775_C0D4CC27 
X-CRM114-Status: UNSURE (   9.90  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Sat, 21 Mar 2026 15:41:44 +0100 you wrote:
> As suggested by Simon in [0], rework the code flow in airoha_remove()
> and in the airoha_probe() error path in order to rely on a more common
> approach un-registering configured net-devices first and destroying the
> hw resources at the end of the code.
> Introduce airoha_qdma_cleanup routine to release QDMA resources.
> 
> [0] https://lore.kernel.org/netdev/20251214-airoha-fix-dev-registration-v1-1-860e027ad4c6@kernel.org/
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: airoha: Rework the code flow in airoha_remove() and in airoha_probe() error path
    https://git.kernel.org/netdev/net-next/c/b1c803d5c816

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



