Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E60C433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 05:50:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAA832071E
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 05:50:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3f6uRm4s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="f4MMUG2H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAA832071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2L1YiHnrURHMLkP19bzBoqidH5ylKaylmaRic1COZFU=; b=3f6uRm4s2FPlfYbriu1SEARy/
	MS0vsJrKyeIuSUzXj0ak+ZtVE/5RRi6PgGD9eSssz80syBkW8DpefjrENbwiswA0VuEd8diZXHNaA
	5csh+canU+hY2oaRHR2SgMCM7yUR/EJKEPP3obod5DgYBl+INdwz51YWlUKCqpcajEp0x0flj9nfS
	UMixIZ0WqnKGiJpx28fj3NCl7vPnsDyvdtkYuoDGJQMuqD/+q5QKd7yDYWtr8eNAfQBQ4nR4F82SX
	xFPCKYI7USu71ZH4PYUq0urbOgyrKlFQwgz3FjMyT9iPzGj8NsP4wWDGNlRI1fiYXqlLvJ/0PSawQ
	ddX0gASVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kARqL-0008Lq-Rq; Tue, 25 Aug 2020 05:50:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kARqK-0008LF-LP
 for linux-mediatek@lists.infradead.org; Tue, 25 Aug 2020 05:50:01 +0000
X-UUID: 29030e156bb9496fa244588575b9da54-20200824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=x24GTs4og816xQigVioi/+Ob9pQhy96LyKGjS7OYRMc=; 
 b=f4MMUG2HZvbU+nLyemBn5sbLJQqxN3UgFBWLB62Rkh/Ilnok8QZBv+JcN43G+tz8dvNRbKwGxlOiAd7UcxRjEYVUjjwcSUpqw9OF7Gs6vNtdUFjCT8iwgU3nEeHHht9otWTwHW+Nys4zEKQ7GLOap/FmaMqJGT7JonCNkeN+Dxg=;
X-UUID: 29030e156bb9496fa244588575b9da54-20200824
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2077685296; Mon, 24 Aug 2020 21:49:56 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 22:49:53 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 13:49:53 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 13:49:54 +0800
Message-ID: <1598334593.1969.3.camel@mtksdaap41>
Subject: Re: [PATCH v4 17/17] media: mtk-vcodec: venc: fix invalid time per
 frame in S_PARM
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Tue, 25 Aug 2020 13:49:53 +0800
In-Reply-To: <20200821103608.2310097-18-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
 <20200821103608.2310097-18-acourbot@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_015000_886882_45BA799C 
X-CRM114-Status: GOOD (  17.30  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Maoguang
 Meng <maoguang.meng@mediatek.com>, devicetree@vger.kernel.org,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-08-21 at 19:36 +0900, Alexandre Courbot wrote:
> v4l2-compliance expects the driver to adjust the time per frame if it is
> invalid (numerator or denominator set to 0). Adjust it to the default
> value in these cases.
> 

Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>

> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 09baac2dbc36..82b04714f750 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -200,14 +200,18 @@ static int vidioc_venc_s_parm(struct file *file, void *priv,
>  			      struct v4l2_streamparm *a)
>  {
>  	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> +	struct v4l2_fract *timeperframe = &a->parm.output.timeperframe;
>  
>  	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>  		return -EINVAL;
>  
> -	ctx->enc_params.framerate_num =
> -			a->parm.output.timeperframe.denominator;
> -	ctx->enc_params.framerate_denom =
> -			a->parm.output.timeperframe.numerator;
> +	if (timeperframe->numerator == 0 || timeperframe->denominator == 0) {
> +		timeperframe->numerator = MTK_DEFAULT_FRAMERATE_NUM;
> +		timeperframe->denominator = MTK_DEFAULT_FRAMERATE_DENOM;
> +	}
> +
> +	ctx->enc_params.framerate_num = timeperframe->denominator;
> +	ctx->enc_params.framerate_denom = timeperframe->numerator;
>  	ctx->param_change |= MTK_ENCODE_PARAM_FRAMERATE;
>  
>  	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
