Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E1EC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 20:22:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D769F2075D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 20:22:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gCQvk74w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXB05T+w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D769F2075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TgkFW2rW6Optj49s9jkJxuRv//abLHUephrbD5/pByo=; b=gCQvk74w9Oo6uW+YsXFKjbW0w
	oraQEeqEQnv+q0vCq9+QXgU+SfVgeWWQbk3t4jvUEeq6Kihb+mH8H6B3+ym9bInxf28Blqcz6cwK1
	1L4yyLmjvm20X2rNq6CttjPgzWfSYEXDsW2BgRfMEE6sAisO1twc6muJYC6PTg13Tk7wFf4D/vYEw
	jgl997ByNLtjxQfvukRYzSLw4Ig526x4QVj16UJd+RIqJzqEyCZpbLA+IZZ5kQXxv6h2UmEjiq3zt
	ntQENuyE5vgT07utmataqVlkgulvPZaehfdi5Nd7w2gtP35vaBWrb9qMJVwLAj4zKoB7kqlh4c0qj
	+KgeqKSrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv4xt-0001hD-HJ; Mon, 13 Jul 2020 20:22:17 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv4xr-0001gl-U8; Mon, 13 Jul 2020 20:22:16 +0000
Received: by mail-wm1-x343.google.com with SMTP id g75so1200197wme.5;
 Mon, 13 Jul 2020 13:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Un7dCCnkxcZsvwr/aTPovVdtJrLxmvJRKWCcD5TCwew=;
 b=lXB05T+wtWcVmb/ToU2CDb7Jolp2Phtrkp863Dkj50ce4afhbb2DtrWXSd5dr/XFRq
 6HlKu2bvqEwgfLU17lzzcRQTDW/YGm7udhfknmHh7XM5KM1yfQgFF7S8V4BDeVOY4rX5
 uVwyQCLgcU6NojcJ8v9hq0eljOvV6jXz9bs863Acsp/S7slXIwt17eJm4Raw0KacFweq
 t+CCbHbnXXQ9uC/a5l/Xjl6lIYAWeKgSEFwuCRIbL/l33ANQ6BFbfgqHlf0uovajE5Yk
 WhNxww3SS9gsftVAA2xX5NB3UIkh5rza4YLB0xwxKF6Fc8QYl2YHRrE09hE7tIAuEUOb
 FP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Un7dCCnkxcZsvwr/aTPovVdtJrLxmvJRKWCcD5TCwew=;
 b=mE4Ji0LakDKUqF3QS97rEpEvL8rvD6nTN5E1O7Jbcsu64D64xVakujuQAyWjavb9sh
 HNDuJ9z9Ivpfz648mD9Q5WirJVEeBYcrH+QYME24RDb2OLgS0Eqx7Q5Hy3BiBDTK5btI
 yCLE4gJZCYI4T6we4+J6uXS40dT19RlTVZh/cfr4li1wBSOw0x0dQPpDstqk10OpUn2h
 6TNmxg6drYdvE085z4LPTpp2fqHlTpQf6da/5+90aibr+8sVz32keDypPpAlW1W6uJ1h
 WMF6+iy+PYmrkfxyepNUFsO/MJy2Ngy7wdZvKqqOlaOqya4czC6D0zaetC4F8hW3HXN6
 xkwQ==
X-Gm-Message-State: AOAM532ayMl9yRLAkgFi0cTshSPIsbVPbV50DROshiypQSgmejY6LAur
 YpxYGnNuN0nk8D+1P6Q8nMo=
X-Google-Smtp-Source: ABdhPJwb4tLfgGCNFfgqcCjcbJr/U2aVoM5vrdZp/oSZZm+oTjo0hS+XhLTRGDICUWQLSdI57bQ8cQ==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr1092698wmj.20.1594671733950; 
 Mon, 13 Jul 2020 13:22:13 -0700 (PDT)
Received: from ziggy.stardust ([213.195.114.245])
 by smtp.gmail.com with ESMTPSA id f17sm1076862wme.14.2020.07.13.13.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 13:22:13 -0700 (PDT)
Subject: Re: [PATCH] iommu/mediatek: Include liunx/dma-mapping.h
To: Joerg Roedel <joro@8bytes.org>
References: <20200713101648.32056-1-joro@8bytes.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <151352ff-d518-174a-9601-1cffc212d008@gmail.com>
Date: Mon, 13 Jul 2020 22:22:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200713101648.32056-1-joro@8bytes.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_162216_020397_E006E6ED 
X-CRM114-Status: GOOD (  17.15  )
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
Cc: iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 13/07/2020 12:16, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> This fixes a compile error when cross-compiling the driver
> on x86-32.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/iommu/mtk_iommu.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index 6ff62452bbf9..122925dbe547 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -15,6 +15,7 @@
>   #include <linux/iommu.h>
>   #include <linux/list.h>
>   #include <linux/spinlock.h>
> +#include <linux/dma-mapping.h>
>   #include <soc/mediatek/smi.h>
>   
>   #define MTK_LARB_COM_MAX	8
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
