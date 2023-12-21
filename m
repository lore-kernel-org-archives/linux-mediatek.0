Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AFBC46CCD
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 22:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUiKqlE2CAG2qliENKeXRMA9l6Bd2IWc9WFFo7nrKmc=; b=AeaSlbT3db2wUjavxOPt9KxUIi
	z6QV1v/wBoxLyD2CN3bppbUO6YIqSGeEpViYsdWXa8NoqYeB/A7LXxZ5Irl9PHipJoR5alxvSg4Ck
	1JsGQvW4jeRJlOUTD1kCO0G0vV7bZ9UBgpUI3nlBNbl7vmt7QUg/24tOPDZrrijPYIUwCarJ1Xyf3
	AQRwgcqc9o/UR6ZuUyYkZzFdfSVfHdNkihr2o3GPLj3QNSW7FUzPbDgGZB7p+HGaBUylAcSdUbHqt
	XMLxyiBujz2NKUFlHOdx4vRZp57mWPZQ55zXGHGz7dpLsXmXh0Lsh+QuYh3gwHMftK5ydOczVHCKI
	uAtGpj5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGRXw-004Jn2-14;
	Thu, 21 Dec 2023 22:29:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGRXt-004JlF-07;
	Thu, 21 Dec 2023 22:29:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6FEFBCE203C;
	Thu, 21 Dec 2023 22:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227AAC433C8;
	Thu, 21 Dec 2023 22:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703197774;
	bh=3olSdqCH1RJ2MPrPxBn2yqWGIxPoGVfij5wrm0E4WBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WQmpAzbQVhum7pt8MnB5a/VRcUcuMzWWOygOildljSPEjspTWsN83Xs3do5JEyt4B
	 wOCQgDpqhdFiW0WB/4sfRaIcd+qt5e7eTZSHRVCWTIFXFmZWl3uUc4gJ5glMTBM9pC
	 8opfAwrvBB5vm3T4T6bfmRyk3L3xtHbGRrKQgs+ztgCeb9W7qwzwX0LS/nQOPDFmk/
	 1J9++p45KKmNAvXL4jeQgaDDYSYHdw4nnmacHwrGB/e20j87aqa572TAD0p2q4cdB8
	 Q8cHuXjlwkKXyyGPSr03UR34eKjWumho6+z1zy94B2cm6b2v72lysJKg8LDsDKrji0
	 zqwj9JXTs/AeA==
Received: (nullmailer pid 205437 invoked by uid 1000);
	Thu, 21 Dec 2023 22:29:32 -0000
Date: Thu, 21 Dec 2023 16:29:32 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 02/16] dt-bindings: media: mediatek: mdp3: merge the
 indentical RDMA under display
Message-ID: <20231221222932.GA196757-robh@kernel.org>
References: <20231220100853.20616-1-moudy.ho@mediatek.com>
 <20231220100853.20616-3-moudy.ho@mediatek.com>
 <250fead9-868b-4063-a054-4cb966dc4ba3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <250fead9-868b-4063-a054-4cb966dc4ba3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_142937_242938_079474DA 
X-CRM114-Status: UNSURE (   9.83  )
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

On Thu, Dec 21, 2023 at 10:28:52AM +0100, Krzysztof Kozlowski wrote:
> On 20/12/2023 11:08, Moudy Ho wrote:
> > To simplify maintenance and avoid branches, the identical component
> > should be merged and placed in the path belonging to the MDP
> > (from display/* to media/*).
> 
> Combining bindings into one bigger meta-binding makes it usually more
> difficult to maintain and review.

Yeah, but these mediatek blocks appear to be used for both display and 
video codec pipelines. So having different bindings was probably wrong 
to start with.

Rob

