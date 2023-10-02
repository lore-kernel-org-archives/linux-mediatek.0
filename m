Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A0EE784AF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 10:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47dOvMvPNeJUzh6fLv1kzerhmf6KWlMeYd+nlCsqcNg=; b=uDRY3sqH4V2796oVTqieBfrtws
	Wocld31XqfhsuACBNnBTvH/+3ZWKPqadSrw4NLU34UX/nsHoyH3dVfC3cWigYwwflmxsZrregiuKi
	gvcVlrk8swn0F2JaSQ0AtMPTMpNsyxfHE/mYXyZd2GPKXorHstOUyZsLqm6PxaunjqoTorHJQZIJn
	Jrq1wqK1laOgIHgmSPgaG1GueRwV4j5t1ZNdddqEOGAwMFrKehynkMJbTm4OyAcIE8zAuSGjyKxaj
	P+NCAcDZLX9CeaWT4uqv++Lu3HFMpH9w6Z5Hx89WERWg0f4Ljelu6eooUEpoWfxBfTHA0Pyz59J6X
	xgxn9X1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnG5P-00CKkw-1p;
	Mon, 02 Oct 2023 10:23:35 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnG5M-00CKi9-1Q
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Oct 2023 10:23:33 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9a645e54806so2221472666b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Oct 2023 03:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696242208; x=1696847008; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47dOvMvPNeJUzh6fLv1kzerhmf6KWlMeYd+nlCsqcNg=;
        b=eSomxWahGXeC4CG8nAxAS0qrPSUSUuB8HRcjh/byjtyYIPbkfua6vC26LNOr4e05p7
         1V7855h5OTNwXoET34hBk2Ix93R0l8TMHVcfXZ+ncLL1w7/pzmv4rBjXQBBVhNN0y7ma
         d9gd0ZLK0BtoAYNgseXmVzfr7NWxNbhqGaAfLHeLSrrHCBx6L4oX00yjD/Cz/Ir7D/cz
         PDLOGPQNXnslPEdcNacuxXDEqxOisl+XW78QsJEvnby2JoQaZVF+bmWq3NeV3g8AVMi2
         qYuGocaRFg+b94NyAe4jKZJmfjjv3c1UoxvytKWdgPuZVnjYekPbLH8dMb+nEqwp/y68
         XpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696242208; x=1696847008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47dOvMvPNeJUzh6fLv1kzerhmf6KWlMeYd+nlCsqcNg=;
        b=QR9aE+6cgQO7vCJAr/oLZBoPJclDfZ67auWD8l8GdsxNMzg9VEdItPdfQRq7FfQ3wU
         7nPJtnDAmqi3T/NX226IF0sjO7Xyw9hyXn1mbDHoT8UqUDckQ6Bapd3czucRksASqDqW
         inQ8xSmZy3wdABZ3JVf9AeA71RWvqU3KZRQKvdemGvTI+cRIHqzJ7zgF5Dmqj87xnC/1
         DR6CdunFXwe/NcQUZnOERIVioNAkntN8wT6a8qY+SczZOqjTiTD0ZMTUYKC/XGbBsolU
         7hD3Glf5+SRJhnPVEXmi91RStYBOojXV1BmSzbTLDtiajm/e1SMJ3cVVA3TruDWqhlz3
         /DZA==
X-Gm-Message-State: AOJu0Yx0mjCqP7VSPDJH9P8vK2qUHGdBqHYMvKiIazz3ASTJ40WIIGMq
	8kYaqz+ERKrQgGPPmW/4gsf9oOYG2f0=
X-Google-Smtp-Source: AGHT+IHRH2LrjXW9Lu/WWNqI+7jo8bUD8PnSg9TNeQ2CyGGAs90FPr4hir+qru1BkGlx4W5bhbRZrg==
X-Received: by 2002:a17:906:7695:b0:9ae:3d7b:6f46 with SMTP id o21-20020a170906769500b009ae3d7b6f46mr9183734ejm.46.1696242207597;
        Mon, 02 Oct 2023 03:23:27 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id x18-20020a170906b09200b0099c53c44083sm16737870ejy.79.2023.10.02.03.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 03:23:26 -0700 (PDT)
Message-ID: <d4528015-eda2-e089-1e2b-1de4b54c1408@gmail.com>
Date: Mon, 2 Oct 2023 12:23:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: nfraprado@collabora.com, wenst@chromium.org, robh@kernel.org,
 amergnat@baylibre.com, arnd@arndb.de
References: <20230929082009.71843-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230929082009.71843-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_032332_483939_99A89225 
X-CRM114-Status: GOOD (  20.67  )
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



On 29/09/2023 10:20, AngeloGioacchino Del Regno wrote:
> I am a top reviewer mainly for MediaTek SoC related patches in most
> subsystems and I've also been upstreaming both improvements, fixes
> and new drivers and devicetrees when required.
> 
> The MediaTek scene saw a generous increase in number of patches that
> are sent to the lists every week, increasing the amount of required
> efforts to maintain the MTK bits overall, and we will possibly see
> even more of that.
> 
> For this reason, and also because of suggestions and encouragement
> coming from the community, I'm stepping up to be a co-maintainer of
> MediaTek SoCs support.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Forgot that in my previous mail. Obviously:
Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> 
> P.S.: I tried to reach to Matthias for almost two months, but I couldn't
> find any way to talk to him and he has been unresponsive on the mailing
> lists as well.
> 
> P.P.S.: This also comes after Rob Herring's suggestion to have myself as
> a MediaTek SoC co-maintainer [1] and support from other people.
> 
> [1]: https://lore.kernel.org/all/20230804225813.12493-1-robh@kernel.org/
> 
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 208cfcc1aee3..211a8322c801 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2330,7 +2330,7 @@ F:	drivers/rtc/rtc-mt7622.c
>   
>   ARM/Mediatek SoC support
>   M:	Matthias Brugger <matthias.bgg@gmail.com>
> -R:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>   L:	linux-kernel@vger.kernel.org
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)

