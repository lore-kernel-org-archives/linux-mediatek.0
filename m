Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F72C4741F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 15:03:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9667C2158C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 15:03:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PD0SknRf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4+iFFCo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9667C2158C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oxYQq3ow1vVPGX4mVJ9zKIYpn/QSuCUD4tjYv7UDtTo=; b=PD0SknRfnu042xU9vKApvTVbQ
	i1FnvfA7gTZ5/B3rCR4tlarnHucHkQ/Bjr7+oBfjukKRQhFE/IZY9Whj8fUh/VZ19lQNlZwNnn1Mo
	BblIcbXaI561BDgl03sqipW0EodRwjsSPnwIosGcwOicP8javlCla24cqZ9LmumzvYIeYZ8n7jr9M
	fuTmJQ8M0DvTjyVqpTCatBUBoJd2G73a7x5XHqp4Xn2Hu2e54scvhT86r09y1D5FDpqVTGvHs0Im9
	fxHIHjnjM9uYX1tt1yIQEmlibQeNMIKpxqaQ2nP8yPfcYasIkpKSxDDiNgdnNUwbtq9sNs3NsB4O3
	lzzHT4nKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kO078-0003y7-2B; Thu, 01 Oct 2020 15:03:22 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO074-0003wg-Dx; Thu, 01 Oct 2020 15:03:19 +0000
Received: by mail-wr1-x443.google.com with SMTP id z1so6194592wrt.3;
 Thu, 01 Oct 2020 08:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qeO+HST8Alt8TTHfAd+E1LMm1PbcT+IkG0owx3Xzuxk=;
 b=l4+iFFCo1+l+g+ES34C57Um09yEXm62T8GVoyj/mbmgZC4sT3AtzcOdB3TG5VDMcwj
 47ebk2RTFRJ/ELF6NF/Oyoz1m1ar+X0P1zvMEdx6IUqVNP+SzgbNPgw9xzJpIC0NHwXa
 U+Vfv1l3Itd4k5x9aOQatCFzKDID2eXx7K8J1S3H0IWKlO37wz/hvxbdQihPJHuMq5OH
 iqWT6ruU8SENR2NZCqf2MEX80Gq+zMcS7rqCY1vrF1WeYXpjZyCyPB2V25flvHGRrMPF
 o9AKA3zhYSYamY7UmZL2V2O/OIW5IKG3DS+y6mDKbQveaN0HPLC+7C2xeRxlU5uWDoko
 h+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qeO+HST8Alt8TTHfAd+E1LMm1PbcT+IkG0owx3Xzuxk=;
 b=Zi7lArQkDwEWU8vN3ar2nnwkofTpDjY1OqjIF6aAgFWK8rSiYriiHtFyb/YbbkCgq7
 7XNGlDaGQ+dZdEN3NrVfNaBtwFO/u/113CBTHNfABGwu3nSFNSMJTGHz5bubMN0UzrZ3
 +Y4UIM2V1CztB47K4eCRol/Zq/tPPhDBFYtI7G1CbAoH1fQphH6TtlMN/mzyKbWRL1vH
 85E9wl5GTxiOgVs3QMON9v/lGVbdNMOpelMd2c2uGV5+FmPn9oQ6jZCFr8Hpn/TLcJm5
 Tc7EybyyOE/dlSruXlpQST+3WkolCnnkS73VF6v4rKNTGFyOPK6j0t8ug+1ljnv1B4Mp
 MTuQ==
X-Gm-Message-State: AOAM531XIHBxh7RHMPs4IJ0PO/IGt8bxUBHeUE/rkXm9fCVSHJ1qPZVb
 iNs03wKsE3iIxeKuhk5XP4s4ZN0ebEOzCA==
X-Google-Smtp-Source: ABdhPJzJ7WZpM28O8Xbb6cYw/iSZ7lyPFeKcgOzsuymgVAbOd4Ax6EQJV5JEn4gJ4Z4OIE739jTlkw==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr10141733wrp.390.1601564596429; 
 Thu, 01 Oct 2020 08:03:16 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id d19sm379727wmd.0.2020.10.01.08.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 08:03:14 -0700 (PDT)
Subject: Re: [PATCH v2] soc: mediatek: Check if power domains can be powered
 on at boot time
To: Nicolas Boichat <drinkcat@chromium.org>
References: <20200928113107.v2.1.I5e6f8c262031d0451fe7241b744f4f3111c1ce71@changeid>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <fe2f0eeb-ec21-5cf5-7cae-c17855bf0297@gmail.com>
Date: Thu, 1 Oct 2020 17:03:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928113107.v2.1.I5e6f8c262031d0451fe7241b744f4f3111c1ce71@changeid>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_110318_536258_D374874B 
X-CRM114-Status: GOOD (  26.54  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 28/09/2020 05:31, Nicolas Boichat wrote:
> In the error case, where a power domain cannot be powered on
> successfully at boot time (in mtk_register_power_domains),
> pm_genpd_init would still be called with is_off=false, and the
> system would later try to disable the power domain again, triggering
> warnings as disabled clocks are disabled again (and other potential
> issues).
> 
> Also print a warning splat in that case, as this should never
> happen.
> 
> Fixes: c84e358718a66f7 ("soc: Mediatek: Add SCPSYS power domain driver")
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

Applied to v5.10-tmp/soc which will be v5.10-next/soc as soon as v5.10-rc1 gets 
published.

Nicolas can you please make sure that similar logic will be part of the series 
Enric is working on?

Thanks a lot.
Matthias

> ---
> 
> Changes in v2:
>   - Add WARN_ON if the domain can't be powered on, to make it more
>     obvious that this should not happen (there is already an error
>     message).
> 
>   drivers/soc/mediatek/mtk-scpsys.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index f669d3754627..ca75b14931ec 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -524,6 +524,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
>   	for (i = 0; i < num; i++) {
>   		struct scp_domain *scpd = &scp->domains[i];
>   		struct generic_pm_domain *genpd = &scpd->genpd;
> +		bool on;
>   
>   		/*
>   		 * Initially turn on all domains to make the domains usable
> @@ -531,9 +532,9 @@ static void mtk_register_power_domains(struct platform_device *pdev,
>   		 * software.  The unused domains will be switched off during
>   		 * late_init time.
>   		 */
> -		genpd->power_on(genpd);
> +		on = !WARN_ON(genpd->power_on(genpd) < 0);
>   
> -		pm_genpd_init(genpd, NULL, false);
> +		pm_genpd_init(genpd, NULL, !on);
>   	}
>   
>   	/*
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
