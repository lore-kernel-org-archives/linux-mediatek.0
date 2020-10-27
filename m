Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EFDC388F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 10:26:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9A4F22263
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 10:26:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yP4Xayo2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iydivj8U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9A4F22263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5KOWVhQeMOXKG+nEiAeKB/raP5Mury1qwM6SgU3wTrg=; b=yP4Xayo2W+UPAHKFg4TUtIuOx
	PEO6I06ffWL3I3oZN212oihJyiT/ptFG2ewT6wyrjdBpkxjbEOdgOqFamv3cTAc07J/6FevbmQoDy
	CDwHJYXJlVi6ZvVqzfKuICZuQP3EabnO2rPDhcqtBEz9ZO8XFtZYiYTQt6kEiRWWen0x2ja9lVIM4
	lRL+sSTtfus0afdNGKr6ZrzhuyZLcHqNH+hQaKsVHwVS0dag0kjM11JpAmdlv95nh2Au7rOogzCCW
	bdSjMQ4oisWg6lkh+fZyWgXQ4UOncdT5n5aEButvwJeLmm2HbHVZqwd+QPYc/lkQvjcSmLJPhImQL
	Tsp6CFcWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXMAz-00056K-GG; Tue, 27 Oct 2020 10:26:01 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXMAw-00055V-Jx; Tue, 27 Oct 2020 10:25:59 +0000
Received: by mail-wr1-x442.google.com with SMTP id e17so1210719wru.12;
 Tue, 27 Oct 2020 03:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qLG8HT/Mlv9M4LmYodAr5CWZX0Y3ZAsGE5UGgEezEGg=;
 b=Iydivj8UDtVRIkriCxVC6L3hv7zmWqlgdUMcMIHoIjsadiHhjQs4D5YU4VfJyAdG4u
 t9q1CZ0+aOBCNjPXu+IZ/oztHDei5PK2gVBrAl5xMXEeozUVcUTAOUt4721mJPWRbmop
 UzvRRcJ+U4GaW6DlWZnljumnRTHroh5itrDOtvB9bIXP6VsXsqTI1BTYHYeV0IvUMQ3d
 5lFnES1ZvRfLONqO1GArQo3nBJkXtCbeciU+tsuuQNuZObEh4Qk7bCWyUV1yNsORG9XD
 61NLfQ4fdZOiee+7bXniRdDnHMGzPgrf7ydsrmbCXXrr+eT8Rzss2irjleqOzzACxTb8
 9FQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qLG8HT/Mlv9M4LmYodAr5CWZX0Y3ZAsGE5UGgEezEGg=;
 b=fvMdojBarMbG4InIflAokjOaP0LIou383J5zgRDPuMLTZTarmSlbsjiPpP2EROQS7a
 GgntyBXAt2Rkml72LVxurxHFv3fC+E4YUE39m11yNYq+PJZbvOU0nLeX11ZYJPmOnbMe
 6wSTDazdmlVuxVZsjtCQUGfvUJuUaSntayMblL2VLRlR8/hzXqpk4Lp+O+uvJtyH5FF/
 Ro33Jd+iClhpJybfn0DU7z3X3xyau0ftnEJyzlY0SMvCLVkPC36M3PrU+KLf8UERbMQO
 daynu0GNI3Tobws0mgsBaKMU5zGj/TGyTvSr30x3zUIsy3ihzSW6euY6TAFPNcZuBxK3
 /SEA==
X-Gm-Message-State: AOAM5327UUkBr0bjxKWCvXgxnv9a55RQWeE3xNWupEpW7wtTd9D2XK7+
 mJcrAmqr/y8zY202JlNBmFA=
X-Google-Smtp-Source: ABdhPJyJS1diLzgQhtPIEDKUGQZ12t0ydx30T3gdaD6BkMglnZXU83UYALJGS1fnFYYJjEloEAjPPA==
X-Received: by 2002:a5d:494c:: with SMTP id r12mr1947246wrs.406.1603794357330; 
 Tue, 27 Oct 2020 03:25:57 -0700 (PDT)
Received: from ziggy.stardust ([213.195.117.206])
 by smtp.gmail.com with ESMTPSA id n83sm1362890wma.39.2020.10.27.03.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 03:25:56 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] soc: mediatek: pm-domains: Add default power off
 flag
To: Weiyi Lu <weiyi.lu@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>
References: <1603370857-30646-1-git-send-email-weiyi.lu@mediatek.com>
 <1603370857-30646-3-git-send-email-weiyi.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <32fbc5c6-88e4-7cdc-2491-5226d819db37@gmail.com>
Date: Tue, 27 Oct 2020 11:25:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1603370857-30646-3-git-send-email-weiyi.lu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_062558_740768_4E502CA7 
X-CRM114-Status: GOOD (  23.95  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 22/10/2020 14:47, Weiyi Lu wrote:
> For some power domain, like conn on MT8192, it should be default OFF.
> Because the power on/off control relies the function of connectivity chip
> and its firmware. And if project choose other chip vendor solution,
> those necessary connectivity functions will not provided.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-pm-domains.c | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index b7ccf94..50a7ae1 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -24,6 +24,7 @@
>   #define MTK_SCPD_ACTIVE_WAKEUP		BIT(0)
>   #define MTK_SCPD_FWAIT_SRAM		BIT(1)
>   #define MTK_SCPD_SRAM_ISO		BIT(2)
> +#define MTK_SCPD_KEEP_DEFAULT_OFF	BIT(3)
>   #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
>   
>   #define SPM_VDE_PWR_CON			0x0210
> @@ -506,17 +507,26 @@ static int scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node
>   	 * software.  The unused domains will be switched off during
>   	 * late_init time.
>   	 */
> -	ret = scpsys_power_on(&pd->genpd);
> -	if (ret < 0) {
> -		dev_err_probe(scpsys->dev, ret, "failed to power on domain %pOFN\n", node);
> -		goto err_unprepare_clocks;
> +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF)) {
> +		if (scpsys_domain_is_on(pd))
> +			dev_warn(scpsys->dev,
> +				 "A default off power domain %pOFN has been ON\n", node);
> +	} else {
> +		ret = scpsys_power_on(&pd->genpd);
> +		if (ret < 0) {
> +			dev_err_probe(scpsys->dev, ret, "failed to power on domain %pOFN\n", node);
> +			goto err_unprepare_clocks;
> +		}
>   	}
>   
>   	pd->genpd.name = node->name;
>   	pd->genpd.power_off = scpsys_power_off;
>   	pd->genpd.power_on = scpsys_power_on;
>   
> -	pm_genpd_init(&pd->genpd, NULL, false);
> +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
> +		pm_genpd_init(&pd->genpd, NULL, true);
> +	else
> +		pm_genpd_init(&pd->genpd, NULL, false);
>   
>   	scpsys->domains[id] = &pd->genpd;
>   	return 0;
> @@ -603,7 +613,8 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
>   			"failed to remove domain '%s' : %d - state may be inconsistent\n",
>   			pd->genpd.name, ret);
>   
> -	scpsys_power_off(&pd->genpd);
> +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
> +		scpsys_power_off(&pd->genpd);

Is that really needed? Turning the domain off when it's already off shouldn't hurt.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
