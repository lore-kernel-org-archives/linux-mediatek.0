Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3132C54E68
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 15:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xaUG2ldhaQRaRHuk6t4MDB7vN1BXN+/W59BKlbNm/o=; b=U0IjHpSgSeE5EoTdAWBxCDIvqb
	B550Qg2cmum/oh+agQVivjkdorVdYQqRcG/E0zjF1CEWMB8ZRNJFn1TRVTX7LuT0UkssrWDebgNXF
	fkVAGV4kaZE9lupmW4eQ7x89Ve9qQ4uAnwD0KOs1Iin8+kDFR7IpQY/MIZKSJW1vzxwyBu+Vd7REL
	8noDvylUVL6P3A3p1dfUJMh8JFgnlBxihVTDmWKNuluDyRoHMy1RA/FQWrI/2NwhOanYplSun92UT
	1oiYJiFZ2GPHu93gYaS8DhQpkZJvqRzSKpYCYluzICJOK53PCj0cfA0YsrVDJ0IHYZp7h6ipX3AJ8
	DNqp5SqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnKK1-00000003TH5-0vVq;
	Thu, 21 Mar 2024 15:27:13 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnKJy-00000003TGA-3DGe
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Mar 2024 15:27:12 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1de0f92e649so7392985ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Mar 2024 08:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711034830; x=1711639630; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+xaUG2ldhaQRaRHuk6t4MDB7vN1BXN+/W59BKlbNm/o=;
        b=fB+s3KjtRDkmpI9MmN5TXtjDoE53wd7jRFhvQ9y86AAW2dDSzrNRmkTyu5U52lHbuH
         vUjXF2vKuGw5yxn1PEXhTClYhoTo/CHtGiMISRsB7Q/J13uG/qeLxAKALjPQ6DjDMluX
         CH1dZmZAQxJKE2TT3BR8IiHSvZTP790zumrWXUKlOtgawJfBQSZxdCs5VrUgo+7cikkk
         qH0Tw9ktvKjqAXA2MGV04M4QB5hFgwgXyZ2qABRjskMA7BgXqszTf/5T+HPnAucmpkpt
         HdqRuW7LG4BK03sOXa+gdUu1fRkN6qpVtpcsFqMtySomgQgQh3HXMbFFInTCb/6TjJJS
         jdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711034830; x=1711639630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xaUG2ldhaQRaRHuk6t4MDB7vN1BXN+/W59BKlbNm/o=;
        b=wV1/2adn5TQ/aGCtbL2+lo9VXjfJfG8Y2+KN7o5xvmvA/JbVn2BETva5I/QT27Ag2j
         cEypwu17xuRJRihjESitevE9BFmbJ+PG9/xKTBSGLiej7HpEodYyd5vwP0y2EDWA+sZ+
         mmO/QbJ92CHqANBzDqu9waOwehjlzmAf6471SvIoJ3gcSoLrXG5GY6rCCbjaV6eTRXbh
         idh4uTtXt6E8q6uxGX3AS4KYTB8ISZOzoDPr2vh6nZna5MIjpr6+u2/UfL354SeS+CT4
         wzSo+zwN2YnOJLx33st2+JZjKOJGtEXJO4qj4ryEzIsTjlP+L5adfWwIKajMNYptj26Q
         D02g==
X-Forwarded-Encrypted: i=1; AJvYcCVN/GXb8TtUkCgB1XpvhTuk0Mvdrq6PncfglKR98iRW4rFwoW8wIISUazq2q7nxM+nOwrnqk9An6ac5YRpOUset655kQ6CCMBFZrT5PHBAo6OFO
X-Gm-Message-State: AOJu0YzQjESqRCCJa1apENoSmIXY5ZfoJxy8BFbMzQAzQza8KtgtD5In
	eK4y0mczjax57pWdxeFADyUJ2Dw0Gl1wxz1DJgiX05GOvMEte4znPud/uj9JRTrzKjw0ASx7G7t
	R
X-Google-Smtp-Source: AGHT+IFZusUIQQGZ01wR/lIafQ3ProKPMjN3Xn3Bpv3FxV8YHFTb1NMxzLzr2zATgiRssYtdZLM9qA==
X-Received: by 2002:a17:903:22d0:b0:1e0:1e87:c9d8 with SMTP id y16-20020a17090322d000b001e01e87c9d8mr13021667plg.7.1711034829723;
        Thu, 21 Mar 2024 08:27:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d9a2:e52:d93:c759])
        by smtp.gmail.com with ESMTPSA id q6-20020a170902a3c600b001dee3fe3c1asm15077983plb.258.2024.03.21.08.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 08:27:09 -0700 (PDT)
Date: Thu, 21 Mar 2024 09:27:04 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: andersson@kernel.org, matthias.bgg@gmail.com, tzungbi@kernel.org,
	tinghan.shen@mediatek.com, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org,
	kernel@collabora.com
Subject: Re: [PATCH 2/2] remoteproc: mediatek: Don't parse extraneous
 subnodes for multi-core
Message-ID: <ZfxRyMyUqyqtXy8n@p14s>
References: <20240321084614.45253-1-angelogioacchino.delregno@collabora.com>
 <20240321084614.45253-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321084614.45253-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_082710_836531_842A9D87 
X-CRM114-Status: GOOD (  17.28  )
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

On Thu, Mar 21, 2024 at 09:46:14AM +0100, AngeloGioacchino Del Regno wrote:
> When probing multi-core SCP, this driver is parsing all sub-nodes of
> the scp-cluster node, but one of those could be not an actual SCP core
> and that would make the entire SCP cluster to fail probing for no good
> reason.
> 
> To fix that, in scp_add_multi_core() treat a subnode as a SCP Core by
> parsing only available subnodes having compatible "mediatek,scp-core".
> 
> Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 67518291a8ad..fbe1c232dae7 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1096,6 +1096,9 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
>  
>  	for_each_available_child_of_node(np, child) {
> +		if (!of_device_is_compatible(child, "mediatek,scp-core"))
> +			continue;
> +

Interesting - what else gets stashed under the remote processor node?  I don't
see anything specified in the bindings.

Thanks,
Mathieu

>  		if (!cluster_of_data[core_id]) {
>  			ret = -EINVAL;
>  			dev_err(dev, "Not support core %d\n", core_id);
> -- 
> 2.44.0
> 

