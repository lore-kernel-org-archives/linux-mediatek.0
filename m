Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B6AEE49AE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 21:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sb+8B0MLmf4tgQ3FPv56qNbDe94/XdjmPCnIDt42lFc=; b=bk0kz3T2Ay1d+27//9f1ZXerSg
	z4ikZeis2R7Onyu+oxIVDJ6ijP2KVwnMn9LVIiL8xXh2ypBf1hMG37CHOJcVLZT1Y4K1Ubb2X0Hz0
	MaQI5nuwOn+E30qWuzOH742eV86ok8A5zQAs7vfS1rVb3mlLFjUn8cKi3azpuAn2RSrNbuWXeVhV3
	U7UnvP33PEFencEaPnayricqluk3e8wfxCj2aI79khn21WXh/VH8iTs41nfY4hbpC2J0CiEvO7/3j
	FdKud7fCQZ3DNKIzssxEKTrI2+e7SJCyp1KIVfCTu78kjD3DTUuVgG4+ylrOcJ8pWn4OC2//SlkQr
	ct4uRlBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYZJO-00GqM4-2E;
	Tue, 22 Aug 2023 21:53:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYZJL-00GqLR-20;
	Tue, 22 Aug 2023 21:53:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 248446445C;
	Tue, 22 Aug 2023 21:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77813C433C8;
	Tue, 22 Aug 2023 21:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692741194;
	bh=Sb+8B0MLmf4tgQ3FPv56qNbDe94/XdjmPCnIDt42lFc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fBFauLga5KWguRoR+euA048qYtqGnmn2KT5j86hXcgxbovpviuAyQNxoLNq1yXbZs
	 ujXb7N5FuGe+Ml7X9JR+/pFdNsSpxNcNQA2lZ5qQjwxz2KxIYthm17ZeQSjwJ7zDXi
	 jB2sjSjRmU4det4schIUwTqYmfBrF7GncMOHhdqHmubtuxeOIoyIQ4eni4Da42dRU+
	 pxTRyeoiFJI1emNa6FUruG+QHTNE04/3YtwNVwnbPxwhwcU5bQrI7SfRgb97qEdLvK
	 jAtLP/Rg8s1MfmKl+U/iQGp0IeKrrJ8z/joS5dYHFP3cECQz7pG2GwuHBAveU58AOm
	 utj0xJqYOkT2w==
Message-ID: <ae6c4c5e6bcce66da49d5699624414a1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230705065313.67043-9-frank.li@vivo.com>
References: <20230705065313.67043-1-frank.li@vivo.com> <20230705065313.67043-9-frank.li@vivo.com>
Subject: Re: [PATCH 09/13] clk: mediatek: Convert to devm_platform_ioremap_resource()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Yangtao Li <frank.li@vivo.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Yangtao Li <frank.li@vivo.com>
Date: Tue, 22 Aug 2023 14:53:12 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_145315_701073_032647E1 
X-CRM114-Status: UNSURE (   6.86  )
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

Quoting Yangtao Li (2023-07-04 23:53:09)
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---

Applied to clk-next

