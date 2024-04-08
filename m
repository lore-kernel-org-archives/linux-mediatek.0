Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4621C67861
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 06:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5HCfq5uK8y7rOB5VKTxwaht8j5UlBg/L7xDpwpFvFU=; b=O7QK6BMJIyResXvgBGdMpTtaTr
	rOE1r/mVYrbsay/+k/OwKtw7dveKG5U9vVQzJ2wuKx6ow1PSpyU/zYFgihsWzmpJUIyp9jPAGtl8B
	fYM3b9u0xnLXqCQwKo1NDp0ui4e6i0JVgtpu69ElN+cQpKt+Q7nM8eyh1eHXSqgvhid0GB96KNEgq
	pH3s3sD+QS9VtxPc7evhAiHCLIR6vD4UKAuHpY3W/xzEhgpwNvzmC+W0Z89EzAunIYDu8E00lyRHv
	1dbiNzT5YkimuXGZYn3AguU+M4HJtS3mnftUK3gEtAE77ivuc7QOyhk6pHKvfnSwm6FMnQXoEZ5FQ
	AINgUZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtipV-0000000EZWN-39QP;
	Mon, 08 Apr 2024 06:50:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtipR-0000000EZUl-3bS0;
	Mon, 08 Apr 2024 06:50:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2C132CE0C6C;
	Mon,  8 Apr 2024 06:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54743C433F1;
	Mon,  8 Apr 2024 06:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712559003;
	bh=+5HCfq5uK8y7rOB5VKTxwaht8j5UlBg/L7xDpwpFvFU=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=QMZZlJQPcbxI6rLSJoLYM7+1EiE4Yc56PsWcKu10aGZRrJ20HZBv0Ut7uW2oGwrNz
	 01kIAyLirLsfv84XHi55FpSU5LiG0At+KOsSPol/yaqA9jdO1/9CixUGR/nMXomixi
	 VVTSLGAa436AHH/wWClW1kL7Quh3AASTcSLH/vs7/yCicGSqLtqto/P3zzwHtJkTbo
	 7IY99e7qFRcBAD0jWjN+uUbGfJUtPGi3KXFYXKEc5vy01D64Z5bHtU2wNgXgMqaqig
	 OrNDdWgFtS/P1XOzoFPvULIIYr+5zLVYHQ8eBJUxQopuCerLBIo/8pMUeYOt1HX9td
	 +WxQdG8lGP2NQ==
Message-ID: <6e2934870cc523f26953a856dc454441.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f0383126-99c4-4233-b222-597caacf43b9@collabora.com>
References: <1da2506a51f970706bf4ec9509dd04e0471065e5.1710367453.git.daniel@makrotopia.org> <f0383126-99c4-4233-b222-597caacf43b9@collabora.com>
Subject: Re: [PATCH] clk: mediatek: mt7988-infracfg: fix clocks for 2nd PCIe port
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich <frank-w@public-files.de>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Sam Shih <sam.shih@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Sun, 07 Apr 2024 23:50:01 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_235006_123751_76176A03 
X-CRM114-Status: GOOD (  11.35  )
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

Quoting AngeloGioacchino Del Regno (2024-03-14 02:44:59)
> Il 13/03/24 23:05, Daniel Golle ha scritto:
> > Due to what seems to be an undocumented oddity in MediaTek's MT7988
> > SoC design the CLK_INFRA_PCIE_PERI_26M_CK_P2 clock requires
> > CLK_INFRA_PCIE_PERI_26M_CK_P3 to be enabled.
> >=20
> > This currently leads to PCIe port 2 not working in Linux.
> >=20
> > Reflect the apparent relationship in the clk driver to make sure PCIe
> > port 2 of the MT7988 SoC works.
> >=20
> > Fixes: 4b4719437d85f ("clk: mediatek: add drivers for MT7988 SoC")
> > Suggested-by: Sam Shih <sam.shih@mediatek.com>
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>=20
> That's funny. Anyway:
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Are you picking up mediatek clk patches and fixes this cycle?

