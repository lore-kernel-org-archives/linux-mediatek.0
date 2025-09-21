Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C034ACAC5A7
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Sep 2025 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gladXUT5F0XURCw6JuQBdgxcedelWcH2hcrlQcX0DOc=; b=ZHXQ0Zt/wiBr/ghlD1eSgpBXEE
	6x3LXygM2vdWQfde7t8RyUe1P8X17VxjgEyhxGd+ZVf5qGv8rDzpzkSHZederw7crq6pT1Hze08Jy
	OLJSTPwDvK/qz8v9EmRtxEpZCjtHw2eZVuJhaCxtN/g0w//TRiv7e8MIe+eJZZeJiFmLf9cO3RTkO
	F8s2eJ5/p4rzdX7NZ/wb2tW65iAEXYuShrjIPiD+4VS3r6o81s/ptxW/PFc0xnqt9IfKBwjbfyt5m
	/UixkVxYGbmsM738pj2+uL91ippWbmgFVpuTyJp9S6exFhFG45L0GUTce5RLAqf6o7GgP5U0ga0GV
	tv7lWR0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NMD-00000007rhP-3NLx;
	Sun, 21 Sep 2025 16:56:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NLI-00000007qmU-1ADW;
	Sun, 21 Sep 2025 16:55:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9EE643881;
	Sun, 21 Sep 2025 16:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C83C4CEE7;
	Sun, 21 Sep 2025 16:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473715;
	bh=gladXUT5F0XURCw6JuQBdgxcedelWcH2hcrlQcX0DOc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HSj9EssM6Pxf5rY/zKangvdCD4/dxy/LP46OVg7ucuK6LIHBr8Y2vYVWHg73C1SUe
	 pU7hbDILv5qHCZ4Y1g11RSmHLmj5jvY1DfDVfYrZaISfLbJfwYsdNIeg4fk70MkkJV
	 cGb+R63jQ3qsMUbLwG/byY/bHYuBtElrsMSXapEVzWFNagumVf5cHumZQGPEyiNX8G
	 gUYrUoqW/1OM+wSP+g86QQz6QbskDGjB6t7hpKQ3A9NiJ7dJ7ylW6kl2tErBkqe0L2
	 46I5Q6u1oRHwUFMc3BT5B2LrxtP8bG1uN4ywU/ctkwnI7iqZY2SQvUviJ/Bx5F5Rrx
	 jE8ZtStQV2Q4Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-28-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-28-laura.nao@collabora.com>
Subject: Re: [PATCH v6 27/27] clk: mediatek: Add MT8196 vencsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:55:14 -0700
Message-ID: <175847371427.4354.3269379078117550500@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_095516_341680_C0164D6A 
X-CRM114-Status: UNSURE (   6.03  )
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

Quoting Laura Nao (2025-09-15 08:19:47)
> Add support for the MT8196 vencsys clock controller, which provides
> clock gate control for the video encoder.
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

