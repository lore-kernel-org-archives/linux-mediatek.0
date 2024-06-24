Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B833C2BD05
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 10:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHvRf15elSFaiTbxNQyuBSkD1wPWTNFLk05m9oxJ58c=; b=1ma7BmY5bS6Tb9GpcDBX66eRcX
	HjxbgvPvs0BzXSDayqod/5+HWLUrMoroVlSiLNurswdVAYuzS/4Yf2FObkGykZoHLMtHWS5IV2WY6
	4a8rGHcMinPm01ygZJmt4mUlRoRn3Ny/MnuUHB6+r0eXd5r5qsAnUb07IJVLlKPaG4yevzxY2JiVe
	qJkV0GeRB1SZyWkbtoA5a1dGYYooi3T0iYzHmFAUs6bJy6arrVdkztRvYPUGHZpDo1qGo5ItHPEOm
	dS5WGJCbtsn6HpkXE6mLjU0ovdHmlo3h9k7UF+pM3yTEiC99wssmdeRdVfWrimWNup+huUVuSZ4eT
	KuwNiD3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLhIm-0000000GUqr-48BX;
	Mon, 24 Jun 2024 10:52:00 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLhIg-0000000GUpw-2vwa;
	Mon, 24 Jun 2024 10:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719226313;
	bh=zECgMKM9yykTAXEDbgcRVzxyKGAZ3Ejp9Ilu/XnL06Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Mb0qeF7XFYa8RwDEaUB8FWTMJ5TbhRK3XhkatDPTh3raAj+ayHZTQ8GfuWE16zErP
	 LHDCvWGqTiLFMlcLJMNk0z/zGn7swRQ5gWTK4y66/PE6xnPl7UZ0w2U/NIkXW3b35i
	 Qsbe/igmKuCG152SXAp1HgCrqivpg1AfuCeUK3X/Eh1J2VwLl5nYWyzAfUU2bFMuQh
	 95ZRcbnZUZ/vE4pYpZCTmtbmYU9lRyJorOHFG6hj/CmPwxrpefTkpiMILgQqpCO/jk
	 lLvhgihXYx4hoLM1HadeTXbBhJ2uSy/M5I6E5/c05qNNF4XvWOjA2MzPUG6+2cgLX5
	 OsRJgCTtC+pww==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A6DE437804C6;
	Mon, 24 Jun 2024 10:51:52 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240620094746.2404753-1-wenst@chromium.org>
References: <20240620094746.2404753-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH 0/3] arm64: dts: mediatek: Add MT8186 Voltorb
 Chromebooks
Message-Id: <171922631260.124275.13611191482374063756.b4-ty@collabora.com>
Date: Mon, 24 Jun 2024 12:51:52 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_035154_912523_4479FC66 
X-CRM114-Status: UNSURE (   9.15  )
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

On Thu, 20 Jun 2024 17:47:35 +0800, Chen-Yu Tsai wrote:
> This series adds support for the MT8186 Voltorb Chromebooks. This is yet
> another product based on the Corsola reference design. This particular
> version features a higher end spec-ed SoC, necessitating a beefier
> regulator for the big core cluster.
> 
> Patch 1 adds an entry for a new regulator IC. How this differs from
> the previous iteration is not totally clear.
> 
> [...]

Applied to v6.10-next/dts64, thanks!

[2/3] dt-bindings: arm: mediatek: Add MT8186 Voltorb Chromebooks
      commit: 52225f8c1347328168f113cc2c089bf81e6714d6
[3/3] arm64: dts: mediatek: Add MT8186 Voltorb Chromebooks
      commit: e612fe2dfd7833ae06e7418eba39d7fbddb36799

Cheers,
Angelo



