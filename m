Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F42C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 12:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDha2jBrsEUgN3jPHAGVM3zx4MwDw2cAiP7MwARUAIg=; b=bU5wSiajnRI5I9
	qM7l3xp9GGqHjlotb0f45u6YRnnWGtnBh6kaagSx34Sz5RQmB9KU7eKfPB99Q9Un5f3eBk1wia44z
	sOMet185XY1UuApmLWdn9C4SokC1O7/iNesTh1yWOhfiGK7lg35poe/qQoOO7iM4hecktpsTDlNTq
	PsP5DjsUC0qR1UXuT3fb2U0HXLhcneRHXY4X/Szq0r1BHsdiYra0G3YFIHEmSNq0azY1DvD4UPP5m
	O1xQklaPgqPa2pTlwqiLWAMW4r88K6xRXWOumRO/MRRXreZgHWP9bgdkPPk7wIKzxQ/8/9O2BMnzi
	4V1NQAlMdKR7JGbDYWiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlrVQ-005ixj-Ta; Tue, 03 May 2022 12:19:52 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlrV2-005ij0-Q7; Tue, 03 May 2022 12:19:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8D50F1F440F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651580367;
 bh=7dmHQ4KerR5qmz8szAHhl2RdSUpC3IqMde/web4SJVI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oLDe2oHiRbT3NMQHsqrGQgkM2j77gKaebdcIESyJ/PQhseVGHXB4mY9UB/4UBsWv4
 8+abIYy7l0uvL4bcAAPg5TmyFkNfAIYMOy1/EUnkY6HrsuXb+J4k8UrCiavBaPZOva
 tbqKdR3n1N3hN3xzZAi6/Wyk4FOxSYgvr7jMzbcB06NbgP/2q9jXHUyoyO9HG6aqbw
 jVBxXJXa5+oPiYw9N+r2SfEcgHV+jQx5QA2V3pFyZAKyUjzXy/M/iB90kE0Gz1L08n
 fYAreCLdIPP7aqo5Nw1Qj4vUkWv1DkpHytOhb23qoypyPBP5t9o8b9XWOIpb1Mty26
 oc7sbOVhGOeIg==
Message-ID: <c6be6d95-35f0-fb62-2d10-53f974ba67e4@collabora.com>
Date: Tue, 3 May 2022 14:19:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v19 06/25] soc: mediatek: add mtk_mmsys_write_reg API
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220503102345.22817-1-nancy.lin@mediatek.com>
 <20220503102345.22817-7-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220503102345.22817-7-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_051929_031413_F374FCE9 
X-CRM114-Status: GOOD (  15.96  )
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

Il 03/05/22 12:23, Nancy.Lin ha scritto:
> Add mtk_mmsys_write_reg API. Simplify code for writing mmsys reg.
> It is a preparation for adding support for mmsys config API.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-mmsys.c | 35 ++++++++++++++------------------
>   1 file changed, 15 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index ab3c5cbb0175..3e2e5e3f721d 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -191,22 +191,26 @@ static int mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
>   	return -EINVAL;
>   }
>   
> +static void mtk_mmsys_write_reg(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
> +{
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(mmsys->regs + offset);
> +	tmp = (tmp & ~mask) | val;
> +	writel_relaxed(tmp, mmsys->regs + offset);
> +}
> +

Uhm... this is the equivalent of regmap_update_bits(): I fear that calling this
mtk_mmsys_write_reg() may lead to confusion.

I think that a more appropriate name would be mtk_mmsys_update_bits() or
something similar, recalling that this is not just a register write, but
a RMW.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
