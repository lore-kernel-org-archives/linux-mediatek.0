Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C0B606A323
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2026 22:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3UCpz1P6;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FlVzCnuS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IMKxAJTioTnFgV2kKOcnfYJ3tZQRRjdSbCM++F5BVaE=; b=3UCpz1P6FnUOV6
	pS1UUZ0oi88bMUifcFo8iQ3l8G8L1bqBqcA5S50QqWThyAazcHUnikqExz+dwnBTrn1C9Jw4qNTkX
	JAlSmULyPXsG9ewzfiQn/OznHbZHJ7uPLKUs0AcKgfrVMRE/oB5qfDBXmhzh8i4z5I6YJshEbV5uT
	jOmdzH1Zc1Ptv8szBOgxiqIW81HCgjrIbqg92f8JCH/i6HhwC03y280V0PfC5TS7DlDahHRo6A9AZ
	N7H0LGLJYn9Ox1NhqHZw62vvY6X0+zMWn8Wm9lQlufGb558yq41YGVY+yWuotV1eyw+L6KdZviXz1
	N3vZbGCBx9bG6+DEzV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKNSj-0000000H2PU-2iPx;
	Fri, 23 Oct 2026 22:10:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKNSi-0000000H2PD-2Dti
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Oct 2026 22:10:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E449C4172B;
	Fri, 23 Oct 2026 22:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E661F01825;
	Fri, 23 Oct 2026 22:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792793407;
	bh=IMKxAJTioTnFgV2kKOcnfYJ3tZQRRjdSbCM++F5BVaE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FlVzCnuSbMh0amDfEVVUsCnuMcnW2pIkQdyeD3xYmsVO/j3oLQNDsS7C0ScjMY+7K
	 uuhKbctsX7VAbbLir9L8PRt1Dfj3Aona0l53vEz5QvJl2oUr5/Sxczz46GKw2GCTbf
	 yAkP1iehxYCs66jJmkfVxNt/rMxGx4/zHjIEcXmVG14WyR4PrW6syV4hlBnyGrKxs/
	 SGGm1pAFiH9x6W4hdroIbnw5omfRwoakIdzwNv3E0fct9KCFgw1R/4n3NoNoe7XCEP
	 Le7MJZIJ74VZUH93B6Vi7rnVSYHAIzS7gfegpwCVHIp2vfvkI6XtTo14fjhIwzY6VN
	 r0AADJEKpf7Zw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE5B7391B158;
	Fri, 23 Oct 2026 22:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/3] Bluetooth: btmtk: fix ISO data reception
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <179279340621.1294506.18194273796007140982.git-patchwork-notify@kernel.org>
Date: Fri, 23 Oct 2026 22:10:06 +0000
References: <20261022032150.2213479-1-chris.lu@mediatek.com>
In-Reply-To: <20261022032150.2213479-1-chris.lu@mediatek.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 hao.qin@mediatek.com, ot_wenlong.tian@mediatek.com, sean.wang@mediatek.com,
 will-cy.Lee@mediatek.com, ss.wu@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 22 Oct 2026 11:21:47 +0800 you wrote:
> Two fixes for btmtk_recv_isopkt(), found while debugging LE Audio on
> MT7925, plus an update to the ISO data transmission setting. The function
> is shared by every MediaTek USB controller that supports ISO data, so none
> of this is specific to that part.
> 
> Patch 1 drops the zero padding that the ISO interrupt IN endpoint appends
> to each transfer instead of parsing it as ISO packets.
> 
> [...]

Here is the summary with links:
  - [v4,1/3] Bluetooth: btmtk: drop zero-length ISO packets from endpoint padding
    https://git.kernel.org/bluetooth/bluetooth-next/c/fa9d4ec85257
  - [v4,2/3] Bluetooth: btmtk: bound the ISO payload length by the controller's MTU
    https://git.kernel.org/bluetooth/bluetooth-next/c/61eb283d06c7
  - [v4,3/3] Bluetooth: btmtk: derive the firmware ISO setting from MTK_ISO_THRESHOLD
    https://git.kernel.org/bluetooth/bluetooth-next/c/c9d0dedffc1e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



