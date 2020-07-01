Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A398C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 03:41:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DABA020748
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 03:41:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cGuGF4Ph";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AHHT2TII"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DABA020748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DiESNkrjmdE8VzS11N6LW4V7jyD9FI2KeNlT82joInk=; b=cGuGF4PhAywxQ9hvi6OuMrsa3
	9/pFJTX9rhpq+N+vGiUDR6BAZ9olZFp14/q1MWp0JdHKEkOysg60MOcbJhgjWXUWU5iS7mMFG8BMT
	0Pag1aCj5uvzFf6diR72jS2D1PxyLAdBwV9EOtuLMl7xzX3xbYYks8+mjI3rHaT5zMnt1xXxDS3uz
	au26/mxjuWKs/ns0q1J+VPBDk6wX0sBEQcq0cCue2/8dJfAAhYINRcsshTqBh4Zo7+2KVx0VkTQ/l
	c/5iPvaygvBYnV5+EEEy8BrbW/rZQeol14AZxoCFWLR1i6YrtieH8N5QHzDe3sydmbMEfHMyhSl51
	vQo4Ar/HA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqTcM-0007df-Qu; Wed, 01 Jul 2020 03:41:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqTcJ-0007cu-NN
 for linux-mediatek@lists.infradead.org; Wed, 01 Jul 2020 03:41:01 +0000
X-UUID: ae733b297d3c46fca246d8ec9e377026-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jPLb6X7KkAERFbw83D4rpBHLOde+TpO2PyeCi9S6N1E=; 
 b=AHHT2TIIhepSYWlhLVKskutyhuKRf2HSMQvwbgvqDuaoO7na3BOl662AHh1phPyVHy3TXzTz5j2TzzG/l9HbuknxCEpoR6epc0OAxFeXo9t6xkoep6UTdIQSVEIS6AySYPnfqT8TQ7uVnAx/4GQmGlCvNLi7zGs8vXXaI0hPVuo=;
X-UUID: ae733b297d3c46fca246d8ec9e377026-20200630
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 404130093; Tue, 30 Jun 2020 19:40:34 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 20:30:52 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 11:30:48 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jul 2020 11:30:48 +0800
Message-ID: <1593574249.1533.1.camel@mtksdaap41>
Subject: Re: [PATCH v2 11/18] media: mtk-vcodec: venc support
 MIN_OUTPUT_BUFFERS control
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 1 Jul 2020 11:30:49 +0800
In-Reply-To: <20200626080442.292309-12-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
 <20200626080442.292309-12-acourbot@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A53B404917E71990100EFA58BA547508BC57621DE14CC7C0F8BFD21319A27A322000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_234100_199065_4EE205E5 
X-CRM114-Status: GOOD (  12.41  )
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
> This control is required by v4l2-compliance for encoders. A value of 1
> should be suitable for all scenarios.
> 
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>

> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index f2ba19c32400..f833aee4a06f 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -1206,6 +1206,8 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
>  
>  	v4l2_ctrl_handler_init(handler, MTK_MAX_CTRLS_HINT);
>  
> +	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
> +			  1, 1, 1, 1);
>  	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_BITRATE,
>  			  ctx->dev->venc_pdata->min_bitrate,
>  			  ctx->dev->venc_pdata->max_bitrate, 1, 4000000);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
