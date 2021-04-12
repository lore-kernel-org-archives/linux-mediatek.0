Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946B8C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 08:49:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 309186127C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 08:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 309186127C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lLWvlQU6wRD+7hzNaZLpSyu/Q+JkRwBwYpNvNLkZm5E=; b=Uzu0s+fU+OxvPRlyj1CEDb1mZ
	lOpRt0JtUoZsLeJ6NKxMyel4bB5FH6JYe0zz35/YxM5JQh2+cvt/73ZXMDQ/YtMFUqOr+TEQCJXfX
	fxDcZS+nXUak0C1tfYe5GILaNO/jJIR/Lm3jPqiqcltVW0oZBMp1YIpK2ysr9YN1kXiLrxFU8oqGt
	OOI8y7WGh2sWIfo7FUULSuKVXr3Z5oUH1O5ZpyW1EzA5/YwKxytnkgsZlv4Gh7rAjAaPXYc+MGzcl
	/fzU6nAfew0TUtssNVDYlCN+MJ6Ufrx/RL7FkoVZLpOj2glRcMCxv/xDvlR1e6Q8eIYCQ9qFDCftL
	hZ1jKe7VQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVsFh-0069Op-MX; Mon, 12 Apr 2021 08:49:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVsFc-0069NZ-Dq; Mon, 12 Apr 2021 08:48:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=RweJgmRF+LDjf8Ds2biby3dH1UAHrROV6leebHr8sAA=; b=MMy94xqsy7WUzv9H8jPZD9QeZH
 mIjNVIPBxcql03lzCxweuqqU+lXvK7ocOKQtj7tRznAP0c/Tzis3jjHvhVhmbvF7IlzaF0AcmFPRL
 NVJ6mwzG8WiQ5M8KihH9O+0yGZZlxxpt/nQ4CT6Zy+ljReaMWaEDz04pvvYfLIwBZuH+lzhOXZPQe
 tprKjL39dw9IgRcywulXr7v00dbVQ/VBEA5D8f7qW+E9ycc3M2LU9bdluD6goM5Gjf3zxxBM7xZRp
 569ysPtN9UgQDrpgN1dpR5FHcwOpnX/A5/4FNHrkmhzP8ltQHNQJaxBb5eIqly+uNqjl8RD45/zLN
 /eV8rh3w==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVsFW-005zhk-N1; Mon, 12 Apr 2021 08:48:55 +0000
X-UUID: d3af3281a61b4147b01486f00b95d618-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RweJgmRF+LDjf8Ds2biby3dH1UAHrROV6leebHr8sAA=; 
 b=EmvUMhAhYgK7Kwv3Q+5M60Fq7BMCfphLprUpC64KNZ4J2pOspIEN5U+b8nwFAZleTom9qsjS2KPDNlVP4JWtdTNr/35Goa2kQgm9so0srNf7tKuNjTlbSAOc3Q+BAylOjC5e5VZs9AYaEVJ6FsbSqKj/V2WUpITRIf2otD49PEQ=;
X-UUID: d3af3281a61b4147b01486f00b95d618-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 249324533; Mon, 12 Apr 2021 01:48:47 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 01:46:26 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 16:46:23 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 16:46:23 +0800
Message-ID: <1618217183.16010.4.camel@mtksdaap41>
Subject: Re: [PATCH v1] drm/mediatek: adjust rdma fifo threshold calculate
 formula
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, <devicetree@vger.kernel.org>, "David
 Airlie" <airlied@linux.ie>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Date: Mon, 12 Apr 2021 16:46:23 +0800
In-Reply-To: <1618212332-3547-2-git-send-email-yongqiang.niu@mediatek.com>
References: <1618212332-3547-1-git-send-email-yongqiang.niu@mediatek.com>
 <1618212332-3547-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B93D2EA023810F2AB99CA9F7808B7137FCA922C9F707457EE34B03921C380BE52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_014850_772617_E9830BD0 
X-CRM114-Status: GOOD (  19.04  )
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

Hi, Yongqiang:

On Mon, 2021-04-12 at 15:25 +0800, Yongqiang Niu wrote:
> the orginal formula will caused rdma fifo threshold config overflow
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index 728aaad..8c9371b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -167,7 +167,7 @@ void mtk_rdma_config(struct device *dev, unsigned int width,
>  	 * output threshold to 6 microseconds with 7/6 overhead to
>  	 * account for blanking, and with a pixel depth of 4 bytes:
>  	 */
> -	threshold = width * height * vrefresh * 4 * 7 / 1000000;
> +	threshold = rdma_fifo_size * 7 / 10;

It's better to set threshold by width and height, but it seems that no
one could come out a solution for all SoC. I could just accept this
solution, but I need some addition comment for this solution. How do you
decide 7/10? In the future, another may need to modify this value and he
need to know why you use 7/10. If you just choose it at random, just
tell us that you just randomly choose it.

Regards,
CK

>  	reg = RDMA_FIFO_UNDERFLOW_EN |
>  	      RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
>  	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
