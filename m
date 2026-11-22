Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A03606A32A
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Nov 2026 00:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VMgKH5PJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m6J+ibVd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H99txkPHm9dGDVOna5fmRsZn5RWoC9UwQ/dEpIVrS2k=; b=VMgKH5PJMUcM7+RO2eJmzamlRx
	gVtZqOzmRdzQlQ6CCi2JN8LYMV9sOZ1z7kLaXtisWGQKj8ZEMDPSqj08rlmY72vGxJD+dHYhxjnsC
	4xxnwlgnOBUXNg9ZtNnUitVN0YGKGSMVGGgRAILUq+vfqBaNpftpZNuWmJm6/1NJdxjTbqA+i0vXv
	CMBcTnZFazQK2Fy7Kcpy/rRd/pjUv6TOoAPsNtavmtyLQ2QUM4GVGist5q6bH/UUDjGceE431bAkI
	P6d+ubKFQWKJZ2B8cN9hB7WZdzm15WkU+KSmchAJQ5ozUNQBiY1i3LgPBW3c83OU8h4JJAaTCTFP1
	5bmTh3hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUvjl-00000000cFz-1KnW;
	Sun, 22 Nov 2026 00:47:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUvjh-00000000cFY-3CG2;
	Sun, 22 Nov 2026 00:47:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BB2F360D43;
	Sun, 22 Nov 2026 00:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99761F000C4;
	Sun, 22 Nov 2026 00:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795308436;
	bh=H99txkPHm9dGDVOna5fmRsZn5RWoC9UwQ/dEpIVrS2k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=m6J+ibVdmd6IGgOEaLkTQFnC19aka74mJmzz2E5gIB2Qyk76V2AGGgsE5uHhFfegM
	 4sE7jPyep43t4y4K4ReWf7W1gdmZcyP0o9NPFlUHkkHX9SreFmw2SNwlSZPGKQS5be
	 VW9xsW2EWnUcEhG5pAyhzSz7vFzcLjOyZMaGAnuiJRnF421kh/kjT/bze1Vl++knYX
	 43DvMZDAufWigfoogSnlNzzNSsz2M5iIYCbfofCbdDlKVhW72s20imr3JS4MnvhjDn
	 yydxOXk66B9DE6fKzpvx8hpyJ6X7i1oHFqDAw3qNAu9RvPcFmMEOxkbQkzO6I9ir/f
	 kk+MTRiWBQSqA==
Date: Sat, 21 Nov 2026 16:47:14 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Sandeep Haemoon <sandeeph@loljews.com>
Subject: Re: [PATCH net-next v7 0/3] net: ethernet: mtk_eth_soc: 9K jumbo
 frame support
Message-ID: <20261121164714.5b0ae08f@kernel.org>
In-Reply-To: <patch-7d2c457e68de6b53b7348d1bdbeadcec@loljews.com>
References: <patch-7d2c457e68de6b53b7348d1bdbeadcec@loljews.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mason Chang <mason-cw.chang@mediatek.com>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026 21:55:36 +0200 Sandeep Haemoon wrote:
> Date: Tue, 17 Nov 2026 21:55:36 +0200

Please use git send-email or b4 to send patches.
You submitted patches with a date which looks 1 week old.

