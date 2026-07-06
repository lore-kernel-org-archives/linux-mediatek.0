Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA39C43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0DC2hOdTNxx+EPNV41bd73bBnK5k0yS7npNoHCzZEU=; b=2yh5lwY2GoPrCtx+g8u4gResFF
	zUV8zb0ze1+RkNiB0weyl0hYafpmkKl03L3UfH42g0JvFkVb+Crr+fw9tMfBUUvBM07/wdNZAXed3
	hFQAYlXfzTKQ8okYPr9ndOJZgr3QoN+VmgpGiSXmOtZV3kW9jSeuWY7kp2UDxdvvbTUfSxgftQMj5
	ZgS+v14DyK4NxWOZZ5WpYne1ZwLSvLtx4kcedXZpIb920EV/yTqkvWpuQU8AGKTSvEJpuwjyLfI5l
	Pqw6lfDuUb7Wqt/WL/qEp1ZHoztf0NCcPfll68xOE0/KP9l+uD+JJqUKCSbDHJXaCb8gyZUjnmrZL
	WKsRuqMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkwa-0000000CqZH-3SYf;
	Mon, 06 Jul 2026 15:09:13 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkwV-0000000CqVn-3StD
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 15:09:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47640541585so1965750f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 08:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783350546; x=1783955346; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P0DC2hOdTNxx+EPNV41bd73bBnK5k0yS7npNoHCzZEU=;
        b=B8/5YRxUcbmCtFA2BgkfIfbLt+p06Eow+EFlRD5/T/+FchmMYn3MdphiBr4CmfWbqo
         aXym7w/k5X89WuUsiAeK9H3jT5HQTYqhEwpLYPDrmp+OIhH04coNBRsQKLXpncPi7PpT
         qlzsTl8eWv75N5P/dHAXyzyaYu9Tyysi3iGLX3J97Fy0ZVz7WX48OdpO4FP8bj0iY1mb
         wjeTf6TFxhFh5DaHoNuI0yTY72kzXsvluaxMzsSXKo+vM8/t9uBjZEW49cPlsdLMaEMn
         CLs086HVYBWsSuex4Fx53WnAkDQdN1VV05whXnupErzQnh5VVuvPwusDczQ9nRJKxLpr
         rlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350546; x=1783955346;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0DC2hOdTNxx+EPNV41bd73bBnK5k0yS7npNoHCzZEU=;
        b=krjbCLpOvkBZ6af4lSfF2hBnmCNwqjVUsu53rPC5ggM5iuVPm9XS7N+n6Ezod8QLRO
         RWyeIOrBobdXDF79GFN1YLhfVACPLsoq27BOx3EBd9JAOxQJX2j4LzPcvY6/ogflb6m2
         WRkO9hfMG/UcVWJwtMZpd0o/QQfHctZJ5VsteAGdQSNUlg8evGSGudQV6T40i8AIXapy
         jdG6lhJY1KzhQERikyZzGFb1NfXDt+m0eiql041CZb7ZvkbF8qHOY+lpfhnBuZq7ViZu
         z/Mg4Hohht8JJ7pHrSy8bYdgBZdtbS4emonpymphMb7rX+Z+7kslcB3/R7Ks5Ey0hNSN
         MfHg==
X-Forwarded-Encrypted: i=1; AHgh+RqR5Z+vC0t2GXDyJ37PHbUaAZV8WW1u73ZFXVsUg3njiDJNuOM7MI0LMrzjllbVepTW0O2v4C4pTSiRO3Uzkw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzM2v3duSkPNAA9IliO7WgL4so1YOcBs7NYD++ZRxc5aGEtzkDD
	MDen6gFzHXf8octcEjsY8S17iTM5I9LZq85BhBbjj0/Uyjt7cdeQvn2OjS9Uugx87vg=
