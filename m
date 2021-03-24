Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634EBC433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 16:13:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1245C61A10
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 16:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1245C61A10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zfmi2EFFgMnL86lAaJR/IUefZHXvftBktUoMPGRWbCE=; b=ChCsZZRXhFH3A4H1CVYv9z4Oj
	GdYe547Z3NlGfPTKpBES2mibCR3sgesaohRGL/OejPCVuu9R0W+NFhw8x3Kb+c+AqIN3xndRHzkBV
	Xa7o9X1Jv2XsDbh9CFO2I3d4pPNELN7+J3nNLxmTaxbiXVwg7VxSlgWNTfUFRMrLPRyEzNxjvpiOR
	Ia+rpVI+vhwe1msNmI9pDJUhsLvFaDpy5+TDN+TgM2I2ohDXlaV1rSOnejVKEUwO6pbdnrvV2SAt0
	ICAmJPY73flOvdDg1RQcLTvipJzGgXF4cDZdH2UvgFK0MmpA2IYSEpu11/UODSjRC/ixiAbdbM8gT
	tUs3RFRRg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP67n-00HM9w-9T; Wed, 24 Mar 2021 16:12:51 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP67b-00HM7p-EN; Wed, 24 Mar 2021 16:12:41 +0000
Received: by mail-io1-f50.google.com with SMTP id k8so22070639iop.12;
 Wed, 24 Mar 2021 09:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LQe8mB4Zgg4XFKf9gTgpkrZrwD2w0XrO12e5gW6IipQ=;
 b=CWzM+dINNrm2pGMsoSZjQYz9mv9CaU0t8EokFj1j4P+iTptZQEshuJyhCe5Rf5tmQJ
 uwz2RLMgjxr+Zv7DBH5nVk3FIVssxG007vLD4+3P2qoUXT/m7TqudvCaVqbuu39jR28B
 KJ+38Ray2OjVXVoaSfaHJxiOfQiS2bTIbz6QJoluAaHQzaxgphJyF4kuO0WP+3/xzInc
 8+wlT5Q4t+ea47/3YXuKuT0DOeRgNWdIWNTRYUvu9yngW0Zoh4P9yuI63dz1ixaMreph
 mbdW9JttgPRF+2eQsjZa5rcIlFxXRX5ItEiSWGEqFGga+Ngbl645BKuzdqtQ952R4Ln1
 KSiw==
X-Gm-Message-State: AOAM533PplcJmY4PkNpwv3szFPy6pZ8NfgQ1NbuereJpSqJIyKtDnFuQ
 gEf++i7zYkDT3S4QBltd+g==
X-Google-Smtp-Source: ABdhPJwX4gV2lhVI6+HX3+Erc3mPYuI2WdlwXzBahI+PyLQt9TmCbprlf42MQp8SkKsbMlZQFVt6Sg==
X-Received: by 2002:a05:6602:80d:: with SMTP id
 z13mr2999536iow.17.1616602358385; 
 Wed, 24 Mar 2021 09:12:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id i12sm1250140ila.1.2021.03.24.09.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 09:12:37 -0700 (PDT)
Received: (nullmailer pid 3170148 invoked by uid 1000);
 Wed, 24 Mar 2021 16:12:35 -0000
Date: Wed, 24 Mar 2021 10:12:35 -0600
From: Rob Herring <robh@kernel.org>
To: matthias.bgg@kernel.org
Cc: lee.jones@linaro.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, matthias.bgg@gmail.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH 1/7] dt-bindings: mfd: mediatek: Fix regulator description
Message-ID: <20210324161235.GA3170092@robh.at.kernel.org>
References: <20210312145545.26050-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312145545.26050-1-matthias.bgg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_161239_780549_1B9584AC 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

On Fri, 12 Mar 2021 15:55:39 +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> Having a separate compatible for the regulator node is redundant and not
> needed. Delete the corresponding requierement.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
> 
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 3 ---
>  1 file changed, 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
