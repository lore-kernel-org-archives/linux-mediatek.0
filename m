Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B898C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 05:48:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B6B120737
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 05:48:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DObwLRGe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EEJTjwk7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B6B120737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VaLf4yHQQEFfI7QIrncqLpXvbjq3Akth4wibJXj/sj0=; b=DObwLRGetLEBp3p31jDkszsOx
	GzwDX7ptdC1yvQoyD/zLjNOr3FLPV6oCuLKP3MmlmVAy41AdTBTJ02MweqLuR/bhlnSAC+R0pdGMp
	jwhiHBLfKTOEGjiNqCNlBKb5yMgD113rtY2J/IgdF3VZIt2UQOun5zfo68L8xLJUERSdmDoRRtIyQ
	/w4Ci4z7OjFPA82XagxaepaKLwlO2N+ZaXxLO4rCSmqSvPLzpfz2A8Lg70UhkyGsJWAB8Tffggw0E
	WLGTBZmZdm2DrlZZUYWya0dPsbA30ywNTailIJHl/zCq43bCJikUIk34incu4izcpfqFYdlYBkFvr
	qQu+7WEyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kARow-0008Fx-GM; Tue, 25 Aug 2020 05:48:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kARou-0008F8-1x
 for linux-mediatek@lists.infradead.org; Tue, 25 Aug 2020 05:48:33 +0000
X-UUID: a526ccba296144cb829f0c6a12cfd9e7-20200824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Gj2k2nCRgpGn8wDG6E8zsIIVRy+7rfL5+QIF8gvfJnM=; 
 b=EEJTjwk7kD0puC3M+CUouq/DnqRG3kkTTBQ4bUvM1dZIz1G2jWQdIiMMNmQwDtXuvJJfkMFXxe7hn9vxpUdDe+6R6xA97O+g2yT1s+LNllcdvRRTe+C8HAVJcX9RgukRoI8IlJupxWqkFmtrnlgi5dy6tEyATA1rKnY1a9szxKQ=;
X-UUID: a526ccba296144cb829f0c6a12cfd9e7-20200824
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2097447822; Mon, 24 Aug 2020 21:48:28 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 22:48:25 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 13:48:25 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 13:48:25 +0800
Message-ID: <1598334505.1969.2.camel@mtksdaap41>
Subject: Re: [PATCH v4 16/17] media: mtk-vcodec: venc: set default time per
 frame
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Tue, 25 Aug 2020 13:48:25 +0800
In-Reply-To: <20200821103608.2310097-17-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
 <20200821103608.2310097-17-acourbot@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_014832_259312_71921B33 
X-CRM114-Status: GOOD (  15.35  )
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
> The time per frame was left initialized to 0/0, which make the driver
> fail v4l2-compliance, and also leaves it potentially exposed to doing a
> division by zero.
> 
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>

> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 1b79185cf922..09baac2dbc36 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -24,6 +24,9 @@
>  #define DFT_CFG_HEIGHT	MTK_VENC_MIN_H
>  #define MTK_MAX_CTRLS_HINT	20
>  
> +#define MTK_DEFAULT_FRAMERATE_NUM 1001
> +#define MTK_DEFAULT_FRAMERATE_DENOM 30000
> +
>  static void mtk_venc_worker(struct work_struct *work);
>  
>  static const struct v4l2_frmsize_stepwise mtk_venc_framesizes = {
> @@ -1197,6 +1200,8 @@ void mtk_vcodec_enc_set_default_params(struct mtk_vcodec_ctx *ctx)
>  		DFT_CFG_WIDTH * DFT_CFG_HEIGHT;
>  	ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] = 0;
>  
> +	ctx->enc_params.framerate_num = MTK_DEFAULT_FRAMERATE_NUM;
> +	ctx->enc_params.framerate_denom = MTK_DEFAULT_FRAMERATE_DENOM;
>  }
>  
>  int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
