Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5550C48BF8
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 04:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0twjdnUZK3fCwX0EY33IZ2Wjb+zn9RhH3jERrQuyxng=; b=pwlMbQAIXEHvh67ffjTkLEpr4Y
	zWiKeVbS1UzeGI03eVeu1zY4Cj//RklV5JcQOky0sAVjaSvMb/lZPYcK9+7pbPgPfUSCFL+Di9MLT
	6mngrxXbEWUOwVj0Y2v0/8C5ydIqSAMLfYWh2rVwVSuVZmg9vNeybQOlEOuWiikAiOPP6OT0uVTE8
	hPqbwjE5KaypuGia9AO4FOzQ4YgeK9fumoYXMio3xkyyCbXE1Yx38TanXb0pR8q0yVj8rNNP2uLj3
	mrlpf7dKABDc46H+T+JB3fgic4zFe5XBJsPyXdtqDSFVB1FDvluHBbmkSxWwsp7pMmkyZKrTwEGkK
	j2W+sZeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd17X-00000003WV8-1wN6;
	Thu, 22 Feb 2024 04:55:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd17U-00000003WUa-2q63;
	Thu, 22 Feb 2024 04:55:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AC6DFCE1E43;
	Thu, 22 Feb 2024 04:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71AEDC433C7;
	Thu, 22 Feb 2024 04:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708577737;
	bh=0twjdnUZK3fCwX0EY33IZ2Wjb+zn9RhH3jERrQuyxng=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JRhCVowN1kGPufF9VMiWE1+2taFg1JqW+zEhyPT263uu2Gx8JFjv25+FVEk9Eq7nQ
	 3TgCaMS/MKZ4Jx23YGDtfe0p7We1We+fb/hz7AOPD8UOob5F8IeSIgFvBZCSZYDxaH
	 l1qdP5owoOXLwXXy6H/1Ex7mC6i7eMjY1ov1sNgbnVzwT6IJ/IvpApEL/lv1tdnWWb
	 U3wUaSA0qbSId7k0//A+Z5xHrIQbY1aaspx7yp+MWxfmzxljGAJ1hQ9OTcpNCcOQXr
	 JGDnMLNblWPsVqdXypDyPWgZJ12kJYWp1tKnhQeIxRsdBBq0xilroSvJtsnLYOOre0
	 NukMhNoqZ67cQ==
Message-ID: <779e41e11d90cdf05ead7932de07192d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240219105125.956278-1-wenst@chromium.org>
References: <20240219105125.956278-1-wenst@chromium.org>
Subject: Re: [PATCH] clk: mediatek: mt8183: Correct parent of CLK_INFRA_SSPM_32K_SELF
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 21 Feb 2024 20:55:35 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_205540_914849_A1986684 
X-CRM114-Status: UNSURE (   8.39  )
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

Quoting Chen-Yu Tsai (2024-02-19 02:51:24)
> CLK_INFRA_SSPM_32K_SELF has the "f_f26m_ck" clock assigned as its parent.
> This is inconsistent as the clock is part of a group that are all gates
> without dividers, and this makes the kernel think it runs at 26 MHz.
>=20
> After clarification from MediaTek engineers, the correct parent is
> actually the system 32 KHz clock.
>=20
> Fixes: 1eb8d61ac5c9 ("clk: mediatek: mt8183: Add back SSPM related clocks=
")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

