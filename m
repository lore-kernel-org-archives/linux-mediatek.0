Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89B1C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 06:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2t0EHghdZEZ/nMCrQ9vAkg6wwMVt0D2CUy16Xe/84c=; b=hKXBeeNVuIkYhh
	TBgZ1UQpSRCZkVk7wsKpwdqnAyRikWQ+hm2wlJt6Ko6Xg6iSUQLf/8rTBkEEXqLZJk5CMmDxsjcNe
	3tJletyfYW6CN+K5zuI4n/+tIV+vUhWQPlzS7YEPpagnyzSudNdB8yYH5tsX2Ukxc9yYteOxpaOdw
	artr+ar1zaIV67k5Wf9peLimmWNqMKlOlBBJ1ATZKo9wYxs2r5eAQODXmEVkEEGDDM9No/CHOtypJ
	f8f3Rw05GauD9VdqPiwMDN69vQ+ec88FcGxsoagjr46ZFoRjY43GnZu0HrxFA6PDrPdVNsg7TPW6b
	sZ6e0AyxFZ385wjX9qBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Sa9-002Leh-Kr; Wed, 29 Dec 2021 06:37:05 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Sa7-002Lcl-6h
 for linux-mediatek@lists.infradead.org; Wed, 29 Dec 2021 06:37:04 +0000
Received: by mail-pl1-x634.google.com with SMTP id n16so15242920plc.2
 for <linux-mediatek@lists.infradead.org>; Tue, 28 Dec 2021 22:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=p7zVEyegDmuj+6n30KCO1S5If0BRlYsdYfkjtOazVTk=;
 b=US3E/hqHlmnyPzOy/HskFnqIw6YITYtB3SecYzBz/TvRFRiaQ5DNALRLAG1KPwoX4J
 sdBQ2c6Fm0s8nGLH1iLRLu6FUqFDXjmD5E5kgs1rUOuHC+aCdtwY5dqh2Ev41kZOMVMb
 JT/44yXGfpcDJ/kOLKnYQIqs7HAjYlSLDIVP98i5KxF2HWCRbPPlFuiGAGcRbPQoTNpq
 pKVNacwTs8+fmivZ1QHilorH76JfKWLYlHAR+j1FcZCE4uG8HNOHvJyki9/G9qHZ9doc
 w3+mIdcw/VCRHpkDbNyJyPBV0iBAIkpoMwfbDuFPZgJmId3BIzA0/bGe1/XouW9QehRg
 3+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p7zVEyegDmuj+6n30KCO1S5If0BRlYsdYfkjtOazVTk=;
 b=O1wbXVCy+VDUsReHnxTQzbf8+KSHoI9KXGwqgsJ7Dy3hldTqk9b5GIrckDRusM3ipQ
 OQdQn7f8WOpPxkbUy0kYXf8SA0mdf3DlQsJyLUiBq29zt8m6yVbqCEASt1fjwy5moWl3
 Og6mt5zHGRVG2U/uftDDQ6xVp3NFagY8+90hdRWbuQmKB+HEFxhiWSRSBQJVA+Xd4062
 bqejTE9O4zjKOrB13EhepDG78PvhN/wHy5CcDxbx3AIe09DIqorjSrZtAkbHubmXDVeV
 t9x+bNhyVzs5MBZAVAr8TvfmWZ9flrD595T8Um4hEI8cDM01EerUcz9WZP/JAi9msJ9j
 dj2A==
X-Gm-Message-State: AOAM531onqNUyU0q0YZwlayx+JSxSwILBZnlAxW0AAKOpZHElrvXZ+Zs
 +Gjb+E1rQtJWC65rGjSvZbcjJw==
X-Google-Smtp-Source: ABdhPJzbQgs3ZiPyG3g68c9CE72l8nXqFUBGdfo2PobHZ4oRqfWUj1AoQFmLtN/bznm5cjXVREY+kQ==
X-Received: by 2002:a17:902:6a82:b0:148:a2e7:fb5c with SMTP id
 n2-20020a1709026a8200b00148a2e7fb5cmr25308794plk.157.1640759819836; 
 Tue, 28 Dec 2021 22:36:59 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4dea:2b20:ea89:724b])
 by smtp.gmail.com with ESMTPSA id p37sm18097039pfh.97.2021.12.28.22.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 22:36:59 -0800 (PST)
Date: Wed, 29 Dec 2021 14:36:54 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2, 05/12] media: mtk-vcodec: Call
 v4l2_m2m_set_dst_buffered() set capture buffer buffered
Message-ID: <YcwCBgw6ZjYwBLFf@google.com>
References: <20211228094146.20505-1-yunfei.dong@mediatek.com>
 <20211228094146.20505-6-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211228094146.20505-6-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_223703_277513_D5B2B872 
X-CRM114-Status: GOOD (  14.98  )
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

On Tue, Dec 28, 2021 at 05:41:39PM +0800, Yunfei Dong wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>

Same as 4th patch.  Please fix it.

> For lat and core architecture, just need to get output buffer for lat
> decode. For core hardware need to get lat's message and capture buffer.
> In order to let lat and core decode in parallel, need to set capture
> buffer buffered.

I think the description should be rephrased.

I may misunderstand but something like the template:
"""
OUTPUT -> lat -> core -> CAPTURE.  Lat and core can work in parallel.

Sets capture buffer buffered to ...
"""

> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> index 5aebf88f997b..23a154c4e321 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> @@ -314,6 +314,9 @@ static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
>  	src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
>  				 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>  
> +	if (ctx->dev->vdec_pdata->hw_arch != MTK_VDEC_PURE_SINGLE_CORE)
> +		v4l2_m2m_set_dst_buffered(ctx->m2m_ctx, 1);

s/1/true/ helps readability.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
