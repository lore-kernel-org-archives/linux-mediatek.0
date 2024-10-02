Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122E0CF318C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 01:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1xa2uAGj1n+Icx0aIM2pYPLVfYgphRBJdN7Zz/pCSI=; b=NkWJgwA8IzacHW4LEtx71jucRr
	twS/O04lUx2KZzQa/Zy2gsh7rl4TZdSVm+bnSGBoyUU2kudIZL6EL9trUw9zcRis5YpSOn97xBkPM
	G2dREYnwsL05Vq3N1SOEz4zcVewpZRjMvuC3QMrI5kU0FCITS9O3G+txOtsgjcWobgsvOTsN5gBNQ
	bY9gJHhL/teNWPWCkDkGvb9giN4SiyaqcQjV15bweMG+YM6xn+TD5/GNJI95IpCLMLFPFSARsJNXO
	AD5imtHwnDG6XHKNzYp8oYAQ6b/42uuFnCRH5LKVQ6rEXYHTxQB/CFDtxGBjU4muEgLmjShVrMWLc
	MRVUKNVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svoXf-00000004a7X-07kN;
	Wed, 02 Oct 2024 01:52:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svoWQ-00000004a1V-3PPx;
	Wed, 02 Oct 2024 01:51:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2AD275C0366;
	Wed,  2 Oct 2024 01:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B85B4C4CEC6;
	Wed,  2 Oct 2024 01:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727833880;
	bh=5zXX1GxmTVudwxxhQ5BxxstLJNAqQANcQJXzqffqHKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fgXrHylnk4H2qzVpJwHSQAJfkFOvBS6/r9g91vMACFhmXgP7zU+vLRokgPa6LkNY7
	 bXSPx8cmJOqvFJuEnRBasaHi7xf1cUzHvKZuXLqMObFKbMi57bErYHm23AkzW/+bvC
	 LMfSWF90ZR7Zs5X3u0bjgPH5TXJz91afowjY1jIZNNuhhB1BCvE8PTvmPchffoSzWj
	 v0s8XkiGTGtKJWWadIIU6qQiPLzEUC90VbFCsZU/IBGo9gPegMMuOIlSMzxL81cAM1
	 P93xMA7fWMzVolNuI0scTNJzgDzFw6LefUd2B4uqbUXLizU2lX3AqB+E9pgmgLlvdu
	 GLdNR7bWWsY6g==
Date: Tue, 1 Oct 2024 20:51:20 -0500
From: Rob Herring <robh@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rohit Agarwal <rohiagar@chromium.org>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Sen Chu <sen.chu@mediatek.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v4 5/5] dt-bindings: display: mediatek: dpi: correct
 power-domains property
Message-ID: <20241002015120.GA236278-robh@kernel.org>
References: <20240930083854.7267-1-macpaul.lin@mediatek.com>
 <20240930083854.7267-5-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930083854.7267-5-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_185122_919485_D1BF11CD 
X-CRM114-Status: GOOD (  15.65  )
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

On Mon, Sep 30, 2024 at 04:38:54PM +0800, Macpaul Lin wrote:
> The MediaTek DPI module is typically associated with one of the
> following multimedia power domains:
>  - POWER_DOMAIN_DISPLAY
>  - POWER_DOMAIN_VDOSYS
>  - POWER_DOMAIN_MM
> The specific power domain used varies depending on the SoC design.
> 
> These power domains are shared by multiple devices within the SoC.
> In most cases, these power domains are enabled by other devices.
> As a result, the DPI module of legacy SoCs often functions correctly
> even without explicit configuration.
> 
> It is recommended to explicitly add the appropriate power domain
> property to the DPI node in the device tree. Hence drop the
> compatible checking for specific SoCs.
> 
> Fixes: 5474d49b2f79 ("dt-bindings: display: mediatek: dpi: Add power domains")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dpi.yaml        | 24 ++++++++-----------
>  1 file changed, 10 insertions(+), 14 deletions(-)

You missed Krzysztof's R-by tag.

