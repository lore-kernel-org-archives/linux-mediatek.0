Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ED5C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 01:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xPU785sdpITfroxorUX7oThuDAt4Iw7noeTiz1IVJEY=; b=W/I4T2+iBjdDBu
	lD9DnhL7g3Tw5l5eAICFo9959a8eMk+hHLtpB0D/fkeZx4d6SyNqCMdrnXE1dHQ/vKEXBRFsbuD/A
	qc69bVPbaRwhlm9FN246H/PWv1cBd8lfjC262Lpbk1ZMrIpBhL6OiMhhiKJ32zKa0RUbluWrqDhhX
	tMILgLreCrY3X4dJeb17w2Ku9CkJJiBFq4E3lv4W540BmtHTmI3Ctri0WdJsoDG39b544yNVzU4DO
	UY8UL7L85hbEmQR1i8DeqA7qw5D1VePst7gCdh2//xyD4JfmOKEcve87Ob2awObkrYOElEbsvz0ov
	sCXJDo3RsILa3BOFEBlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncHJ2-008mXc-Ov; Thu, 07 Apr 2022 01:51:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncGum-008btx-9M; Thu, 07 Apr 2022 01:26:25 +0000
X-UUID: 6b667d3885674b6aa163e98e1e0718ac-20220406
X-UUID: 6b667d3885674b6aa163e98e1e0718ac-20220406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 678146261; Wed, 06 Apr 2022 18:26:18 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 18:16:16 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 09:16:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 09:16:15 +0800
Message-ID: <8fbabb83e838169697a06a1b525252c99018a93f.camel@mediatek.com>
Subject: Re: [RESEND v4 PATCH] drm/mediatek: Fix mtk_cec_mask()
From: CK Hu <ck.hu@mediatek.com>
To: Miles Chen <miles.chen@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Jie Qiu <jie.qiu@mediatek.com>, "Junzhi
 Zhao" <junzhi.zhao@mediatek.com>
CC: Zhiqiang Lin <zhiqiang.lin@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <dri-devel@lists.freedesktop.org>, 
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Thu, 7 Apr 2022 09:16:15 +0800
In-Reply-To: <20220315232301.2434-1-miles.chen@mediatek.com>
References: <20220315232301.2434-1-miles.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_182624_356214_C7590D8B 
X-CRM114-Status: GOOD (  17.57  )
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

Hi, Miles:

On Wed, 2022-03-16 at 07:23 +0800, Miles Chen wrote:
> In current implementation, mtk_cec_mask() writes val into target
> register
> and ignores the mask. After talking to our hdmi experts,
> mtk_cec_mask()
> should read a register, clean only mask bits, and update (val | mask)
> bits
> to the register.

Applied to mediatek-drm-next [1], thanks.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Regards,
CK

> 
> Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Zhiqiang Lin <zhiqiang.lin@mediatek.com>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> ---
> 
> Change since v1:
> add Fixes tag
> 
> Change since v2:
> add explanation of mtk_cec_mask()
> 
> Change since v3:
> change misleading subject and modify the commit message since this is
> a bug fix patch
> 
> ---
>  drivers/gpu/drm/mediatek/mtk_cec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c
> b/drivers/gpu/drm/mediatek/mtk_cec.c
> index e9cef5c0c8f7..cdfa648910b2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_cec.c
> +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
> @@ -85,7 +85,7 @@ static void mtk_cec_mask(struct mtk_cec *cec,
> unsigned int offset,
>  	u32 tmp = readl(cec->regs + offset) & ~mask;
>  
>  	tmp |= val & mask;
> -	writel(val, cec->regs + offset);
> +	writel(tmp, cec->regs + offset);
>  }
>  
>  void mtk_cec_set_hpd_event(struct device *dev,


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
