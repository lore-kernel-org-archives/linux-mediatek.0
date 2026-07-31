Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F49C55171
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2026 08:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RW5kVziQTvjwkaw1oQsd8tnJ2xMtqtixoMGra8Klios=; b=QtMSDug6hv3hxNcAqGpAS94W2T
	Nc817ThMpNm1Wggc4c2cMGeKrhaWgMTafYwVK0ApIUAYoHZVkmnHhn83t/JdkslBsmf/rtkkf/Ytu
	MGVNseYhWihRBthChDqmuRKWBuiY6Hyp0siIkMA0cmURF2QcJh8CreTbRS08xnjA78bYoldn2UzA3
	Jw9CdB2AfAqV0UkpgWagwHjlYEXvglCcNRujZnb7fD1ZZWBiRrJWGcVCd8ostZ3XSqmTsG8mpOOTB
	cL9UP1YHu3wfFXTu8mUXDaEhdPOcMgvnBcQbe20LRVLHRkdazQYTr/esue0s0D6E+uTqeSg+7wE1B
	nP7rDg/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpic1-0000000C43t-0Ku6;
	Fri, 31 Jul 2026 08:29:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpibz-0000000C43N-0Zr8;
	Fri, 31 Jul 2026 08:28:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D1C78401AA;
	Fri, 31 Jul 2026 08:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3EE1F000E9;
	Fri, 31 Jul 2026 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785486538;
	bh=RW5kVziQTvjwkaw1oQsd8tnJ2xMtqtixoMGra8Klios=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZuPFaCL9b7sQa5RwzaGkHA3yu+ywn9HIYZ+JoGm8T4pfCYXJay4OVqX3cVT004HPL
	 GeLIcVt4vlua8WLztiEeOiWnSv/HKW1j4dgSWUIG+egyqYBINVnoGj1wMouAvWAgBU
	 lVN3SsRdFZRHPIqam7TjSx/p2ANomVgMyHE4KTiXVkh/ZlTEfJmFzvhjh6lY+9nTCM
	 A9HUIU0cOR12gdhODdym06G14yHHP7doPVRAnZ/f+wQiGb3KfVf/vzWu9AJ251tsYc
	 dlUGbX8xcHj74YtGN+WNvVJURdConBDeEW5PB3F06vQd2+7lK4iFWhDuZ0k71HVY7S
	 UMdGlZK9XZ8fw==
Date: Fri, 31 Jul 2026 10:28:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Peter Wang <peter.wang@mediatek.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
	Stanley Jhu <chu.stanley@gmail.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v10 24/26] arm64: dts: mediatek: mt8195: Align ufshci
 node to dt-bindings changes
Message-ID: <20260731-curious-unnatural-octopus-cef3e9@quoll>
References: <20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com>
 <20260730-mt8196-ufs-v10-24-bc5ecef202dc@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730-mt8196-ufs-v10-24-bc5ecef202dc@collabora.com>
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

On Thu, Jul 30, 2026 at 11:49:20AM +0200, Louis-Alexis Eyraud wrote:
> The MT8195 UFS host controller dt bindings now describe several extra
> required clocks that were previously missing from clock description
> and deprecates the freq-table-hz property use in favour of
> operating-points-v2 instead.
> 
> Currently, the ufshci node declares the freq-table-hz property but all
> values contained in the array are zero, thus converting it to an OPP
> table is not needed.
> 
> So, add in ufshci node the rx_symbol clocks in clock list and remove
> freq-table-hz property.
> Also reorder properties in node.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)

DTS must not be combined with patchset targetting SCSI/UFS, because UFS
folks were grabbing entire thread. Please follow the same rules as when
submitting to USB, serial etc.

Best regards,
Krzysztof


