Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAA1C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 May 2022 05:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/NHRDbJ1xBCg6JRoHc9uIK+vdkVHdMHFofEanVnxek=; b=uWnFGvqGI1/sg6
	aj8LieLKImSt3roIx6VoPDtn7+HLn4PQNEXa3Rd2QeRpsQ/MnjB5qV6IcQOXq25UOT713ZIkF7PTD
	UB6tLW30hujtcAK7WjEybLBEjfUTHl1u41Qz1nqTSnTM3YGxpyZN9jq92oS71FAPjkmzkSG0SlYUM
	89277jqVbwnL/C9632Lhl6NHw0OCcSZmOEislHsA7cMsWJWpkh3UGNh9eH6vwbM6lVgRjNh0p5PIu
	qRFx3bFGsgHW1c/6OQGrKKXXMe9R4+aH0fJKRIu//Hascm7kev/jg5eDfPbfPRR4LSCWRG420kQWc
	5bZFiGIeh7ZY5YppBUxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuScH-00GgFV-DS; Fri, 27 May 2022 05:34:29 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuSc7-00GgE4-11; Fri, 27 May 2022 05:34:20 +0000
Received: by mail-pl1-x62f.google.com with SMTP id m1so3259958plx.3;
        Thu, 26 May 2022 22:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mHsgR073nhQ7znBaXl9ZvXV9DZWPaFFSru830DQsQ0Y=;
        b=CkfNzIX8OnRfpWFXUOnAK2Y2udwIkn+RM//g1UjElnQfxTLLBc5IXRMhx+pU8BWMjc
         xjmVOlZ1LNnRpS+GBqKYJwfcswbsj/Nc6MOsxNBYvSKC5Pa0OeDiOj6Sj5MZO4UhAJ7a
         bqzHOY7gzlyaqgtyrM9UJbv35hXoEC6lXjl5fypxLahyTmc0ORExCulIbeIx/MpkSJ5n
         qvEIYQv2TBox4vgK08jFchhbhM3utHie9tHAwq8Y/pq0rpt5AzCLkCQ87Y1XniD9RRnz
         eQW5wfPuK2TZRP/WYe/lvISDHqd65pJPObSo730LllZDZpltyVC3SKKMayWBCIjhZku1
         gtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mHsgR073nhQ7znBaXl9ZvXV9DZWPaFFSru830DQsQ0Y=;
        b=3l9fa++9uQxPm6yAgYqe44YSPxSBdq9oGmjTLUNcm3ZqgA8Csto0i1l/RKNsbFWgy3
         z8Q0gUzcyRR4vrWa7o5oXNFSFd6dIBuBAI2vlDICwZseUHgSZTlCIKf+rQ0rHYVnAcIS
         57KJLYTPUwSf782dn2QVhgmVVG4GSJ9Kgw0vWa0zrT4hMBbkqGNVIYhks2UPdA/038mD
         D9OMvagIxWZNykIxRI1XhWhgbNxsxuStiq3TTUaZGALnlUnraqG6iiqXoZHmlTj69MKM
         KrY//KxCA+z/DzxcwfKe9l77XWj34BxNM67vmDTMupzxDeZXRQUH1bvme4Q0yzvYLwqu
         wzfQ==
X-Gm-Message-State: AOAM5325Chh0KmqH8T8uv2RIxmkTEyeKkzeE+cF0tsS+m92lIvx1KsvA
	js9ve0fP1qR/Qh9m2saGAV/lME9fgYM=
X-Google-Smtp-Source: ABdhPJwfAEUlQxnLazyMiIdYppZUmcBVdFsMafDQPnrug63PbYyjGGPsFKtKok9xhI7YJZ1jY+iD3g==
X-Received: by 2002:a17:902:a50f:b0:162:28c6:bfac with SMTP id s15-20020a170902a50f00b0016228c6bfacmr22440174plq.99.1653629651318;
        Thu, 26 May 2022 22:34:11 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:3206:ea0b:ce53:ea86])
        by smtp.gmail.com with ESMTPSA id fz6-20020a17090b024600b001dbe7ccdd4dsm629302pjb.10.2022.05.26.22.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 22:34:10 -0700 (PDT)
Date: Thu, 26 May 2022 22:34:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, mkorpershoek@baylibre.com,
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] Input: mtk-pmic-keys - Transfer per-key bit in
 mtk_pmic_keys_regs
Message-ID: <YpBiz7fGCgHaKqGs@google.com>
References: <20220524093505.85438-1-angelogioacchino.delregno@collabora.com>
 <20220524093505.85438-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220524093505.85438-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_223419_110140_00F36363 
X-CRM114-Status: GOOD (  13.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, May 24, 2022 at 11:35:03AM +0200, AngeloGioacchino Del Regno wrote:
> Place the key bit in struct mtk_pmic_keys_regs to enhance this
> driver's flexibility, in preparation for adding support for more
> PMICs.
> 
> While at it, remove the definition of MTK_PMIC_RST_KEY_MASK as
> we are now dynamically setting the keymask relatively to the keys
> that are defined in the newly added rst_en_mask variable, on a
> per-key basis.
> 
> This commit brings no functional changes.

AngeloGioacchino,

Could you please tell me if these devices (currently supported by the
driver) have 2 fully independent reset settings for HOME and PWR keys,
or is there are actually 2 separate bits, one to enable/disable key
reset, and another controlling what keys will cause the reset - only PWR
or either PWR or HOME?

Thanks.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
