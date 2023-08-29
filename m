Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB65C6FA8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Aug 2023 16:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ur0uBaFJROiz/T4GjGiYvHEod4CSHQKyFRKKRd3Se9s=; b=YmxBbDiIVulwjTdVenscWwt9vC
	/60mxkW3RRs4mE8aMnwdibW0N5Oz0e7M0SqiQjIW8DdKT2wGfaT/VCaVeb/pq/V1wPtVv0nDt1iye
	NxC254aG6OkLxKnSsuCC2xbrIVkacMRrcRtDP8PyS+NezseT/Xj1oUeMtVhrWntxBNR9uLtaP1WI8
	OHlNjmzE2Fi8V8xSax98iaH6vQ7WRQ/Oiz3CCKX3zmD/iESDteU6/fLfG4mtldZEIxS4dMjslGYtT
	3jHeJ9wJS212WA1V09/zYcN9rHD/VLVLu3Nsvdk3IB8EMV/MtucvG2zvHVtXhQXksAK7WrcjEChwO
	LdyjpD8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb194-00Bp8m-1K;
	Tue, 29 Aug 2023 16:00:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb190-00Bp67-1B;
	Tue, 29 Aug 2023 16:00:43 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F4A56607236;
	Tue, 29 Aug 2023 17:00:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693324835;
	bh=JCfP29V3g/z06V7q+2qRQmI7uI0SGWM3SW0Z6ZJgNl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XMDriXCzwSEEe30YsG8nKNO4L66h3QBquvxvUS7YQbKvfTaF/v4utnOUazsTmr3WI
	 lOuX4955i/ct+lSgyN8T28c+Uksuu7ZLqwdpKl1bddyet1Hd2ngafJSKOHfBs/Qzsz
	 TjxkJd6B9rgqrVTItQ5VNlQT/pf67jTAw8pQt6SWSUUHnQgIWiptYtwDgayqVZFPb6
	 lqf8AeL8rg7Bh5V3jiYG8JUBb0YRZslko9/bJ0H7G+m/686w+vB3vrHdx+otVlcdU6
	 Dzis5e0zZSOPJQeM4KQrLXCSjMdbuP0p15LAsnNgpy4u36X9HWzboVHrqxbMhOiX4h
	 FKQ5M19VLxWaw==
Date: Tue, 29 Aug 2023 12:00:29 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH 1/2] drm/mediathek: fix kernel oops if no crtc is found
Message-ID: <16f85ad3-57f4-4cde-88fc-b9d0b763f9e2@notapiano>
References: <20230829131941.3353439-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829131941.3353439-1-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_090042_551014_815E0E6F 
X-CRM114-Status: GOOD (  11.30  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 29, 2023 at 03:19:40PM +0200, Michael Walle wrote:
> drm_crtc_from_index(0) might return NULL if there are not CRTCs

Typo: not -> no

> registered at all which will lead to a kernel oops in
> mtk_drm_crtc_dma_dev_get(). Add the missing return value check.
> 
> Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT8195")
> Signed-off-by: Michael Walle <mwalle@kernel.org>

There's also a typo in the commit subject: mediathek -> mediatek. But
regardless,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

(tested that the patch fixes the oops on mt8195-cherry-tomato when no display
pipeline is available)

Thanks,
Nícolas

