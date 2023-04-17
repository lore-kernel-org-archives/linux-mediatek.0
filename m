Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B014FC77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 08:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+5FXgxPfP+kYy0cKYJROIavk4Tvu9mzSjFMZaAs0VQ=; b=k/SV3Y5e7xW+coNtHkL2l54woG
	s4FocQ9py+yeWAlT0J/Tt4jUseQziXlTDKMNgWacups3Q3SN21KBEMA9XBSZLlLTn3G7rq/vOqPxC
	lkwvAUa/LeqiKuvFYDdcbxuQ90YJhPbP97WV860m2z4uE08gmpNlbaZyXV0TVmk7RaSDRsNb9xJeU
	LaqEVWoFdzervxhcnaSHq/tsQqpW2vDOTRrd9veTFyuxDt/AX9I8Pxpg/VlkNnwMaVvpl+E0SVgRK
	O1WsI3MD1mZv4bViLiWWOl/uP4o2lznKqxxkywGVnACZApe5ELwqbriTG9vL9u51bXKerJOn5WGA+
	U0WiAHCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poJnu-00FJZE-0E;
	Mon, 17 Apr 2023 08:01:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poJnr-00FJXr-09;
	Mon, 17 Apr 2023 08:01:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8552761FAC;
	Mon, 17 Apr 2023 08:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF9EC433EF;
	Mon, 17 Apr 2023 08:01:30 +0000 (UTC)
Message-ID: <0341924c-7f0a-28aa-eeae-f7de69ab36d8@xs4all.nl>
Date: Mon, 17 Apr 2023 10:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: mediatek: vcodec: Move a variable assignment
 behind condition checks in vdec_vp9_slice_single_decode()
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Guo Zhengkui <guozhengkui@vivo.com>, Haowen Bai <baihaowen@meizu.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mingjia Zhang <mingjia.zhang@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <b98dcc94-13f3-a6cb-f5bd-f1f8644d87d1@web.de>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <b98dcc94-13f3-a6cb-f5bd-f1f8644d87d1@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_010135_118767_1298D0B2 
X-CRM114-Status: GOOD (  21.29  )
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

On 14/04/2023 20:30, Markus Elfring wrote:
> Date: Fri, 14 Apr 2023 20:07:01 +0200
> 
> The address of a data structure member was determined before
> a corresponding null pointer check in the implementation of
> the function “vdec_vp9_slice_single_decode”.
> 
> Thus avoid the risk for undefined behaviour by moving the assignment
> for the variable “pfc” behind some condition checks.
> 
> This issue was detected by using the Coccinelle software.
> 
> Fixes: b0f407c19648ae9110c932c91d6e1b9381ec0aeb ("media: mediatek: vcodec: add vp9 decoder driver for mt8186")

Not a fix, it was never broken.

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  .../media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c  | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> index cf16cf2807f0..22b27f7b57bf 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> @@ -1990,7 +1990,7 @@ static int vdec_vp9_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>  					struct vdec_fb *fb, bool *res_chg)
>  {
>  	struct vdec_vp9_slice_instance *instance = h_vdec;

Just drop these lines instead:

        if (!instance || !instance->ctx)
                return -EINVAL;

That can never happen.

Regards,

	Hans

> -	struct vdec_vp9_slice_pfc *pfc = &instance->sc_pfc;
> +	struct vdec_vp9_slice_pfc *pfc;
>  	struct vdec_vp9_slice_vsi *vsi;
>  	struct mtk_vcodec_ctx *ctx;
>  	int ret;
> @@ -2007,6 +2007,7 @@ static int vdec_vp9_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>  	if (!fb)
>  		return -EBUSY;
> 
> +	pfc = &instance->sc_pfc;
>  	vsi = &pfc->vsi;
> 
>  	ret = vdec_vp9_slice_setup_single(instance, bs, fb, pfc);
> --
> 2.40.0
> 


