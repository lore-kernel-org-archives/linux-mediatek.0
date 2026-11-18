Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C98D60A3818
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 15:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2faZt+Bf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W8zw2Mm6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CQtt6NUcccISSbdyEpvPqzDH+yf6OBeSB8twsD4QtO8=; b=2faZt+BfjeT3SNaymqtCR9DAYs
	jsvE/aZxu1WK3nJslTGrFGCEApQOYeEoWmPO6nswQKDKxgj2Q7o9P58QLUEIJNQ1BcApQmxoQBfdU
	ZNp4Z3rnxbkj5ukXHOAM0bNsMOeKAihw5+kxgTmyQY7+1mnQPDUN8vpn0Dm09uSUCaScqynEExfF3
	4qX1kEvYcKHQtjxzpVnWwQZCHHtynKu6shTLVKXCIn5NXnbcAhgxch/5x/vC2GsWUknkhQNFj666K
	R9DhU2kAw0ErJPbTTDBvL51czTi2YtDldu9/aIRtoHtMvy4NVpKHbsPHnRaqZCnaqPEldjK6c8phy
	Uv0cUPCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThUO-00000009Gcf-48z7;
	Wed, 18 Nov 2026 15:22:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThUL-00000009GZx-39KR;
	Wed, 18 Nov 2026 15:22:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 251444567F;
	Wed, 18 Nov 2026 15:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27A51F00927;
	Wed, 18 Nov 2026 15:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795015341;
	bh=CQtt6NUcccISSbdyEpvPqzDH+yf6OBeSB8twsD4QtO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W8zw2Mm6V6Fv+uT0ZNqI1Cvw9GEO2JwPmKoZHpbqqWsKoXlB8W8+sHkz8Senji5ca
	 7o6fygfYkLnYcO+fxJ4og/OtywPoDINQIJz8I05NbErdclxqvVKDB8rhmXSACnQqM5
	 xZGF2BFxKR5DhmubJtiyDIrQTLzRGxJqCaKfKoB7PPXpa4J0KJXl3qVwBMYG47txsY
	 pAt29173IoOHxUpZ0tylehRSEX75aeIGvIAP+5zyzgNpoKudptSsnrGWg3uFWS23Oe
	 gsqspEiqKGuBIslxCEH7WfK+5Lw0iIJKj9n/qSxQXUHyjEr9TBsTVsT3jCdrV+Hain
	 +ZGuc0so4b3nw==
Date: Wed, 18 Nov 2026 09:22:19 -0600
From: Rob Herring <robh@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: Re: [PATCH v9 08/14] media: dt-bindings:
 mediatek,vcodec-subdev-decoder: Add MT8196
Message-ID: <20261118152219.GA1746506-robh@kernel.org>
References: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
 <20261117032950.1425556-9-kyrie.wu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117032950.1425556-9-kyrie.wu@mediatek.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Fan Wu <fanwu01@zju.edu.cn>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Kees Cook <kees@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Haoxiang Li <haoxiang_li2024@163.com>, Irui Wang <irui.wang@mediatek.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-mediatek@lists.infradead.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Qianfeng Rong <rongqianfeng@vivo.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Ricardo Ribalda <ribalda@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 11:29:44AM +0800, Kyrie Wu wrote:
> Compared to previous ICs, the MT8196 supports a 10-bit decoder
> and has a decoding capability of 4K@120fps. It also supports
> 36-bit DRAM IOVA address and Video Power Control to optimize
> bandwidth and voltage usage.
> 
> MT8196 uses VCP to run the decoder firmware, so require mediatek,vcp
> for MT8196 and move the mediatek,scp requirement into the condition
> for the existing SoCs.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 52 ++++++++++++++++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)

This patch should be based on this one:

https://lore.kernel.org/20261019212431.4109371-1-robh@kernel.org

Rob

