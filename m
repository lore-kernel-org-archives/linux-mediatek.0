Return-Path: <SRS0=7C4w=K6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFD1C47083
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 03:56:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 642276124B
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 03:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 642276124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzf/Iqd0c7w3pFP9BS1nls9ORT33KeiyevWwze5Kj80=; b=QqpleTvEhXXGv8
	nQ8jPwviuyPV+KTEDHrYCH+wQXKlPJAlPqqMO8o1dxNBeHO98DlSPPC6fweIaIep3eEWcGR6ZZx9n
	vXs/ikBVNR5LQGvy08fcIkXjmeoD41dMbfB9vn0Gctm+VZJRsdSWMBxInWvaJ21eGkMDuMPa2DMBk
	qC6XhHrwruZRCwTM68AbVHbCxhZwFHnG4boQm6igVUoOKhdR8XtxwpaplVqg3j3YgoSieTRdTxnjC
	TeLUMX7I52kzC9uRgX9OsEazT/8f8/hOCxKCYmsi0fijgx8QflhXK28oe59mSpC6HnM8PB2DRz7Le
	U6qF9WfghYkYPSzWQPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp0wr-00BQq6-7O; Fri, 04 Jun 2021 03:56:41 +0000
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp0wd-00BQop-UN
 for linux-mediatek@lists.infradead.org; Fri, 04 Jun 2021 03:56:29 +0000
Received: by mail-pj1-f43.google.com with SMTP id i22so4880331pju.0
 for <linux-mediatek@lists.infradead.org>; Thu, 03 Jun 2021 20:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eMMwY8qQNkTVoHZiZIl5tn9ghZC2j5sUCYWs3fjlNkc=;
 b=WQYEOJQWgXV4Z7RlPLlCH0GI+8Mhykds+lFNzn0YEf1jC3NHqQDlnuj1KwVBv/ZBQX
 pZNuy4boZd2b5p9mFrU+nNwNa8pExofWPH8fWCT2NkP+ZEEdC26KFyH0eXB1nm+bz/2Z
 HSFTbe3cq9V7LGWs2wNjTxwxjbSAjqCKZw8zKzq3/mJe4N/JoD6Kqcb0lislhEzPbWAF
 dQcDE12nrPhNyxzg6hjcYpp7wXdFO59UM1Dd0LuPnJ7XZFdv01gp1F1pRwEZLc8t/Xe4
 xMi+71z90CBtnKV8nH+H+8qVxwYvONklR91BD3XYmLThGLSZMOFLzuA4QefdfVyrqcH+
 TNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eMMwY8qQNkTVoHZiZIl5tn9ghZC2j5sUCYWs3fjlNkc=;
 b=uN4ZsJ6tIm7X4yDu08DHIP1grrb23yBv2tfGVO7bUyBEcAiXQb2n0idQqZHvDEzw9O
 Dwms/4Of1G9FJPOwiTQ1xK00Glgw5kwHuWtp3Qe4M9ZdhoAiv7aWPHfj97zPRAKVCvHI
 GQ48GHSgLXWH/S+8GhnEp8tydE7qmUPoD5egNFY3ZZLCusNx7bZz+8DEDO3MuD/CIQYL
 Ukge+mvCZhhNEL4B9RHFQDn7KTpjAYOtKQXEoVPIrSJfZwyIla8cXUDI2WpXDptq3IvE
 HLc18vGI+k2D+IxA4vsfj2J3JSGWDgLL9UgWLeGPcdatIG2UCCMc837XSXjdOMYjusYe
 /Dig==
X-Gm-Message-State: AOAM531iJem2atstEatdYBR/Fic4Ln+NZ5O5/76NIfRg0HZXFSsrc6co
 z8y3Nk/rCn+e5wGntbGvoyGxWw==
X-Google-Smtp-Source: ABdhPJw31ObwYL3vjh7VCbQTqwewCpEgPzasyY0q9PhumD4gKAiT8PNeki4nnCaX5rvxG2YlnrciEQ==
X-Received: by 2002:a17:902:548:b029:10f:30af:7d5f with SMTP id
 66-20020a1709020548b029010f30af7d5fmr1584319plf.22.1622778925580; 
 Thu, 03 Jun 2021 20:55:25 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id s22sm475766pfd.94.2021.06.03.20.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 20:55:25 -0700 (PDT)
Date: Fri, 4 Jun 2021 09:25:21 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Seiya Wang <seiya.wang@mediatek.com>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
Subject: Re: [RESEND 1/2] clk: mediatek: remove deprecated CLK_INFRA_CA57SEL
 for MT8173 SoC
Message-ID: <20210604035521.ly6unoj5537xy27h@vireshk-i7>
References: <20210601071042.31349-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210601071042.31349-1-seiya.wang@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_205628_046626_17C68FA7 
X-CRM114-Status: GOOD (  14.04  )
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

On 01-06-21, 15:10, Seiya Wang wrote:
> Remove CLK_INFRA_CA57SEL for MT8173 since it's no longer used.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> ---
>  include/dt-bindings/clock/mt8173-clk.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/mt8173-clk.h b/include/dt-bindings/clock/mt8173-clk.h
> index 3acebe937bfc..3d00c98b9654 100644
> --- a/include/dt-bindings/clock/mt8173-clk.h
> +++ b/include/dt-bindings/clock/mt8173-clk.h
> @@ -186,7 +186,6 @@
>  #define CLK_INFRA_PMICWRAP		11
>  #define CLK_INFRA_CLK_13M		12
>  #define CLK_INFRA_CA53SEL               13
> -#define CLK_INFRA_CA57SEL               14 /* Deprecated. Don't use it. */
>  #define CLK_INFRA_CA72SEL               14
>  #define CLK_INFRA_NR_CLK                15

Applied both. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