X-Gm-Gg: AfdE7cn+ILSEGqi3ln9sPyo5U6sMo94tCysKMLj8aCBtNJrzN1lxiUmVt8jJpEACsYZ
	nRROaHj6nsLrCPWoqxQdlJ7+EwVvHyrVHJASL9jH3pi/hCQrHW7mG/CjXYn1fCergkOhV+e9ukU
	fHIeYipkrnLqq4H0gCKL1VNJa3riFuQ7EJdY6BXGaUlslwG5LyRMBArs/W8l+BmK1abo7r5QNZ2
	5+pPb4w133ihlI/NGt/0Ur/X3rrRi5kmY3uFJq8PLGOtfiquv73UCHV4NxC2ULKF61YSDfMvIxG
	bnG44DBqWrzj+YH65oFuoAVUucAno4yp3hdIzsgZwqquxuBiFiEuQyFXspKTG+H69YUoQktl4Ix
	enw2eZTbXQNB43h9KV3qdDCkPh9VLrAP+86dVYz+L8ntvHWZQ1xsGqBWhFclJETn+W/IR7DeKZ6
	0TmhjBT38wbB10DyGRxV6wpJQFiwmilBaYo8K+zWVOHaekTJH1zu1X83Xd0hoQ
X-Received: by 2002:a05:6000:e43:b0:474:9002:c74a with SMTP id ffacd0b85a97d-47de66a6dd6mr548307f8f.35.1783350545711;
        Mon, 06 Jul 2026 08:09:05 -0700 (PDT)
