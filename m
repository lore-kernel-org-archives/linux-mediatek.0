Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C242606A33F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 15:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y9Yiq+t/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WrJrZPxH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xknnVEsoR6H+3/0kZCcdKISh6bJJcx/A+zYzsrOLOcU=; b=y9Yiq+t/u0Zm0DRJMULWY7fOzd
	C8zgPlkIq66iXlPRYqcGxu9gVkhFciKbyykBDzO1jg79uJrd74DGXYABFqZb452M7Mm+95OT2K6sE
	NVPvt8GSGnbJhDMhW0CZevn26yT6QROz4nDJkBbV1QLWnbEd6rJcJncuAnRv01jr18N2jvmFmRUFV
	Frsq8jsmxew2NxHNXLuxGoQhA9Ot8EhO+cie6zurEtH7kORSGkRn8fQp4IUBSz3bIbAdY4vaEAM7V
	pBYVZ07gQCanfe+kOMSl4w187njhdhP5qPYlkOd/biUD0N/3nYyjDdYEP23vJqXFkhMO5bPJvX4xD
	Um9Q+jRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThSe-00000009FTe-1qu0;
	Wed, 18 Nov 2026 15:20:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThSH-00000009FAv-2Tmv;
	Wed, 18 Nov 2026 15:20:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 49F604333C;
	Wed, 18 Nov 2026 15:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8411F000C9;
	Wed, 18 Nov 2026 15:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795015213;
	bh=xknnVEsoR6H+3/0kZCcdKISh6bJJcx/A+zYzsrOLOcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WrJrZPxHUXZ+IFsZgxU8Y7E1hHXJjeNhUWufAidq9GR7LcBXj6VgxjGrG+tmfkuyc
	 7Xoy5/KzNkZxRpLPbzM3eJHTzUaUKijOwfNYYzaSu4/StslDMSwPrF5MGY8k9iPGvW
	 /Wtkl1eDEC58V6BL3xk0PWGQ16zKVwVgX90Muk7PUZEHvaDtYn0Ntzme6d5d8QNq5b
	 VLXWovhJ5TemjnIpexxW+CIwESaq3g16qFYE2kE+OChXWVUxshy4I+0LWJp/rtJMBn
	 5jVYxq37KBFKLPKBuCnepM8RHzxb0Qe2is0qQa7yZac2olnKbR48QrM9GJGKb/B+Fn
	 rAVUGnPt5vI1A==
Date: Wed, 18 Nov 2026 09:20:11 -0600
From: Rob Herring <robh@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Irui Wang <irui.wang@mediatek.com>,
	George Sun <george.sun@mediatek.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Yilong Zhou <yilong.zhou@mediatek.com>
Subject: Re: [PATCH v12 01/10] dt-bindings: media: mediatek: decoder: Add
 MT8189 mediatek,vcodec-decoder
Message-ID: <20261118152011.GA1714890-robh@kernel.org>
References: <20261117085834.1464723-1-kyrie.wu@mediatek.com>
 <20261117085834.1464723-2-kyrie.wu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117085834.1464723-2-kyrie.wu@mediatek.com>
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

On Tue, Nov 17, 2026 at 04:58:24PM +0800, Kyrie Wu wrote:
> Add compatible for video decoder on MT8189 platform. Compared with
> former ICs, the MT8189 decoder use iommu to instead of smmu, and
> use scp architecture, the frequency is only 406MHZ, and cannot reach
> more than 700MHZ. It uses two clocks named soc-vdec and vdec. At the
> same time, the decoder supports the vp9 decoding protocol for the first
> time in single IC.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 24 +++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)

This patch should be based on this one:

https://lore.kernel.org/20261019212431.4109371-1-robh@kernel.org

Rob

