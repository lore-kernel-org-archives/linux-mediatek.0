Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8293BC388F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 10:53:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F401E2224E
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 10:53:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jXajijy9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMviA3v7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F401E2224E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o9d9A+fYK0VVmVhvNNbPORr/FRcgtJXi8x/pYXu5Jlg=; b=jXajijy9QLMlhqAGV5KmPkoZd
	5E258WgYC8ql8ioWrKPXgqvCy9LoDUqMgM1TkBFkoaLyd4yLpxKyMw9taGhkfBwJICij0+RWmWvwT
	ZUe1PYF5oEFictMnAkFiZiC0nEJUCvJmQagK33Rq0wtJOMJAaxzl16n4/q9nriXWlGCNWhdaqqi7k
	RvQELSwNUW+sCvOdtgm/hCVmLjkaZHKcsTYHH/QoDaxtrevzT46bL/3JB3YY7FEhipG7XMKdP3nkf
	Ed20fSm0krPPfA/9rsjMXCj1uM4SjtuwMZk+U8TTfkM09R9rinwCje9UmhIF+DzBkTuXiXNoGMlu/
	Y6r6UBrTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXMbk-0004nM-To; Tue, 27 Oct 2020 10:53:41 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXMbh-0004mC-MY; Tue, 27 Oct 2020 10:53:38 +0000
Received: by mail-wr1-x443.google.com with SMTP id x7so1360606wrl.3;
 Tue, 27 Oct 2020 03:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WpqypFnY9U7+uLzrR/1nVmk8p5K95P6Yb5r5N8zFRV8=;
 b=SMviA3v7hqhKjl0nNuRoXzMKyrWCHttiZtdn3Ryxceo34RlaxwsSVGfZE9aBh66ic7
 XVBDmwzvUy0hcFtsIQZyYFDp8jFoacC7pL7oR99+YkkOElWEQy55jjCj6E6mzKoZYKDo
 YbytgNuPCMp65uYnq/4e9bHZGLYUZqXIokImv9u8vQlmbFUJLpvra7p19DNgeAlTc72C
 oVfNY8QXGJFkE4uDLTLIuq+Ldxj0LPn5gLph80+JBsxssfkMXyvUsH5gih4WlSoyURJZ
 TaghWavZJz71030V5bV5huvIyU0e8aKaibwPO4dwbXfQ0IUr3UhBMYAX7ZSA3VPLx8VV
 03+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WpqypFnY9U7+uLzrR/1nVmk8p5K95P6Yb5r5N8zFRV8=;
 b=RXnMrnuy2hUVwH0j0vNKuliH82ACW4J1MqZh2MscmmdXSigLWU6HGMYoKN7cpd65hl
 s78AotRYEuX6GGrZ5rhydhvOpVYHX5lnwM09wbDg4181S+F7avaU8xYb2+opUUb6rTRI
 Iw8i4lWvxBHV/hh4HH49Bm9+TKdjUyrHmdF/H/s7j6ZmU+lrP0yvZIMnSnA8uux5jsAp
 +DBc4eaOeoMgomJCAyJgNnXS7TZNin8XQgETLUDSyUaLZDovvdUYRe8gHNIdsB3JbOeM
 R9CPE9rTpB1m9k8G4TimWVyRifLguCtPZCak8eOPAvCT/HDFMgWDZa/+35EHDW/yWdsF
 tzLw==
X-Gm-Message-State: AOAM533ucvU8jHPxQKYIua/aAOSj32RzrkWTC7kIpVVsFLvIv7oj9L0U
 YgoCkW5A2bB+W9Eu3tGY9GCsTs6AiWn58g==
X-Google-Smtp-Source: ABdhPJwyIZPcF6b+fQtE1zkd+SAnxeK5QDQlxoK7O1bXCgNEwx76qskbS2hNznMNMX01TBXkvCJjnw==
X-Received: by 2002:adf:8541:: with SMTP id 59mr2138495wrh.61.1603796016049;
 Tue, 27 Oct 2020 03:53:36 -0700 (PDT)
Received: from ziggy.stardust ([213.195.117.206])
 by smtp.gmail.com with ESMTPSA id m12sm1489623wrs.92.2020.10.27.03.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 03:53:35 -0700 (PDT)
Subject: Re: [PATCH v3 15/16] soc: mediatek: pm-domains: Add default power off
 flag
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
 <20201026175526.2915399-16-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <05be2a94-d6e6-36e5-2c14-6d971e4a7677@gmail.com>
Date: Tue, 27 Oct 2020 11:53:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201026175526.2915399-16-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_065337_781608_987C2819 
X-CRM114-Status: GOOD (  26.33  )
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
Cc: drinkcat@chromium.org, weiyi.lu@mediatek.com, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 26/10/2020 18:55, Enric Balletbo i Serra wrote:
> From: Weiyi Lu <weiyi.lu@mediatek.com>
> 
> For some power domain, like conn on MT8192, it should be default OFF.
> Because the power on/off control relies the function of connectivity chip
> and its firmware. And if project choose other chip vendor solution,
> those necessary connectivity functions will not provided.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>   drivers/soc/mediatek/mtk-pm-domains.c | 23 +++++++++++++++++------
>   drivers/soc/mediatek/mtk-pm-domains.h |  1 +
>   2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 63993076a544..fe0e955076a0 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -378,10 +378,16 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>   	 * software.  The unused domains will be switched off during
>   	 * late_init time.
>   	 */
> -	ret = scpsys_power_on(&pd->genpd);
> -	if (ret < 0) {
> -		dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
> -		goto err_unprepare_clocks;
> +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF)) {
> +		if (scpsys_domain_is_on(pd))
> +			dev_warn(scpsys->dev,
> +				 "%pOF: A default off power domain has been ON\n", node);
> +	} else {
> +		ret = scpsys_power_on(&pd->genpd);
> +		if (ret < 0) {
> +			dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
> +			goto err_unprepare_clocks;
> +		}
>   	}
>   
>   	if (scpsys->domains[id]) {
> @@ -395,7 +401,11 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>   	pd->genpd.power_off = scpsys_power_off;
>   	pd->genpd.power_on = scpsys_power_on;
>   
> -	pm_genpd_init(&pd->genpd, NULL, false);
> +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
> +		pm_genpd_init(&pd->genpd, NULL, true);
> +	else
> +		pm_genpd_init(&pd->genpd, NULL, false);
> +
>   	scpsys->domains[id] = &pd->genpd;
>   
>   	return scpsys->pd_data.domains[id];
> @@ -478,7 +488,8 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
>   			"failed to remove domain '%s' : %d - state may be inconsistent\n",
>   			pd->genpd.name, ret);
>   
> -	scpsys_power_off(&pd->genpd);
> +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
> +		scpsys_power_off(&pd->genpd);

OK, so you merged Weiyi's patches in this series :)

So same comment here: Does it really hurt if we turn-off a already turned-off 
power domain? Or can we get rid of this check?

Regards,
Matthias

>   
>   	clk_bulk_unprepare(pd->num_clks, pd->clks);
>   	clk_bulk_put(pd->num_clks, pd->clks);
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index 2ad213be84a5..0fa6a938b40c 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -6,6 +6,7 @@
>   #define MTK_SCPD_ACTIVE_WAKEUP		BIT(0)
>   #define MTK_SCPD_FWAIT_SRAM		BIT(1)
>   #define MTK_SCPD_SRAM_ISO		BIT(2)
> +#define MTK_SCPD_KEEP_DEFAULT_OFF	BIT(3)
>   #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
>   
>   #define SPM_VDE_PWR_CON			0x0210
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
