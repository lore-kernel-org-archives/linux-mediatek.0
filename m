Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68863C10F1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 16:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nY3auwUQ4IGAE5aF88xwHYxT32j0VcDBfimcS20F+o0=; b=xpqm01aTR1I2DsKDtkhiBMP90D
	7LuSBJ5aAlbSJOt5Ypb9sHPNKG00pXEOxVEwifAiYhF0S1vesd5b5O8e8b/DInQDQ4mfqiuoWkOs1
	dUK6SZJE5/pRj60PLv/V8js+Wi9GjGIw1kYaXn8rcn13QY8JY39s/bC5g5dBM0WP1jPs77q8GKjB4
	wbKJ6CPx6/Azda2GtoppjfKKRW5xRmID17FmRbIvbILFu0Np0JKhfR7aNDrQk/w95e6ocgo32Trr9
	VOFkZ5YVCZZvSeG2nGdmBmr9ce76YZgwVVDPS8VMtDGG3q4yVt/MwGssAroVzdQ40pwHr9DXGqC/d
	kD9jsV7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Nh3-0000000BzK5-1sas;
	Tue, 07 May 2024 16:29:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Ngk-0000000Bz84-1MQR;
	Tue, 07 May 2024 16:29:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4DC8ECE1255;
	Tue,  7 May 2024 16:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46773C2BBFC;
	Tue,  7 May 2024 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715099347;
	bh=dPChBTgN3pNTkEs39qbzPGhdirgHNSrhYcFvG2Sfkig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ijxKTfvRkApxZcFjD7YQUsrymcqd0uU5wkvTKh8iVf+V2joVZVCh4S0KkksoFOgQ/
	 PdCi8mwlCTk3PVsr/DzOtfJ1w30aDzpnprrCH5qzuWkQZ92+ME4Was184IcA45XsRd
	 IfcxdKKZ33G//bqXMIYFDZ2wkuK2DS6vIxqY5wpCFElnwl22ivwCVZTyZ476JvXm4J
	 f21KYREQSE7s+GKnfG9ft5ENAQ7EVSW5hv4pNRzZEV/PeM9j5gxpXHeFsiutys4k31
	 9i49qlIxn60d/Zg9Iw2rGgxEJpklq0KxaYUtsPUb6jUQztNFfp/lKTN0+axcqipD6w
	 MhljztaFM37WA==
Date: Tue, 7 May 2024 11:29:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
	devicetree@vger.kernel.org, matthias.bgg@gmail.com,
	wenst@chromium.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, conor+dt@kernel.org, p.zabel@pengutronix.de,
	jitao.shi@mediatek.com, ck.hu@mediatek.com, mripard@kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	shawn.sung@mediatek.com, krzysztof.kozlowski+dt@linaro.org,
	dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, yu-chang.lee@mediatek.com
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
Message-ID: <171509934047.820109.12693254267558250910.robh@kernel.org>
References: <20240502115622.248456-1-angelogioacchino.delregno@collabora.com>
 <20240502115622.248456-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502115622.248456-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_092910_821551_2E6FD361 
X-CRM114-Status: GOOD (  10.46  )
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


On Thu, 02 May 2024 13:56:21 +0200, AngeloGioacchino Del Regno wrote:
> Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
> per HW instance (so potentially up to six displays for multi-vdo SoCs).
> 
> The MMSYS or VDOSYS is always the first component in the DDP pipeline,
> so it only supports an output port with multiple endpoints - where each
> endpoint defines the starting point for one of the (currently three)
> possible hardware paths.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


