Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC15C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 08:00:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61CBE2073C
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 08:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61CBE2073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=879jCpRDUkzZY95xbeBd/WgnhQFQyUROMlHhYJPMzYc=; b=xYoMhcgJkuTtrkRb/ugzDkc/7
	0AiuadvzjoHCaZ+/Bvc0brZjhOb9Iq1XRLvryQWfiu3S1C40TnV5oxhbpauUbMqf/mxeDUCQ4FjGZ
	x3z/TTFge1irMrusKUwaEGAqoUgTP+JmG4tevclWURxlXd0bPotEKMVkLPWpUXjrSWCqPtgXU1GFQ
	IZG+3hQBLPA20lDFCt1Fr3EDDbU4FxoMNPvDj69eIrhVt7Yp5s5W2mxH3QixvWNdO6Hsc2jznWDSI
	EWcdVlRzKNmTwRinyWFMRmCjQ8IrRt6+rh9oaOuumM9pikG0IFQXEPH6XT63Nxtse/AjbIA8zL70m
	DnHJu8rMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4fju-0001N0-Vv; Wed, 27 Jan 2021 07:59:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4fjq-0001MC-A1; Wed, 27 Jan 2021 07:59:44 +0000
X-UUID: 69263a02a01d437bba9c06baead41264-20210126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1rHN6XFoiNjbEZ4gE5YNnM87NBquj4VfEM0/8Mtk/+Q=; 
 b=kg3G0nWN2pDgYhhIpcwKEcQRSaBxO44pO3zvRIOa+Dm2g4NOt1mVXqiblCdF81+f56YCovos8uXJJivkYhDpaTUyQ9TJdKXQNfS0WlyS4n/zT2mZ+qe0orCX8mrEanSDfwCQv1qso7qvPx3dZKkbCX5pgui5qqHQyJwuwdZDpL8=;
X-UUID: 69263a02a01d437bba9c06baead41264-20210126
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 692178672; Tue, 26 Jan 2021 23:59:32 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 23:59:30 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 15:59:27 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Jan 2021 15:59:27 +0800
Message-ID: <1611734366.29432.1.camel@mtksdaap41>
Subject: Re: [PATCH v10 3/9] drm/mediatek: add RDMA fifo size error handle
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 27 Jan 2021 15:59:26 +0800
In-Reply-To: <20210127045422.2418917-4-hsinyi@chromium.org>
References: <20210127045422.2418917-1-hsinyi@chromium.org>
 <20210127045422.2418917-4-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B5DCDF8D63F7A26FDFCD987D2C12B5798BBF49DA80FC41CA24B08212AB3D6CBA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_025943_793261_A4951127 
X-CRM114-Status: GOOD (  17.83  )
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Hsin-Yi:

On Wed, 2021-01-27 at 12:54 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> This patch add RDMA fifo size error handle
> rdma fifo size will not always bigger than the calculated threshold
> if that case happened, we need set fifo size as the threshold
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index b84004394970f..04b9542010b00 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -168,6 +168,10 @@ void mtk_rdma_config(struct device *dev, unsigned int width,
>  	 * account for blanking, and with a pixel depth of 4 bytes:
>  	 */
>  	threshold = width * height * vrefresh * 4 * 7 / 1000000;
> +
> +	if (threshold > rdma_fifo_size)
> +		threshold = rdma_fifo_size;

Please see the discussion in [1].

[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/1607591262-21736-6-git-send-email-yongqiang.niu@mediatek.com/

Regards,
CK

> +
>  	reg = RDMA_FIFO_UNDERFLOW_EN |
>  	      RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
>  	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
