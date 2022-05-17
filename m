Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983B2C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 13:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjlVK/bF/tAbPOY2/SnbfCfRiHKx2tarCzVS7OO8xhU=; b=rddPGlrAnGxXAK
	DzVANfPFD/wZ++e1NOS5K120iWclIzGEbb6LemmOEAQZXw1hrpxZU9h0yiMHunYVI+g3w0V+kOQ2f
	SQFPRgWGeekfwrZVQZda9h/iib4kQt6qfVdyT5IIJQqRE7xTKh1OKHc70uQbhZDP2Kc/wOGMt8kVd
	emV4gvy/EA5kIuNm48by6EEqc6tDNALqjDExNBLOszgIs2iqz7UpRzzyp7tnWQPde/M4mtjYBzbSb
	Z1mPwy+y3Fify4zC1xxdVVeNkY8wfr8VUpmEzma9EE7E4/y+FqKPNOh6JDzOApylYC2p59posb2xx
	3zSLK60jOQfpFPNgLnfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqxVd-00E1pa-Mc; Tue, 17 May 2022 13:45:09 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqxLl-00Dx77-Om; Tue, 17 May 2022 13:34:59 +0000
Received: by mail-wr1-x431.google.com with SMTP id j24so9548432wrb.1;
 Tue, 17 May 2022 06:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zENm4m7v3jmHevxy6zbVD9ZWKHm7pY9Rx6cLLJz8FF8=;
 b=JgChqh4QTXIA48MUJqB/UqQimt2Bhq6cVURNDui3KnYietQ+1pedhParg/KfUVa9jq
 3WLOM5s95bDqqYsQJjua7y4622+pNDviCOxwTXvpuWQ40xXM+0AReXscClOMPNh9ocwk
 /miMGSzoYnwWbd5GQ7VfDGWud8IUyPcEiOihD0WIUndyifk5X5/COiyHK17Yh+Z+w3Kx
 pluQdGkN3WTw1ePQuBAhYlhI3i7yKnVojg4RM2+d56dUupBBTMH5uKYQ16HIjasx12yU
 pbUlrYpD6MrCTyXyYjDVaocuJWrE4YwpY37MkVBZ2tAIro6iCH2tJgbFCEi/o3VfTpf6
 eSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zENm4m7v3jmHevxy6zbVD9ZWKHm7pY9Rx6cLLJz8FF8=;
 b=AWqvZ9lydID4X0nLp5dbve76fg8gVmJT41EvClesLa0pEWmjfoHxmiYKwzD4WW7oHN
 SpvQwTuCTTmpyuiGxVXRJL3/ZEB3SogaNq8iyUA3ZX5u+cvzN0fn+YtVILwFsjnKU3u1
 rqbzhDl2Jtd0BDTlVdpAxem9gnHlXkcn+5/GBucY8P49RGeR6NEG7+T0qfbrx/CBICyk
 oBtxCetL66LLx0BD9IIqKcrE4P0Vkg5KGnFzngDfPDjNPqXByFtHVrV8VdurawOk49eG
 00ovdOsIum+q/F9sQwc4DqdRxwuvOCITS5KSb25P0AolA4o60UCjLLuPMKVrprUxoIkz
 WOuA==
X-Gm-Message-State: AOAM532CFc4CFID778dNyZaQiTO7c8z2QqB3INZtbkD8ibikoTkcDe1S
 xe/soxkZPTzoY+3ZSYkA7mmwYZPnIdS5Aw==
X-Google-Smtp-Source: ABdhPJylGTnXGOZlqlu6Q5VjENj7HaWzMWHJrXzR20Ahexa4NBSKy3E+BJyTOig7eDYl9ApoiVQ5Pg==
X-Received: by 2002:a5d:574a:0:b0:20d:70c:3aa8 with SMTP id
 q10-20020a5d574a000000b0020d070c3aa8mr9479400wrw.255.1652794493326; 
 Tue, 17 May 2022 06:34:53 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 g9-20020adfbc89000000b0020c5253d909sm13032201wrh.85.2022.05.17.06.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 06:34:52 -0700 (PDT)
Message-ID: <99ed8d4e-8139-851f-47ff-7968822713da@gmail.com>
Date: Tue, 17 May 2022 15:34:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 0/5] MediaTek PMIC Wrap improvements and cleanups
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 rex-bc.chen@mediatek.com, zhiyong.tao@mediatek.com
References: <20220517104712.24579-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220517104712.24579-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_063457_876541_B9E773CB 
X-CRM114-Status: GOOD (  19.05  )
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



On 17/05/2022 12:47, AngeloGioacchino Del Regno wrote:
> This series is meant to improve the mtk-pmic-wrap driver;
> that's done by removing the custom pwrap_wait_for_state() function
> and correctly using the readx_poll_timeout macro instead, which is
> doing exactly the same as the former.
> 
> As also shown in a patch [1] by Zhiyong Tao (MediaTek), performing
> a tight loop is not desired: because of the operation timing in the
> SPMI PMICs on these platforms, it makes more sense to wait for some
> microseconds before trying to read again, reducing CPU busy time
> around these state waits. For this purpose, a ~10uS delay was chosen.
> 
> While at it, I also took the occasion to tidy up this driver a
> little by optimizing its probe() function.
> 
> [1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220329115824.13005-2-zhiyong.tao@mediatek.com/
> 
> Changes in v4:
>   - Avoided moving call to platform_get_irq in patch 3/5
>   - Dropped Nicolas' tags from patch 3/5 as it's different now
>   - Added newline for readability in comment on patch 5/5
> 

Whole series applied, thanks!

Matthias

> Changes in v3:
>   - Added two more cleanup patches (4/5, 5/5)
> 
> Changes in v2:
>   - Fixed a critical typo in patch 1/5. Thanks Nicolas!
> 
> AngeloGioacchino Del Regno (5):
>    soc: mediatek: pwrap: Use readx_poll_timeout() instead of custom
>      function
>    soc: mediatek: pwrap: Switch to
>      devm_platform_ioremap_resource_byname()
>    soc: mediatek: pwrap: Check return value of platform_get_irq()
>    soc: mediatek: pwrap: Move IO pointers to new structure
>    soc: mediatek: pwrap: Compress of_device_id entries to one line
> 
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 225 ++++++++++++---------------
>   1 file changed, 97 insertions(+), 128 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
