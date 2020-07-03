Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABCCC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:30:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59841207FF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:30:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fFgroBtP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="Lyw3z/AH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59841207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NI4GYfAte/KFsTudd/A9kaCEb8mf1P2Z1CkL2ddo1dU=; b=fFgroBtPzIj7iX5dyYDGzr/ZO
	SLOOu+QJDmnA4aX4c8Y7SVLXmbvloJ5j/etLUIeUEF/mtmNIUqkMvnYap8vxr35S+rBneCk0pRgPz
	/iMo2syX87Jp4d0RrjPS7Z8DJpKgu2F+3VirgkWLzwPr1dxH+wtwVEFpB1ZTuxyV8CijlG5WBIij7
	EO/5obu9qCMaubkiZGRrJCsgvicSqk/rqtKKFTv5RRo0pDlD27skZcG62nZcfrC8Uk9EH/4DNu4nb
	ZSKZ74QRmy4JDpD/cSmbUFxfJlh79vw6VT70D3Hy3O4gJ2cgFN2RP19t12jX6p7W7e6AN5QEnPIoo
	0eooGUbGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrH5Y-0000D1-SS; Fri, 03 Jul 2020 08:30:28 +0000
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrH5W-0000CA-VV
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:30:27 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id rH5Ij8D3AmVFqrH5Lj7KgK; Fri, 03 Jul 2020 10:30:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1593765019; bh=K4ZVeaIkwpDUJF8k8wN+GOIsqANXeHbsL0HW+X17StY=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=Lyw3z/AHYGxdfG/s21TxsZpZN0Y49U1gEfAtb4yDQVLVLoqoMff23glkXrlfZUD1/
 MIq8JDDUflchHOVwvFOrviBhjrpydprKwz0CNO3CPuSceq8Rfi1dMbPDaxzdQH7GRI
 6UXU2zuIaXlAOfp2v1FhPnJQFFewn40eshw95Cuz6nbnhJW88QDCs86BVhbGmxRcAl
 Q3moyqAh/EKqDsUeQSTCtwhbUdT0PTQBcMJNLzQuB972mYwyslhamzM+v3fganZ5hA
 wJHyxM18TQTkDIW0Uyr/n2pxcuj8mXYWRmNHuf+c7ARv+JPcltaoX0KUYnM4eSznxn
 NAXmCWXYe6KAA==
Subject: Re: [PATCH v2 16/18] media: mtk-vcodec: venc: make S_PARM return
 -ENOTTY for CAPTURE queue
To: Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
References: <20200626080442.292309-1-acourbot@chromium.org>
 <20200626080442.292309-17-acourbot@chromium.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <84068e20-9a34-6d03-61e6-6c243680749c@xs4all.nl>
Date: Fri, 3 Jul 2020 10:30:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626080442.292309-17-acourbot@chromium.org>
Content-Language: en-US
X-CMAE-Envelope: MS4wfN3aHGef6GoyC6YgNA+lQWNvYAc/GX6g6o3fT32/5hwSIhH59XHQbvcTien9vjQM/YRK8/kYsxaYUglP3+lhHn/i1bTs64qnSGtjtuZ3rbWpaJg5Cwzh
 ee/Qw0usDZy6YvVKe95toreYVGQLSMnyfb6IWRvnnKsJ34bNGPNobu3fmm6fWnUyFUbTMHZF/K++QQ5sJOCyjtu0b7SPStdJhozsJiDiPQnjDmpKyPmIQ1Pg
 I+IzcWGihJBgbMc1hwRM+VlCmizRCSDMvSo/j+pdqALdhpD7F1AcWU6Fz09D9h2HheACAQPCKLqSIg2yoxKiWcGJAniUolShkRzeS+5dhgkDjQcmxxaa6zK9
 szHu5TUA/LjJoQdfhxDbFTG8Do3b2nrb3eur+jpaRvtTc7LVQqC2LH3z6drkOw1A1vqzZDKC+525qEznPhXlDlrBK2I/plhFGW1TxLA45llhZhxxCvpqXFF8
 gxPiA3S1Ve+HGs14cDlgJFSiVZrKrf6UX43IuMx/GawHL1xWyN/VH12/Wr8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_043027_115681_8E43392A 
X-CRM114-Status: GOOD (  13.94  )
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 26/06/2020 10:04, Alexandre Courbot wrote:
> v4l2-compliance expects ENOTTY to be returned when a given queue does
> not support S_PARM.
> 
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index aae610e6d4e8..346a33c6869d 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -200,7 +200,7 @@ static int vidioc_venc_s_parm(struct file *file, void *priv,
>  	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
>  
>  	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> -		return -EINVAL;
> +		return -ENOTTY;

This doesn't look right: S_PARM *is* supported, just not for this buffer type.
So -EINVAL is the correct error code.

What is the exact v4l2-compliance failure? It might be a bug in the test.

Regards,

	Hans

>  
>  	ctx->enc_params.framerate_num =
>  			a->parm.output.timeperframe.denominator;
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
