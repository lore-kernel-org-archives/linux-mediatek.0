Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA96C25B7E
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 12:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8X1kO8OVbPmnC90itbufP+c5LV2USXCG4OyY2mzc9N0=; b=zTt5FRNqKs3J5ktIq2DEFRepb/
	yFmhmuC24mTK60JNihyQCNWybtb3rR8SwCj7Kz9boViQzRIjeuxyx6TNhWxKl4n/b/L5EjTnF9apC
	tqj3rmXmzkj+Cr0LSnLVL7BrS3UBUGaz5pw3MMtWJYHryBPTMaP063xl5Wsn6DcOgD7V/nA1AsoVo
	nbmOiWHoN7b0V4PqPBzzbiwwFt6PKTtW3mzeT386Wr0EUa0OTMMYUt31qjufAxcmEXl45+IIpcewe
	wx38Lor48QCjNGEe1KHcZeZ56usHP9yoy75WSBsLgVKMyF7Jz6LjPMIj3xJc8MEd1961191iq1Rd2
	A8Aq1IvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETW7-00000002KZx-0GkS;
	Tue, 04 Jun 2024 12:43:55 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETW2-00000002KYM-3JXM;
	Tue, 04 Jun 2024 12:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717505029;
	bh=z9VKastw0Fg3r+6oyJGCgZjdTXvNGn5BMn3Iy1JBTjc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=yjPIBp/I/yrz++QRFFCWXo8sWUixFwRHmLtKp9+YqOn4lxHbQ+UAJ4XFt+oZ09pB+
	 7pDcsn4OD8OJbnm/sBKtQvkvC56bi8xV3VSN514lpc+aCyIxyhOFMxas9pTE6uSWpF
	 LxnVcIKIOswBr+AAIvcUDGv0BOs2h88ImLWXZ/MW7cSahxP54pqp2IHIdIrWIpo1ho
	 hCzbANG0up679nlLNH/UXeAn2CqO4agFwf308mdvzHkvN6Os25p2e132bEnORrLxS3
	 i5kuXyBsKj+sHXiGgE0BG1CViI72Tml9+vDbi6g9AR1HyWu4TtKlV1OqjLHvuSH/uq
	 ekGOPJvxkWLNg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5B8BD37821A8;
	Tue,  4 Jun 2024 12:43:48 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, 
 Heiko Stuebner <heiko.stuebner@cherry.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 openwrt-devel@lists.openwrt.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
In-Reply-To: <20240527115933.7396-1-zajec5@gmail.com>
References: <20240527115933.7396-1-zajec5@gmail.com>
Subject: Re: [PATCH 0/3] Add initial DT for OpenWrt One
Message-Id: <171750502829.333704.14436657931851729298.b4-ty@collabora.com>
Date: Tue, 04 Jun 2024 14:43:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054351_062098_C2BC2FF5 
X-CRM114-Status: UNSURE (   8.05  )
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

On Mon, 27 May 2024 13:59:30 +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> OpenWrt project (https://openwrt.org/) celebrates its 20 years by
> releasing an OpenWrt One product. Early units have been produced and
> will be followed by DVT samples really soon. Then the mass production
> is about to start.
> 
> [...]

Applied to v6.10-next/dts64, thanks!

[1/3] dt-bindings: vendor-prefixes: add OpenWrt
      commit: 80468ed25791e9c749cd12117111650a7f014928
[2/3] dt-bindings: arm64: dts: mediatek: Add OpenWrt One
      commit: 33e9d52fd89c8101a72fd95f648c8094ef4488a1
[3/3] arm64: dts: mediatek: Add OpenWrt One
      commit: c8770738f12ac3eced96dd7768be62b6c5018ed3

Cheers,
Angelo



