Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3313360A2614
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 09:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lFF+v/a3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VdD3hLZD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5uJWM6hL0OFVMz1J4hGBkjZHthmHVX/mwHx5mjdhReg=; b=lFF+v/a3Dhk9Rx
	uokAEp5lrBeWmNEQFwzb5ypUMtXAT3ei5glv6p4r++NM3k+3tzhb5cA93XXYy7PMU/RWGtXcf208t
	9fFtCufdzs3QSiezavJdsZLb/rfhhchKZ5b1WtCdsi8WN38a9ZwQX8Zn44tNjxRjWSkTKfzQrCHy1
	deTKznTLq24Ki85j6wTL+n77evllS5rRZTLzWuFY2Ip7eQYKPOrR2CsIfKAqcmm0tdNXKG+TcG45X
	QM4mQGlwiGJ6WFr75MGDLuhy8+5q38BWmPjF4B0jpZP4Jenx9ejD94IyhX4qRw4GYxuzdGmcJ8FLk
	PAt84QiKAid8XzjhpUiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQjO-00000009HYq-3qRy;
	Thu, 12 Nov 2026 09:04:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQjM-00000009HXp-3mLy;
	Thu, 12 Nov 2026 09:04:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E6BF4128A;
	Thu, 12 Nov 2026 09:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270851F00A05;
	Thu, 12 Nov 2026 09:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474268;
	bh=5uJWM6hL0OFVMz1J4hGBkjZHthmHVX/mwHx5mjdhReg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VdD3hLZDUMoBrhfsRugQXHfVgOiCbalLv3tWkvQDodrYpDyue2qM5h0ZgomI4+U1k
	 clUBAob+tgORvjhg7FTTNzNogOIfDTD0TotNdWVkAYPHjxWVFaXuq9IWOPmvpm1TkM
	 JCkzbKBZYkcbyXno15REeEs/Dd5oT0jFBqevwXNJwlEPg1X3IE/vtDKUThzB18GiPF
	 a6q7DfuhcPkMwIrDrYBVKU77IYO1HOOoIF/i6NWFPWaNftO68kzhaztHhgc9wgOc73
	 1W+2+xltmPKGGZ7e74qM2jih9dyVBUAB4pjGi4eQWKQfep5wddtnk86T3EDavPBFhR
	 1EI0fkSAj/Epg==
From: Vinod Koul <vkoul@kernel.org>
To: linux-phy@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20261012173402.24568-1-rosenp@gmail.com>
References: <20261012173402.24568-1-rosenp@gmail.com>
Subject: Re: [PATCH v3] phy: mediatek: tphy: simplify main allocation
Message-Id: <179447426479.428303.7583249997534314852.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 14:34:24 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 12 Oct 2026 10:34:02 -0700, Rosen Penev wrote:
> Use a flexible array member to replace kzalloc + kcalloc with a single
> kzalloc.
> 
> Shuffled some code around as __counted_by requires the counting variable
> to be assigned before any array access.
> 
> 
> [...]

Applied, thanks!

[1/1] phy: mediatek: tphy: simplify main allocation
      commit: 90ebdb0cbfa1cc1d23fa275ef96897d42b29503b

Best regards,
-- 
~Vinod



