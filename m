Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A01DCDB484
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 08:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mWE3ioyQaxDSod4iM87Tqs0+a3jEsBLfvJyNoNblIM=; b=4tACBzVsLjXwYNNXJAWFlBow6L
	pDYtIrhuKRAQZolwVqGDfueCmseQXVGyqjOCE5PTawjqRb/ToAtDvmK75j94U30HNyyp4Qdj19tkl
	LNjJOCuze6bzZjG8C6mADjPoxkPnn7lRXHrC9bqd2ydB9qpQ0MHwbnDQD5xoicY4w8l7D9VQNaLAv
	kxm5HKYcoGa5di4sXPbrTetWGKc4ytMqlhbYnzY5oZ3jahz54CGOugxlStV/WCZo99ODKGoMTl80V
	+JBJP8kvuI9VryUGN8ORnQU9CBSchqZE0x6SbvM13pDh59DSGNd4RHWdjV9Rgob+a5D6xmwjxBArb
	wy07bFhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsffS-00Bic7-0G;
	Tue, 17 Oct 2023 08:43:10 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsffN-00BiZE-0L
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Oct 2023 08:43:09 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-991c786369cso873110866b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Oct 2023 01:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697532182; x=1698136982; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5mWE3ioyQaxDSod4iM87Tqs0+a3jEsBLfvJyNoNblIM=;
        b=I3pOdBo8qMhGMM7H25n0UP3JHJvFq2+HDXQ1uafAnKlB0lIwf3ZeM4RSGX3OjPTb2N
         /pt7WWpMa+4bQq0EjLtr/c7bQL+9CEzDIU1U1cpfoDF9CALrkShlZ+utHYMTPVemSP1/
         MHH4NAhE2NeEvfuhHw3DFm0hXtmou6zK6NkaN7VOljq1Q5IH+mD1oPkH6sjiFkgO8mN1
         h+sfEnKS+W7h4tZ/XDIOenBEMDpaOQTc2g/V1qdHeUspZR4QVOUrcjDXYbjwIu9o0a4d
         OZOpY5aEHBjLq8Kb9Ey7Q2RaZgrGz5rFVknjzjrYCHMZ3A2KuTxDEfQWk+NY0MXMGRLF
         GL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697532182; x=1698136982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mWE3ioyQaxDSod4iM87Tqs0+a3jEsBLfvJyNoNblIM=;
        b=lwgLqfon56Dfgg2VC8EJtasqiNpWUQFakeiJR11KxshwMPtx0gB+c4bvrAkvidZlxe
         BCEUU63pVnxFYn0OoypMjezH3+qWBaff7OBaB1eCp/wZonX8NgO8jdMu11Yq6hvwK5Tp
         VUxCkUc7Gut3dNk1g8o9TARQAp9JxEYjm4LtcQAiaHEy6VyS6WMUbJkN4sponMoohZL7
         lRwB1XGNwd4clm6nGzoSAzOtUltlHh2ZNedqVz5hxenvDHKxKcLBCHPq3ZYLscdqESt+
         6ZTj2lRR/ZDDYQUSLR3iPGk1uz1tXrpG2OObhnu8lnKf0+5BkCeTV/k1Y9nEPLvN3ldr
         DPrQ==
X-Gm-Message-State: AOJu0Ywh53QVjKMxftLDYJId/EupRvXoB9PBZLoOghL9Dj2R9N1Q0U2T
	toL/ZufQ75fXdSM7mT7lADbTaA==
X-Google-Smtp-Source: AGHT+IGqNGsH0DhEU+PTpv1aQpuhvhpsLwVB8CXj5e5ZEBB+NTCBmRB3K2VAr1Lf6lDIB8I9SInX3A==
X-Received: by 2002:a17:906:c105:b0:9be:aebc:d479 with SMTP id do5-20020a170906c10500b009beaebcd479mr1140349ejc.19.1697532182082;
        Tue, 17 Oct 2023 01:43:02 -0700 (PDT)
Received: from blmsp ([2001:4091:a246:8222:872:4a5b:b69c:1318])
        by smtp.gmail.com with ESMTPSA id j5-20020a170906474500b009a1c05bd672sm789525ejs.127.2023.10.17.01.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 01:43:01 -0700 (PDT)
Date: Tue, 17 Oct 2023 10:43:00 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] thermal/drivers/mediatek: Fix probe for THERMAL_V2
Message-ID: <20231017084300.c6wsozaqg7ztgkf2@blmsp>
References: <20230918100706.1229239-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230918100706.1229239-1-msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_014305_342038_B80B9257 
X-CRM114-Status: GOOD (  17.31  )
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
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Daniel,

On Mon, Sep 18, 2023 at 12:07:06PM +0200, Markus Schneider-Pargmann wrote:
> Fix the probe function to call mtk_thermal_release_periodic_ts for
> everything != MTK_THERMAL_V1. This was accidentally changed from V1
> to V2 in the original patch.
> 
> Reported-by: Frank Wunderlich <frank-w@public-files.de>
> Closes: https://lore.kernel.org/lkml/B0B3775B-B8D1-4284-814F-4F41EC22F532@public-files.de/
> Reported-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Closes: https://lore.kernel.org/lkml/07a569b9-e691-64ea-dd65-3b49842af33d@linaro.org/
> Fixes: 33140e668b10 ("thermal/drivers/mediatek: Control buffer enablement tweaks")
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

Did you have a chance to have a look at this fix and the other one for
auxadc_thermal?
  https://lore.kernel.org/linux-arm-kernel/20230907112018.52811-1-linux@fw-web.de/

Thanks!

Best,
Markus

> ---
>  drivers/thermal/mediatek/auxadc_thermal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
> index 843214d30bd8..8b0edb204844 100644
> --- a/drivers/thermal/mediatek/auxadc_thermal.c
> +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> @@ -1267,7 +1267,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>  
>  	mtk_thermal_turn_on_buffer(mt, apmixed_base);
>  
> -	if (mt->conf->version != MTK_THERMAL_V2)
> +	if (mt->conf->version != MTK_THERMAL_V1)
>  		mtk_thermal_release_periodic_ts(mt, auxadc_base);
>  
>  	if (mt->conf->version == MTK_THERMAL_V1)
> -- 
> 2.40.1
> 

