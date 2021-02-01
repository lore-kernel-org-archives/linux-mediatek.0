Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546ACC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 09:14:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEF7B64E4F
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 09:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEF7B64E4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOxXTSu8ulsDewEp3rlq1f6ZsZC8Q9gtDZ3XFsmK9XM=; b=yvXLpK0cxfr/qDaBJJeiUSZSRl
	i/+YplnFc7iWKUYy0gpv4K4ouLkU7ZrUOtZQdtufLu3V6v+bDSxaHmGRz/zdHrT7rYMYixAXbofZv
	EteX9eYIFTJ8veEcjDEkDh+f9szyniJsfk91ajUgrE5QC91aTFq/FRnl7v1jww5PpDU/oaQEt9/AX
	Y2o+jyU11EzxHqXXGk7xn3V/NGE8aBDtBayc/y/VjYvWrnhm5GBSOvN+xuoG2eAX1Td2LVlZSqJPw
	McB+YwUYqW3zGwvavhmS1/KgEobAg2VtSdUPg45JrYcraC3QY1HnJHVF4UVD237SJc5wrLIKFABFW
	Og6tn2Fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6VHa-0005j2-5x; Mon, 01 Feb 2021 09:14:06 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6VHW-0005i9-Un; Mon, 01 Feb 2021 09:14:03 +0000
Received: by mail-wr1-x434.google.com with SMTP id z6so15649187wrq.10;
 Mon, 01 Feb 2021 01:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Fo7SHQNM6Z0HqKpfGDmnmMPvTFBZ4gb+tdjIA9oKGDg=;
 b=avyrrve8VKwKmHmarlQMcrmqR3D5rivE/qotzf19jkWIHDhIC1n87r3D7DVoV0piAd
 q/p8eoe7IF+PxV/DgU7esnASvKDxXnQqczwEQDwfCkvkdFx7J0Ybl1G4CJjl7plCmz+6
 6/uOccObWFbTWqd1JBMV3Pn3hmWocQkkBU9eKn+90IXS4CQfBYVve8wqjsZUpqzFbJRy
 hZObpYtb/ZwjZce+RZeAiKWdaXgIJx+yziUcENnlBDS13T19fJE8FBwjdjGCX/KcAd0p
 g3MCDHdF9YMTvpgDH+kBxyfHGbovEYKk3tXuzvobwUif+YxU0WefLqBreJpApY8WDVKe
 O59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fo7SHQNM6Z0HqKpfGDmnmMPvTFBZ4gb+tdjIA9oKGDg=;
 b=pKjiqjscg1u+h2rY5lDQ4/jy3LLKnjmNemBgfZKuHm2OoWmqFy/HrJQdKTJ40Rktdi
 CgIcrw23FrpZsjxQnpC+Inpu1WVWpzwpR6nsLE/6I9Hfekx3f/cirt6PfqJ1WLvDUxpD
 coeK5lqhN86BoY7nmiZeG6D9804zoqsCXO+rr5b67QhP2NR3a5/tWet51Bp7srgdbeCO
 N5hOfR1hmF9uMndlBC7hP22smDF5BnLiGbemduuwvpeqW3PtI+NF+hpX9JtUsBvrNrCF
 EaLGMzGKXkeBiW1YDiGQaZJg9spMRwigMKu5hkEQieGMTy51AOf3deoLvDGKozCqJGJ7
 M0Gg==
X-Gm-Message-State: AOAM533zghVGzqBGbQuMCQkHcu69agk2RTEOcvb9KKcn/sUG5b1ABrQB
 x4te6rHE0ToCE1Fbo4gc3X8=
X-Google-Smtp-Source: ABdhPJwpf0YKtXdwdta7Zb7q7dGeMFn2HKVn5m8c3F/LST0fdks44LO6E12JNoEMV9eR//ueyraZLg==
X-Received: by 2002:adf:e4c4:: with SMTP id v4mr16091337wrm.376.1612170841464; 
 Mon, 01 Feb 2021 01:14:01 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id y20sm19869845wmj.44.2021.02.01.01.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 01:14:00 -0800 (PST)
Subject: Re: [PATCH 2/2] soc: mediatek: pm-domains: Add domain_supply cap for
 mfg_async PD
To: Bilal Wasim <bilalwasim676@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, enric.balletbo@collabora.com,
 hsinyi@chromium.org, weiyi.lu@mediatek.com
References: <20210201054542.1470695-1-Bilal.Wasim@imgtec.com>
 <20210201054542.1470695-3-Bilal.Wasim@imgtec.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e5c7352b-58db-760b-120c-090f225768b2@gmail.com>
Date: Mon, 1 Feb 2021 10:14:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210201054542.1470695-3-Bilal.Wasim@imgtec.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_041403_041182_58561C46 
X-CRM114-Status: GOOD (  18.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 01/02/2021 06:45, Bilal Wasim wrote:
> The mfg_async power domain in mt8173 is used to power up imgtec
> gpu. This domain requires the da9211 regulator to be enabled before
> the power domain can be enabled successfully.
> 
> Signed-off-by: Bilal Wasim <Bilal.Wasim@imgtec.com>
> ---
>  drivers/soc/mediatek/mt8173-pm-domains.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/mediatek/mt8173-pm-domains.h b/drivers/soc/mediatek/mt8173-pm-domains.h
> index 3e8ee5dabb43..065b8195e7d6 100644
> --- a/drivers/soc/mediatek/mt8173-pm-domains.h
> +++ b/drivers/soc/mediatek/mt8173-pm-domains.h
> @@ -63,6 +63,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
>  		.ctl_offs = SPM_MFG_ASYNC_PWR_CON,
>  		.sram_pdn_bits = GENMASK(11, 8),
>  		.sram_pdn_ack_bits = 0,
> +		.caps = MTK_SCPD_DOMAIN_SUPPLY,
>  	},
>  	[MT8173_POWER_DOMAIN_MFG_2D] = {
>  		.sta_mask = PWR_STATUS_MFG_2D,
> 

We are missing a third patch for the DTS to actually add the regulator. Please
provide them for both, mt8173-evb.dts and mt8173-elm.dts

Thanks a lot and I'm very happy to see you starting to contribute!

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
