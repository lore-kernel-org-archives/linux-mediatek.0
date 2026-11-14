Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7604B606A323
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 00:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OBMC6e0U;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iA+2NgHs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=; b=OBMC6e0UcB06KLREx1KAdUYc7G
	pAHIW7N0TjGW+FWhybwEcqarZEa0gck29jpwIe+FETPD0SdNYa9jH/7ELlCL/ZVLo481+7nVO5ku1
	kIMIG5hr4W2BCp+6NDkcWOTv3NyleBJsSNc98sreeyVXos/GMcJPjXsw7kCvpVo2YRHUp49SSUfZf
	AgQ4+Jq2aY11DHp4DwBVw7h113Q5sDYVoinqsVxhDPtdnvnvUH5im3I1qKyQiZFKSQo/Nlob+Mefs
	T7pjYMeoogDKFE/sEL/nUHdN0C95JDiLcbYuUaYwgiz7i8yAhaiQbhqtkwPLjNzxZ8Jwp2NIbJpxf
	B0pgOs0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1gq-0000000EvJB-0mkq;
	Sat, 14 Nov 2026 00:32:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1go-0000000EvIe-2uPL;
	Sat, 14 Nov 2026 00:32:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DFF2612C6;
	Sat, 14 Nov 2026 00:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E821F000C5;
	Sat, 14 Nov 2026 00:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794616337;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iA+2NgHsIM1XGhJsN3YhlgEAOkvSXDvn106dhXYWMkWhG8xdOu0HbJtl8lp+VQ/tL
	 REacGdAPJXouCZUPgBiedOQ0xrnJUpEgyB36W6nzdYrLmAl74w16UYajZEnVGgqjJU
	 xFITQ7vzF1w0LTGObI15Gyhwo/ejTYroExNxe6HdFjrXpHeuKpZjPuv4k2O/pOpesn
	 VeeXCJ/SLasPfq+jaaGfxHk99SWjjYRdeP8foFGF4n1z+wc/jAsKcDnvnXg/rRgEcr
	 HhJ7UEJVB2qqXE8GS+Dl5GYH8kRn0zCeqG+rsumm4rAIg2DNPCB4FEetoPn1OZ54dF
	 U4yl6uqjYFa3g==
From: netdev-bot+sinfo@kernel.org
To: Sandeep Haemoon <sandeeph@loljews.com>
Subject: Re: [PATCH net-next v6 1/3] net: ethernet: mtk_eth_soc: fix the RX
Date: Sat, 14 Nov 2026 00:32:16 +0000
Message-ID: <179461633631.2168702.17586474086593763386@kernel.org>
In-Reply-To: <patch-4b4c5003bcf028fafd094e719c5e910b@loljews.com>
References: <patch-9e765e74d06edbba3fd85a0cd49c4bb5@loljews.com>
 <patch-4b4c5003bcf028fafd094e719c5e910b@loljews.com>
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

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

