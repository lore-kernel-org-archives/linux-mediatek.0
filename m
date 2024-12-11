Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAE4E7717D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 09:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDQ+IclxYQXuRj+EsyaZ4CUxTq+VoKpOPtTeDdrdCCc=; b=YBsy+TPrsTucXDGFJzAHFK5zj5
	Bx9AJJ+YEn1I2uKUyMgeZdk1p2uH73e1A7Zp7q4Xzmu/tLshYwbtPfw0G9gMIxYjqjWSdTNlcBRo2
	p3siGD1Fa+pzJrwmHA0bMKKTbIrIjR4YfEP3M9QXIPuMNPJhT+GbC7mz/xe56Lh08rBdTiPxnmb+V
	gDF9ly/Es1/dwV+XAtJqgd25r+LtPAq8c0TWX4u5rE4D9vvqoQ/dNXrczFYQcrtfUjkx5Z4mQFL3x
	6p+R24EEqiU8PsQZccma7kajGV+SLD8WQVoVxH+ciTMXk2A/P/ugdtRVo9+D4bu+hXE2j1+agCAD9
	5y1WsDwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJCi-0000000ESSu-0VKK;
	Wed, 11 Dec 2024 09:40:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJBd-0000000ES87-08Nx;
	Wed, 11 Dec 2024 09:39:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EA3E8A41FDB;
	Wed, 11 Dec 2024 09:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FD0C4CED2;
	Wed, 11 Dec 2024 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733909956;
	bh=CSDhiOEmbfrkwtGpS8rSLIKuetIToYhzF+eZR29YgAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OtAXYuje0C0W2XsEKYln45lBU/EFfMLyJZqXQmHotXtIwH27nE4f0HZBJlpUs4D8m
	 7lcuS70CTinpynbUtwW5HEJoQ1yZ4WAAL134eDLuXdEOgobZcSiQrPzqwmNOv1Xp1W
	 XQsOKSo3GsSoVSRhaZoVb9D11MJhEmleTLCRzbzDk9JNE9egOHimNP4/0IXiOplxCs
	 dDS9mMw9TI+88mDzdk3qrJ0FaEe95qXFd6Bzvsd+BjcFKSJjxyw2Om70/wT6uCGizp
	 yW30CeMS3HTD7cWWxfwYPvZZ+dB9NjLKwASqxUDnS5XLC188u0ONd7gmhIV3Mpe0Bm
	 GaMAI7SaSecyQ==
Date: Wed, 11 Dec 2024 10:39:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, 
	Xavier Chang <xavier.chang@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 2/8] dt-bindings: mailbox: mediatek: Add MT8196
 support for gce-mailbox
Message-ID: <yhfxpflyumevs66sdwgiiyuablpfxfxw3e7ybrxju7ssicmnu5@truuiuvxlq6e>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
 <20241211032256.28494-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211032256.28494-3-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_013917_126411_1537B30A 
X-CRM114-Status: GOOD (  10.35  )
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

On Wed, Dec 11, 2024 at 11:22:50AM +0800, Jason-JH.Lin wrote:
> Add compatible name and iommus property for MT8196.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml     | 4 ++++
>  1 file changed, 4 insertions(+)

Headers are never separate from the bindings patch...

And you reveived exactly the same comments before which you just
ignored.

NAK.

Best regards,
Krzysztof


