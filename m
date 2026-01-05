Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EB7CD0407
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 21:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8u80z+tPf43NlNwf3gyc1tmFsPKFLQnzJ5dp6IiBCs=; b=NJ2wGWs05R2yQX5AdA01iJdK/1
	c134BozWKv6z6LkMQXU7aHQMpVTgCC30Pc5MAxt7mdpzHvW+hrjGv1X3ohNc9lloKq68dK/JmU90W
	d+Grj8l/Z+9SvJf88ryJvpoAtiUxtm70Otvd4SrVQj++xGzdgVnlA61li4nWeSOHJ3NpgZEzCHQG8
	2SEgi3EJOXfurIWf1NTGbauvuZ7Xegh8NjdYyv1YGxh3tmVlD5RKG8+hkgxraYHTaGV3qhLeNd0Hf
	p9xFFvywn/ZLzl+Ah8XKlpL46Fy74d5U3t3eHXqdZ9U7e24E+LB8tgpUAHsXE6n7mefp0d7WTANFf
	XQDuaKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsCO-0000000C8Ap-0Apk;
	Mon, 05 Jan 2026 21:33:12 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsCL-0000000C8A9-35Mt
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 21:33:10 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso3196915ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Jan 2026 13:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767648789; x=1768253589; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p8u80z+tPf43NlNwf3gyc1tmFsPKFLQnzJ5dp6IiBCs=;
        b=zzYciquNB8WHPeXYeuiiqNzv8cfMLaThzqhT3k/LWnYo2NdmSfw2iByXYP6nfiip0H
         2QkfcGn0YlGH8l887Sq7iITzUTdDDbNDjGjSoPIRJFF6XIlqLZvX8zy0rMrrrqzG2oqC
         rd/Hl6QR4stMtE+oy+wrIAJqscPPEsuQnXjlMDNQLXwJ8mNNpsuBsvR0VBIiat3hz+i7
         0hKSk0o6OAl9wh+evXlTpMRSmhxwyUOfs+/gLbDNXfpcBTUxglbZtd3/xAWipFpSYHe7
         zrTJL225zEFwbjX35JZ6k7Ska+wtAawrUxpYR8Xv1U8/7P/bIECY5IaPc3kVexAAS0p+
         ooNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767648789; x=1768253589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8u80z+tPf43NlNwf3gyc1tmFsPKFLQnzJ5dp6IiBCs=;
        b=eCnGGpWj9TICl38cV7fRf7znBDkYLQ04+DkwVhQ6KJXycxlW4PQAiGwuGYg2Vhbrw7
         orKbNo/ipMtSy02W4n7j05Xt8R7rac6GfQrZs2D89QPisWH1ThJKiwblRVjtwvfVrdRJ
         TsbIFN8fvudxgJafDORwBMJvb5jsUPdH8I0anSLZcJealZS/0X4rp8O9bpki1xNiWp03
         7721U+h9BrCQfvoXCLmOoIn0CcH4Lc4JjhwKFJ4o1SvXHDMITCIo05yvTBg1eW2oJf8W
         2CtMjmlbRFkOKmM192Y6K32omJoq8kj71fQz1WJA27HDed3ZshSv5Ni0QD2MlfKE4fUC
         Mf5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXC1qzoA6AZHC7GQrOFfMbtFkqevjcvCX7M1PtT9yJ4f0PetoG282WrSsmYpuvvYHo5NWsi4IcJpSqug7u/JA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxP+qWE7YrvbZpC06QJVc6DE6qAowXQx7C+2KJVTOfJyiPU1Rte
	9lczix3E7iPPs1Tlh8FOeVoUYA476VFqFYkA2nV4kH1FyO6Q5/mzVirGRQ6SKy0/kySdYC2XQFe
	i9KwLmaA=
X-Gm-Gg: AY/fxX69wKhBxr2hLMqU6Ryqi6dbIXWFjtC23WPVPQ3tHxUAnxcsdnerSH8tBJlBC+c
	9WfGU2PxoNJs6Wfc58k4AcI5yJiBRTVNvlYLQHxxF2IS571x7A+wWYj50j7QSZj7jkqflihhcdX
	Ho2MWjgTVKUn3RBIiijM7Fds3d+zb7J1izn74SQ6pU4P54jd2UCD20FjKPUCXyE/qrrskKT5Gn5
	s/01yChC9Buui6Wu+lAhpe7w9fYAcL1PO2kKeQb1Jn8XluDb7SwsrrCT9i/zddhG2hT//IuAp90
	hlX0lIf1ad4nyoTTManoO02cbJkGo6DVEsKXXP6ypqqRrSXgoNZ/urWscI2tbt7A5xJ9IP+V7M8
	RfCgF8ywAXRjGM+zQGDmCMsRWrAXzaGV21yEwAJB2K0bvTcJHYJ/plhsNhUCePF0VlbiOr1Aceg
	PuNsk7bHPoz8z3Jw==
X-Google-Smtp-Source: AGHT+IF0bVODhApERlsNCQrrCwCXh5Bc7cgqZB6OPyCG+4xaL0MSIbArxA2Sg2gVDzhacygsGqC4xA==
X-Received: by 2002:a17:902:fe04:b0:2a1:2b5f:d16b with SMTP id d9443c01a7336-2a3e2cefe5fmr6801155ad.31.1767648788754;
        Mon, 05 Jan 2026 13:33:08 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:3f6b:5551:220f:8f13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a512sm1849275ad.10.2026.01.05.13.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 13:33:07 -0800 (PST)
Date: Mon, 5 Jan 2026 14:33:05 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] remoteproc: mtk_scp: Simplify with scoped for each
 OF child loop
Message-ID: <aVwuEZCAjscaZs7m@p14s>
References: <20260102124827.64355-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102124827.64355-3-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_133309_811582_F822F10F 
X-CRM114-Status: GOOD (  17.27  )
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

On Fri, Jan 02, 2026 at 01:48:28PM +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>

I have applied both patches.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index db8fd045468d..328541e62158 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1287,7 +1287,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev_of_node(dev);
>  	struct platform_device *cpdev;
> -	struct device_node *child;
>  	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
>  	const struct mtk_scp_of_data **cluster_of_data;
>  	struct mtk_scp *scp, *temp;
> @@ -1296,11 +1295,10 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  
>  	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
>  
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		if (!cluster_of_data[core_id]) {
>  			ret = -EINVAL;
>  			dev_err(dev, "Not support core %d\n", core_id);
> -			of_node_put(child);
>  			goto init_fail;
>  		}
>  
> @@ -1308,7 +1306,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  		if (!cpdev) {
>  			ret = -ENODEV;
>  			dev_err(dev, "Not found platform device for core %d\n", core_id);
> -			of_node_put(child);
>  			goto init_fail;
>  		}
>  
> @@ -1317,14 +1314,12 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  		if (IS_ERR(scp)) {
>  			ret = PTR_ERR(scp);
>  			dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
> -			of_node_put(child);
>  			goto init_fail;
>  		}
>  
>  		ret = rproc_add(scp->rproc);
>  		if (ret) {
>  			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
> -			of_node_put(child);
>  			scp_free(scp);
>  			goto init_fail;
>  		}
> -- 
> 2.51.0
> 

