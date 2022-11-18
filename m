Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE797C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 14:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAjWbRWqEitk8RQ8rQGWmCu5fnBnnF3qq3D4wL/pwhg=; b=Tj1y/qvHOA5SAx2rpAfCXuLnsw
	v5aaYcRintaanOw+aqjVFESlejqHvyY53LK04P9s3MIh0PWVi9aCsbWEd0F9WueoaEHyUraa9bVts
	+QJ8dXiu3t0e2px6MW87GN26RYLLViL/IDbltIxz83LhEfFYatG3l24FO2vxXDoII3eJKqfwVFMiz
	PJsDAxlpxPgpHEmyVhhZccB8btZryJY65V3LuipFL9KtaNap05qQUvxZ9ZVBcx7rachxc5a3eagUv
	3RdO77BDcK4DIExbz/vwBgCAtzCFRdXTJMaREBPo5g2WxjsMjXkY8ifxueTpGRvDAukaHCHFIVmEu
	EdrhhNaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2X6-004Xao-Cz; Fri, 18 Nov 2022 14:39:56 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2X3-004XWn-1B
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 14:39:54 +0000
X-KPN-MessageId: de5a29d8-674e-11ed-bd66-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id de5a29d8-674e-11ed-bd66-005056994fde;
	Fri, 18 Nov 2022 15:39:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=KAjWbRWqEitk8RQ8rQGWmCu5fnBnnF3qq3D4wL/pwhg=;
	b=PGuQljui9azlCkqyfPGfVBYQMA7Sfy5qu/k/a94on8TUgdW1i0zq/dfZ4fYLQ/m4QLpIcZ2tIkG+4
	 h6Q/vPQI/gvjShZIiCjzXhcIuvE/SJieKtwVZkPRSxteuey4vOFLWc1CW1FguFAt2Xpy9zKuFFNmer
	 pODbvVydOI/qoRDsMOdZNwIOCsCbGwotqSwYJxQ/cYPTDMeLDNd888EXz0r/VvYt3A9x/V9iFAXjGR
	 FKIh9kN0LoNtSQ73pSvz6gKPVkk/Eng8Csy94Xf+onq6A2jKwh+epmV7tTor2NbemHSWaQDkFeKIQC
	 OvhtNna722oWfjPuXkHaZQvynaAjA9Q==
X-KPN-MID: 33|pjf0Jn5zAyCMRtfEBaA4sEua2aYn1IRSQpDdlCjFD2Xi2LRJbY5pB91LA8orcZl
 cUq4QSbC21K8BMR9txUGALQ==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|ySOW7ppoxARsp8AZR2P/+82tTweUC0409/AltcmQM/hk9iRKek0WfTEiiegtRH4
 3jGdHuM6V8DPnnqyebijP9A==
X-Originating-IP: 173.38.220.59
Received: from [10.47.77.219] (unknown [173.38.220.59])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id d9605df8-674e-11ed-8bc9-005056998788;
	Fri, 18 Nov 2022 15:39:48 +0100 (CET)
Message-ID: <8bed61a3-1200-48b3-0934-65285e322184@xs4all.nl>
Date: Fri, 18 Nov 2022 15:39:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3] vcodec: mediatek: add check for NULL for
 vsi->frm_bufs[vsi->new_fb_idx].buf.fb in vp9_swap_frm_bufs
Content-Language: en-US
To: Anastasia Belova <abelova@astralinux.ru>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 lvc-project@linuxtesting.org
References: <20221111090604.10327-1-abelova@astralinux.ru>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20221111090604.10327-1-abelova@astralinux.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_063953_253928_079D7A49 
X-CRM114-Status: GOOD (  19.47  )
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

On 11/11/22 10:06, Anastasia Belova wrote:
> Any time calling vp9_is_sf_ref_fb we need fb != NULL after checks.

This doesn't match the subject line at all!

> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: f77e89854b3e ("[media] vcodec: mediatek: Add Mediatek VP9 Video Decoder Driver")

Drop this, it's not a fix, it just attempts to make things more robust.

> 
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---
>  drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
> index 70b8383f7c8e..776468cd834a 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
> @@ -208,6 +208,9 @@ static bool vp9_is_sf_ref_fb(struct vdec_vp9_inst *inst, struct vdec_fb *fb)
>  	int i;
>  	struct vdec_vp9_vsi *vsi = inst->vsi;
>  
> +	if (!fb)
> +		return true;
> +
>  	for (i = 0; i < ARRAY_SIZE(vsi->sf_ref_fb); i++) {
>  		if (fb == &vsi->sf_ref_fb[i].fb)
>  			return true;

This won't work: if fb == NULL, then depending on whether
this function returns true or false, the code in vp9_swap_frm_bufs()
will crash in either vsi->frm_bufs[vsi->new_fb_idx].buf.fb->base_y.va
or in vp9_free_sf_ref_fb().

Unless you can show there really is a path through which fb can be NULL,
I don't think it is worth continuing with this.

Regards,

	Hans

