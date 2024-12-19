Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19E0E7718A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2024 09:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lsL5MvpyUJT/g7OPRNEEH9d17/70n2QS/pZPS+4W0Y=; b=FNW/oyc8kxgaRQpae4Vg2AHsH6
	Z7W1N81aTBxxxcZ0cFKNQubEg77+9/qsFljlHnEXggO4dHgK2TRm8TBhHrUX+3kRzwxCpCzk7rC/S
	adjX8w/Ocxgc3Y3lYXpejPtBCliIqHLyvBJ2xLD97TN09ZAhfZYxoWNUHQq2S6A4xyw7Umyw2/vix
	UWcWNcpbFuc1knmXDtAT/xBA9U6ZyYks1PoXNQqL0E6RfYRnZY6mRANIs8fTeQqkGiVw02hm3Jzmh
	BU8bYe+Ep8v5TNF+Mcpgn1Lj8UojoxT4TXsm3h0goA2V9VBFlDdzeND0EFcCkQlFxdxbb0oGWYW8b
	Cm6tkDdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tODBh-00000001SwQ-3RUa;
	Thu, 19 Dec 2024 09:51:21 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tODBe-00000001Sus-02R3
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Dec 2024 09:51:20 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-29fb5257e05so167893fac.0
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Dec 2024 01:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734601876; x=1735206676; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7lsL5MvpyUJT/g7OPRNEEH9d17/70n2QS/pZPS+4W0Y=;
        b=xMdc7u2F9slkWsmMr5kyqICP3EbPb4uH7iYSgWG0Gg3cQNy1N9Y7w1oXVF51UVj8V7
         CT/L6gAOwyyIQfip4NM2Pm9idz35xgRTq3EhtrjJut06Ev5vldkBQk0SM3ZnxUUyF8jT
         Vjy616Iajsz5welutWRALw4iYCcI2h8RzQMTzHpYvf6Xr/Z3dX+zdQEzaLmssD451JrT
         V1zIw2o6V+08xVxEKZSp5y9ZcQdn8DirtRTqojm6vpHaz+uhP53gS+h5C7CSYQoiN6oI
         jNKArW48gCDRbuuoWW/jG7J7LdggYmfBufKj4NKwzwYbVv7jzdbZW5gfhWQft9BraaZD
         S2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734601876; x=1735206676;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lsL5MvpyUJT/g7OPRNEEH9d17/70n2QS/pZPS+4W0Y=;
        b=fWuqYaE9PCXqYYVkBfGYTNyqO1+eocwNFjdOpdtCxE2uLKsqX2ahc7lBNjeY0nPvQ9
         06SrgcPTYQUoFsEeIcW+GOf0eFqcF0IyPKwfnTcq/3sMGgvOOKYftVPexugzjFExN5dt
         v9tg3YLFdbSRp1HSg8u8nQQnnjmi7odXuZT1465Kb/q3PEk8FzDAuuqaOg48zS8+lafW
         JD3o9lXgeOWwq5VEtP/rDtEFmzRhI88uaIp7VA2Ipnt1YmCLmSLnAXY17gkdMP8hK9ea
         w1hpO+snwX4slknqZOFcJ6TT4Q1MPG/Tc3adSRl2emap2nEFLw11G/oHYXJhipclD2He
         FlWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvfE5guliNk7ad/YZ4mjybtZqHJFyCD+VPVobqu/o13OaJ7ZPyP5WH9T06oxehFduoe4FgPU+c8T9k8zYqzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyakCkqO9L7xRpp9spPc/oog/4V4pwZpcB1/tmDTqXwXUNRFcbL
	GO4+O5wYzN/GfXLouHoSDwFqXYxNXJGiCQf389Uv2LDd6/dDZuyD90uO5Q9Sr2gWAeibEcLl0Fh
	so8OpOJDtgSMaJXayOiObqa2j2EaTRyQrlHD/Zw==
X-Gm-Gg: ASbGnctu1+hMPDHaJ0fiP/P525TRPQP0axJodT/WXFcsGuEkYnwODd2etq+gnN/Pcj1
	T86YOqGgIYi3Us+mjyRUr0OM2wpE4rs3Lu9T2
X-Google-Smtp-Source: AGHT+IEy79LXyiT2op8bTAdUEawSGOv+z8DC4vTnwhR7g9WzIVoZpBiDFmT+ifNeJg1xtzw9VNaK+cZyVwT46kQSRM8=
X-Received: by 2002:a05:6871:e786:b0:29e:255e:9551 with SMTP id
 586e51a60fabf-2a7d074d490mr1547605fac.2.1734601876589; Thu, 19 Dec 2024
 01:51:16 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Dec 2024 03:51:16 -0600
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.8.10
References: <20241218113448.2992-1-liankun.yang@mediatek.com>
In-Reply-To: <20241218113448.2992-1-liankun.yang@mediatek.com>
MIME-Version: 1.0
Date: Thu, 19 Dec 2024 03:51:16 -0600
Message-ID: <CABnWg9uvQ4_vxYx-_8AKE_CvLgKd04LuvS1qvKwyMHvBck7_cw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] drm/mediatek: Add return value check when reading DPCD
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	ck.hu@mediatek.com, dmitry.osipenko@collabora.com, rex-bc.chen@mediatek.com, 
	jitao.shi@mediatek.com, mac.shen@mediatek.com, peng.liu@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_015118_312384_B4D15AD0 
X-CRM114-Status: GOOD (  11.08  )
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

On Wed, 18 Dec 2024 12:34, Liankun Yang <liankun.yang@mediatek.com> wrote:
>Returns the number of bytes transferred (1) on success.
Hi Liankun,

I'm not sure this statement above is true, you are not returning the
number of transferred bytes?


Aside of that little nitpick

Reviewed-by: Guillaume Ranquet <granquet@baylibre.com>

>Check the return value to confirm that AUX communication is successful.
>
>Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
>
>Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
>---
>Changes in V3:
>- Using drm_dp_read_sink_count() to improve patch.
>Per suggestion from the previous thread:
>https://patchwork.kernel.org/project/linux-mediatek/patch/20241128030940.25657-1-liankun.yang@mediatek.com/
>
>Changes in V2:
>- Modify Fixes in Commit Message.
>Per suggestion from the previous thread:
>https://patchwork.kernel.org/project/linux-mediatek/patch/20240930092000.5385-1-liankun.yang@mediatek.com/
>---
> drivers/gpu/drm/mediatek/mtk_dp.c | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
>index 36713c176cfc..b26dad8783be 100644
>--- a/drivers/gpu/drm/mediatek/mtk_dp.c
>+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>@@ -2100,7 +2100,6 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
> 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> 	enum drm_connector_status ret = connector_status_disconnected;
> 	bool enabled = mtk_dp->enabled;
>-	u8 sink_count = 0;
>
> 	if (!mtk_dp->train_info.cable_plugged_in)
> 		return ret;
>@@ -2115,8 +2114,8 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
> 	 * function, we just need to check the HPD connection to check
> 	 * whether we connect to a sink device.
> 	 */
>-	drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
>-	if (DP_GET_SINK_COUNT(sink_count))
>+
>+	if (drm_dp_read_sink_count(&mtk_dp->aux))
> 		ret = connector_status_connected;
>
> 	if (!enabled)
>--
>2.45.2

