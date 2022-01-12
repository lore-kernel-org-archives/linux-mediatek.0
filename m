Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AEBC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 10:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekVj/H6BDxVKjz15Qs23IgQr2VENdASSRAC4DSJBOWg=; b=YUE/napDCG0B1L
	ETE4f0VkTRL2E38wEoXeDbUa5zKnLRnwUgHS1fFbCpUjvvCJ9S9pEIQDnlNpAhrgHxsEZyxmVc0+R
	+G5jYiR9OR471fO+hpWcgRqtN06x8TyrE+EshhB5fy3CH9b3Z6UF0j8pkxYuiRNpp2vA8RGavYAj6
	2uk6RalgUrr13krfuzXJToCptfcwQsMSlK5bn6X61J5m47pmTobpFhP7GfowqrnRC3WmDo5EewvqU
	WmT2YjjBqniemJpodv7ZcctRCQK4pVbn4ejGT4axrauMufjo2lNlefrf1wk+SPk4s6OF9X78RQCCn
	VHnElw0crMak5AIbi3qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7ajw-0023iS-RB; Wed, 12 Jan 2022 10:20:24 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7ajq-0023dI-Iu
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 10:20:20 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 177C840019
 for <linux-mediatek@lists.infradead.org>; Wed, 12 Jan 2022 10:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1641982817;
 bh=ZFiQ3BSkZV8JLMzs5+GiJp8IJAdyEgrG9WjGPcBJ1to=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Rt7un9ol+ALmK24vm/o8c8BgKlLjlmMuhBjwWaVNE9F++hHXuoH8Q4vJFSica/36N
 7FtEcLxrnx+WOg5kTz+QYi9dXhf5+eJzeyDaFRYCgL0fxL3NmcDmzKXIA5SHei+8Iy
 aEtgvv6+rve0mICT/jqIl1zyrH9mvYsBoByj/SE8fXIyeTutqN3S2aFbPyqQ8ZVXKw
 VxuBXNUTTm2XV8XhKFVc3UUhg465hGSKvWQRepuGmDp1e67W4L0GE6zyf0exhwGLom
 H9TLnV2kC8FJOYL48znvdLMKVEtKE9K6+zPYUthP56LqF/LtncKBQyS/R6HuJTQd8L
 ASPp2wlbgjKEg==
Received: by mail-ed1-f72.google.com with SMTP id
 v18-20020a056402349200b003f8d3b7ee8dso1811395edc.23
 for <linux-mediatek@lists.infradead.org>; Wed, 12 Jan 2022 02:20:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZFiQ3BSkZV8JLMzs5+GiJp8IJAdyEgrG9WjGPcBJ1to=;
 b=w/nB0Cr9XgMyRxI6blReIAVyc6kCK0OJI7nnOqtgYY83rPzZE/GEvhUHHbGADQwEsO
 fsnErfKnq3NbnGQgvRR8IPc/Tw+cdgKbGdkuMauw6m4zV2FiB8g9orolWZIuvJ/VPMAn
 RhG1Xfv7ZJdW00NB2F9eGbyM27wd5qVjx1rtp3/0HHabD7FicLgm9U7b99MTBuR6A8Fb
 D315H+9pgSAN1B0K45I4WeXZi50/xjqBryXNn+Bau1MDHoxtWPCH7Vgplqu2JST9Fk8+
 zcPSwLipHGEm2huXB3W0OZ2tgibLIlNDy54PrgFrFNZLRrBVLJoOI15wX9bnkDmfgr4i
 YLdg==
X-Gm-Message-State: AOAM533zwdq64/drvKZeXotBmsabH1iNrQnVMJgAeMRIIl7RK0bURkDk
 p4lBURjQZWzAJk5tuxuy1N4QhIlw3wvTYJsX5JYHccBTDalw2jxTS5N4zNAQFl/xSNNjBpSuXO5
 wC6Iw9PYSrqrQvybhPry9gZKGdQ6nnaCojBp06OhHj7oGy3x8vg==
X-Received: by 2002:a05:6402:5251:: with SMTP id
 t17mr8194528edd.397.1641982813181; 
 Wed, 12 Jan 2022 02:20:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdLsOYtXRyV8ugt5h8vZw6vPbgwVNs4QQiqNdhIAdlMzEhEhXKY3AjG7bkdFEafgdxVmb/Yw==
X-Received: by 2002:a05:6402:5251:: with SMTP id
 t17mr8194520edd.397.1641982813026; 
 Wed, 12 Jan 2022 02:20:13 -0800 (PST)
Received: from [192.168.0.29] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id kw14sm4349252ejc.68.2022.01.12.02.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 02:20:12 -0800 (PST)
Message-ID: <a3c48c27-515d-f741-e447-98e0ddfe3b01@canonical.com>
Date: Wed, 12 Jan 2022 11:20:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 4/6] memory: mtk-smi: Fix the return value for
 clk_bulk_prepare_enable
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, lc.kan@mediatek.com, yi.kuo@mediatek.com,
 anthony.huang@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220111063904.7583-1-yong.wu@mediatek.com>
 <20220111063904.7583-5-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220111063904.7583-5-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_022018_804777_5A9F1BD5 
X-CRM114-Status: GOOD (  20.68  )
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

On 11/01/2022 07:39, Yong Wu wrote:
> The successful return value for clk_bulk_prepare_enable is 0, rather than
> "< 0". Fix this.

I do not understand. The commit description does not match the code.
What is the error here?

> 
> Fixes: 0e14917c57f9 ("memory: mtk-smi: Use clk_bulk clock ops")

There is no bug to fix...

> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index b883dcc0bbfa..e7b1a22b12ea 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -480,7 +480,7 @@ static int __maybe_unused mtk_smi_larb_resume(struct device *dev)
>  	int ret;
>  
>  	ret = clk_bulk_prepare_enable(larb->smi.clk_num, larb->smi.clks);
> -	if (ret < 0)
> +	if (ret)
>  		return ret;
>  
>  	/* Configure the basic setting for this larb */
> 


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
