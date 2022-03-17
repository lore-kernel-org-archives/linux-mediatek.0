Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FEBC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 12:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HQFaKjr0SPaYlfTcxuid1Ux0O8sGnJ5er1qQuYm6l74=; b=k2q/JbaHQpHQo2
	DmBRPv7AasUgQdwiPcIv1NLw4QXs8wKkJcpuR3TxDZLSI9dkPlnfACpCVKa8thXPWa2JOBcKegj6a
	3eZrH56K0UQCdFiR9XSsSBH+KMTgcO6UltPJKCaH7u2jfPbCp+lmxWbiEU4yU4A/ZpkbW7BlYY1Vd
	R/Z/gahnkeqBzXW5cp0mm5p1Pwz+TAhO8Llj7bgVLCpufvV+WJYnpHqvQ8XFITw/ZcvF80nEc/rEk
	enl7b6mIOePiAtsDkYDLIbg99p2P2MXoN4cdaTT/qyBjfX6v7A2ezpwLpWeqm5qSAHvo8ISvVIQOf
	sRb03AiXdQmMpO/rgrZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUpX5-00G7yp-VH; Thu, 17 Mar 2022 12:47:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUpWk-00G7o6-Ka; Thu, 17 Mar 2022 12:46:51 +0000
X-UUID: 9e3224846bf241b4ab9b0b164dc52720-20220317
X-UUID: 9e3224846bf241b4ab9b0b164dc52720-20220317
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1356763848; Thu, 17 Mar 2022 05:46:43 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 05:46:41 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Mar 2022 20:46:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 20:46:30 +0800
Message-ID: <07e040716fed3f1c3a15af698767dbe8f77308ea.camel@mediatek.com>
Subject: Re: [PATCH v1, 1/1] drm/mediatek: fixup ovl vblank callback data
 null pointer issue
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, "Dennis YC
 Hsieh" <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>
Date: Thu, 17 Mar 2022 20:46:31 +0800
In-Reply-To: <20220314080808.29370-2-yongqiang.niu@mediatek.com>
References: <20220314080808.29370-1-yongqiang.niu@mediatek.com>
 <20220314080808.29370-2-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_054650_689255_20DD74C8 
X-CRM114-Status: GOOD (  15.93  )
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

On Mon, 2022-03-14 at 16:08 +0800, Yongqiang Niu wrote:
> ovl vblank_cb_data will be null pointer when disable ovl
> vblank
> 

Hello Yongqiang,

What issue do you encounter?
Is it a timing issue?

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 2146299e5f52..f3a450c0ef2d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -113,7 +113,6 @@ void mtk_ovl_disable_vblank(struct device *dev)
>  	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
>  
>  	ovl->vblank_cb = NULL;
> -	ovl->vblank_cb_data = NULL;

IMO, this may be not a good solution.
If this is a timing issue and you don't need to handle irq after
disable vblank.
I think you should handle  ovl->vblank_cb_data == NULL in
mtk_disp_ovl_irq_handler?

If I am wrong, please correct me.

Thanks.

BRs,
Rex

>  	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_INTEN);
>  }
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
