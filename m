Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65D6C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 12:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWUNaPp+86lBcDxmM5Cmz1FWFIuaBbRZyVpt9vvYx2k=; b=XLkw7Dgxygv/+e
	O5kfAPLSfzM6OOzyLA/wCyORb70vu2sAkOIhLIPre+uNU6NW3X/8KRVb677OI28EsfT2wahIpgOtZ
	lExyPv23KcKdRS5Q1UitpFrOop6YRKE3hvsYHd9xbGloUyY/REXRM3d1BRvH+8ONQTCfmr7H/GmZZ
	9B6CjajAguKxgQpMHe0/Y6EAeflgrSoqoXv/U+Xk4YKqNvT1L5E6QeyePX6YJfuR8NAW84rEI1Wtv
	/SA3xFhPL+0zJbP3jhh+4W/hWKJP37c6HWRQyddsQlm9XOaH65qUopGjrAQ1cw2qOXQkXo8zHaqVt
	jYlvwmzHOXgvpJ4TpXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhsc0-000TXi-RR; Fri, 22 Apr 2022 12:42:12 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhsbv-000TVm-VC; Fri, 22 Apr 2022 12:42:11 +0000
Received: by mail-ot1-x32d.google.com with SMTP id
 c11-20020a9d684b000000b00603307cef05so5398302oto.3; 
 Fri, 22 Apr 2022 05:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=vGqa3JNO0ZwDV+RYD0ECVU5s6pbxZ+ZuFhh+nnOh86A=;
 b=LBfCLg8ASGYezRMGA+VVf0PNoUuLIfF3Vvw5f8bQ+GqlBc2CwIm8uQ1ds5TTIBOwsy
 o81TJbXpFiwrdwr7qZJBqBZ9/zhawNI3QVMYI6N9fuaYkzG4RMZEKAb+M/yckNnTIqLN
 ijz4G3Dhcgx2G13G9XkTs9PZsE2re2LyaFNeqkYRHL9lw/lmxsCd2KevtLWN1RF9Hlyg
 0VgEscO0yiLd8462X9qJfYmdMwEKw7MmWS9aHl6AgGTz40V2OuSV11rstDwb+V8WGySh
 8rX7SE+M8lmEnZnzfiihQ5b6inDHL9MoABvcUIJVx0S7aVj5CfXij1efPBGUHU26pxAJ
 zEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=vGqa3JNO0ZwDV+RYD0ECVU5s6pbxZ+ZuFhh+nnOh86A=;
 b=EOqcVRHk1G1z3d5fFhFPIEKd60MsKDldbyBBW/f/ndqvxHU64jT3xuss+uue1PU2In
 PqHlVpTEK1/TMvM3oOMIiuC8otpMNAqD36L8XrP4i8NEbwmijXkgDGEQmEHBkmJ4NMer
 XeOr5A925UGqL4xWpfFaP8tXmG5i5PnwZQQ7Qj6guLswte/iO2bVXGFZKPnXbKka/rUh
 XOZAeLKuKimnpBAPMHhrrMokKK644xUFALN7yTzO+vaIaUzUj4iE3Kd5jeTSRaD5xTc1
 NnjJqm56WGv2y1jDvzK5V/ERP99iqhvIzVya4O5QP/EzxM60q/XZsIl6Dnp7fl5sXYU8
 VcKA==
X-Gm-Message-State: AOAM532F6olU5WiGJiXnWgMLJTjYiAyrwML90a4pVoG2qmHaWvkQltg/
 ay+iKihJmy6xSKv8wTcmToY=
X-Google-Smtp-Source: ABdhPJyejOc9C14qomTmt6coqql+HtHeKAtOwbV0316n4wsRsfn/lGoPXXV4DndOzUHF3JDGh/WTgQ==
X-Received: by 2002:a05:6830:18f:b0:605:433b:c568 with SMTP id
 q15-20020a056830018f00b00605433bc568mr1632888ota.46.1650631325731; 
 Fri, 22 Apr 2022 05:42:05 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a056830144b00b006054888b7a3sm673378otp.1.2022.04.22.05.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 05:42:04 -0700 (PDT)
Message-ID: <402f0e60-8d3c-850d-84ff-af5424b72b73@gmail.com>
Date: Fri, 22 Apr 2022 14:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: CK Hu <ck.hu@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
 <20220419094143.9561-9-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v20 8/8] soc: mediatek: remove DDP_DOMPONENT_DITHER from
 enum
In-Reply-To: <20220419094143.9561-9-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_054208_087767_4AD269E6 
X-CRM114-Status: GOOD (  13.81  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 19/04/2022 11:41, jason-jh.lin wrote:
> After mmsys and drm change DITHER enum to DDP_COMPONENT_DITHER0,
> mmsys header can remove the useless DDP_COMPONENT_DITHER enum.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

Chun-Kuang, I think it would make sense to take that through your tree as it 
depends on the previous patches.

I provide you a stable tag so that you can take it:
v5.18-next-vdso0-stable-tag

Regards,
Matthias

> ---
>   include/linux/soc/mediatek/mtk-mmsys.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 59117d970daf..fb719fd1281c 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -16,8 +16,7 @@ enum mtk_ddp_comp_id {
>   	DDP_COMPONENT_CCORR,
>   	DDP_COMPONENT_COLOR0,
>   	DDP_COMPONENT_COLOR1,
> -	DDP_COMPONENT_DITHER,
> -	DDP_COMPONENT_DITHER0 = DDP_COMPONENT_DITHER,
> +	DDP_COMPONENT_DITHER0,
>   	DDP_COMPONENT_DITHER1,
>   	DDP_COMPONENT_DP_INTF0,
>   	DDP_COMPONENT_DP_INTF1,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
