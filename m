Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46698606A333
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 00:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XmY3c9IT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N97ElCaZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=; b=XmY3c9ITs+xHCIJXTTXYOxlNzi
	gX8Gzx6LdKS8T0ZGC/l/kfRTGkRD68Q2+pJw2yvezg6kNf460WLP6DTqbkNiNftFoESoIIjtrnqot
	vXPvmVy/Xn8bSpTIjQB2x71zPq8MMOM+KFw+9QNmOnkN2BlHT0ZeBWAWfA0veFE7sREb3JjvftQdB
	YrbajObJE5ZzqwmCYCKWdi8rYDr/PJfxv2zMD+44GeuDLZjmOKZYaBjovts7pZf/EhpduqQmpdwkx
	lKW61spkpm+j2sm348KqHEqB9mzl7Y15fV3sO1/nX4TAAzndA+HRhFHD81ePIlCZmmf4K2uAlbU8B
	BT/c6YUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1XA-0000000Etdo-31dd;
	Sat, 14 Nov 2026 00:22:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1X8-0000000EtdG-23pM;
	Sat, 14 Nov 2026 00:22:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D1D7061ECE;
	Sat, 14 Nov 2026 00:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7841E1F000C4;
	Sat, 14 Nov 2026 00:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794615737;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N97ElCaZ18uG92IjVfYrXBblFU9aIYDF8KKtN22kDx36OdOITRm5VfjGhB7FhYoPz
	 YBF1A54C19ostQzREksQNdAf+lj8VQ+ACy7pKzdrKlRFWREG2vd0d4u+MzVK5YodJ8
	 uXHj1yfjmmhEs1uRLUTCSMVeQZW5EOFEZ/9Ap5PRcPI3i5ba86J9NzfuxdliVp+ZYz
	 VP0WYYFcQWB1QrTIbLyy6FGb/fxFX6EVGHI5GTMNfmuGUiFrrdEqF3n1Fo7P3IHttw
	 UFj6Bj2dsyiQ3xxluOETQzEmyJUMupPwEir4iyjps9vPgq8eUgYxfHKWwfDzvA7xbz
	 Iq+TEa216kMxg==
From: netdev-bot+sinfo@kernel.org
To: Sandeep Haemoon <sandeeph@loljews.com>
Subject: Re: [PATCH net-next v5 0/3] net: ethernet: mtk_eth_soc: 9K jumbo
 frame support
Date: Sat, 14 Nov 2026 00:22:15 +0000
Message-ID: <179461573593.2168702.7673153146325668469@kernel.org>
In-Reply-To: <patch-f1e62a87eb0f914e1ea52a395f465998@loljews.com>
References: <patch-f1e62a87eb0f914e1ea52a395f465998@loljews.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mason Chang <mason-cw.chang@mediatek.com>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

