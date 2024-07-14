Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7A9C3DA42
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jul 2024 15:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULeJdsWIEPuYij71WeaxNDZiLpYnvBS72Y1/+MXWi2Y=; b=M+s4WXLp/+jYfAtmpWqhnCwOJG
	XKxN9M5NUWnThDd+42KoQkUX5uLy7kzIEDbrXmqkC1P93JHzpVjOHbZsN/c/a4vJnQml0pXABAEM/
	si6BmQmafMmQOVis/c31iYMLEKTGe5hfGcabjHvSJLHGpEuMBseOYzJadQxSk0wns55ciklY0jXAJ
	2h4g1JgN7Zt0LCggfVEnpeR+oK2bk9v3fWwX6j8j2R6xR/TbFETll6V99+Pmn3CM8988PBVm1045H
	FDrmSQHPEiBAghhywvVlDut9V2AiU/49tLuqM7//QWmTvEeXAocYB/s7pUULE1yGy/jgLCcEkN6mG
	ixVVY84Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT0nr-00000004fMU-1itG;
	Sun, 14 Jul 2024 15:06:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT0nX-00000004fJ8-0nEe;
	Sun, 14 Jul 2024 15:06:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5A7DDCE0B2D;
	Sun, 14 Jul 2024 15:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24A7C116B1;
	Sun, 14 Jul 2024 15:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720969556;
	bh=OcilRDSgHzP9m7JOvXvEqJtgQZc/+G/blo1Cph4V0A4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lEjGpkqYjHi3WKq5NFsnlXXGlmrSEVYaihgGRK+TX8rAb1wQ7aPIT6QRcR+drzFN+
	 nxZw/lV1gvMpsdhTCHAyTWQEYvJ8kf0lwZaUvBh/6si6L1FJmFg7sciP3nbaliwU3B
	 ol7QcMLUAys1oKsadXEOUeVyOfagd5sGOFz+ZaYPl1pvkYDeh41W66XxelXwNVwa0+
	 PmBOC4zXHywHa6Zucf1mzZrAWgIb0y+vIlSqe0OlqB8dg4+2Z8vff8c0uqvIt9Pawa
	 uMbSSnZgG2UVXJwsmIVMEXkIrvzXPVeC2/ad0vE53lrglXVi2akrgRvaoZN4nD+W2c
	 lmvzwDglsImlg==
Date: Sun, 14 Jul 2024 08:05:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: wojackbb@gmail.com
Cc: netdev@vger.kernel.org, chandrashekar.devegowda@intel.com,
 chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
 m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
 loic.poulain@linaro.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [PATCH] [net,v2] net: wwan: t7xx: add support for Dell DW5933e
Message-ID: <20240714080549.4ae15f36@kernel.org>
In-Reply-To: <20240711060959.61908-1-wojackbb@gmail.com>
References: <20240711060959.61908-1-wojackbb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_080559_438733_7975C108 
X-CRM114-Status: UNSURE (   6.38  )
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

On Thu, 11 Jul 2024 14:09:59 +0800 wojackbb@gmail.com wrote:
> From: jackbb_wu <wojackbb@gmail.com>
> 
> add support for Dell DW5933e (0x14c0, 0x4d75)
> 
> Signed-off-by: Jack Wu <wojackbb@gmail.com>

Please change the name in the "From" field as well
(you have to update it in the commit, git commit --amend --reset-author)
-- 
pw-bot: cr