Received: from [192.168.1.136] (48.85-85-171.dynamic.clientes.euskaltel.es. [85.85.171.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae4fsm26285613f8f.18.2026.07.06.08.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:09:05 -0700 (PDT)
Message-ID: <132a24cf-75e5-4db4-9b24-71296f8f5710@suse.com>
Date: Mon, 6 Jul 2026 17:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] pmdomain: mediatek: Respect PD relationships during
 error cleanup
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 ulfh@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, nfraprado@collabora.com, irving-ch.lin@mediatek.com,
 macpaul.lin@mediatek.com, aford173@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 justin.yeh@mediatek.com, kernel@collabora.com
References: <20260701121920.19347-1-angelogioacchino.delregno@collabora.com>
 <20260701121920.19347-3-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20260701121920.19347-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_080907_923642_05081CD0 
X-CRM114-Status: GOOD (  27.22  )
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



On 01/07/2026 14:19, AngeloGioacchino Del Regno wrote:
> In case any probe error occurs (usually, a probe deferral) the
> power domains shall be cleaned up while respecting their child
> to parent relationship, or the system may freeze.
> 
> In order to do that without any memory footprint impacts after
> the fact, allocate a temporary array in the probe function and
> use it to store the indices of the added power domains in the
> correct order.
> 
> This will be used in the error cleanup path and will be freed
> at the end regardless of the probe status as, when the probing
> succeeds, the genpd API takes care of unregistering all PDs in
> the correct order anyway.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/pmdomain/mediatek/mtk-pm-domains.c | 43 +++++++++++++++++-----
>   1 file changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index e1cfd4223473..db543d4b1813 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -738,7 +738,8 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>   }
>   
>   static struct
> -generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node)
> +generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node,
> +					 u8 *domains_idx, u8 *num_domains)
>   {
>   	const struct scpsys_domain_data *domain_data;
>   	const struct scpsys_hwv_domain_data *hwv_domain_data;
> @@ -906,6 +907,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>   	else
>   		pm_genpd_init(&pd->genpd, NULL, false);
>   
> +	domains_idx[(*num_domains)++] = (u8) id;
>   	scpsys->domains[id] = &pd->genpd;
>   
>   	return scpsys->pd_data.domains[id];
> @@ -917,7 +919,8 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>   	return ERR_PTR(ret);
>   }
>   
> -static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *parent)
> +static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *parent,
> +				u8 *domains_idx, u8 *num_domains)
>   {
>   	struct generic_pm_domain *child_pd, *parent_pd;
>   	struct device_node *child;
> @@ -940,7 +943,7 @@ static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *paren
>   
>   		parent_pd = scpsys->pd_data.domains[id];
>   
> -		child_pd = scpsys_add_one_domain(scpsys, child);
> +		child_pd = scpsys_add_one_domain(scpsys, child, domains_idx, num_domains);
>   		if (IS_ERR(child_pd)) {
>   			ret = PTR_ERR(child_pd);
>   			dev_err_probe(scpsys->dev, ret, "%pOF: failed to get child domain id\n",
> @@ -949,7 +952,7 @@ static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *paren
>   		}
>   
>   		/* recursive call to add all subdomains */
> -		ret = scpsys_add_subdomain(scpsys, child);
> +		ret = scpsys_add_subdomain(scpsys, child, domains_idx, num_domains);
>   		if (ret)
>   			goto err_put_node;
>   
> @@ -991,14 +994,16 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
>   	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
>   }
>   
> -static void scpsys_domain_cleanup(struct scpsys *scpsys)
> +static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx, u8 num_probed)
>   {
>   	struct generic_pm_domain *genpd;
>   	struct scpsys_domain *pd;
>   	int i;
>   
> -	for (i = scpsys->pd_data.num_domains - 1; i >= 0; i--) {
> -		genpd = scpsys->pd_data.domains[i];
> +	for (i = num_probed - 1; i >= 0; i--) {
> +		u8 pd_idx = domains_idx[i];
> +
> +		genpd = scpsys->pd_data.domains[pd_idx];
>   		if (genpd) {
>   			pd = to_scpsys_domain(genpd);
>   			scpsys_remove_one_domain(pd);
> @@ -1215,6 +1220,8 @@ static int scpsys_probe(struct platform_device *pdev)
>   	struct device *parent;
>   	struct scpsys *scpsys;
>   	int num_domains, ret;
> +	u8 num_added_pds = 0;
> +	u8 *added_pds_idx;
>   
>   	soc = of_device_get_match_data(&pdev->dev);
>   	if (!soc) {
> @@ -1228,6 +1235,19 @@ static int scpsys_probe(struct platform_device *pdev)
>   	if (!scpsys)
>   		return -ENOMEM;
>   
> +	/*
> +	 * Temporarily store the IDs of the power domains that are added as in
> +	 * case of a probe deferral this can be used to correctly cleanup all
> +	 * of what was added before.
> +	 *
> +	 * Note that this array is used only in the probe function and must be
> +	 * freed at the end, regardless of whether all of the power domains were
> +	 * probed successfully or any failure happened.
> +	 */
> +	added_pds_idx = devm_kmalloc_array(dev, num_domains, sizeof(*added_pds_idx), GFP_KERNEL);
> +	if (!added_pds_idx)
> +		return -ENOMEM;
> +
>   	scpsys->dev = dev;
>   	scpsys->soc_data = soc;
>   
> @@ -1258,13 +1278,15 @@ static int scpsys_probe(struct platform_device *pdev)
>   	for_each_available_child_of_node_scoped(np, node) {
>   		struct generic_pm_domain *domain;
>   
> -		domain = scpsys_add_one_domain(scpsys, node);
> +		domain = scpsys_add_one_domain(scpsys, node,
> +					       added_pds_idx, &num_added_pds);
>   		if (IS_ERR(domain)) {
>   			ret = PTR_ERR(domain);
>   			goto err_cleanup_domains;
>   		}
>   
> -		ret = scpsys_add_subdomain(scpsys, node);
> +		ret = scpsys_add_subdomain(scpsys, node,
> +					   added_pds_idx, &num_added_pds);
>   		if (ret)
>   			goto err_cleanup_domains;
>   	}
> @@ -1280,10 +1302,11 @@ static int scpsys_probe(struct platform_device *pdev)
>   		goto err_cleanup_domains;
>   	}
>   
> +	devm_kfree(dev, added_pds_idx);
>   	return 0;
>   
>   err_cleanup_domains:
> -	scpsys_domain_cleanup(scpsys);
> +	scpsys_domain_cleanup(scpsys, added_pds_idx, num_added_pds);
>   	return ret;
>   }
>   


