Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED62C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 12:33:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBC1C23109
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 12:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBC1C23109
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n+wAryJ9BWjj0owwuWlbNnwItFbUPDx2oyDwqSUvY+k=; b=JyRbtvWxuymN8kLmxtAUIpyO1
	NITadFPvnNTOMa5G0mBiJ+mD6w2Oabn1PcHTQpMAryEEqLGtkXxWGTAGzVdtOW9DsrpKJkjRwFMVc
	KHjMDao4h0rahLjp9aWHNn4sjUxdAGMIwYBbEduTgpkGqMRbcjwYq6WE2OGBWEJC5bomFaDJlojJB
	HcULANNjiwMJylFn+dJlIGTwZuPO+YVvHXwovArC+dIUCPNK12zNQNdZXDVYmYFfGL8NIQdbIP2pM
	sQqsITPLXsKaK+MBevqKcf8hWN1Ha6yXQjg5FJReP50Q1yY4+NOJxFzPzI4p9/xtbKYEkCGlSqkQR
	cGncRDtdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzIqw-0001hR-FT; Tue, 12 Jan 2021 12:32:50 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzIqt-0001ff-KY; Tue, 12 Jan 2021 12:32:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id r7so2320531wrc.5;
 Tue, 12 Jan 2021 04:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aM24vL1gPR6qASSHUNQlMwvy81FHWXkH1YAXneeMQoA=;
 b=pZY6Maiwg7rgdFHPgQNSkKcKcJAVfB7ijeElJV+w32kW2GnL8ihH+TlMc/HrX4gb9Q
 kTyy4fNGbtDIJ9+gscwHu6v+PzPOrh+LbaIXAEjMRkON89y9VohvGt702gw0MO8JvhIa
 wsGmAXf/CQlN6803c3luw10w2H25lJicK9hjqNg/RNNVKwt2MOl3537yFVZn1D300r8P
 M7KMwPcW712Fz5zUK80YJzDQmHZyqmUsxrX9AcaXyatwUBZAW1eg+Ph7N3QeZDoQoON3
 Pv69yip3729bTgj/LcIgEWjR5u6odQdHCvcX2wHnRkzgiLZycw+kIkUOP8xoBTEvZ/mp
 nW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aM24vL1gPR6qASSHUNQlMwvy81FHWXkH1YAXneeMQoA=;
 b=gXsaHV7TAX/bHeWIdc9i6PfJyj0vUCWR53q3pHo4Jl8R8wMtVVq629uaieWw986A9P
 22je4nLd2PPnjKfMGBeCs9/1gj+qi26KGYu+O3vhrKdzAsmZHTlqic9tboIP88D5WgSi
 cm64AcoStyYlfBJX5WNKWxJoZ8S6TwxXZH7ytaPnqZaryC93Ug1eGrO6nbMDulBd2Xwm
 9AWxjwjA39+DsglsL1AtyDjGKofG7qtFpauI35LP/vpyaAOectMld2odlC8L0KiBSkre
 m8kQxbe+StmmdMls2+icfUKAGQBH2gkU/yyNul8t0/qpnFSPLNVUxOCSHf4uVgd6O3PO
 SNrA==
X-Gm-Message-State: AOAM531S0WvWclxX7Jtee/yhupXOgGAvqBpFOLrApXivomzfH8vLfDfO
 W21nemxviGOQu28YyX174PU=
X-Google-Smtp-Source: ABdhPJyPAgzHEEo3ugjAXRk4rP75T8ynGPtKVTqKbPbcC9R7J/W1IyXbFCGdKnF5pbHdf3Qtqu+a0w==
X-Received: by 2002:adf:d20b:: with SMTP id j11mr4035471wrh.318.1610454764721; 
 Tue, 12 Jan 2021 04:32:44 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id x25sm3620475wmc.3.2021.01.12.04.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 04:32:43 -0800 (PST)
