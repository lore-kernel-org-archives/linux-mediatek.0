Return-Path: <SRS0=L+xn=ZT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84821C432C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 01:32:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54E132071E
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 01:32:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NhTIOJRm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pzX6Gd1/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54E132071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5n0NrltbREojch4OZni1D0XPgb0RsiJJbH/qzn08CYI=; b=NhTIOJRm+/xWXh
	ohmWv+7t65JM7w1jdQra7fFM2JS39YvtwYmiHsnKsrr4TTmIxufQCAjh8xuWRPZpFwUPeULQHp05H
	A8jUQXzYCvwQFpVVlbssLNB6H+vg4do3SU/dcYlY1EcmUYtVt9MozJKVf4Cbhrt4ymzbUHe3z+R+o
	I8AgBV+I8kGcvfId76/wmbLvYUUYr2m2YbTLmn8fg9SNkLddIdT7bqxdpU6OKAOZe48+i2F/QZmqm
	29ZvahOY/+F2t5Cv08i7oeayOyI1qgpv01vboYWnZ7ssIXk7ehcwAF0+lfpjnHy4Z+OEAmncHaMxF
	4x4VnoClhH8CRB3AqpCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZmBa-0003zc-E8; Wed, 27 Nov 2019 01:32:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZmBP-0003or-Bo; Wed, 27 Nov 2019 01:31:56 +0000
X-UUID: 2dc72293d63e41979bad1e93aa46b5a3-20191126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FfLWy7hYVqt6twZ6RqO6oRqpE+bo5f378iJWtJ09HPs=; 
 b=pzX6Gd1/S3ZFzHELtyJqaXA82W9WaSXjecV9rS4JWtTrpAhaxPrXakJcN6NyBqoxLpwDIQgSx8vpq3kB1LzCrBafZp7WzSixhOeCkPFqJIhipRT5wEcNDDpuE0RNRoeIPcfK0t0UvEyrS0vSz1aWTf8QBHMwhCkSxFvCxMIH0Fs=;
X-UUID: 2dc72293d63e41979bad1e93aa46b5a3-20191126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1838101639; Tue, 26 Nov 2019 17:31:49 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 26 Nov 2019 17:31:55 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 27 Nov 2019 09:31:44 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 27 Nov 2019 09:30:52 +0800
Message-ID: <1574818303.15691.10.camel@mtksdaap41>
Subject: Re: [PATCH v1] drm/mediatek: fix up 1440x900 dp display black
 screen issue
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 27 Nov 2019 09:31:43 +0800
In-Reply-To: <1574750869-12611-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1574750869-12611-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B6B9FEC13DEDCAA3FED78A3946FCFD3C5E46997A32C15BEB208086C51E86B01A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_173155_410962_18FAC317 
X-CRM114-Status: GOOD (  14.31  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Yongqiang:

On Tue, 2019-11-26 at 14:47 +0800, yongqiang.niu@mediatek.com wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> This patch fix up 1440x900 dp display black screen issue
> the computed result will overflow rdma1 fifo max size
> when external display pixel clock bigger than 74MHZ
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index c1abde3..41143f5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -152,6 +152,10 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
>  	 * account for blanking, and with a pixel depth of 4 bytes:
>  	 */
>  	threshold = width * height * vrefresh * 4 * 7 / 1000000;
> +
> +	if (threshold > rdma_fifo_size)
> +		threshold = rdma_fifo_size;
> +

This looks like that threshold is over spec. I think this FIFO is used
to cover the latency of reading data from DRAM. When data is read from
OVL not RDMA, OVL already has a FIFO, so RDMA FIFO is useless. So I
think you should set threshold to a special value when RDMA is in direct
link mode.

Regards,
CK

>  	reg = RDMA_FIFO_UNDERFLOW_EN |
>  	      RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
>  	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
