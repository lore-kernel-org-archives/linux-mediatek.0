Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7B7606A337
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 22:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JYBvSnCw;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lzGln/yR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vonja/PWgylse+6hBXyJmA35GVq/syIKCdpb3rN0/Ug=; b=JYBvSnCwwhk3JQyi9qT+eFdYZq
	cYkyIwLeySHBSijhTomnheLAT1TMJ3kjB6jyZau5h4Y3KDuMv16V3pvzg6oacZOVBBvLcvjVoarLQ
	IZoC7sxW6BnXLBMfwRPyWGkfyZpNt1yWCXJ6xDumgvUAsLbbd/d7YeHLYkHZuNgI+B6N4ZTQxmBLu
	kKgSpkcKwgkjZsTYsonHUKIzXXO9rJqJs7y3wJ59oGdOQnjA4wFru3n/qjMSEMW1S19whR0xMS/tf
	98BHpidmFokRzDhrwr9e1lDYk2PKkCMc29l4yHsyt4EBw1Rkv34QT6BPipYtnl9hsds+0UVctDog9
	vOy7ve8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcY3-000000055BS-1tR7;
	Mon, 23 Nov 2026 22:30:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcY2-000000055B6-0ljQ;
	Mon, 23 Nov 2026 22:30:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FDB043C2E;
	Mon, 23 Nov 2026 22:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29DB41F000CA;
	Mon, 23 Nov 2026 22:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795473005;
	bh=Vonja/PWgylse+6hBXyJmA35GVq/syIKCdpb3rN0/Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lzGln/yRz0K8gY3hSZwX2LcHlzexYk9HaYmvAPnNhXpSPS4+QBaa7uf/ly9tyKVCQ
	 GoFTfFuDI1Y1q5tacn+dbIwATPLdJkVCLKFmgvbSYN4owZLfj/xf9spP7YNyUGiVxl
	 j1O5Z3ubd7CMwP2nZXMGRB9YhmTEpzbUqYmFt4cpH+fuplUeeTk/1PjYExrHG7uHOr
	 m3g95Ns7YbKow0C6U69Ac839inaU0aaEqE0FyFB4hxTL9Fvg5uOeiVZv0y1B/jAXY1
	 FFU1GvOaTFof9Z5A95t5tASH7cW4jneouftkDHQQFGakpcDV6woZUryvaQVSU54pfY
	 LfKyqWOAL35xg==
Date: Mon, 23 Nov 2026 16:30:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Simona Vetter <simona@ffwll.ch>, Heiko Stuebner <heiko@sntech.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	David Airlie <airlied@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: gpu: arm,mali-utgard: add mt6572
Message-ID: <179547300234.3122395.932903973826023560.robh@kernel.org>
References: <20261121-6572-dt-mali-v2-1-1c3925ec7ad1@protonmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121-6572-dt-mali-v2-1-1c3925ec7ad1@protonmail.com>
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


On Sat, 21 Nov 2026 19:55:54 +0200, Roman Vivchar wrote:
> Add a compatible string for the mt6572 Mali-400 MP1 GPU.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
> Changes in v2:
> - Pick Krzysztof's ack, resend
> - Link to v1: https://patch.msgid.link/20260810-6572-dt-mali-v1-1-fb908627bf23@protonmail.com
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


