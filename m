Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3E4C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 17:14:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFE6920888
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 17:14:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LGHy+weM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oFBXmglF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFE6920888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SJbrDBCl6FSWFqdNVsT4fHpQolNSUD07G5kAUHRB3po=; b=LGHy+weMVR5huuHnkaE/+QqEv
	3GlJ9qpDF7+BwhOxvO9cIJirkgQzIYGObLekDKn5e8e1SuS0FWPMgQ+o+8LaR8XngiB/arZnuiGIv
	KuTsFgWMvlg4Ilg4JlSaXJnD330dad5KzIodvW8Zk30I8IWwVRfCg41Y7gd1Mf+s7sINFPHBHuRbr
	6bXgC3O4FrUph34kU2Q2KzWd4MLXgB/VdnZgKtuIp5VCpoBMUbuBeDGDDe5nALaqUEhKb+OLlynGJ
	L3g6iijLSkXndwYKSZ2SdwTEpr4GQdmPq5UmcdgIe7Gbs7K20QnBTs2Vdzb+L6cUQRZgcp7ac6ytO
	+LL77RoJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8RfQ-0007Zx-6V; Wed, 19 Aug 2020 17:14:28 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8RfL-0007YR-CY; Wed, 19 Aug 2020 17:14:24 +0000
Received: by mail-wr1-x443.google.com with SMTP id a15so22241186wrh.10;
 Wed, 19 Aug 2020 10:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uxW4P/9c5owj5TbqeeSJhimozsZ/ts6TLrVEcdoDcKc=;
 b=oFBXmglFqppJ5H90JX7k9hVq8siJfn73/Uhkmym4cndlhhgXjw4iDjKyVkO8F42dui
 dEbp2PPwm99BpwM07gh7iv6zAyTreBFl2zIdvbvU+uieLrbSW3w6DM1km47en0+Bizfe
 8AKRsx+fg1XsTpvJuGOTZWK2KQ7gpM8avVsrNwBjaC730kj4ckvcJ3CJfhVYhJNBIi3r
 jCWrYD0yGziZ6ueN0FREoyhaitcwrI7Q18FXL/5hgm09WF59Ri5Ipe4IRXnjU6UtswGc
 4hwH/CVPBKpDUPfuT9HFbA/0Rm2U14iAHLyPHFmdawomBqNr9ZMIWU+0Eo4Gh/p7acp2
 d/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uxW4P/9c5owj5TbqeeSJhimozsZ/ts6TLrVEcdoDcKc=;
 b=cambjvz2xT58nt/0ubn98h1bHuEIjFrWhj7Z79WtpJHJPCBlI/8gGZiK1FTu+LnPkW
 y1T5W7HuwNzFzOAnqqrneiVEJRCrA+oP3qTgm3vHjCMQ8TL8il/Od0PMeoe1WPQmCG7x
 Mqsl4OpxaEyvnGb4owTrvJBRr9lnTTyYQ3NvofgleXaGddo3sAbD/PRXmhmzv5t9zH4G
 TZ37Legbn0kYm2c5VUPxuedbvF5QzoWL/fZBQxezvad/CCJ02mKPAzH4v4UqEuriey4n
 m7C/G6D6m9wNF07k6ORWxbdTfo9EEEnWBkMe/KYJ8NtDjFvFJymW8cuU7CdIKsySxevT
 xTNQ==
X-Gm-Message-State: AOAM530uhWLZJfSCweRXDXZHMj7TFAEinbJwGVM7NCd8Afm+JPHm2VVz
 5i8PZ6jY/yPPlDGG5pUj+fs=
X-Google-Smtp-Source: ABdhPJxuglAF/P70gnxyfeZB51uIoA+nGJl5R01Hf8f8HnZsYxB4igMuLgNDVozV2tn4SOsRThTh5w==
X-Received: by 2002:a5d:6646:: with SMTP id f6mr25966574wrw.155.1597857262147; 
 Wed, 19 Aug 2020 10:14:22 -0700 (PDT)
Received: from ziggy.stardust ([93.176.180.54])
 by smtp.gmail.com with ESMTPSA id f17sm6742926wru.13.2020.08.19.10.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 10:14:21 -0700 (PDT)
Subject: Re: [PATCH v5 5/7] drm/mediatek: dpi/dsi: change the getting
 possible_crtc way
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-6-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <4812f750-5f85-61bb-fb68-4eec99285e77@gmail.com>
Date: Wed, 19 Aug 2020 19:14:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819081752.4805-6-linux@fw-web.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_131423_476031_88792F9D 
X-CRM114-Status: GOOD (  22.45  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, Frank Wunderlich <frank-w@public-files.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 19/08/2020 10:17, Frank Wunderlich wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> For current mediatek dsi encoder, its possible crtc is fixed in crtc
> 0, and mediatek dpi encoder's possible crtc is fixed in crtc 1. In
> some SoC the possible crtc is not fixed in this case, so call
> mtk_drm_find_possible_crtc_by_comp() to find out the correct possible
> crtc.
> 

Hm, shouldn't we stash this int 4/7, otherwise we will have not used functions 
in 4/7.

Regards,
Matthias

> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c | 3 ++-
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index d4f0fb7ad312..e43977015843 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -608,7 +608,8 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
>   	drm_encoder_helper_add(&dpi->encoder, &mtk_dpi_encoder_helper_funcs);
>   
>   	/* Currently DPI0 is fixed to be driven by OVL1 */
> -	dpi->encoder.possible_crtcs = BIT(1);
> +	dpi->encoder.possible_crtcs =
> +		mtk_drm_find_possible_crtc_by_comp(drm_dev, dpi->ddp_comp);
>   
>   	ret = drm_bridge_attach(&dpi->encoder, dpi->bridge, NULL, 0);
>   	if (ret) {
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 16fd99dcdacf..c9f4ad029cb1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -974,7 +974,8 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>   	 * Currently display data paths are statically assigned to a crtc each.
>   	 * crtc 0 is OVL0 -> COLOR0 -> AAL -> OD -> RDMA0 -> UFOE -> DSI0
>   	 */
> -	dsi->encoder.possible_crtcs = 1;
> +	dsi->encoder.possible_crtcs =
> +		mtk_drm_find_possible_crtc_by_comp(drm, dsi->ddp_comp);
>   
>   	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
>   				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
