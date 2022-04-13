Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94338C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 09:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fmON+l93wZEQKrxfAEZHsAAtn5mnVj3nGwk+c8QeQc=; b=D9tADOAmPtrWhe
	cRdd8RImNjC7AHUvYXvC+SmgbgxXjpuAGjNVREfyKicAU8GJcqYZmdx44ZzRPuDPQg+Zv8wS7xwbX
	Kiq2/ZoNK2LNv5OhpRbMJ9Lrp2N7Lmh1Ho2OuxuesNuNBm7rZLm64yxiK2w9PB8T1VO4PRSu7n15E
	A8BFOE1XhBq6C231kJsh6rzOyU3XmgUYHa9o35giFN+T2KrGpq/XL8fQH/aGQ0640nYeRw05HofiW
	5o6qBM1/iTyxHB1mpHu91j9+vt5R4F/pClKE2GZheGzJvyfzdx2z5KaQICvL9Cs3Jgo/PIoi6GzrW
	eZ7w9Ptq/8F+E0j4DQgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neZ2s-000FxO-No; Wed, 13 Apr 2022 09:12:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neZ2h-000FtJ-BJ; Wed, 13 Apr 2022 09:12:04 +0000
X-UUID: 260690b3b10946e396f3655bee3ecb89-20220413
X-UUID: 260690b3b10946e396f3655bee3ecb89-20220413
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1858028856; Wed, 13 Apr 2022 02:11:51 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 02:04:53 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 13 Apr 2022 17:04:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Apr 2022 17:04:40 +0800
Message-ID: <720c5ede369357fb40152588c441614456b0f96f.camel@mediatek.com>
Subject: Re: [PATCH v4, 4/4] drm/mediatek: Add pull-down MIPI operation in
 mtk_dsi_poweroff function
From: CK Hu <ck.hu@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>
CC: <jitao.shi@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Wed, 13 Apr 2022 17:04:40 +0800
In-Reply-To: <1649644308-8455-5-git-send-email-xinlei.lee@mediatek.com>
References: <1649644308-8455-1-git-send-email-xinlei.lee@mediatek.com>
 <1649644308-8455-5-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_021203_417142_487F135B 
X-CRM114-Status: GOOD (  17.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Xinlei:

On Mon, 2022-04-11 at 10:31 +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> In the dsi_enable function, mtk_dsi_rxtx_control is to
> pull up the MIPI signal operation. Before dsi_disable,
> MIPI should also be pulled down by writing a register 
> instead of disabling dsi.
> 
> If disable dsi without pulling the mipi signal low, the value of
> the register will still maintain the setting of the mipi signal being
> pulled high.
> After resume, even if the mipi signal is not pulled high, it will
> still
> be in the high state.

After add Fixes tag for [1], then

Reviewed-by: CK Hu <ck.hu@mediatek.com>

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/mediatek/mtk_dsi.c?h=v5.18-rc2&id=2e54c14e310f655bb0915413e8e4a3da67c78a66

> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 9ad6f08c8bfe..e35343357f90 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -676,6 +676,8 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
>  	mtk_dsi_reset_engine(dsi);
>  	mtk_dsi_lane0_ulp_mode_enter(dsi);
>  	mtk_dsi_clk_ulp_mode_enter(dsi);
> +	/* set the lane number as 0 to pull down mipi */
> +	writel(0, dsi->regs + DSI_TXRX_CTRL);
>  
>  	mtk_dsi_disable(dsi);
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
