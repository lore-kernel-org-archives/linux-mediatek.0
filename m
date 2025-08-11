Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B1CC87FD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 07:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0kQ0XEf/ViXtQuWIzdHwDKQC2+5B/wA3MfeWkXEqX4=; b=L3urynq8cqrF9kGAFycZydAw6x
	qTsmJoouAh/czVx6n1Y9I1VbLXL2Tm6z5cJHKgWHG/vfxymLXMSp/ROmWoITwONt29jtfaqXZEM3J
	bkkR67bU9OKHLRJP5bvmXe6h63Pjp2zViXBeWmZP2DkEbEPJV+MTYzHrdfNQrZoqQutGci52jTV9X
	uR04nX7wzKQExcP74gTEg/z+k11QD1bqne0Ti7E/BZPKt4UNvMBWJT5W+4Hi+qukR8qV7N3OXR+2l
	N8Nsd/yBGkK/2Bh0n0kVIpdIyRe7hrQ4AaN7jjNUeLggbV1OxalRYjqQhv6L7ehiB01vD9B0ih6SJ
	ppNRLcdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNPU-00000006mBP-2OO6;
	Mon, 11 Aug 2025 07:57:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNHA-00000006kgH-2271;
	Mon, 11 Aug 2025 07:49:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B3A1B5C5CF7;
	Mon, 11 Aug 2025 07:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67D9C4CEED;
	Mon, 11 Aug 2025 07:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754898539;
	bh=baeyeGu2iP9CInxAIYDtexBroZfdM4XJvypIfebRVLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pS0s9wkgtFc5B6v3228fIKrwjz7UIgdcv0vXy/fqkPBjTdyOcFAZBFlHoj8WF+BVD
	 KRjPMTHENl03ZVJv4l/y4D60A/L6+eYNk2kxuILQDPOZjLuC1v9cj/J+mCNmkePQC6
	 Y7ROJV4UUelNuVz/goa2hJ/K8DO0EcVXEuekzmZOs7wqGyJqixjsCVBXZmTjNA8ThI
	 zxgz1RN3CJBIk9zV7dywLiNreq7JTIFzvMB4DKrX0G6qL9fl+JDrKrjbeB52RwRW3D
	 qFIArXZKoI8RA9UP/rqVS+JVSYC8w4Lqy4eSv0HEsxP26+3SU5DoBuM6K/auqx50co
	 NJxVzKxw0uHWQ==
Date: Mon, 11 Aug 2025 09:48:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jay Liu <jay.liu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/6] dt-bindings: display: mediatek: dither: Add
 support for MT8196
Message-ID: <20250811-unique-finicky-toad-cc56a2@kuoka>
References: <20250808125512.9788-1-jay.liu@mediatek.com>
 <20250808125512.9788-3-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250808125512.9788-3-jay.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_004900_561715_6F1982D0 
X-CRM114-Status: GOOD (  11.15  )
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

On Fri, Aug 08, 2025 at 08:53:57PM +0800, Jay Liu wrote:
> Add a compatible string for the DITHER IP found in the MT8196 SoC.
> Each DITHER IP of this SoC is fully compatible with the ones found
> in MT8183.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dither.yaml    | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


