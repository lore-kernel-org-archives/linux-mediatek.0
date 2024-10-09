Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761ACCEE35E
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 23:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hV9ctvyE/5w7nQBVOLafrusMSwAuRpOy+IJ31YSq6o=; b=BI9ZL1GCpo/BVmE2NHcODpyFMG
	37o1jxx2Evgaqflqcv3K6pNxyTStfn8x8sIUnAWHD6G515MJFq+Olc59MCXfpCEnB6J5OuQDVL61r
	pd27l+rIRVlH6UFRTBrh4KFnNyAlLz15KdUeZeYDcMzP5k89Ld/G/EDk4cEnbaz7qT2xulcvhN/Zr
	tqGOPzpcl3+6oUrS2N+VZD/krujzswy7yVyGsCsBy2RoKsWTXwF7RlKQk2E/dOeAO/sMaKP6jm5yo
	LBZN82wda3tZpzI16fs8i6QdR9/K57Rk2oeIo4MTJ03BhrzQDVugXQPYXjzX0gJYJTmxQ9nMR3E9g
	p6dzSzEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syffj-0000000AzNK-0odx;
	Wed, 09 Oct 2024 23:00:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syfeN-0000000AzGb-33Jj;
	Wed, 09 Oct 2024 22:59:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2091AA447BB;
	Wed,  9 Oct 2024 22:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48232C4CEC3;
	Wed,  9 Oct 2024 22:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728514762;
	bh=+hV9ctvyE/5w7nQBVOLafrusMSwAuRpOy+IJ31YSq6o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=j/Llr7Om47okBfrDjzOJvoH2+dab946xBe1qYAGDdj6+CoSsyeJ4yoSsUa3jPl0Rd
	 mUmVOdIjQeRt5Z+Cpm+eZVUOtOP4itHJijvlihxYM1XP6vGjPvBQrqNvXOvkuBlt90
	 Yh/7vWMyTL0N4ekz9RVRmgZz+AdCx2BnqWeaG9ftiOfptNSsJiZcn87Qm1pYdpcVqs
	 Shgun+9xNCkabBmLqq7DepYB7UNlQWN9otwaeHQ3kkna7A7hjAzMLV9DUSlvHuIdrc
	 7BOU//xDSeeu93meZrXBrIOwEZtoVt2QjdNuMPeXkNOyJINpZri8X3J/OYktkQWM/P
	 LwQqWgK/iolng==
Message-ID: <8e4d80ebeb8400d27f1ccd88716bc99a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240911143429.850071-2-fshao@chromium.org>
References: <20240911143429.850071-1-fshao@chromium.org> <20240911143429.850071-2-fshao@chromium.org>
Subject: Re: [PATCH v3 1/8] dt-bindings: spmi: spmi-mtk-pmif: Add compatible for MT8188
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fei Shao <fshao@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 09 Oct 2024 15:59:20 -0700
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_155923_853449_492AC751 
X-CRM114-Status: UNSURE (   7.72  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, "Rob Herring \(Arm\)" <robh@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Fei Shao (2024-09-11 07:33:54)
> Add compatible string for the SPMI block on MT8188 SoC, which is
> compatible with the one used on MT8195.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---

Applied to spmi-next

