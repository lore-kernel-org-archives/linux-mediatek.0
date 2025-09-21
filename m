Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D68FCAC59A
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Sep 2025 16:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8f/9G9mAreZymbDZirPomAxcYvgRWBMv/7B2LPxzobY=; b=l/wZB6ZWoX9vTWDOQ4LItYXfhs
	lUKNEI9PQoLOX4vfhefFP3STpXRtloEl8MgI8HutMgVuxFKivAaLYerqe8U89zYhORxllsuZRIEZY
	0ce8uXAVtJMp4KHmxhkqfqs2Lc1aa1eb8PO23G17WNm3/MbJqmrOzi5UtqgpF+QeRDbG009MEGJt5
	7PMbvAg7beo72vnVT113Fj379zrgkoPrq86zL9EMODHlzOZNXcnbp8GGV2rTxre1MnMwEO4qIvT//
	jtfiqr4Fb7xmhfTFJR7Uk+PACrcBESinE3mryFn48X4fcnjGnYjlgi3IFAh4Xxydz7gAdDLqp4bEN
	SD8snq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NL1-00000007qV5-0yZF;
	Sun, 21 Sep 2025 16:54:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NKP-00000007pvl-1foj;
	Sun, 21 Sep 2025 16:54:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EEE1A44230;
	Sun, 21 Sep 2025 16:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC50C4CEE7;
	Sun, 21 Sep 2025 16:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473660;
	bh=8f/9G9mAreZymbDZirPomAxcYvgRWBMv/7B2LPxzobY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=stU/VsM6dRPxQnPfM4Z7X6DUADlhgxfa/ZpWxIXAIiOIB7PnVyCyMeIMAyh3yB5Aq
	 g2nQEMmPYYT8lWKjXwEY6us7O/GXtFnGAjW2fiJN0ZdOfNSDTipWbQRS7NHQLFUSuE
	 E1WBZmB/AcoUn08sH5D6ELxmQdlYKvPLQF+mgq+frkVMNmFto2qqtIRPp+hoxUEoI9
	 j4D4vdd153X/q555Kj6QZ2Eax57NWFW9Zl+k83eGeucYRJ7hGxng41A51G4S5+I5hl
	 uRr8oT7HWgqxSa/SW3XVwqUI3sAa+E+y6DFXK98GsdoG+dFdItPFOQMZwRfx3t0k6u
	 kBPwedCzgbQzQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-16-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-16-laura.nao@collabora.com>
Subject: Re: [PATCH v6 15/27] clk: mediatek: Add MT8196 ufssys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:54:19 -0700
Message-ID: <175847365934.4354.12041857829986457329@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_095423_926230_1F5657D0 
X-CRM114-Status: UNSURE (   6.21  )
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

Quoting Laura Nao (2025-09-15 08:19:35)
> Add support for the MT8196 ufssys clock controller, which provides clock
> gate control for UFS.
>=20
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

