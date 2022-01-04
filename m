Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CEAC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 09:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGwe2Jv1dz6F5/6quUxzBjST/EWIMQ6j4Py/7XzkpgM=; b=CRL8P9d4j1tO2oQwyL50N0bMpf
	b9ySTUs05SNnY1qHom+ZGriwUxRLNjdLPWEuHagU2n+k1vSdq5EXn1+LARielkAM+8f6+NbivAnwX
	2pkGKzDdQV98fshOzq2L1rD6opmwbL6i1o6JdnO9c/sBsvM0dM7uPFxP1Dw7hANujeaygJhzYkJRG
	zXrgwv2+BoeHj9/CKI4B1MQh6FgEdoGP7JY60ZnvtiCpei0ph7TsDRkRJjpTsu6CxLBiV1WK64MQK
	DZGhf4hi771b5DFUlUKd3sQstVDLNawxmv7fe3PGa9rGnC0e1NEy0/C1GpOKJDboB5OTVuIori0Cd
	7z5RDSUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4fuj-00Avg5-8x; Tue, 04 Jan 2022 09:15:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4fnb-00AtLX-1E; Tue, 04 Jan 2022 09:08:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E676D1F42D09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641287285;
 bh=8Dx96BzS5V0cNEYbDj2kjQ7X4Fa7vPHPz+P7c6y5cIw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=H/Jkyi5lCDzjOSF6jvyqDzBlvnbdD6WiEuWhu0q4kvZym9jq1IlSx2Aunuh5w3kdJ
 RRTaGEdt9RnDRQiXxMT6+JDmiFhRGu98pJ8wQmgTf2hJiWp2yHAqtZ+JVQ+7gRL1d6
 TksM0T4L5/ZLTKCfelFi/+5Ic4M00fN7IZ9+y7m/GMXJKIqKp1UEuiqN8yvM8VuYug
 Nv5/BK9IqvAgreCruqp4Uqxr0jIHpKJ8os6As0Sv3j70r5mE/+tr+3MKVdPsZqWdDI
 lRTpL6r00foKr3ZnCqdDQb/O/nwVcWep7I/cBCvAav3hJclnhFnE43e40PdLYmr/Bl
 636PjsSVY2R5g==
Subject: Re: [PATCH v4] drm/mediatek: Fix mtk_cec_mask()
To: Miles Chen <miles.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Junzhi Zhao <junzhi.zhao@mediatek.com>, Jie Qiu <jie.qiu@mediatek.com>
Cc: Zhiqiang Lin <zhiqiang.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220103054706.8072-1-miles.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <1c57eecc-de2d-b3dc-6ea6-ddd50db70e95@collabora.com>
Date: Tue, 4 Jan 2022 10:08:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220103054706.8072-1-miles.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_010807_273435_6924D6B2 
X-CRM114-Status: GOOD (  20.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 03/01/22 06:47, Miles Chen ha scritto:
> In current implementation, mtk_cec_mask() writes val into target register
> and ignores the mask. After talking to our hdmi experts, mtk_cec_mask()
> should read a register, clean only mask bits, and update (val | mask) bits
> to the register.
> 
> Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
> 
> Cc: Zhiqiang Lin <zhiqiang.lin@mediatek.com>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> 
> Change since v1:
> add Fixes tag
> 
> Change since v2:
> add explanation of mtk_cec_mask()
> 
> Change since v3:
> change misleading subject and modify the commit message since this is a bug fix patch
> 
> ---
>   drivers/gpu/drm/mediatek/mtk_cec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
> index e9cef5c0c8f7..cdfa648910b2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_cec.c
> +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
> @@ -85,7 +85,7 @@ static void mtk_cec_mask(struct mtk_cec *cec, unsigned int offset,
>   	u32 tmp = readl(cec->regs + offset) & ~mask;
>   
>   	tmp |= val & mask;
> -	writel(val, cec->regs + offset);
> +	writel(tmp, cec->regs + offset);
>   }
>   
>   void mtk_cec_set_hpd_event(struct device *dev,
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
