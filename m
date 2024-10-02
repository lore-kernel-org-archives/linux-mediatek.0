Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F98CF3196
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 06:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3aSrb8GpuPY02UoCohCcvhceg8N89TMRkKZwvkYi7c=; b=v1kC6nRxzdxs9/6Sx4lcttg4mM
	iwzfNp7QhKPmWGRpnw3d8nol9H5Wiso3aCVK5otqm3zarpbozBig0kKel1rJFbQAM0z41YDlNCgAh
	HzZum2OxXNDGuGNMYcel7ugrksDc40MaJgPx8lnrpdFkNdkOMFq3zhqjTukFq3LEELax0ntJSjjeC
	sn4hsqy6sqksaCjSV/uU1z+/8j1cJakAVwSVi0b1k3dZXLs/nAyrXUVrdQYD45eckQeTNGjA/0URv
	3r3cClyACj4clH83yVlb/5SAMsj3NYNPPZJBHxKoR56KlFx9ZuA+jyYbVJR2JGcIV/HfCNjecbI4i
	QfQ0UATg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svsVE-00000004uA8-2jsh;
	Wed, 02 Oct 2024 06:06:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svsTO-00000004tx8-260J;
	Wed, 02 Oct 2024 06:04:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4C705A41441;
	Wed,  2 Oct 2024 06:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B438C4CEC5;
	Wed,  2 Oct 2024 06:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727849069;
	bh=eRDH2gRHruASGT5jIjGwtC0n2ZkTL8neYpxlhmRvEhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o1l4vKo+R24aKUhtoK4RPWqg3hTdfs5DZ8QTcKArXPES9xZ/CMZxzDEIDZmGdtBN6
	 i4YrOt9UWjUMHOMl+Vc3xNYigCtDHmP6ZIqlrw2/KUTRP7g8iWO7MtU+NVW38eHma+
	 Hjo3/2okxFlyS6xpnivTf8T3Hp/fvqkFjo2y4tAMP39+z49ZYFyP9d0uY+PSSHe4LY
	 0J6j4mBx5kBwn3uvOpSX+B0VHnjPazoNR1M9X2CaYcLOSXAx4pgJlXxrAVTXUmJNK8
	 dk7SnCyAkfFVdwuLjcFeTM+cxgMgqVHULozvZp8tsLuCbMbPkdxiRP1E8qlIbxFtqs
	 S8cnpJhj1mNuA==
Date: Wed, 2 Oct 2024 08:04:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rohit Agarwal <rohiagar@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Alexandre Mergnat <amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, 
	Chris-qj chen <chris-qj.chen@mediatek.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v4 5/5] dt-bindings: display: mediatek: dpi: correct
 power-domains property
Message-ID: <idkorrjd5g2yjcnclks55pozf6rrv2w4fyhbwaaznvq5ngmcdm@vxpjh6q4visi>
References: <20240930083854.7267-1-macpaul.lin@mediatek.com>
 <20240930083854.7267-5-macpaul.lin@mediatek.com>
 <20241002015120.GA236278-robh@kernel.org>
 <7f212146-3dc7-9a0d-baf4-ac7a5b845060@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7f212146-3dc7-9a0d-baf4-ac7a5b845060@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_230430_699675_9825ECE6 
X-CRM114-Status: GOOD (  24.91  )
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

On Wed, Oct 02, 2024 at 11:09:07AM +0800, Macpaul Lin wrote:
> 
> 
> On 10/2/24 09:51, Rob Herring wrote:
> > 	
> > 
> > External email : Please do not click links or open attachments until you
> > have verified the sender or the content.
> > 
> > On Mon, Sep 30, 2024 at 04:38:54PM +0800, Macpaul Lin wrote:
> > > The MediaTek DPI module is typically associated with one of the
> > > following multimedia power domains:
> > >  - POWER_DOMAIN_DISPLAY
> > >  - POWER_DOMAIN_VDOSYS
> > >  - POWER_DOMAIN_MM
> > > The specific power domain used varies depending on the SoC design.
> > > 
> > > These power domains are shared by multiple devices within the SoC.
> > > In most cases, these power domains are enabled by other devices.
> > > As a result, the DPI module of legacy SoCs often functions correctly
> > > even without explicit configuration.
> > > 
> > > It is recommended to explicitly add the appropriate power domain
> > > property to the DPI node in the device tree. Hence drop the
> > > compatible checking for specific SoCs.
> > > 
> > > Fixes: 5474d49b2f79 ("dt-bindings: display: mediatek: dpi: Add power domains")
> > > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> > > ---
> > >  .../display/mediatek/mediatek,dpi.yaml        | 24 ++++++++-----------
> > >  1 file changed, 10 insertions(+), 14 deletions(-)
> > 
> > You missed Krzysztof's R-by tag.
> > 
> 
> Oh, I just missed that reply for v3 in the mailbox
> and thought it still need to be reviewed.
> I just found Krzysztof's R-by tag in the mailbox right now.
> 
> I'll send an update for this patch set.
> Thanks for the reminder.

Plaese, instead just start using b4...

Best regards,
Krzysztof


