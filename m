Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41183C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 09:29:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1442E61359
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 09:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1442E61359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuk6SurEvqn89d7oSq/MxxEIF9+NsRiuafH0Qe07VVA=; b=yu0w/NI0dd1CkgGRkoG5I3I8Xa
	qPhsGieFS/3Hec28J78r6LtDpYUM0TyWwT0aVfYa9nUhyfSj9DrL0LzWu55b/DE8aw+jN87CIZfol
	8SA0sTqgnz8AZm3E8gBC4R8cuEQJbGFHzPyLgi/MK15E09rx2/3fatu6zZIcjSHDc9oDGAYxd+U7g
	s3sL5NWggiwPVNH7JgaV1jjawEgBtZ7awSni6rpfT1TTV9mMpnT4wt9DS9S45kkLW8Z8bNsvyOrar
	Gbb/IVq4hqmxA8PVTJTgI7eYLDatSWneVzCL6TcNBAXenmIsHyuIIePGPPTORHustPSNxA1JpcIJz
	wS2l4yDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md7ut-003zmW-NI; Wed, 20 Oct 2021 09:29:47 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md7ue-003zdW-Lx; Wed, 20 Oct 2021 09:29:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 08B1E1F43FDB
Subject: Re: [PATCH v2 3/9] media: platform: mtk-mdp3: add chip independence
 architecture
To: "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20211020071448.14187-1-roy-cw.yeh@mediatek.com>
 <20211020071448.14187-4-roy-cw.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <89b3f65d-3ad1-5f81-7e16-0c00db74678b@collabora.com>
Date: Wed, 20 Oct 2021 11:29:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211020071448.14187-4-roy-cw.yeh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_022932_896651_E0931CAF 
X-CRM114-Status: GOOD (  15.97  )
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

Il 20/10/21 09:14, roy-cw.yeh ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add chip independence architecture
> - Add hal architecture for mt8183
> - Add driver data to adapt other soc
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> ---
>   .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   | 154 ++++---
>   .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 181 ++++-----
>   .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   | 193 ++++++++-
>   .../media/platform/mtk-mdp3/mtk-mdp3-core.c   | 383 +++++++++++++++++-
>   .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |  19 +
>   .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  10 +-
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   | 259 +-----------
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   | 268 ++++++------
>   8 files changed, 925 insertions(+), 542 deletions(-)
> 

snip...

> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> index a6caefb097be..50fd5430a565 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c

snip..

> @@ -732,7 +514,7 @@ int mdp_frameparam_init(struct mdp_frameparam *param)
>   	param->num_captures = 1;
>   	frame = &param->captures[0];
>   	frame->format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> -	frame->mdp_fmt = mdp_try_fmt_mplane(&frame->format, param, 0);
> +	frame->mdp_fmt = mdp_try_fmt_mplane(mdp, &frame->format, param, 0);
>   	frame->ycbcr_prof =
>   		mdp_map_ycbcr_prof_mplane(&frame->format,
>   					  frame->mdp_fmt->mdp_color);
> @@ -744,3 +526,4 @@ int mdp_frameparam_init(struct mdp_frameparam *param)
>   
>   	return 0;
>   }
> +

Please remove this empty new line.

Apart from that,

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
