Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A38CCF9E5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 19:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrhhGZCcSVCtaHZ+vYiB25qro/W+Zh/774jR5vM078Y=; b=YYK4Qm4K27Zq9TxtBPcYJ3L2Sp
	0t80IR702P/emte06g+zZNFPV+yQdgC/qPFzVng5jNuXFFXbBrZrpLrtzhCafCUNhgjezNy6SDd+1
	zUZxVQ+CHDjMj0YvvxuYacikCy/fn3ynJx7A9AMKsw9a3yWuVXB/DYuzd6WggCP4v8MuycMCevNhr
	iieLaKX8XV1y2BWbuRQ9H98EHNGtUloiw9jdhupLrYma0ii6pMsI9pU6OaNtvcYM/lJhsmBYCJ5Ii
	fsZL05tTtlKvNJv6nqmrLj9gLIfoU10ryuIRmZAfXv9aoB1EZeLm0mi3UGTiev7JPlsjD+Pp8gjtO
	g706nfeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSq3-0000000Eeyc-39eO;
	Mon, 27 Oct 2025 19:25:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSq2-0000000Eexw-0tEq;
	Mon, 27 Oct 2025 19:25:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E56761F84;
	Mon, 27 Oct 2025 19:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB041C4CEFD;
	Mon, 27 Oct 2025 19:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761593105;
	bh=EMFYNTxqqtbeWG7w/xTxHN65hWaPaOm53UuixA0S/bI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vFzBCiD2TaGdMk3IXuYjzLamws536+Bz7hp5DNvEo0KE381bf4hAOkl5BzMilVSs9
	 TbmuMCnTuI1Nu8la8KjABQ7QF3fXE6UfG6JWQju64rvNpMTH3zfqgWqB7cgKS2Uybt
	 ZCdMY4B7jNzlxocCvEv+YByAgfXaOQEKh/c1LAL9cJAVClnvQGSgmyIPFxWSbYqtGQ
	 8VNGtmcBXuUUK/h6u/rRyaqejErpjwuU8bUFXKABeof3vMkEe2PgpgbdQmsIhRW920
	 omf1N+UlcXgua/pw0KZ+3N4DwiviNcgyPXFDHx/hvI8+457eASfDU4bXE9lukwcSwx
	 p5wKjifUBK6/A==
Date: Mon, 27 Oct 2025 14:25:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v1 2/5] dt-bindings: thermal: mediatek: Add LVTS thermal
 controller definition for MT7987
Message-ID: <176159310054.1448869.17678673857769151951.robh@kernel.org>
References: <20251026122143.71100-1-linux@fw-web.de>
 <20251026122143.71100-3-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026122143.71100-3-linux@fw-web.de>
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
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Mason Chang <mason-cw.chang@mediatek.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>, Balsam CHIHI <bchihi@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Sun, 26 Oct 2025 13:21:31 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add thermal controller definition for MT7987.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../devicetree/bindings/thermal/mediatek,lvts-thermal.yaml     | 1 +
>  include/dt-bindings/thermal/mediatek,lvts-thermal.h            | 3 +++
>  2 files changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


