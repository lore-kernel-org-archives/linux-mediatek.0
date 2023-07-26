Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C187CC001DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 19:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TZ3FHua0wDFIGJprY4NFX10spgBxW6JuVbPdcWeFm4=; b=EqEp1G8dooqQzfy+GrKHV3nejw
	dPyxSqMAiUZ/gzHiSpY3Ytn5Y/WnceUl84dSzjixscI8bfb3F3HMs/i8QYu0tEKc2xaxgMJhAh+RE
	mgalXoqTspJuC39wMl6muJte6tK+Lp+rwFb/wlLRvcwtXuul8FxwTQxYgJD+RXgP7VfCfPQJPyxjQ
	DBr62bza4uaELCvbXGaibSi8w+R7pjaihfqzv3HNIjIdGodp27gW192j2Jx2fgDCDyGdh9kPpowod
	uPtApJ+CVGQaEdaP6m6ewQ7tkDSFUHD+iSQLnIYyCgudyk1MtvthVDpZgwZhjlp1g7i78vT9l9NRH
	CP6AFslw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOjw2-00BLs2-1b;
	Wed, 26 Jul 2023 19:12:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOjvy-00BLqs-34;
	Wed, 26 Jul 2023 19:12:32 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 352A56606EEE;
	Wed, 26 Jul 2023 20:12:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690398743;
	bh=G4FpupW9DEtNaFD9OegV101Badg4Woe69O1Mqu29tLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FyHgYP+LMWGPpR15ecxcluCrj2UnBtlDXh8fp8ZMNDaNCBAp0In6uhGIcCn7Aezzj
	 PRc4u0m9VvHNAVIy9dWSwgyitMV0Q5icqDBwutExWf+dZrY5+wIyMXjAVTCVx5XGZL
	 yeS5ECBd/e9RNY/4e/igKjEr0qnOd1IMidJ2K9pB7jPBlXM8t6lFNBI5gDZAA3PGLM
	 2UE3RbG5fYmKQyJCuWVNjxKxLcfVaK29FcrnbJRDbAV/YuQ804rOxY3PAHPttu8NRf
	 vP0FGCSBLFCb2GcnDkRHEyV3GJA9kiZ8vCgEh1o9wV4ArtcTupNkP4JjgLUc2loO12
	 BQ1Tlt8U5x7Xw==
Date: Wed, 26 Jul 2023 15:12:17 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 6/7] arm64: dts: mediatek: mt8173: Drop VDEC_SYS reg
 from decoder
Message-ID: <8b9bd1ba-5d0b-4eaf-8284-d9f0c523d358@notapiano>
References: <20230630151436.155586-1-nfraprado@collabora.com>
 <20230630151436.155586-7-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230630151436.155586-7-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_121231_148994_C99393B5 
X-CRM114-Status: GOOD (  11.85  )
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

On Fri, Jun 30, 2023 at 11:14:12AM -0400, Nícolas F. R. A. Prado wrote:
> Remove the VDEC_SYS register space from the decoder, so that the node
> address becomes that of VDEC_MISC, solving the long-standing conflicting
> addresses between this node and the vdecsys clock-controller node:
> 
> arch/arm64/boot/dts/mediatek/mt8173.dtsi:1365.38-1369.5: Warning (unique_unit_address_if_enabled): /soc/clock-controller@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
> 
> The driver makes use of this register space, however, so also add a
> phandle to the VDEC_SYS syscon to maintain functionality.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Hi Matthias,

just to let you know that Hans has already picked up patches 1-5, and they're on
their way to the media tree:
https://lore.kernel.org/all/af0772c6-7052-ce13-dbf3-d403b06aad02@xs4all.nl

So feel free to pick patches 6 and 7. Though note that these DT changes depend
on those driver patches (commits 1-5) to work.

Thanks,
Nícolas

