Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422C5CA0FF7
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Aug 2025 08:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wK4Er8KjkwMDiCqZCZ7Wf/p6TGj0YR9zxNdMYL6U4zs=; b=Ym5bB/OfXmg6cgAS9qmgCEbDz0
	nffzE6LbehAQI4bNhnB4rDCqOj29HmY+iNCkLlrY9b1FH4uErIE/oo6WqhxXrRmnN8SWd+o0VtctQ
	cT2SXHmkNFwr7nFpscavn9Zj+P0POq3ngrqs/rZXSBDhXTM0BI+RHczpCnu6AiyG9Qhex24+Vk+Vc
	3rxlCq5C0Pdp0piGvZflyoTn2L977JWPGbdX0g85mz3xk6EEx+4NHuE4l64SNNhggSF4UjHPIR3ar
	2uq57hafTSp5B6QSSNiUsjbUSMR1L/VklB9o/5HlCAY50uKjdIzXDxESizVc96npSg0aMdfyjJPt7
	94rTqX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uruK3-00000004wMR-3qK0;
	Fri, 29 Aug 2025 08:18:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtrK-00000004p4o-2quX;
	Fri, 29 Aug 2025 07:49:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B2B343F96;
	Fri, 29 Aug 2025 07:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF26DC4CEF0;
	Fri, 29 Aug 2025 07:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756453758;
	bh=dF+v6pBPXAEvo6aOXOvywP1ufSrZor0h7MkaWLQK5dI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jh7eyiPa+eTuVCyVjfAOPherneBnYDfNTkkbV3vRkFZt+w3aJYb3ZgmwsHTGBeCV8
	 9opq4JF0YiaNpyxxy4hJGoP0ArtNLmEfS3K2BNjPgFUWeJpngtBvF1sfX9P19pIC24
	 q0Ji295VEt2zSosrb/wFyYW8l/S8w56yvuEsyiXH5Nvy6DgTYWEwvreqjwDTDotVaI
	 +AJgHkhAiEKMcXw8F2FG2loRDBSqa5z8+sPBTJsKFkuOwQFMHyAMubkbs8lfyIqbEY
	 m7lIpT/gqMkddw2gO5F2hbZLpSwVLCaLew3c61ViQFr3EVP2zo4r//rxrpYVVLQGwE
	 p7tqkgo4TLyfA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1urtr9-000000000Zj-07S0;
	Fri, 29 Aug 2025 09:49:07 +0200
Date: Fri, 29 Aug 2025 09:49:07 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, "Nancy.Lin" <nancy.lin@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: fix device leaks at bind
Message-ID: <aLFbcznLUutbMo6r@hovoldconsulting.com>
References: <20250722092722.425-1-johan@kernel.org>
 <aK7VCJ9yOKntjgKX@hovoldconsulting.com>
 <CAAOTY_-CijzQqrRUf_=cQbTUSybN3GT46q0vx1139mmZub_OfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAOTY_-CijzQqrRUf_=cQbTUSybN3GT46q0vx1139mmZub_OfQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_004918_742854_3E7785CD 
X-CRM114-Status: GOOD (  14.29  )
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

On Fri, Aug 29, 2025 at 07:51:23AM +0800, Chun-Kuang Hu wrote:
> Johan Hovold <johan@kernel.org> 於 2025年8月27日 週三 下午5:51寫道：

> > On Tue, Jul 22, 2025 at 11:27:22AM +0200, Johan Hovold wrote:
> > > Make sure to drop the references to the sibling platform devices and
> > > their child drm devices taken by of_find_device_by_node() and
> > > device_find_child() when initialising the driver data during bind().
> > >
> > > Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
> > > Cc: stable@vger.kernel.org    # 6.4
> > > Cc: Nancy.Lin <nancy.lin@mediatek.com>
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> >
> > Can this one be picked up?
> 
> Ma Ke has sent a similar patch [1] before you. And that patch fix more things.
> I've already pick up the final version [2].
> 
> [1] https://patchwork.kernel.org/project/dri-devel/patch/20250718033226.3390054-1-make24@iscas.ac.cn/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-drm-fixes-20250825&id=1f403699c40f0806a707a9a6eed3b8904224021a

I'm afraid that patch is completely broken and introduces a potential
use-after-free by adding a bogus decrement of the OF node refcount.

I suggest you drop that one and pick up mine instead which is correct
and cleaner.

Johan

