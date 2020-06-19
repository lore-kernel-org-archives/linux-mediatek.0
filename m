Return-Path: <SRS0=jvDT=AA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BEBC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 07:05:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B56EA2078D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 07:05:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EgrRd3tM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="u0VcAhR6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B56EA2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6xIa2clDgNf+xM5Cv7ZKL/v1GafIddG+NoyYAa+ero=; b=EgrRd3tMkT5Hvm
	dHu7iej8QCpIxyeCHqjJQ6KwKu4gRMb1rUme+jLteAPD4fQaOTmcusDe1aPoOg/EMzak+8YZKRro6
	dlLQW0mpJ+zNZsof3CNSly3OP6ohQOXe2MkWJ70mlHtMw3LGP3n04dnkNF5enLYzkWxA/Brvx8AZ3
	IW3wZ5PrUK4AzFGZZAv/DXzP89I+CZ7bvXVHvIjTI1IlaOjQ1yqmA5MXJk6FajPuQalwoWND7be+a
	LFZG6z0XYaKwDpbjtui7WcVmbP/y3+2dlqNEmtuA0apuTtG+J6AxZDG+TQ5UY7qJodku1aHYujxHO
	SOdqNpv806JR2DU+Jkqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmB5W-0001MF-FH; Fri, 19 Jun 2020 07:05:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmB5T-0001Li-Aq
 for linux-mediatek@lists.infradead.org; Fri, 19 Jun 2020 07:05:20 +0000
X-UUID: d3ceeb5aaf0449dba8334e455568e6c3-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PCB8Qz7hOOk222bVQxjPpuUhXuN7LtCLPsnk9tCpO4M=; 
 b=u0VcAhR6xsyiieTIQPVcjxbHrxRLWu5wsq2BVbZwk9QtooTM2z+UaWu6ktDonHhO4E8hHvYt739v2xZmiikORHwCaVC30lt1aZsMSu5jVy74122596hMUHOMAh5FqYUN47oYmOfzrPmShJbjPHebuOXBQybOXyBEpCpnK80OJPw=;
X-UUID: d3ceeb5aaf0449dba8334e455568e6c3-20200618
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1400906837; Thu, 18 Jun 2020 23:05:22 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Jun 2020 23:59:18 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 14:59:11 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Jun 2020 14:59:12 +0800
Message-ID: <1592549952.23952.3.camel@mtksdaap41>
Subject: Re: [PATCH 07/10] media: mtk-vcodec: venc: remove redundant code
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Fri, 19 Jun 2020 14:59:12 +0800
In-Reply-To: <20200520082723.96136-8-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
 <20200520082723.96136-8-acourbot@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7CCBF29C811E6FE35B861FCCF8B303D3C129E8FA0D985C43E6CCB2781D20C5BF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_000519_388263_59C5FE46 
X-CRM114-Status: GOOD (  12.31  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Pi-Hsun
 Shih <pihsun@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-05-20 at 17:27 +0900, Alexandre Courbot wrote:
> vidioc_try_fmt() does clamp height and width when called on the OUTPUT
> queue, so clamping them prior to calling this function is redundant. Set
> the queue's parameters after calling vidioc_try_fmt() so we can use the
> values it computed.
> 

vidioc_try_fmt clamps height and width only when f->type ==
V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE

Does this cleanup pass v4l2 compliance test?
I recall compliance test will try different fmt and make sure driver
response enough information?


> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  .../media/platform/mtk-vcodec/mtk_vcodec_enc.c   | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 05743a745a11..f0af78f112db 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -449,7 +449,6 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
>  	struct mtk_q_data *q_data;
>  	int ret, i;
>  	const struct mtk_video_fmt *fmt;
> -	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
>  
>  	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
>  	if (!vq) {
> @@ -474,20 +473,13 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
>  		f->fmt.pix.pixelformat = fmt->fourcc;
>  	}
>  
> -	pix_fmt_mp->height = clamp(pix_fmt_mp->height,
> -				MTK_VENC_MIN_H,
> -				MTK_VENC_MAX_H);
> -	pix_fmt_mp->width = clamp(pix_fmt_mp->width,
> -				MTK_VENC_MIN_W,
> -				MTK_VENC_MAX_W);
> -
> -	q_data->visible_width = f->fmt.pix_mp.width;
> -	q_data->visible_height = f->fmt.pix_mp.height;
> -	q_data->fmt = fmt;
> -	ret = vidioc_try_fmt(f, q_data->fmt);
> +	ret = vidioc_try_fmt(f, fmt);
>  	if (ret)
>  		return ret;
>  
> +	q_data->fmt = fmt;
> +	q_data->visible_width = f->fmt.pix_mp.width;
> +	q_data->visible_height = f->fmt.pix_mp.height;
>  	q_data->coded_width = f->fmt.pix_mp.width;
>  	q_data->coded_height = f->fmt.pix_mp.height;
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
