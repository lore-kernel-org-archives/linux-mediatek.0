Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1951C00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Aug 2022 21:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xn/YDW1oxSCTPE3EsCbcQZP4Vaq6nuvLGE6elbjLbvw=; b=rPLPGV9Y0ETeLGX2tJMBl/tRqh
	R1/WeK+zxd3zxJhWFs3i3dgMzmqsTQv0RG8sDIehpb/GrJObm/fuAVkl1Mg1biOXGusBnh87rv2N5
	LgEh/VICBPl72w5MwJ1FLUfzAjdu/1szDlQT3Jk5Wl1OCgJ03xPJWwN53rbiQM7Nq1bMSnNWFOKB9
	EDcdSqJoeIMhgaK7gt730BSQ9x2uR2CHEO9x7k4/ioIl3N3Oy9tHxgxySWySouVgg5DkkSoEoyawg
	8xrsciNMEOgzifeBG3DWWBnd9UyBkZ4dGIljxfJyf0PpxklWa0k/VRUBAE75CbcnpGM3pTnEviVTO
	+dX1R6SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLt3K-00F3tg-40; Wed, 10 Aug 2022 21:15:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLt32-00F3fI-TJ; Wed, 10 Aug 2022 21:15:30 +0000
Received: from notapiano (korma.collabora.co.uk [168.119.224.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5965D6601C74;
	Wed, 10 Aug 2022 22:15:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660166122;
	bh=/jwBuBx79c+lk7i4kE7uZcAxqKWyDiBWEZ+cunWmR8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GvWzDwX0VnghTEO0QFED/hL1bYc0BmK5NdO9GgXLRMZBmo4xFdsI1+HUKIexdrZU3
	 t1kciV686A0kO1LKnmvEBDmN+HU/UKXcHqBwOB9IXx4viufCZbIt9AWT3vohoycFYh
	 j5SrFZnSKHHuMJHCXm4D8urFnrjLTBptx49lPhnwjMG4qbYz0XIBWY+mMuQU5KCZdo
	 mZwj59EUoqrrCEE1tqhQVnkytD8qIB6mRQ4BI55in0xWVcqUVI7veJatspDIz3HqTo
	 q1hzwfwFbF3x7fmqd8OycPrqam9pIxQ7tqz54EFzf/QX+esMGspdF9PKcuU7Efp3c3
	 +hmmAOJaqc7gA==
Date: Wed, 10 Aug 2022 17:15:14 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
	daniel@ffwll.ch, matthias.bgg@gmail.com, rex-bc.chen@mediatek.com,
	jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/mediatek: dsi: Add atomic {destroy,duplicate}_state,
 reset callbacks
Message-ID: <20220810211514.nmufrsi6gssb2kel@notapiano>
References: <20220721172727.14624-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220721172727.14624-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_141529_199619_8734BB1B 
X-CRM114-Status: GOOD (  16.92  )
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

On Thu, Jul 21, 2022 at 07:27:27PM +0200, AngeloGioacchino Del Regno wrote:
> Add callbacks for atomic_destroy_state, atomic_duplicate_state and
> atomic_reset to restore functionality of the DSI driver: this solves
> vblank timeouts when another bridge is present in the chain.
> 
> Tested bridge chain: DSI <=> ANX7625 => aux-bus panel
> 
> Fixes: 7f6335c6a258 ("drm/mediatek: Modify dsi funcs to atomic operations")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Tested on mt8183-jacuzzi-juniper. As part of enabling IGT tests on that machine
in KernelCI, this regression needs to be fixed. [1]

Thanks,
Nícolas

[1] https://github.com/kernelci/kernelci-core/pull/1059

> ---
> 
> Note: The commit that has been mentioned in the Fixes tag should
>       *not* have my Reviewed-by tag, as the author changed it but
>       erroneously retained the tag that I had released for an
>       earlier version of that commit (which was fine, but the new
>       version broke mtk_dsi!).
> 
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 9cc406e1eee1..5b624e0f5b0a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -808,10 +808,13 @@ static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
>  
>  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
>  	.attach = mtk_dsi_bridge_attach,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_disable = mtk_dsi_bridge_atomic_disable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_enable = mtk_dsi_bridge_atomic_enable,
>  	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
>  	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>  	.mode_set = mtk_dsi_bridge_mode_set,
>  };
>  
> -- 
> 2.35.1
> 
> 

