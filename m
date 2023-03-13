Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4508C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 13:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MUKwK4mMLPh7ybgb0zp1vSLgBpL+VO4MptFgIGqwuU=; b=VRpKK8B3bqjdRbpCVvqD812yum
	Lzslav+fw4llFkEo5fOBkkTtjpLDoxIJW2We472kAQ/WoyMeC0vbi0DqZfWeb1sg8RCUA2ChBytd7
	lfZ4IFJWCVEEtzqFzqDwT6axsjkmcz6Nkq+ZoQVBHvlzFetHe0PKRZ4rpBTeAc5jwpz1NivZW5KD0
	R5GoO2xy6lyN8U4N7qylYAtsPqo9Pj2f3Dxg+8BmYYeM++N01VzhfjSTobtQ8J/Mp8JC5xWWSGUO6
	rXVFbSIcgWCYwjP9pqT926g0JH347jK+FvoD02D/ZAkkG84gJnh6PE6iJYgiMATxi0i9lYicZiJM4
	Fz1Nri5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbi0w-005pDK-2N; Mon, 13 Mar 2023 13:14:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbhyW-005o07-Eq; Mon, 13 Mar 2023 13:12:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 121CEB810EE;
	Mon, 13 Mar 2023 13:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743B3C433EF;
	Mon, 13 Mar 2023 13:12:23 +0000 (UTC)
Message-ID: <b3a32197-c15d-bfdb-051d-724c63ad8cf0@xs4all.nl>
Date: Mon, 13 Mar 2023 14:12:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: mediatek: vcodec: Use 4K frame size when supported
 by stateful decoder
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230302131821.2060936-1-treapking@chromium.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230302131821.2060936-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_061228_671680_B7794A3A 
X-CRM114-Status: GOOD (  21.87  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 02/03/2023 14:18, Pin-yen Lin wrote:
> After commit b018be06f3c7 ("media: mediatek: vcodec: Read max resolution
> from dec_capability"), the stateful video decoder driver never really
> sets its output frame size to 4K.
> 
> Parse the decoder capability reported by the firmware, and update the
> output frame size in mtk_init_vdec_params to enable 4K frame size when
> available.
> 
> Fixes: b018be06f3c7 ("media: mediatek: vcodec: Read max resolution from dec_capability")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
> 
>  .../mediatek/vcodec/mtk_vcodec_dec_stateful.c        | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
> index 035c86e7809f..679f4dc9acfb 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
> @@ -11,7 +11,7 @@
>  #include "mtk_vcodec_dec_pm.h"
>  #include "vdec_drv_if.h"
>  
> -static const struct mtk_video_fmt mtk_video_formats[] = {
> +static struct mtk_video_fmt mtk_video_formats[] = {
>  	{
>  		.fourcc = V4L2_PIX_FMT_H264,
>  		.type = MTK_FMT_DEC,
> @@ -580,6 +580,16 @@ static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
>  
>  static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
>  {
> +	unsigned int i;
> +
> +	if (!(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED)) {
> +		for (i = 0; i < num_supported_formats; i++) {
> +			mtk_vdec_framesizes[i].stepwise.max_width =
> +				VCODEC_DEC_4K_CODED_WIDTH;
> +			mtk_vdec_framesizes[i].stepwise.max_height =
> +				VCODEC_DEC_4K_CODED_HEIGHT;
> +		}
> +	}

This doesn't apply: commit cfce5b186537 ("media: mediatek: vcodec: decoder: Embed
framesize inside mtk_video_fmt") removed mtk_vdec_framesizes.

Please post a v2 if this is still relevant.

Regards,

	Hans

>  }
>  
>  static struct vb2_ops mtk_vdec_frame_vb2_ops = {


