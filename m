Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E122FC47095
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 07:44:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1A6F61351
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 07:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1A6F61351
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uRTtgQkBgaNrTm8zrVAc2xVCaFizpa00gV40na5EgWc=; b=KDD+I56dj1H33IJBQkpRcuc3VL
	XxOEjxolRjwQ2JuYVbGv+mFn+qs9VswRCIkdob/0UuC9JGlcz+351ReoarjtjoNXJNcIWc7B0CQSH
	xKJci/wpF5luKB240pj5VS1c1OxqhHMKe4BbNIt18ot3TmxquFwtEyof9kh5TNxuIQERJhxC1J2bd
	caMCxyktlqiRG1pcGugXNs3xEEHtsS/eSc88B2J1CMNUH4boP2aJmWdeN5ACXYZC+4POu5CO5YAhf
	BAUKbc+hy9NNQEgE+nc9dLmCntzLwr50LzdQhhdHbSG4Zj7UdV0in4N6MGAeVH0bcJDxrlrOMh5HL
	g8e7bLvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqssb-00C9Gj-FY; Wed, 09 Jun 2021 07:44:01 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqssZ-00C9F9-LV; Wed, 09 Jun 2021 07:44:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so3537929wmq.0; 
 Wed, 09 Jun 2021 00:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4Ed9mm909+j2egVHjfeRzyEVoKd06Gn517VmwgTGDNY=;
 b=ihs/M3HXxfcfdqcK6ShERGmNiIwPqOR4VL78BLcUpL2KZujymyOFRY/qkAe+5slhsW
 QGGw1zRiCl3/oKgVIG0L5N/UwmRohLjxkvDZYW0ZgMgueMUgQ5p5KxICAKZgBW5MByI6
 1wvCIUA4w09NWUzZMCsAe/bdnLIHleQDciilgfOlygDXs/99S1fxZBhSQw6YZDXtKLlB
 V41F7zfaEGWNQ5hZOl22FQ+UI2Sr/vnqfRXBRST0lTMBAO+FcANq+f6kJlFDVIetgOv4
 5yuqeeUBORrQos9RQszQJMuytnjC2598FLs9JBlRP5FS28zZQcfdYtjdaRYVh/4Ldxoy
 rfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Ed9mm909+j2egVHjfeRzyEVoKd06Gn517VmwgTGDNY=;
 b=ZuG+17VK2KAtS9d5KFzt+OjiR6IBtLEZuED4bC0Jxx5/UoWTUfmBU2r/Ck/pTQO+lt
 lgJ3uA539RuxiQUYX68NsNsLS3nqY8rD87LrPzDhYl0oOA3Y66iXQmHaDfF217r2MFm9
 qkONE+ZpojdW9YbMKNRONxoCi8ROiYmWC76X7otdNmWBezWzTkrf7lY5stSeYNhXKAb4
 yOTvyfqotc1YzKOkzTc4nUKGiNb8EwKPwoOo8lh7MzP2v9SQK2ZC9HaoVs3e6z+xDTTk
 viiuX0VeuDkm2RVjc8nRtCPrRlwX6sGVzZJavThVMjhBWkj+PUuWGS8TLaJn0pZ1bxjX
 JvoA==
X-Gm-Message-State: AOAM531Rb6hpvTVrZqTWo8///2i7iVxYZwE3UvEpvVIScXmN6BJXTSVd
 77X8MrCu4Pbc1v8t0Z4Cr84=
X-Google-Smtp-Source: ABdhPJy1TN5g9HVPQta2ngBPCU9iX96cZHpN+j/ZJV4T2M0MwzeH3BbE0S0m5qwPSCAQmLDWiA+gmw==
X-Received: by 2002:a7b:c189:: with SMTP id y9mr26040858wmi.106.1623224637195; 
 Wed, 09 Jun 2021 00:43:57 -0700 (PDT)
Received: from ziggy.stardust (81.172.61.185.dyn.user.ono.com. [81.172.61.185])
 by smtp.gmail.com with ESMTPSA id q3sm22548486wrr.43.2021.06.09.00.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 00:43:56 -0700 (PDT)
Subject: Re: [PATCH v5, 3/4] soc: mediatek: mmsys: add component RDMA4
To: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1618236288-1617-1-git-send-email-yongqiang.niu@mediatek.com>
 <1618236288-1617-4-git-send-email-yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a1824cdc-7e2f-a38f-d019-e1d8f92ead2b@gmail.com>
Date: Wed, 9 Jun 2021 09:43:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1618236288-1617-4-git-send-email-yongqiang.niu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_004359_742757_E57466F3 
X-CRM114-Status: GOOD (  16.11  )
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



On 12/04/2021 16:04, Yongqiang Niu wrote:
> This patch add component RDMA4
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>  include/linux/soc/mediatek/mtk-mmsys.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 7718cd6..4bba275 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -38,6 +38,7 @@ enum mtk_ddp_comp_id {
>  	DDP_COMPONENT_RDMA0,
>  	DDP_COMPONENT_RDMA1,
>  	DDP_COMPONENT_RDMA2,
> +	DDP_COMPONENT_RDMA4,

Pach 1-3 looks good, but could be squashed in one patch. Please try to come up
with a more descriptive commit message. Rule of thumb is to explain why we need
a patch not what the patch does.

Regards,
Matthias

>  	DDP_COMPONENT_UFOE,
>  	DDP_COMPONENT_WDMA0,
>  	DDP_COMPONENT_WDMA1,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
