Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA4D606A334
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Nov 2026 14:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H0MDiP1w;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U4+o3+72
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/E3RY52GDj4TNMPPJaH93QZ9upC2WYUMh4er3d/oEMM=; b=H0MDiP1wFx07sWwPpsokkP7BrE
	xL9Xm09TZL97RGtLjsriQZvcbVPL8Wud5bdMY+7QyhC1O9LJ0O6V/M/Fe0myYk/15KnfJdpjivYGu
	xGBMuSwzwm/bamgAqTNlZ5JkTpUfIn/h6moXv3JC9DuAGBRsRDaO0Juw6BqX72cTLGuY2tU55VP9V
	Isij68K/HKNrEVMmkcECZjLYQ6vg07uGZARSYGpwd92+2drCoRBbP2coinAePbkAIh88X+vhs5fh1
	/zGuyyeo2wLH+XLNCb2pLJLlL1vXnCpYXseq6fCONSBbh5Y0Jo7IpgjgLmfqJ8oeFKDQ57Ogj1+1N
	A/PEzUcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV8c9-00000001CUU-2nEp;
	Sun, 22 Nov 2026 14:32:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV8c7-00000001CUA-3ewe;
	Sun, 22 Nov 2026 14:32:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E555A60D45;
	Sun, 22 Nov 2026 14:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819BF1F000D0;
	Sun, 22 Nov 2026 14:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795357938;
	bh=/E3RY52GDj4TNMPPJaH93QZ9upC2WYUMh4er3d/oEMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U4+o3+72Cc1R3NCJHpERN9bGqHo1CVD9lM+q+e1EpcDasyHI34kSLRw/icFD+kAaM
	 uOV/32mUe71E4q4P8VWkus81cwG6zCLxU5V80/qXmrsyqw2hPdOxemaIMIcuokuCf/
	 gwiB6LT8h0/MHJOFuI+ugzttKy3u0lKZ0kFHcdSt8Q2B1CuEDNvA/qORcMmhR/6d97
	 S8ASgDsuajn8KlxWpu87s9oOlPbOFa1k2tkupaUUU8UG54wulUCPVM7G5RTGCpFqy1
	 B0epHNwm7uPAtVXSb1+IpheegK1fK04xgCBDRbCBF0Vn2neJvsp8fVRm2+rHMHzOPe
	 7qzIcTfPlsytQ==
Date: Sun, 22 Nov 2026 15:32:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>, 
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, Hans Verkuil <hverkuil@kernel.org>, 
	irui wang <irui.wang@mediatek.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v19 10/13] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgdec compatible
Message-ID: <20261122-pristine-vagabond-coati-f6cfd3@quoll>
References: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
 <20261116013402.1273016-11-kyrie.wu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116013402.1273016-11-kyrie.wu@mediatek.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 09:33:35AM +0800, Kyrie Wu wrote:
> Add the MT8196 JPEG decoder and decoder-core compatible strings.
> Describe the child mediatek,smmu-config phandle to the dedicated JPEG
> SMMU configuration syscon and require it for MT8196 decoder cores, so
> the compatible and its hardware requirements are introduced together.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---

This was reviewed and your cover letter is vague about tag removal.

Adding new properties at v19 is more than unexpected. Honestly, this
should not happen.

I drop the patchset from DT patchwork.

Best regards,
Krzysztof


