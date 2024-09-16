Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA6EC3ABB2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 09:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICVkO155Bp7n9e6nsmepH4m95gK3Ker1+yTqAskJHCA=; b=u5b7FO/K2EN3sWnBWv6Iwh+hVP
	dqXRMCO3XIblbPDt5IkWJzBjklbSJqk/d+O+HHQsVO7TysrFTwRgkuRJWQdB/NxBQNQA94oJ21owE
	d+jcRwbhpYzrUlqJPy97vwntpyfeLFpVYq/Kp09l2dFpKPpizekcYlBZRTdZ+rsXKsvrBENWVPWL9
	uzro3e8OXYpuKAcuubbZkw7RyhLhgTwnCRMP1OARwsnUYQKC01sI3C/oj04IEGchw3jhEV8UwS67g
	nLerFSf+rmVpjQe30jp8ekNgHxTgRwxTV9tc3D75sXn4UPl8Lx7rvgEU14t1OsIavcxjHMKfSpaV9
	eBR6Ohbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq7zy-00000003Zm6-3ZTT;
	Mon, 16 Sep 2024 09:26:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq7yt-00000003ZZU-3htt;
	Mon, 16 Sep 2024 09:25:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2D3B9A41B40;
	Mon, 16 Sep 2024 09:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7B1C4CECC;
	Mon, 16 Sep 2024 09:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726478714;
	bh=vLrfIzpNtpqTfCOqfCAt9jt7gKeQhXhVTLWVC2YKFFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ab148Y7b3rAN2wJtP+0rs6F8WuJGUh+t4Q+569KNaWahtaZZwazP8kXLyw3e2Pq5s
	 E4Ali9Ca/76F+iWaRO1GR0VntlhPOO9eNPDFQM8W8Xrb15bRuNylTRKskKGf0/EFya
	 EHajF3wzpfJCAD6Au6J3E3EnoULv/jh/Asm/jLcD9SUq4eRD3wOVIabIH/HqGkz/QO
	 wdTOlBGvJKi1KrEhPe6qJI6PVrRvmcXhz6YGf/eWTVa1OmJCF9nXrKcOR1N/3L6pgg
	 mKPJWTmsVlyLnlKewrnw0W+JbVPnyQuix1GEhHiBr2mIZGlO0oQ8ckLfgu0MCoiuDG
	 mY9JrPkt9zTbg==
Date: Mon, 16 Sep 2024 11:25:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
	Sen Chu <sen.chu@mediatek.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>, 
	Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
	Macpaul Lin <macpaul@gmail.com>, Chris-qj chen <chris-qj.chen@mediatek.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v4 1/3] regulator: dt-bindings: mt6323: Convert to DT
 schema
Message-ID: <iv2v4ywijimac7l336sgqqm4rfxpx73tgmsil63z7l2xilpivz@vmpff3oitslw>
References: <20240914132731.9211-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240914132731.9211-1-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_022516_012070_74430B1F 
X-CRM114-Status: GOOD (  12.35  )
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

On Sat, Sep 14, 2024 at 09:27:31PM +0800, Macpaul Lin wrote:
> Convert the MT6323 regulator binding from the old text-based format to
> the new DT schema style. The property "regulator-name" has been added
> as required property to reflect current usage in mt6323.dtsi.
> 
> Examples have been streamlined and relocated to the parent schema file:
>   mfd/mediatek,mt6397.yaml.
> 
> Update maintainer and submitter information with new entries from MediaTek.
> 
> The reference document cited in "mediatek,mt7530.yaml" has been updated
> to point to this new DT schema file
> 
> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


