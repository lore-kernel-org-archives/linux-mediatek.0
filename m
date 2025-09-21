Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F394CAC5A7
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Sep 2025 16:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1G7Idd1jXSeydVO9+p6aQflLNNbJDkn7NEgXhDdDu4=; b=PXEUg/1MECXi7JXzVNXgWzUDMo
	CD92qIsjXlxeGXBH4kyvUOLk4gZSufKo4eXN0DgJPZndJywoiB56iHNPrJt6a2gB507txdJeF0bZU
	c4io0WH5Egp0YQShOGBxY4uZGvqDnW8FDI1dx+REBUwRm7g3XTJy2mgV9se4KZep194chfStdxQ3I
	XpXk7aZ0PK6qxmnoDiKmi1KyHHLpWdde++J9EeRdGqWEq16/Iau6JG5Vp8oWiltvw7plD2WoLShzx
	gZ+jnJlLn1dGjZKO8dtKZlLKZkkAitjg+Jdl7s77e4rXbjgJH9quRDYr/IlHHYAAPkoreJD96iZkE
	q1gI/0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NLG-00000007qkU-1CIz;
	Sun, 21 Sep 2025 16:55:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NKZ-00000007q5h-0pbm;
	Sun, 21 Sep 2025 16:54:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B0CBF443ED;
	Sun, 21 Sep 2025 16:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E63CC4CEE7;
	Sun, 21 Sep 2025 16:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473670;
	bh=a1G7Idd1jXSeydVO9+p6aQflLNNbJDkn7NEgXhDdDu4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oxzgxrJmM6nGWeWDtDfVDCugmZzdBDSprGCTSya6OE+eWxRZSQs0eZuVfAJjgf9kZ
	 zDOWbhtsDDo74T8nEnHUazZrejTq0eFVatl+1B+EFZk+mA1Y41NwBPKobdX3JSwW1/
	 MBsr5IZ62P+mESbxsNmCY2fSbFl+wmJvi1k7Do/l9jtMswzGSJem5gk7c6Z006FS4u
	 9oAf/4LA/j5I8SrjBPO5Ri5FqSlt8LY/0FUgSwghqSoE2I7TAA1h1RQ59UujRhzdav
	 ombLVsRD8bFXCd+ousnDGjUw5VNqBibytDcvXjxQM8CcREdOqzjXJIFp1Ig/fJ7a0J
	 5cnnJoR7+J1UQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-18-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-18-laura.nao@collabora.com>
Subject: Re: [PATCH v6 17/27] clk: mediatek: Add MT8196 I2C clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:54:29 -0700
Message-ID: <175847366920.4354.9675172258834502280@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_095431_318635_88395752 
X-CRM114-Status: UNSURE (   6.18  )
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

Quoting Laura Nao (2025-09-15 08:19:37)
> Add support for the MT8196 I2C clock controller, which provides clock
> gate control for I2C.
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