Subject: Re: [PATCH v7 04/11] mfd: mt6360: Combine mt6360 pmic/ldo resources
 into mt6360 regulator resources
To: Gene Chen <gene.chen.richtek@gmail.com>, sre@kernel.org, robh+dt@kernel.org
References: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605177598-23501-5-git-send-email-gene.chen.richtek@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <74b127eb-9a3c-20c9-5692-b00b982f4da3@gmail.com>
Date: Tue, 12 Jan 2021 13:32:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1605177598-23501-5-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_073247_719145_711DE5DC 
X-CRM114-Status: GOOD (  16.62  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 12/11/2020 11:39, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Combine mt6360 pmic/ldo resources into mt6360 regulator resources
> to simplify the similar resources object.
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mfd/mt6360-core.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
> index 692e47b..5119e51 100644
> --- a/drivers/mfd/mt6360-core.c
> +++ b/drivers/mfd/mt6360-core.c
> @@ -265,7 +265,7 @@ static const struct resource mt6360_led_resources[] = {
>  	DEFINE_RES_IRQ_NAMED(MT6360_FLED1_STRB_TO_EVT, "fled1_strb_to_evt"),
>  };
>  
> -static const struct resource mt6360_pmic_resources[] = {
> +static const struct resource mt6360_regulator_resources[] = {
>  	DEFINE_RES_IRQ_NAMED(MT6360_BUCK1_PGB_EVT, "buck1_pgb_evt"),
>  	DEFINE_RES_IRQ_NAMED(MT6360_BUCK1_OC_EVT, "buck1_oc_evt"),
>  	DEFINE_RES_IRQ_NAMED(MT6360_BUCK1_OV_EVT, "buck1_ov_evt"),
> @@ -278,9 +278,6 @@ static const struct resource mt6360_pmic_resources[] = {
>  	DEFINE_RES_IRQ_NAMED(MT6360_LDO7_OC_EVT, "ldo7_oc_evt"),
>  	DEFINE_RES_IRQ_NAMED(MT6360_LDO6_PGB_EVT, "ldo6_pgb_evt"),
>  	DEFINE_RES_IRQ_NAMED(MT6360_LDO7_PGB_EVT, "ldo7_pgb_evt"),
> -};
> -
> -static const struct resource mt6360_ldo_resources[] = {
>  	DEFINE_RES_IRQ_NAMED(MT6360_LDO1_OC_EVT, "ldo1_oc_evt"),
>  	DEFINE_RES_IRQ_NAMED(MT6360_LDO2_OC_EVT, "ldo2_oc_evt"),
>  	DEFINE_RES_IRQ_NAMED(MT6360_LDO3_OC_EVT, "ldo3_oc_evt"),
> @@ -298,10 +295,8 @@ static const struct mfd_cell mt6360_devs[] = {
>  		    NULL, 0, 0, "mediatek,mt6360-chg"),
>  	OF_MFD_CELL("mt6360-led", mt6360_led_resources,
>  		    NULL, 0, 0, "mediatek,mt6360-led"),
> -	OF_MFD_CELL("mt6360-pmic", mt6360_pmic_resources,
> -		    NULL, 0, 0, "mediatek,mt6360-pmic"),
> -	OF_MFD_CELL("mt6360-ldo", mt6360_ldo_resources,
> -		    NULL, 0, 0, "mediatek,mt6360-ldo"),
> +	OF_MFD_CELL("mt6360-regulator", mt6360_regulator_resources,
> +		    NULL, 0, 0, "mediatek,mt6360-regulator"),

As discussed with the MFD maintainer [1], the regulator (and probably all cells)
shouldn't have a DT binding.

So please send a new version which fixes that.

Regards,
Matthias

[1] https://lore.kernel.org/linux-mediatek/20210111164118.GE4728@sirena.org.uk/

>  	OF_MFD_CELL("mt6360-tcpc", NULL,
>  		    NULL, 0, 0, "mediatek,mt6360-tcpc"),
>  };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
