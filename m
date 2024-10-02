Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808DFCF31A9
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 09:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6F0ERGvRjxzlMDlKyqycBVnqCPIQibGDYDqFnub87NY=; b=xc9lOk9laOnAqW3yVgfnhKrcEf
	rZ1OBvgQZk0D6cwmA0Sm/DR9Ts2XM5HO2h0g0G5BpY1AuaSYK2wpvYMPzhArEylDsm9xwmgQxeQqL
	EuoRRmBY29AJ1rVVDgn7nViRFQUI6OvV/vhc+SPishZs6Afft8zwyeW4JgZu4fWUA84Lx9pwX2cuv
	l4XduftOCKZtHxz5S+Pzrr3l4Xa5icHduHgc5nTMNwv5/P/Nr5ogz6oZjSjlZBHRZIKrtZXmJcqOL
	Zph/SBrR5F7tr7tWicnV54pqZ2ZW2HuHcVmaKAfx4lwYL4QnCAIQ1HwoJ1HAG6XQJIUO3r5ZN5Yph
	ZTaaK1SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svvpE-00000005Msz-2XWz;
	Wed, 02 Oct 2024 09:39:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svvjf-00000005Lem-1yTR;
	Wed, 02 Oct 2024 09:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727861609;
	bh=DAtGJqVbakzDbiZtYokHvZtNYlKTAu4abCJItS1QG/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Jwme9FEorp2j+aphusEqIxwEq+4BI9kQ4vdExhP+wRvtdlekayQn/3rt3kmvu9K3Z
	 0Mv3NTJTEV9+qgRVQWr/AfRdwQK0PK/TlgJNY0XzA/LIlO2F3Ots9YjsoXuWe7yw0t
	 4OOA+PN9nnHkNz7w+PjFAKPOH5X3lqzZrax23ZezA9DtFd8xHZQYE07jPIkXBY9TLc
	 4sviLfjrMnruYvsSc7+Ohn6PRgzXI222NirnqEI1u3jFguowTRjcFNOL37i8jcwawt
	 h4QQJsIo+bhkZ6kA6hFiAVXJCUuwJlQTOmtqFs3DiuxuI5oX9GBPsiWJi98kB4X+rI
	 XVX4jDh8SsDUw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4EF6F17E121B;
	Wed,  2 Oct 2024 11:33:29 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: Pi-Hsun Shih <pihsun@chromium.org>, 
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
 Fabien Parent <fparent@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jitao Shi <jitao.shi@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Pin-yen Lin <treapking@chromium.org>, linux-kernel@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240916162956.267340-1-alpernebiyasak@gmail.com>
References: <20240916162956.267340-1-alpernebiyasak@gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-kukui: Disable DPI
 display interface
Message-Id: <172786160926.39477.6425761248165017242.b4-ty@collabora.com>
Date: Wed, 02 Oct 2024 11:33:29 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_023331_695893_51CD4FEE 
X-CRM114-Status: GOOD (  10.32  )
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

On Mon, 16 Sep 2024 19:29:32 +0300, Alper Nebi Yasak wrote:
> Commit 009d855a26fd ("arm64: dts: mt8183: add dpi node to mt8183") adds
> a device-tree node for the DPI display interface that feeds the external
> display pipeline, to enable HDMI support on the Pumpkin board.
> 
> However, the external display is not fully described on Chrome devices,
> blocked by further work on DP / USB-C muxing graph bindings. This
> incomplete description currently breaks internal display at least on the
> Cozmo board. The same issue was found and fixed on MT8186 devices with
> commit 3079fb09ddac ("arm64: dts: mediatek: mt8186-corsola: Disable DPI
> display interface"), but the MT8183 change wasn't merged until then.
> 
> [...]

Applied to v6.12-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8183-kukui: Disable DPI display interface
      https://git.kernel.org/mediatek/c/377548f0

Cheers,
Angelo



