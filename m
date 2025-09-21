Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DBECAC5A7
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Sep 2025 16:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjbJUAsOJvnVsSkd0SpD92Mad+1i6cHrk6TaHi8r1M8=; b=BspfJTUKooJBNqOCurZWC7Foe4
	/8/ucxugzMVUdwctNDBD7Km+QuiLlGVuDy6gRi/Rs90OkiaDIlOD1J15MwgZG8MEqhMYbmL9WJlST
	JOW0thy++8hJgOQa/gHl0qz82HusatzjwrMlfs5MiBRejczZGDs0IoQ//6dgKaHPhr8XOXwnBMiVE
	xA4ZJhAT/OTmzA1+pM8pGFYpY8opgyJxzWpzm+8CFsTr1B6DTK9h6hk/Y5+N/NH/YE6Fj8HAUCRlK
	CG+udXJFnkjoe6WwdvamIskEePQy9B81IvLgo9808iyYCbXTqwiuAhUtAGDwkKws6g9CWPL9sXy5f
	/7Q2zwpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NKu-00000007qPA-0XPb;
	Sun, 21 Sep 2025 16:54:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NKI-00000007pox-1Ar4;
	Sun, 21 Sep 2025 16:54:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DDA3140739;
	Sun, 21 Sep 2025 16:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF58C4CEE7;
	Sun, 21 Sep 2025 16:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473653;
	bh=tjbJUAsOJvnVsSkd0SpD92Mad+1i6cHrk6TaHi8r1M8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pB7ybL9Vkw4nqdkgFs0jz7QXCnZ82eQzv1+zQa6q9fbcFWLuuZiFdKjyP2p3CeYy7
	 W3Rlk4MWstDnKXN6b5zF0N2LNLysS6a3dVc1SBbMsZciesqoQ8DCkQJ6pzhT5riDan
	 vIAjU2FTC0o2zbAixzqJQXIP2B9WztZeUbVkp8nUOSB3pyNIM9Owvuf4X2BYRHWRTf
	 cHEn05/TGEDijOgkZbvJXiOVeN1R3vnTOv2S8K/uYG0RFB3I5Bvs+YKkmlM1kSknOm
	 8s/aJcrOvx0GkLRecod3r6lqcsjSCSiIQ6ooVHIVx7TPHY/c5x9CE7WazihHHw0atd
	 holo21/5h/4qg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-15-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-15-laura.nao@collabora.com>
Subject: Re: [PATCH v6 14/27] clk: mediatek: Add MT8196 peripheral clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:54:12 -0700
Message-ID: <175847365240.4354.11730843899669937671@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_095414_350091_35C1E388 
X-CRM114-Status: UNSURE (   6.30  )
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

Quoting Laura Nao (2025-09-15 08:19:34)
> Add support for the MT8196 peripheral clock controller, which provides
> clock gate control for dma/flashif/msdc/pwm/spi/uart.
>=20
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # CLK_OPS_PARENT_ENABLE ch=
ange
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

