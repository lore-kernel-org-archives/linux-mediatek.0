Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28560C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 03:46:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9D602073E
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 03:46:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0L45oVJ6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ovJa4YyV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9D602073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gv6Mx77k29nSROEyJlYSzyLZxvxATm8wSUnSW1dCI40=; b=0L45oVJ6vPqfkqbZsPrNg+eMk
	T0P97FHVSyKAHYFdvmiznCzoPhw4gWBfvwwjIpgDtVnwilX7ekq/D3+afQt1aYe379KtJ8GKAgR7d
	Xba8PYb3t0ZMmtJ4CsybM4vFCcuJnI3KUopwFnJQ9IUcdxsXpUr8hK/mGs7CxodStm6m6loQjNsPd
	NFL1K52czgpIlpFMXxlZu+1mc35D5VXx94aABzR4dgYpA5/XygtxMrqTfqdxc/PktBrgHygW1vuS9
	WbSsst6KV6dl6WSceSA01wkE9KhUag25h2HvPMB/c5G4MjELHha2Q9fXUwY2nw+Re9sbSAMy5GDP4
	XTd2LzY5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqThp-000871-8g; Wed, 01 Jul 2020 03:46:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqThm-00086R-Oc
 for linux-mediatek@lists.infradead.org; Wed, 01 Jul 2020 03:46:39 +0000
X-UUID: 907413c619e8408a908df8e17a20e99a-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ry6nys1ZRAY+H8Q6GyL9wPx9JOP40z3D/yzAqhlEzgk=; 
 b=ovJa4YyVa+MSf+OAgTLxN+HYc/SF+vSAFvuNr2xwCVEqPVRs4xFHxhH3Fij7XbSLAf6P9KHsyXjmC6BJOQ7FWjtTAtoyKXOdxAvtNPpYVM3z9Da8lkVeE83n9VETVDCMJC+k9fwft+bb7pkUsXhWjwO8k1drgRg7FF03JL+8zHA=;
X-UUID: 907413c619e8408a908df8e17a20e99a-20200630
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 253275540; Tue, 30 Jun 2020 19:46:14 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 20:46:31 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 11:46:29 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jul 2020 11:46:29 +0800
Message-ID: <1593575190.1533.2.camel@mtksdaap41>
Subject: Re: [PATCH v2 12/18] media: mtk-vcodec: venc: set OUTPUT buffers
 field to V4L2_FIELD_NONE
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 1 Jul 2020 11:46:30 +0800
In-Reply-To: <20200626080442.292309-13-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
 <20200626080442.292309-13-acourbot@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5DBE0FC55AB4023EE954F5DA77B7212998D8E0782B4337E1906B2A5E2DE6EAA12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_234639_001897_7ECF1CD6 
X-CRM114-Status: GOOD (  14.89  )
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

On Fri, 2020-06-26 at 17:04 +0900, Alexandre Courbot wrote:
> A default value of 0 means V4L2_FIELD_ANY, which is not correct.
> Reported by v4l2-compliance.
> 

Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>


> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index f833aee4a06f..1a981d842c19 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -893,8 +893,17 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
>  	ctx->state = MTK_STATE_FREE;
>  }
>  
> +static int vb2ops_venc_buf_out_validate(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +
> +	vbuf->field = V4L2_FIELD_NONE;
> +	return 0;
> +}
> +
>  static const struct vb2_ops mtk_venc_vb2_ops = {
>  	.queue_setup		= vb2ops_venc_queue_setup,
> +	.buf_out_validate	= vb2ops_venc_buf_out_validate,
>  	.buf_prepare		= vb2ops_venc_buf_prepare,
>  	.buf_queue		= vb2ops_venc_buf_queue,
>  	.wait_prepare		= vb2_ops_wait_prepare,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
