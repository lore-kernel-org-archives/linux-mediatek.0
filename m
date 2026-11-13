Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742E4606A887
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 11:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2yvAV/AN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lnQwca+G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RSjAt/HMlDCwd9HAhZBJnMn5PppCuKBya5A5l4sbxrI=; b=2yvAV/ANDpIz9UKrygwRKKNh2h
	vrETr6r/+abYa2FFSQT9qcj7CBYon+25ME1YDWqholTvtt4E/gJfvzXkOgbiWOVlptkZ0kRuwlU9A
	7jrCWMjFiV3T94jkflvqFHVcxAU5kOR0ZEM3W0zyjCIQDblNK0cd3o98LHg8VzBwI+ldOQHMBY+Rp
	KerUU+wuJiw6yBXjhMP3icgcyy6gZcyDFhU6kp61JYnWzY+20HXNyoSj940qVu/Kf1QIVEe6we+vc
	2cNZMZIx5VUHZA4o1SBXf2L0nmbMu3IB9PFsBDVu/TcqbBcDyMh6X2dVIZ/+e/78MzZS/RVC5qHh/
	qvE4TtiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpF9-0000000CVKv-0jy2;
	Fri, 13 Nov 2026 11:14:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpF1-0000000CVIc-1srn;
	Fri, 13 Nov 2026 11:14:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE47D6269C;
	Fri, 13 Nov 2026 11:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2771F000C4;
	Fri, 13 Nov 2026 11:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568486;
	bh=RSjAt/HMlDCwd9HAhZBJnMn5PppCuKBya5A5l4sbxrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lnQwca+GRqb9FF4YvJn83TpBwSIlBwMgzgMqa9qPEp9/y9n7wHAJ/l/2c8O2SOW0w
	 x8xiuInuRmiCjyQPxaMeOhcfUze8puQ9IygTHDbFqSYTmAcyyYmCYaTL/JnzpCs3W2
	 lczZCuss7/p4R7vt4obWXmRXhMneCtr1cEKgvro/pVyuk0vnhSk2MRt9QLTVLKMOhF
	 cbRugcTm0ap1ukMQvjQVVM36tuxOUYZIH2pWymCzixTQ61GHGvVIv9yT+rOUHidVZS
	 nTYkQwaRgAYy/7Oa3kx86UM143eBeSL+uPbwTQJn6PUsANzWb52tKpcFbgeewwKXHJ
	 zIT3TTAHVikig==
Date: Fri, 13 Nov 2026 12:14:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: mediatek: Add MT8173 Amazon suez
Message-ID: <20261113-marigold-narwhal-of-kindness-8ea023@quoll>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
 <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-1-77b47cdea702@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-1-77b47cdea702@gmail.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 12:19:50PM -0600, Ryan Brue wrote:
> Add an entry for the MT8173 based Amazon Fire HD 10 (2017) tablet,
> codename suez.
> 
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


