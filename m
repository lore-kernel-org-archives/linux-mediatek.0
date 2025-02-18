Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4CCC021AA
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2025 08:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Ia8xqkMLKuhWa5sJpGPzMxWHn2yM14h0dTMwoK/SOg=; b=qIkU/Vfz9YrlE1tR+2g9HpYHOO
	RqHaor4GGU3d2iYU/DnBz1vVFtFtMmyYS1vdbRBqInxGL+hLzW2YbyaDcpwJAcv66AnJmOlJ8yD6z
	K77s5KWM5JbgK3TmjFCU5738vIz9DL6T3nnH5GlJnUsPBmvWK6czgR/X2xWRb9g1QretAM9AW7VYr
	PAWZzKCFEL1HCCkpf8CYird70PCtaQ3vHV6FZVvL23ibZz6J1KnNovusjSmgKPPJoRfZjaRsXvMKx
	cxDFT8vdgBIACu4D7K74m9p6/8HLBmXLRQUYgf//nZC9yCu9Dvahty0SrDwy7pYVxJcc5ZUnL4cjh
	G/Z33jyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkImR-00000007DhV-2T09;
	Tue, 18 Feb 2025 08:16:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIib-00000007CTf-12jK;
	Tue, 18 Feb 2025 08:12:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 83434A41DA3;
	Tue, 18 Feb 2025 08:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52511C4CEE8;
	Tue, 18 Feb 2025 08:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739866356;
	bh=m0uzICN3CTQeSUf/G77xR807tJo8YURiD8Lpz5F3ens=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IQRi2VmvFsxCUwDouh54xRwY0cY4kmYzRFK8LAGBUCczQ5U1izTJrDWOi6rz1KfUt
	 goxHiFMqd0AWPpsfvy+HJbCIBsBzEvMlVkm90Hn1Wu6nzQbTorNu8WcFIBAkm9B+HJ
	 nbG3WQ385KXyW9FZthjupNrV9+nm6jX5T1yDRGuY0gLKobJmvB1r55CMQt0yH4dOAd
	 9yjcdH8R6YIng+qM6PvycbzemR4koU2b8ltMNQg6/jAeUr4gFLTds1CaMoaBBtY0Tk
	 klNNYzDYu1BR/pBi1QGxcS8RIlzjmrd391OatYOmQm0ZQtaldWlsb8kDI6FdhI/xEL
	 3QlKkcPjc8I7A==
Date: Tue, 18 Feb 2025 09:12:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Subject: Re: [PATCH v4 1/8] dt-bindings: mailbox: mediatek: Add support for
 MT8196 GCE mailbox
Message-ID: <20250218-cryptic-pompous-salmon-d816ea@krzk-bin>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
 <20250218054405.2017918-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250218054405.2017918-2-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_001237_347083_2E116418 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: Singo Chang <singo.chang@mediatek.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Xiandong Wang <xiandong.wang@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-media@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Pin-yen Lin <treapking@chromium.org>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, Xavier Chang <xavier.chang@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 18, 2025 at 01:41:46PM +0800, Jason-JH Lin wrote:
> Add the compatible name and iommus property for MT8196.
> 
> In MT8196, all command buffers allocated and used by the GCE device
> work with IOMMU.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml     | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


