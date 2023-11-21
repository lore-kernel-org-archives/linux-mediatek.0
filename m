Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A84C61D85
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 14:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60B3pY2Xh9Y2HNT0lmY5uQ/shIvHzIzMRUkrhJKA0Io=; b=FYcgSjdgIXdgbfovRMSvO/+VX1
	OMpelJOtb/y02H8SagZnW+vCXjhudscVHXceZwoMqCEcJGpniXLSXTBbdyXoIAMKoyZbl+w9Ms/9t
	RjUM65x8abkqx3KeeQthlW6sQ95hwEaCkZz1kCRQLVbHqk9+6vYRuQK/6nDQsx6a17LA/WosXgQcm
	y9g+DRhfyNTJmMy0uRDDr/0M7noLjnY9/vfAPWuqJSOIlSpz80S6Ht0NfKXzlPkYEyPZJTh0lWvMP
	/5UQH4PQeHaQUZh0PucXPdnpuSkJDSXFN1Fds7Y+unCsY/ryZSlDkAIPxwhntVlE4saQEeOVG/+GN
	8ZCbbU/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RPm-00GzPG-0b;
	Tue, 21 Nov 2023 14:07:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RPi-00GzND-2c;
	Tue, 21 Nov 2023 14:07:44 +0000
Received: from notapiano (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 45C1966072F6;
	Tue, 21 Nov 2023 14:07:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700575651;
	bh=tOGWTmQJW/JANHeyGfQepL3uI6iHK1P8zxtRmtORk2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C4syRfR21MGFLX1wH3nywSpQpCUGVfO1aI/4C99i7AxCnFTJB+cas+a+yAy/3lsL1
	 ApnAIbNuyYVeDlg9mff0itSwKCOvUF+P1BOS/qrkMY0MrAaWs6EbPSdZbhmbn+kZg0
	 NFXmAiDw5AU7uiAa0cmpJQWDp5O48pa7rGT+AdP85Q1ogWoW+tAID6+tpMmFafhJ4z
	 H9ZkUeXDPVHO7kro8Nl95ff6G68TOkqGJmFUyoAFKxBgCoQkavB3XgfDC18kzxEt2t
	 /v0H3r4k5++qjcZCJu7tdUFKbck/1sxl+MstUPYA0WWWnCBmwqFUDJy+kR99aQksNZ
	 e/yyLWFgkmo0Q==
Date: Tue, 21 Nov 2023 09:07:24 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, kernel@collabora.com,
	Bo-Chen Chen <rex-bc.chen@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Guillaume Ranquet <granquet@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] drm/mediatek: dp: Add phy_mtk_dp module as pre-dependency
Message-ID: <1de08400-8441-43b9-9104-395444bccc0e@notapiano>
References: <20231120202837.396760-1-nfraprado@collabora.com>
 <8fd1affd-936d-415e-9f1f-b0415b68ddb6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fd1affd-936d-415e-9f1f-b0415b68ddb6@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_060742_976581_CBC91ABA 
X-CRM114-Status: GOOD (  21.20  )
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

On Tue, Nov 21, 2023 at 11:59:14AM +0100, AngeloGioacchino Del Regno wrote:
> Il 20/11/23 21:28, Nícolas F. R. A. Prado ha scritto:
> > The mtk_dp driver registers a phy device which is handled by the
> > phy_mtk_dp driver and assumes that the phy probe will complete
> > synchronously, proceeding to make use of functionality exposed by that
> > driver right away. This assumption however is false when the phy driver
> > is built as a module, causing the mtk_dp driver to fail probe in this
> > case.
> > 
> > Add the phy_mtk_dp module as a pre-dependency to the mtk_dp module to
> > ensure the phy module has been loaded before the dp, so that the phy
> > probe happens synchrounously and the mtk_dp driver can probe
> > successfully even with the phy driver built as a module.
> > 
> 
> You forgot a Suggested-by here :-P

Oops, sorry, I forgot that tag existed. Will send a v2 with it added :).

> 
> > Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> It's fine anyway; being the best solution that we can use:
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> > 
> > ---
> > 
> >   drivers/gpu/drm/mediatek/mtk_dp.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> > index e4c16ba9902d..2136a596efa1 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> > @@ -2818,3 +2818,4 @@ MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
> >   MODULE_AUTHOR("Bo-Chen Chen <rex-bc.chen@mediatek.com>");
> >   MODULE_DESCRIPTION("MediaTek DisplayPort Driver");
> >   MODULE_LICENSE("GPL");
> > +MODULE_SOFTDEP("pre: phy_mtk_dp");
> 

