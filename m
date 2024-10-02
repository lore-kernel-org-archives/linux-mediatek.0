Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E37CF31A9
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 09:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qqvz+r6i6xWYr+OotDkxFQntCbnjBRuYpkkQskjyAcE=; b=LmcqejxyEmo7blswQV0v92umOY
	nA+LpH/v+tUthugN7iJlDaOt/wzdUfz10+ZkNGtMM9lTo15CPoiaEmGke0MrZyOcF3si8Wc3uToaW
	eXpFSjigzq4PPXmX8A4gF5FIoR3y97OUKyATbsGDBAriHtGTkCYfQpq89eqyonBMsLpQoyHiDMDc2
	e33w2DLCLpZOwcaOG1kHRo3Ym//SrLKiv8jG5BmD/zB2vLDDqCFBOOAnkvp6OKmUFOYIsgAxYi0yS
	1FEvHif6Jw62irsFWDgclhe3CQEsBW/0yGudkNT7A//qi/i6924sltkJIh7rXj7pkoC/uXzTEXJ2S
	YoH2b5sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svvu1-00000005NUl-2utB;
	Wed, 02 Oct 2024 09:44:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svvjh-00000005Lfv-2osL;
	Wed, 02 Oct 2024 09:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727861612;
	bh=aEZ3V0e96llw0qLEbix5vImUGc2T9SakySfi4kktqIw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p922LMMSqLkHVljF+Ecm6Wyqj53PprrTan/GuHAnocAa0td6pPXoXZlJJIbXKd9O2
	 CmGPaXvOMBG1gxZpsTVMC67Y2vbLvQUou3fZweCVWY/uhprnRdqixMUJHoQUX1ft6D
	 L3mO8ubA4ZbZrYuwBko9oUEZR9CIJtKqGtqn0rIjHdoiYF5x2L4EQOpOD96gH+eHAX
	 li4O+9aCtLeOKdKFwNjO2r6hbP3ccMYIhmuGyU92uOdvFB46GrpMIS5KPRtGgrURkk
	 UyJ9z0E008SHk2egkElJ3XurYW6hMJOFJ3lEDyn6YEHNjeOCtnaJ/7qXqTIx6iLhf0
	 EOD0frFlh1fEQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD9C717E1250;
	Wed,  2 Oct 2024 11:33:31 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
 Pin-yen Lin <treapking@chromium.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, 
 Jitao shi <jitao.shi@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240912144430.3161717-1-treapking@chromium.org>
References: <20240912144430.3161717-1-treapking@chromium.org>
Subject: Re: (subset) [PATCH 0/2] Fix dtcheck warnings for mediatek,dpi
 binding
Message-Id: <172786161165.39477.4684212034089747258.b4-ty@collabora.com>
Date: Wed, 02 Oct 2024 11:33:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_023333_912931_F91758BA 
X-CRM114-Status: UNSURE (   8.91  )
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

On Thu, 12 Sep 2024 22:43:57 +0800, Pin-yen Lin wrote:
> This series fixes two binding schema errors in mediatek,dpi binding.
> The first patch adds the power-domain property to the binding, and the
> second patch adds the port node as it's required by the binding.
> 
> 
> Pin-yen Lin (2):
>   dt-bindings: display: mediatek: dpi: Add power-domains to the bindings
>   arm64: dts: mt8183: Add port node to dpi node
> 
> [...]

Applied to v6.12-next/dts64, thanks!

[2/2] arm64: dts: mt8183: Add port node to dpi node
      https://git.kernel.org/mediatek/c/ec1a37b3

Cheers,
Angelo



