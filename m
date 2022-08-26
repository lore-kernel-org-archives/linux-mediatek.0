Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833D3ECAAA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Aug 2022 15:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRiL8nVKf9q/KYGvbAx61vmtk80TSfbBKt0e+CxOfpE=; b=x6mbZQb08fI8dG0AlABcCZemun
	0wEA/wjw+ictx91gk+YLSjJLfBSNdw7SbJHKsEsv2ilvsvEbcSYlWubvW2v71E7pQlzek6LMSvQlo
	NINLgtp6zzBOg960IlN/dT8jwRKnhe7XnSzLQG/71BJRisGwgieGaguIzbomP07bt65RZ7JtfPsyd
	2fJcFbXUQQR90Ft2PFo33xST6ZaU8gQ8e02FwhKL6McBxgG0TmGn9xBYfelHOkQSd/Q74EgPIUboq
	AQaoqyz0CJ4OZUKuFU0jtGIOviDV9zQoAGnAzE1uR3lnNS9TQse4+W1WwxcvidoHfAo7j24S9FGiO
	LyfjKnjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRbFr-006zIO-8G; Fri, 26 Aug 2022 15:28:19 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRbFd-006yWu-IH; Fri, 26 Aug 2022 15:28:08 +0000
Received: by mail-wr1-x42d.google.com with SMTP id z16so2200132wrh.10;
        Fri, 26 Aug 2022 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=IRiL8nVKf9q/KYGvbAx61vmtk80TSfbBKt0e+CxOfpE=;
        b=pcfdx/FNHPtFGtypx8TKgBd0IvUGbICnTfjQEAxa3PIEiy0yhB4BoUgkvDHXMlfiLn
         FdB8eRT3udDg3xTAsbRyICL+h/9LDEE2K8Z7T5fVxmzkbsOJRtz5uI0Egn365RrGqusC
         lz3JlQpzVRMNsJbjTMJsyPavEIKJPayMwUt697cbblQP+xMunN+vIIXFqHXVogIyJSqy
         gqatMMxX7oeZJ9Y+a6smXM55J1kjggVgFp+iJaHgVZgtFqgdz+B8PLhct2dSMuNb3kAs
         1tr1wVaZ20NWr2vbaUsRZUTwdTtFARZnWdyMiFcyjWSfYVh+QBbHOKdQpWBjQRtRn47R
         OUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=IRiL8nVKf9q/KYGvbAx61vmtk80TSfbBKt0e+CxOfpE=;
        b=F0laPQrFa92vW/Qup+hy+y67p4h4pbIUbyk8MAwxqd9gPIVjlg9aY8QObmzh3FJosu
         8m0Uw7CksYz5rC5gpMPhvezSnwbs2vEPbGi+J/AAUbMXtZzpOP42BNzqFuh6/1Bn0bAr
         3nAZoovcj1AjzCQuT44qoxOjIIORedQsUACAvU4pocegpOlfUPYpRaC48YJ3EGys6LKL
         iIlXt5lHd0PSyEOtHyosLfkXncW8RN72RZNo/O9RGJf8i7QPEC0Qfexkjylmi0gyu9RT
         c57BB3K9rDZ25hOpMHX2HwS4LCtCX6y/JCe+GDgnRLUfawZhPYixWL0WvgEvYNQ4vn2+
         SNYQ==
X-Gm-Message-State: ACgBeo0CGeBC4iJn2G+s3IuODH42PWVSX6e1INWHoXO3dqb5L5SDxwXU
	xonfNCqyajKeasFI4Agk3yM=
X-Google-Smtp-Source: AA6agR72HaF88Vx+BOAHjQKp8mO58YoHYIOnzG+QYlPkgSalEAKX8gBJ6IMXigK3dI1FNUcr3LG9lw==
X-Received: by 2002:a05:6000:1d82:b0:220:5f9b:9a77 with SMTP id bk2-20020a0560001d8200b002205f9b9a77mr106442wrb.622.1661527681017;
        Fri, 26 Aug 2022 08:28:01 -0700 (PDT)
Received: from [192.168.1.130] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id c4-20020adfef44000000b00220592005edsm25693wrp.85.2022.08.26.08.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 08:27:59 -0700 (PDT)
Message-ID: <4f1d3e02-0b40-cd29-5339-df1715bed84f@gmail.com>
Date: Fri, 26 Aug 2022 17:27:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 0/2] soc: mediatek: Cleanups for MediaTek SVS driver
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: khilman@baylibre.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 roger.lu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220825184616.2118870-1-nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220825184616.2118870-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_082805_629573_2B76EE04 
X-CRM114-Status: GOOD (  11.98  )
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



On 25/08/2022 20:46, Nícolas F. R. A. Prado wrote:
> 
> This is a cleanup-only series for the mtk-svs driver, enhancing the
> usage of standard Linux macros for bitfields for better readability
> and register set/get safety, switches to devm_ functions variants
> where possible and other general cleanups, getting this driver in a
> better overall shape.

Both patches pushed, thanks!

> 
> v1: https://lore.kernel.org/all/20220726141653.177948-1-angelogioacchino.delregno@collabora.com
> 
> Changes in v2:
> - Rebased to not rely on mt8195 and mt8186 support, as they haven't been
>    merged yet
> 
> AngeloGioacchino Del Regno (2):
>    soc: mediatek: mtk-svs: Commonize t-calibration-data fuse array read
>    soc: mediatek: mtk-svs: Use bitfield access macros where possible
> 
>   drivers/soc/mediatek/mtk-svs.c | 260 ++++++++++++++++++++-------------
>   1 file changed, 160 insertions(+), 100 deletions(-)
> 

