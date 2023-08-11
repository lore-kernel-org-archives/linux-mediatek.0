Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC03C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Aug 2023 00:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hN0C8RZhlNl5Im8CUD21G9MoVGTEckrSYOi51AO54JI=; b=0rN2TOF3NsaRs+76KW4U0ZwlGC
	bCtZpKgO34wo2yGFWJqHbVL0IeS+9toU2Fj/6t3ib0gGgXG/+5P7bTjPuYxQjFPArgLVovErK01+Q
	AdZtsPM26Wisd7FilZC8Gsbel8zGdEyRfJIgT3Pko4BxLHZIDMRuyVjQevIYHrFvL1njP1tBFg4EV
	hBcefrCN/Y13RrSxJOhBIiONgEya0QxyOejIaxCpQCsytyx6HFZ3u4IfNqGT48X8uzzrhsHQNiScG
	ab9fq7dzMGfLdjYSM/VpdkhIqg9Y+IQvPbg5vy4Ejy4Oz9VWmPjg0CByUwe3Ozad5lIkGQ4Lg2KSq
	g2Zlu7oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUGHo-0090Qh-2T;
	Fri, 11 Aug 2023 00:45:52 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUGHl-0090Q1-1t
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Aug 2023 00:45:51 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-267fc1d776eso920082a91.2
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Aug 2023 17:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691714748; x=1692319548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hN0C8RZhlNl5Im8CUD21G9MoVGTEckrSYOi51AO54JI=;
        b=z0G502ieEKLfw4NxCmJW/ByenMdnGZnj1JtLTkLaSZP/xtH18aU4hVwBi0JRbrJa6s
         ovscaFg5OYsBK35wNFL2EoFKZxaigQOZC3MFDHCOxo/ZfLYsomTFVlbHzsBNTUIjtBq4
         ZRP15uVE9Z3sv4bR7Sog45Wxk3KxMhKBVNYJOf/9ZWrAhkZ5+eCKRQVrF+WQQ0aZinXm
         fMwelxnMoW/uYiK08O5LwZ6UyzX61YWxHGcGF/h9b9t4Us9L2R3b4c0AJk1NOlkSgm3M
         apWOENr8WrdgwsOpA156J20+0PmTp623uSuo8zP2+tKuuf47nWJ0s7BNj+EMJfuCelLw
         mSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691714748; x=1692319548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hN0C8RZhlNl5Im8CUD21G9MoVGTEckrSYOi51AO54JI=;
        b=MP+hh3Q2ujemnqs1h53WGZNq+OOCxOnf4/ye8mhwS9iZfKDiJgK5XqzHDnqG2Nd6SL
         OjUVwGTiuX/n+zrCaSK4GpfdTWOoWszw8WkUeqSsOnmGbs2mfRqXyUkAiVfIAF850I6X
         hbJatxlbGF4cUdbciH/gLh2EqaGXjaQ/D51Pc9Z9yEN51gDS2IhQNpoWEMm06bNtZxmJ
         8Di08xGqitLRHOjqH4vo+PYijjVVG5j6hFWpOGrZMlRTxBBSsmI02xbRLymEfK2znwjp
         AwXLbBggjr3hQHqtqKyUolYMIvQpjPpPq2XNk7IKhxSjfFF9cwpjz/a5RZp60rcT+o5x
         MMHw==
X-Gm-Message-State: AOJu0YyfvcjNiHLJMoeyacDtbxodrteYtiMscz3e5aQLeJlc65tA1EeV
	mDFteicwVtbum3Orzdh2L+gyaA==
X-Google-Smtp-Source: AGHT+IFyCGjHHsJUOnPRbxJsciSKygnHwkBnNMD52LoSvwsX/eTKtMEnIehB5fZgiiy5jZYXOmht7A==
X-Received: by 2002:a17:90b:70a:b0:268:ce03:e17e with SMTP id s10-20020a17090b070a00b00268ce03e17emr160210pjz.47.1691714747966;
        Thu, 10 Aug 2023 17:45:47 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id hx11-20020a17090b440b00b00263dee538b1sm2119638pjb.25.2023.08.10.17.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 17:45:47 -0700 (PDT)
Date: Fri, 11 Aug 2023 06:15:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: mediatek-hw: Remove unused define
Message-ID: <20230811004543.dzc2ebhjurrsjz57@vireshk-i7>
References: <20230810-topic-mtk_fixup-v1-1-88022eaea0ac@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810-topic-mtk_fixup-v1-1-88022eaea0ac@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_174549_667760_5FD91A46 
X-CRM114-Status: GOOD (  14.30  )
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

On 10-08-23, 20:12, Konrad Dybcio wrote:
> DYNAMIC_POWER does not seem to be used anywhere in the tree, remove it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index fef68cb2b38f..a0a61919bc4c 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -313,8 +313,6 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>  	return ret;
>  }
>  
> -#define DYNAMIC_POWER "dynamic-power-coefficient"
> -
>  static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
>  				    unsigned long event, void *data)
>  {

Applied. Thanks.

-- 
viresh

